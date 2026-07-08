# Appendix A: OCaml Assembly Pattern Reference

This appendix provides a reference for the recurring assembly patterns in OCaml-generated code that appear throughout the optimization chapters. Each pattern is shown alongside its C equivalent and explained mechanically.

---

## Integer Tagging

OCaml represents every `int` at runtime as `2n + 1`. The low bit is always 1. This allows the GC to distinguish integers (odd) from heap pointers (even) without type metadata.

### Addition

**OCaml source:** `a + b`  
**C equivalent:** `a + b` (on `uint32_t`)

OCaml cannot use `addq` directly: `(2a+1) + (2b+1) = 2(a+b)+2`, which is even and would be misidentified as a pointer. Instead:

```asm
; OCaml: a + b
leaq    -1(%rdi,%rsi), %rax    ; = rdi + rsi - 1 = (2a+1)+(2b+1)-1 = 2(a+b)+1 ✓
```

The address computation unit performs `base + index - 1` in one instruction. The `-1` subtracts the extra tag bit.

C emits:
```asm
; C: a + b
addl    %esi, %edi             ; one instruction, no tag
```

### XOR

**OCaml source:** `a lxor b`

```asm
; OCaml: a lxor b
xorq    %rsi, %rdi             ; XOR of two odd values = even (untagged)
orq     $1,   %rdi             ; re-tag: set low bit
```

Two instructions. C emits:
```asm
; C: a ^ b
xorl    %esi, %edi             ; one instruction
```

### Implication

Every XOR in ChaCha20's hot path costs 2 instructions in OCaml vs 1 in C. There are 8 XOR operations per quarterround. Across 80 quarterrounds per block: 80 × 8 = 640 XOR sites, each costing one extra instruction.

---

## mask32: Truncating to 32 Bits

**OCaml source:** `x land 0xFFFFFFFF`  
**C equivalent:** not needed (uint32_t truncates automatically)

OCaml `int` is 63 bits on 64-bit platforms. After every 32-bit arithmetic operation, the result may have bits set above bit 31. ChaCha20 requires 32-bit words, so truncation is necessary.

The constant `0xFFFFFFFF` has tagged form `0x1_FFFF_FFFF = 8589934591`, which does not fit in a 32-bit sign-extended immediate (which has range −2^31 to 2^31−1). The compiler must load the full 64-bit constant:

```asm
; OCaml: x land 0xFFFFFFFF
movabsq $8589934591, %rcx      ; load full 64-bit tagged constant
andq    %rcx, %rax             ; mask to 32 bits + low bit
```

Two instructions per mask32 call.

C emits nothing — the `uint32_t` type limits arithmetic to 32 bits at the hardware level.

### Why Hoisting Does Not Help

Storing the constant in a register and reusing it would reduce the `movabsq` loads. However, OCaml's Clambda pass folds constants through `[@inline]` boundaries before native code generation. Any `let mask = 0xFFFFFFFF` binding used only inside an inlined function is folded back to the literal `8589934591` at every call site. The register allocation cannot be forced from source level.

---

## Rotate Expansion

**OCaml source:**
```ocaml
let[@inline] rotate v c =
  (v lsl c) lor (v lsr (32 - c))
```

**C equivalent:**
```c
#define ROTATE(v,c) ((v) << (c) | (v) >> (32 - (c)))
// Compiles to: roll $c, %eax   (one instruction)
```

The compiler recognizes the `(v << c) | (v >> (32-c))` pattern in C and emits a single `roll` (rotate left 32-bit) instruction.

OCaml has no 32-bit rotate primitive. The compiler emits the pattern as separate operations:

```asm
; OCaml: (v lsl 16) lor (v lsr 16)  (rotate by 16, example)
movq    %rdi, %rax             ; copy v
salq    $33, %rax              ; left shift: lsl 16 on tagged = shift by 16+1
movq    %rdi, %rcx             ; copy v again
sarq    $31, %rcx              ; right shift: lsr 16 on tagged = shift by 16-1 (arithmetic)
leaq    -1(%rax,%rcx), %rax    ; tagged OR: combine with tag correction
orq     $1, %rax               ; re-tag result
; plus potentially mask32 after: movabsq/andq
```

Approximately 7 instructions for one rotation. C emits 1. This expansion is repeated at every one of ChaCha20's four rotation sites (7, 8, 12, 16 bits) in every quarterround.

### The rot16 and rot8 Special Cases

In OxCaml SIMD, the 16-bit and 8-bit rotations are implemented using PSHUFB (byte-permute), which is faster than the shift-OR pair. This optimization is not available in scalar OCaml without SIMD registers.

---

## Bounds Check Sequences

**OCaml source:** `arr.(n)` (safe array access)

```asm
; OCaml: arr.(n) — safe access, index n is a compile-time constant
movq    (%rdi), %rax           ; load array header word (contains length << 1 | 1)
cmpq    $33, %rax              ; compare against tagged(16) = 33; checks length ≥ 16
jae     .Lbound_error          ; trap if out of range
movq    8(%rdi,%rdx,4), %rax   ; load element at index n
```

Three or four instructions per access. The `cmpq` compares the OCaml-tagged array length against the tagged index.

### Range Inference Elimination

When the compiler can prove that an index is within bounds — typically because earlier safe accesses to the same array with indices spanning the full range have already been seen — it suppresses the `cmpq`/`jae` pair:

```asm
; OCaml: arr.(n) — after range inference has proved bounds
movq    8(%rdi,%rdx,4), %rax   ; direct load, no check
```

This is why replacing preamble safe accesses with `Array.unsafe_get` can increase bounds checks elsewhere: the preamble accesses serve as proof for the compiler's inference engine. Removing them removes the proofs.

### Array.unsafe_get

```asm
; OCaml: Array.unsafe_get arr n
movq    8(%rdi,%rdx,4), %rax   ; direct load, no check — identical to inferred case
```

`Array.unsafe_get` emits the same instruction as an inferred-safe access. The difference is that it provides no proof to the range inference system — it tells the compiler "trust me" without establishing a verifiable bound.

---

## Stack Spills

When the number of live values exceeds the available registers (15 general-purpose registers on x86-64; some are reserved for the stack pointer and frame pointer), the compiler spills values to the stack.

```asm
; OCaml spill: store x5 to stack when registers are exhausted
movq    %rbx, -48(%rbp)        ; spill x5 to stack frame

; ... some instructions using other registers ...

movq    -48(%rbp), %rbx        ; reload x5 from stack
```

Each spill/reload pair is a store + load from memory. These are cheap when the value remains in L1 cache (which it does in a tight loop), but they still consume instruction slots and memory bandwidth.

OCaml scalar spills more than C scalar for the same ChaCha20 computation because:
- Tag values may require an extra register per arithmetic operation
- The `mask32` constant may occupy a dedicated register
- The OCaml frame pointer convention reserves one register that C does not

In OxCaml SIMD, the 128-bit `int32x4` values live in XMM registers, which are a separate 16-register file from the general-purpose registers. This effectively doubles the register space for SIMD computation, eliminating most spills in the block function.

---

## Summary Table

| Pattern | OCaml instructions | C instructions | Avoidable? |
|---|---|---|---|
| 32-bit addition | 1 (`leaq`) | 1 (`addl`) | No (different operation) |
| XOR | 2 (`xorq` + `orq`) | 1 (`xorl`) | No |
| mask32 | 2 (`movabsq` + `andq`) | 0 | No (63-bit int) |
| Rotate | ~7 | 1 (`roll`) | No (no rotate primitive) |
| Bounds check (safe) | 3–4 | 0 | Partially (range inference) |
| Bounds check (unsafe) | 0 | 0 | N/A |
| Stack spill | 2 (store + load) | 2 (store + load) | No (register pressure) |
