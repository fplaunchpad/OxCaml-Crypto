# Project Overview

This document describes what the study is, why it was conducted, and what design decisions governed the entire project. Readers who understand this document will be able to interpret every result in the chapters that follow.

---

## What This Study Is

This is an assembly-guided optimization study comparing four implementations of the ChaCha20 stream cipher: a C scalar baseline, an OCaml scalar implementation, a C SIMD implementation, and an OxCaml SIMD implementation.

The goal is not to produce the fastest possible ChaCha20 implementation. The goal is to characterize how much of the performance gap between C and OCaml/OxCaml is attributable to the compiler and runtime, and how much is irreducible given the structural constraints of each language.

Every optimization decision is grounded in the generated machine code. Assembly is the medium through which compiler behavior becomes observable. Where assembly and benchmark results agree, the conclusion is firm. Where they disagree, the assembly takes precedence in diagnosing the cause.

---

## Why ChaCha20

ChaCha20 was chosen for four reasons.

**It is precisely specified.** RFC 8439 defines the algorithm completely, including test vectors. This makes correctness verification unambiguous at every stage.

**It is representative.** ChaCha20 is pure ARX arithmetic — additions, bitwise rotations, XOR. It contains no memory-intensive operations, no branching on secret data, and no lookup tables. This makes it an ideal vehicle for studying compiler-generated arithmetic code.

**It is widely used.** ChaCha20 appears in TLS 1.3, SSH, WireGuard, and many other production systems. Results for ChaCha20 generalize to other ARX ciphers and to integer-heavy scientific code.

**It has canonical implementations.** D. J. Bernstein's public-domain C implementation (`chacha-regs.c`) and the Cryptokit OCaml library both implement ChaCha20 to the same specification. This provides a natural pair of structurally equivalent starting points.

---

## Why OCaml and OxCaml

OCaml is a widely-used functional language with a native-code compiler. Its integer representation — every `int` stored as `2n+1` — imposes overhead on 32-bit arithmetic that has no equivalent in C. ChaCha20 exposes this overhead directly because every state word is a 32-bit quantity.

OxCaml is a variant of OCaml developed at Jane Street that adds unboxed types and SIMD intrinsics. It allows functional code to emit inline SIMD instructions without FFI. ChaCha20 is a natural benchmark for OxCaml SIMD because the four-row state structure maps directly onto 128-bit SSE2 vectors.

The two implementations together cover the most interesting region: scalar functional code (OCaml) and vectorized functional code (OxCaml), each compared against its structurally equivalent C counterpart.

---

## Study Timeline

The study proceeded in the following order. Each step was triggered by a specific observation or need; the arrows represent that causation.

```
Cryptokit OCaml scalar
        │  Starting point: existing production OCaml implementation
        │  of ChaCha20. Structural equivalence with C scalar verified.
        ▼
Establish C scalar baseline
        │  Measure both implementations. Observe the initial gap:
        │  OCaml ~38 MB/s vs C scalar ~170 MB/s at 100 MB.
        │  Motivates optimization.
        ▼
Optimize OCaml scalar (Opt01 → Opt04)
        │  Two successful optimizations (Opt01, Opt02) raise OCaml
        │  to ~54 MB/s. Two failed experiments (Opt03, Opt04) are
        │  reverted. Remaining gap classified as largely irreducible.
        ▼
Introduce OxCaml SIMD
        │  Scalar gap is ~3× and mostly irreducible at the language
        │  level. SIMD is introduced to test whether OxCaml's SIMD
        │  builtins can close the gap against a vectorized reference.
        ▼
Optimize OxCaml SIMD (Opt01 → Opt06)
        │  Seven stages. Large gain at Opt04 (preallocation).
        │  Final result: ~275 MB/s.
        ▼
Question fairness of C SIMD reference
        │  After observing OxCaml reach ~200 MB/s, the original
        │  C SIMD baseline (~224 MB/s) is re-examined. Is it truly
        │  equivalent to the OxCaml SIMD implementation?
        ▼
Optimize C SIMD to establish fair reference (Opt01 → Opt02)
        │  C SIMD is optimized NOT to maximize speed but to confirm
        │  structural equivalence. Two stages mirror what OxCaml
        │  already does. Final result: ~320 MB/s.
        ▼
Final cross-language comparison
        │  OCaml scalar vs C scalar. OxCaml SIMD vs C SIMD.
        │  All remaining gaps classified as reducible, marginal,
        │  or irreducible using assembly evidence.
        ▼
Conclusions
```

---

## Design Decisions

These decisions governed the entire study. Understanding them is necessary to interpret every result.

### Why Cryptokit Was Used as the OCaml Scalar Reference

Cryptokit is the canonical OCaml cryptography library. Its ChaCha20 implementation is derived from the same Bernstein reference code as the C scalar implementation — the same algorithm, the same state layout, the same API shape. Using Cryptokit as the starting point guarantees that the OCaml baseline is structurally equivalent to the C baseline by construction. Starting from a custom implementation would introduce unverified structural differences before the study begins.

### Why Single-Block C SIMD Was Implemented Instead of AVX2 Multi-Block

Modern high-performance ChaCha20 implementations process 4 or 8 blocks simultaneously using AVX2 256-bit or AVX-512 512-bit vectors. These implementations achieve throughput above 1 GB/s on modern hardware.

This study deliberately did not use such implementations. The reason is structural equivalence.

OxCaml's SIMD builtins operate on 128-bit SSE2 vectors. One `int32x4` register holds four 32-bit state words. One call to `quarterround` processes four ChaCha20 state columns simultaneously — one block at a time. A multi-block C implementation would process four or eight blocks simultaneously, performing fundamentally different work per SIMD instruction.

Comparing OxCaml SIMD (one block per call) against a multi-block C SIMD implementation would mean comparing different algorithms. The performance gap would measure the algorithmic difference, not the compiler difference. Conclusions about OCaml or OxCaml as languages would be invalid.

The C SIMD implementation in this study was written to mirror the OxCaml SIMD implementation exactly: same state layout (four `__m128i` rows), same intrinsics (one per OxCaml builtin), same operation sequence. Every macro in `chacha20_simd.c` maps 1-to-1 to an OxCaml builtin. This is explicitly documented in the source.

### Why Algorithmic and Structural Equivalence Was Enforced Throughout

Two implementations are algorithmically equivalent if they compute the same result. They are structurally equivalent if they compute it through the same sequence of operations on the same data layout.

Algorithmic equivalence alone does not justify a direct performance comparison. A SIMD implementation and a scalar implementation are algorithmically equivalent but structurally different. A loop-unrolled implementation and a loop-using implementation are algorithmically equivalent but structurally different.

This study compares performance between OCaml and C. The only conclusion that is scientifically valid is: given structurally equivalent algorithms, what is the cost of the OCaml/OxCaml runtime overhead? Structural equivalence is the precondition that makes this question answerable. Without it, performance gaps are uninterpretable.

### Why Every Optimization Required RFC Validation, Benchmark, and Assembly Verification

Each of the three checks catches a different failure mode.

**RFC validation** catches correctness failures. An optimization that changes the algorithm is not an optimization — it is a bug. RFC test vectors are the ground truth for correctness.

**Assembly verification** catches compiler-level failures. An optimization that is undone by the compiler produces no improvement regardless of what the benchmark shows. Assembly inspection reveals whether the compiler did what was intended.

**Benchmarking** catches performance failures. An assembly change that improves instruction count may still cause a benchmark regression if it disrupts cache behavior, branch prediction, or instruction scheduling. Benchmark results reveal the net effect on wall-clock performance.

All three checks are required because each is a necessary but not sufficient condition for keeping an optimization.
