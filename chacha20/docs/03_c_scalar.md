# C Scalar Implementation

The C scalar implementation is the algorithmic ground truth for this study. It is the reference against which every scalar OCaml optimization is measured. It is never optimized.

---

## Role in the Study

The C scalar implementation serves two purposes. First, it establishes the performance ceiling for single-threaded, non-SIMD ChaCha20 on this hardware. Second, it defines what "correct" looks like at the machine-code level — the expected operations, the expected instruction types, and the expected throughput when no language overhead is present.

Because C compiles almost directly to machine code with no runtime overhead, the gap between C and OCaml represents real OCaml-specific costs: integer tagging, bounds checks, mask operations, and expanded rotation sequences. These costs are quantified in `docs/04_ocaml_scalar.md`. The C implementation is the denominator in that calculation.

---

## Source and Attribution

The implementation is derived from D. J. Bernstein's `chacha-regs.c` (public domain, 2008). This is the same source from which Cryptokit's OCaml scalar implementation is derived. Both start from the same code, which is why structural equivalence between the C and OCaml baselines is guaranteed by construction rather than verified post-hoc.

---

## Implementation Structure

The code lives in `c/chacha20.c`. The critical path is the `chacha20_block` function.

**State layout.** The 16-word state is stored in a `uint32_t input[16]` array inside `chacha20_ctx`. At the start of `chacha20_block`, all 16 words are loaded into local variables `x0`–`x15` on the stack.

```c
x0 = ctx->input[0];
x1 = ctx->input[1];
...
x15 = ctx->input[15];
```

**Round loop.** The 10 double rounds are expressed as a counted `for` loop:

```c
for (i = 10; i > 0; i--) {
    QUARTERROUND( x0, x4, x8, x12)
    QUARTERROUND( x1, x5, x9, x13)
    QUARTERROUND( x2, x6, x10, x14)
    QUARTERROUND( x3, x7, x11, x15)
    QUARTERROUND( x0, x5, x10, x15)
    QUARTERROUND( x1, x6, x11, x12)
    QUARTERROUND( x2, x7, x8, x13)
    QUARTERROUND( x3, x4, x9, x14)
}
```

**Rotation macro.** Rotation is a single hardware instruction:

```c
#define ROTATE(v,c) ((v) << (c) | (v) >> (32 - (c)))
```

The compiler emits this as `roll` (rotate left 32-bit) — one instruction.

**Output phase.** After the round loop, the initial state is added back word by word, and the result is written to `ctx->output`.

---

## Assembly Characteristics

The C assembly has four properties that distinguish it from the OCaml assembly and define the irreducible lower bound.

**Rotation is one instruction.** `ROTATE(v, c)` compiles to `roll %cl, %eax` or the equivalent immediate form. No masking is required — `roll` operates on 32-bit registers, so the result is already 32 bits.

**No integer tagging.** All arithmetic is on `uint32_t` values in 32-bit registers. There is no `orq $1` re-tagging and no `leaq -1(%a,%b)` tag adjustment. Every add is a plain `addl`.

**No mask32.** C's 32-bit integer type handles 32-bit arithmetic natively. There is no `0xFFFFFFFF` mask operation anywhere in the hot path.

**No bounds checks.** Array accesses inside `chacha20_block` are to local variables (not arrays) — the compiler puts them in registers or on the stack. There are no `cmpq`/`jae` bounds-check pairs.

These four properties account for the majority of the performance gap to OCaml scalar. Each is quantified in `docs/04_ocaml_scalar.md` using instruction counts.

---

## Performance

All measurements are at steady state (input sizes above 10 MB, where cache effects stabilize).

| Input Size | Encrypt Time (s) | Decrypt Time (s) | Encrypt Speed (MB/s) | Decrypt Speed (MB/s) |
|---|---|---|---|---|
| 1 MB  | 0.012455 | 0.007942 | 80.29  | 125.91 |
| 10 MB | 0.068968 | 0.057862 | 144.99 | 172.82 |
| 30 MB | 0.181971 | 0.172433 | 164.86 | 173.98 |
| 50 MB | 0.304717 | 0.290854 | 164.09 | 171.91 |
| 75 MB | 0.440299 | 0.433381 | 170.34 | 173.06 |
| 100 MB | 0.586277 | 0.574423 | 170.57 | 174.09 |

At 1 MB the process is still warming up (instruction cache cold, branch predictor untrained). By 10 MB throughput has stabilized. The 100 MB figure — approximately **172 MB/s** averaged across encrypt and decrypt — is the reference number used throughout the study.

The encrypt/decrypt asymmetry visible at small sizes disappears at large sizes because both encrypt and decrypt execute the same `chacha20_block` function; the difference is only in how the keystream is applied (XOR against input vs. direct extraction), which has negligible cost at block level.

---

## Why This Implementation Is Never Optimized

The C scalar implementation is the reference. Optimizing it would shift the denominator of every comparison. If C becomes faster, OCaml looks proportionally worse, not because OCaml degraded but because the reference moved.

More fundamentally: this implementation already produces near-optimal machine code for scalar 32-bit arithmetic on x86-64. The `roll` instruction is optimal for rotation. `uint32_t` arithmetic needs no masking. Bounds checks do not exist. There is no language overhead to remove.

Any future C scalar improvement would require algorithmic changes (such as loop unrolling or SIMD). Algorithmic changes violate the structural equivalence constraint and are therefore out of scope for this study.
