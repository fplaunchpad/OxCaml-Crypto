# 00 — Project Overview

## Contents

1. [The SHA-256 Algorithm](#1-the-sha-256-algorithm)
2. [The C Reference Implementation](#2-the-c-reference-implementation)
3. [The OCaml Semantic Gap](#3-the-ocaml-semantic-gap)
4. [Structure of the Optimization Campaign](#4-structure-of-the-optimization-campaign)
5. [What This Case Study Measures](#5-what-this-case-study-measures)

---

## 1. The SHA-256 Algorithm

SHA-256 (FIPS 180-4) processes data in 64-byte blocks. Each block goes through two phases: message schedule expansion and compression.

### 1.1 Message Schedule Expansion

The 64-byte input block is parsed as sixteen 32-bit big-endian words `W[0..15]`. These are extended to sixty-four words using:

```
W[i] = σ₁(W[i-2]) + W[i-7] + σ₀(W[i-15]) + W[i-16],  for i = 16..63
```

where `σ₀` and `σ₁` are the small sigma functions:

```
σ₀(x) = ROTR(x, 7)  ⊕ ROTR(x, 18) ⊕ (x >> 3)
σ₁(x) = ROTR(x, 17) ⊕ ROTR(x, 19) ⊕ (x >> 10)
```

The C source (and initial OCaml translation) computes `W[0..79]`, but only `W[0..63]` are consumed by the compression function. `W[64..79]` are computed but never read — a property inherited from the original Cryptokit source. This dead computation was not identified until the OxCaml optimization phase; its elimination is documented in [Ox02](04_oxcaml_optimization.md#ox02-eliminate-dead-schedule-expansion-ox02_schedule_64).

### 1.2 Compression Function

The compression function maintains eight 32-bit working variables `a..h`, initialized from the current hash state. For each of the 64 rounds:

```
T₁ = h + Σ₁(e) + CH(e, f, g) + K[i] + W[i]
T₂ = Σ₀(a) + MAJ(a, b, c)
h = g;  g = f;  f = e;  e = d + T₁
d = c;  c = b;  b = a;  a = T₁ + T₂
```

where the big sigma functions and Boolean functions are:

```
Σ₀(x) = ROTR(x, 2)  ⊕ ROTR(x, 13) ⊕ ROTR(x, 22)
Σ₁(x) = ROTR(x, 6)  ⊕ ROTR(x, 11) ⊕ ROTR(x, 25)
CH(x,y,z)  = z ⊕ (x ∧ (y ⊕ z))
MAJ(x,y,z) = (x ∧ y) ∨ (z ∧ (x ∨ y))
```

After all 64 rounds, the working variables are added back into the hash state (modulo 2³²).

### 1.3 Why SHA-256 is a Good Compiler Benchmark

SHA-256's compression function has three properties that make it a clean subject for a compiler optimization study:

1. **No data-dependent branches.** Every iteration of the compression loop follows the same control flow. There is no early exit, no dispatch, no polymorphism. Every cycle of execution is in the arithmetic body.

2. **No dynamic allocation.** The C implementation allocates nothing on the heap during compression. All working variables live in registers or on the stack. A correct OCaml implementation that allocates heap memory during compression is therefore paying overhead that the algorithm does not require.

3. **Fixed 32-bit word size.** Every intermediate value in SHA-256 is a 32-bit unsigned word. A language whose native integer is 63 bits wide (OCaml on 64-bit platforms) must either pay for truncation on every arithmetic result or find a way to avoid it. This is the central tension this case study investigates.

---

## 2. The C Reference Implementation

The C implementation is Xavier Leroy's SHA-256 from the INRIA Cryptokit library (2004), adapted for use as a standalone benchmark. The source is in `c/sha256.c`.

### 2.1 Design Decisions in the C Source

**Stack-allocated schedule array.** `SHA256_transform` declares `u32 data[80]` as a local variable. On x86-64 with `-O2`, GCC allocates this on the stack frame rather than the heap. There is no memory allocation cost per block.

**8-way unrolled STEP macro.** The compression loop is written with an 8-way unrolling using a `STEP(a,b,c,d,e,f,g,h,i)` macro that rotates the variable naming rather than rotating the values:

```c
#define STEP(a,b,c,d,e,f,g,h,i) \
    t1 = h + SIGMA1(e) + CH(e, f, g) + SHA256_constants[i] + data[i]; \
    t2 = SIGMA0(a) + MAJ(a, b, c); \
    d = d + t1; \
    h = t1 + t2

for (i = 0; i < 64; i += 8) {
    STEP(a,b,c,d,e,f,g,h,i);
    STEP(h,a,b,c,d,e,f,g,i+1);
    ...
    STEP(b,c,d,e,f,g,h,a,i+7);
}
```

The looping version (controlled by `#if 0`) is retained as a comment for readability. This unrolling eliminates 7 of every 8 loop-counter increments and branch instructions. GCC does not need to rotate the working variables in memory because the macro arguments at each step already express the correct rotation.

**`SHA256_copy_and_swap`.** On little-endian systems (x86-64), the 64-byte input buffer cannot be cast directly to `u32[]` because SHA-256 uses big-endian byte order. The C source handles this with a byte-swap loop in `SHA256_copy_and_swap`, called once per block.

**Compilation.** The C reference is compiled with:

```bash
gcc -O2 -DEXPORT= -o benchmark_sha256 benchmark_sha256.c sha256.c
```

No architecture-specific flags (`-march`, `-msha`, `-mavx`) are used. The intent is a portable scalar baseline.

### 2.2 C Assembly Profile

The compiled `SHA256_transform` function (see `benchmarks/results/c_scalar/assembly/baseline.s`, 975 lines) has the following characteristics relevant to the OCaml comparison:

- **`movl` count: 140.** 32-bit move instructions — all data movement is 32-bit, as the algorithm requires. No 64-bit widening or tag manipulation.
- **`andl` count: 27.** Bitwise AND operations from `CH`, `MAJ`, and the `ROTR` idiom. These are algorithmic, not representational.
- **`jbe` count: 1.** A single conditional branch — the loop back-edge. No bounds checks.
- **No `caml_alloc`, no closure descriptors, no tag reads.** The output is pure arithmetic.

### 2.3 C Benchmark Results

Inputs are deterministic files generated by `benchmarks/generate_inputs.py`. Each file is hashed once; time is measured with `clock_gettime(CLOCK_MONOTONIC)`. Results:

| Input (MB) | Hash Time (s) | Throughput (MB/s) |
|-----------|--------------|-------------------|
| 1         | 0.014217     | 70.34             |
| 10        | 0.076662     | 130.44            |
| 30        | 0.201534     | 148.86            |
| 50        | 0.335789     | 148.90            |
| 75        | 0.504050     | 148.79            |
| 100       | 0.673280     | **148.53**        |

The throughput stabilizes around 148.5–149 MB/s for inputs of 30 MB and above, indicating that the 1 MB measurement includes warmup effects (cold instruction cache, branch predictor not yet trained). All subsequent comparisons use the 100 MB figure as the stable reference.

---

## 3. The OCaml Semantic Gap

A faithful OCaml translation of SHA-256 runs at **32.29 MB/s** at 100 MB — **4.60× slower** than the C reference. This section explains exactly why, from first principles, before any optimization is applied.

### 3.1 The 63-bit Integer Problem

OCaml's native integer type (`int`) is 63 bits wide on 64-bit platforms. The low bit is permanently reserved as a GC tag bit: a `1` indicates an immediate integer value; a `0` indicates a pointer. This representation is invisible at the source level but has a concrete arithmetic consequence: any computation that should produce a 32-bit unsigned result may have bits 32–62 set from intermediate 64-bit operations. The SHA-256 algorithm, which specifies all arithmetic modulo 2³², requires that these upper bits be cleared after every operation where they could be set.

In OCaml, this manifests as a `land mask32` after every arithmetic result that might overflow 32 bits:

```ocaml
let mask32 = 0xFFFF_FFFF

let[@inline] big_sigma0 x =
  ((rotr x 2) lxor (rotr x 13) lxor (rotr x 22)) land mask32
```

The number of `land mask32` calls in the baseline OCaml assembly is **134** (`andq` instructions with the `0xffffffff` immediate). The C reference has **27** `andl` instructions — all algorithmic (from `CH`, `MAJ`, and bitwise operations), none representational.

This is the single largest structural overhead in the OCaml baseline. OxCaml's `int32#` type eliminates it entirely because `int32#` values wrap at 32 bits by construction — no masking is ever needed.

### 3.2 Bounds Checking on Array Accesses

OCaml's safe array access (`arr.(i)`) emits a bounds check before every load and store. In the SHA-256 compression function, every access to `data`, `constants`, and `ctx.state` is bounds-checked. The OCaml baseline assembly contains **32 `jbe` instructions** — conditional branches that implement these checks. The C reference has **1**.

The 32 bounds checks are not free. Each one is a compare-and-branch that the CPU's branch predictor must handle. Because all accesses in the hot loop are within bounds, the branches are always not-taken — the predictor learns this quickly — but the compare instructions and branch slots still consume front-end bandwidth.

### 3.3 Heap Allocation in the Hot Path

The OCaml baseline `transform` function begins with:

```ocaml
let data = Array.make 80 0 in
```

This allocates an 80-element `int array` (640 bytes plus header) on the OCaml minor heap on every call to `transform`. `transform` is called once per 64-byte input block: at 100 MB input, that is 100 × 1024 × 1024 / 64 = **1,638,400 transform calls**, and thus 1,638,400 minor heap allocations of 648 bytes each, totaling approximately 1 GB of minor heap traffic for a 100 MB hash.

OCaml's minor GC (a copying collector with a typical 256 KB nursery) handles short-lived allocations efficiently, but the allocation and initialization cost itself — `Array.make 80 0` writes 80 zeros into the minor heap — is not free, and it serializes through the allocation pointer on every call.

### 3.4 Mutable Reference Boxes for Working Variables

The baseline OCaml compression loop uses 8 mutable references for the working variables `a..h`:

```ocaml
let a = ref ctx.state.(0) in
let b = ref ctx.state.(1) in
...
```

Each `ref` is a one-word heap-allocated box. Accessing `!a` requires a heap dereference; writing `a := v` requires a heap store that may trigger a write barrier if the reference and the value are in different GC generations. The 8 working variables in the C source live in CPU registers (`register u32 a, b, c, d, e, f, g, h`). The OCaml compiler cannot register-allocate `ref` cells because their address is observable.

### 3.5 Per-Block Buffer Copy in `add_data`

The baseline `add_data` implementation copies every input chunk into `ctx.buffer` before calling `transform`:

```ocaml
(* inside the full-block hot loop *)
Bytes.blit data !pos ctx.buffer 0 64;
transform ctx
```

This is a 64-byte `memcpy` per block, introduced to match the C source's `memcpy(ctx->buffer, data, 64)` pattern. The copy is unnecessary for full blocks: `transform` reads the input sequentially and could read directly from the caller's buffer without an intermediate copy.

### 3.6 Overhead Summary

| Source of Overhead | Evidence | Impact |
|--------------------|----------|--------|
| `land mask32` on every arithmetic result | 134 `andq` instructions in baseline vs 27 `andl` in C | Representational; eliminated by `int32#` |
| Bounds checks on `data`, `constants`, `ctx.state` | 32 `jbe` branches vs 1 in C | Eliminated by `Array.unsafe_get/set` |
| `Array.make 80 0` per `transform` call | ~1 GB minor heap traffic at 100 MB | Eliminated by hoisting to `ctx` |
| 8 mutable `ref` cells for working variables | 8 heap-allocated boxes vs register-allocated in C | Eliminated by tail-recursive `rounds` |
| 64-byte `Bytes.blit` per full input block | 1.6M copies at 100 MB | Eliminated by `transform_from` |
| Bounds checks in `get_be32`/`set_be32` | Subset of the 32 `jbe` | Eliminated by `Bytes.unsafe_get/set` |

Each row in this table corresponds to one optimization phase in the OCaml campaign. The optimizations are applied in descending order of estimated impact, guided by the assembly evidence at each step.

---

## 4. Structure of the Optimization Campaign

### 4.1 OCaml Scalar Phase (Opt01–Opt07)

The OCaml phase addresses each structural overhead identified in Section 3, in order of impact. Seven optimizations were attempted; six were kept and one was reverted.

The campaign is organized into three categories:

**Data representation (Opt01, Opt02):** Eliminate the per-transform allocation and the bounds checks on the message schedule and constant arrays. These are the two largest single overheads visible in the baseline assembly.

**Control flow abstraction (Opt03, Opt04):** Replace the mutable ref working variables with tail-recursive function arguments, and eliminate the per-block buffer copy by restructuring the `add_data` hot loop to read directly from the caller's buffer.

**Arithmetic and annotation (Opt06, Opt07):** Eliminate the remaining bounds checks from the byte I/O functions (`get_be32`, `set_be32`), and restructure the sigma functions to reduce the total number of `land mask32` operations from the inside of `rotr` to the output of each sigma call.

**Failed direction (Opt05):** Between Opt04 and Opt06, full loop unrolling was attempted. The complete documentation of this failure, including the I-cache analysis, is in [docs/02_ocaml_scalar_optimization.md](02_ocaml_scalar_optimization.md#opt05--full-loop-unrolling-reverted).

### 4.2 OxCaml Migration Phase

After Opt07, the OCaml source had no further source-level improvements available within the bounds of safe optimizations. The 134 `andq` mask operations were reduced to 93 by Opt07's sigma restructuring, but the remaining masks — and `mask32` itself — cannot be eliminated from OCaml without changing the integer representation.

OxCaml's `int32#` type represents 32-bit integers as unboxed 32-bit values. An `int32# array` stores elements at 4 bytes per slot rather than 8, and all arithmetic on `int32#` values wraps at 32 bits without any masking instruction. The migration from OCaml Opt07 to the OxCaml `int32#` baseline is documented in [docs/03_oxcaml_migration.md](03_oxcaml_migration.md).

The migration was staged across four commits with a correctness gate at each stage:
- `b48e3f2`: Core types and helper functions (`rotr`, `ch`, `maj`, sigma functions)
- `1c71e37`: Context creation, initialization, and byte I/O (`get_be32`, `set_be32`)
- `f8bc711`: Compression core (`transform_from`, `rounds`) and full RFC validation
- `1d9ac70`: Benchmark harness and baseline measurement

### 4.3 OxCaml Optimization Phase (Ox01–Ox03)

The OxCaml baseline at 67.80 MB/s was already 39.2% faster than OCaml Opt07. Three further optimizations were applied, targeting overheads that the `int32#` migration exposed but did not fix:

**Ox01** corrects a closure capture in the tail-recursive `rounds` function — a structural issue analogous to (but mechanically different from) the same bug fixed in OCaml Opt03.

**Ox02** eliminates the dead message schedule expansion (indices 64–79) that was inherited from the C source and carried through the entire OCaml phase without being noticed.

**Ox03** restructures the T₁ computation to separate the `h + Σ₁(e) + CH(e,f,g)` dependency chain from the `K[i] + W[i]` memory loads, with the intent of allowing load latency to be hidden behind the arithmetic chain in the out-of-order execution engine. In practice, the generated assembly was effectively unchanged from Ox02, and the observed benchmark improvement (+2.2%) is within measurement noise. Ox03 is kept because it improves source structure and documents the ILP investigation; it should not be read as a confirmed performance win.

---

## 5. What This Case Study Measures

This is not a general-purpose SHA-256 implementation comparison. It is a controlled experiment with one variable: the source language and its compiler, applied to an identical algorithm.

The C reference is compiled without autovectorization, without SHA-NI, and without any profile-guided optimization. It represents what an experienced systems programmer would write in C and what GCC would produce from it. It is the ceiling for a scalar, portable implementation.

The OCaml and OxCaml implementations are written to be semantically equivalent to the C reference. Every deviation from the C structure is documented and justified. No optimization is applied that changes the observable behavior of the hash function — all outputs are verified against FIPS 180-4 test vectors before and after every change.

What the study measures, precisely, is: *given that the algorithm is fixed and correct, what fraction of the gap between C and OCaml can be recovered by source-level transformations, and what fraction requires language or compiler changes?*

OCaml source-level optimizations moved throughput from 32.29 MB/s to 48.68 MB/s. OxCaml's `int32#` type moved it further to 73.99 MB/s. The remaining performance gap between OxCaml and C appears to stem primarily from compiler and runtime limitations rather than additional source-level optimization opportunities — in particular, the three-instruction rotate sequence where C emits one `roll`, and overhead attributable to the 63-bit integer representation that cannot be removed without changing the compiler backend.

The benchmark graphs generated by `benchmarks/results/graphs.py` and `progress_graphs.py` are referenced at their appropriate locations in each chapter. A complete interpretation of the final comparison graph is in [docs/05_conclusions_and_future_work.md](05_conclusions_and_future_work.md).

---

## Key Takeaways

- **The 63-bit integer representation is the dominant structural overhead.** OCaml's native `int` type requires a `land mask32` after every 32-bit arithmetic result — 134 such masking instructions appear in the baseline assembly, compared to 27 algorithmic ANDs in the C reference. OxCaml's `int32#` type eliminates these entirely.

- **Bounds-check elimination produced the largest single-step gain.** Replacing `Array.get`/`set` with `Array.unsafe_get`/`set` (Opt02) improved throughput by 26.4% and reduced `jbe` branches from 32 to 24. No other source-level change came close in impact.

- **The closure capture pattern is a recurring trap.** A `let rec` defined inside a function that references non-module-level free variables causes the OCaml compiler to build a heap-allocated closure on every enclosing call. This bug appeared independently in both the OCaml phase (Opt03: `data` and `ctx` captured by `rounds`) and the OxCaml phase (Ox01: `constants` captured by `rounds`), despite the prior fix being known.

- **Full unrolling is bounded by the L1 instruction cache.** Opt05 expanded the transform function to approximately 30 KB of machine code, triggering I-cache misses against a 32 KB L1-I budget. The resulting regression (−3.0%) demonstrates that instruction count reduction does not automatically improve performance when the code no longer fits in the instruction cache.

- **Assembly must confirm what the source intends.** Ox03 was written to expose instruction-level parallelism in the T₁ computation, but the generated assembly was effectively unchanged from Ox02. The benchmark variation was within noise. This is the expected outcome for a change that the compiler's instruction scheduler may already handle; it is documented here as a validated null result, not a confirmed optimization.

- **Source-level optimization has a ceiling.** After Opt07 (OCaml) and Ox03 (OxCaml), the assembly evidence indicates that the remaining gap to the C reference is not addressable through further source changes alone. The assembly-visible costs — three-instruction rotate sequences, tag-preservation overhead — require compiler-level changes to eliminate. See [docs/05_conclusions_and_future_work.md](05_conclusions_and_future_work.md) for specifics.
