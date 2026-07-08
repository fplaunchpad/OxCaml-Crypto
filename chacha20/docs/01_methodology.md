# Optimization Methodology

This document describes the optimization methodology applied throughout the study. Every optimization in every implementation was evaluated using this process. The methodology is not described again in subsequent chapters; those chapters cite it by name and apply it directly.

---

## Philosophy: Assembly as Ground Truth

The central rule of this study is that generated machine code, not benchmark results, is the primary evidence for or against an optimization.

Benchmarks are necessary but not sufficient. A benchmark measures wall-clock time, which is affected by cache behavior, branch prediction, process scheduling, and thermal throttling. Two implementations that differ by one instruction can produce identical benchmark numbers. Conversely, two implementations whose benchmark numbers differ by 2% may differ by zero instructions — the gap is measurement noise.

Assembly inspection answers a different question: *did the compiler actually do what we expected?* If the expected assembly change did not occur, the optimization failed at the compiler level regardless of what the benchmark shows. If the expected assembly change did occur but the benchmark shows no improvement, the change was real but the bottleneck lies elsewhere.

This study uses assembly as the deciding criterion. A benchmark improvement without assembly evidence is inconclusive. An assembly change without a benchmark improvement is real but may be below the noise floor.

---

## The Optimization Loop

Every optimization followed this sequence without exception:

```
Baseline
    │
    ▼
Assembly inspection
    │   Read the generated assembly for the current implementation.
    │   Identify instructions that are candidates for elimination.
    │   Count hot-path instruction types.
    │
    ▼
Hypothesis
    │   State the expected assembly change precisely.
    │   For example: "replacing i.(N) with Array.unsafe_get i N will
    │   eliminate the 16 bounds-check sequences in the preamble,
    │   saving 36 instructions."
    │   A hypothesis that cannot predict an assembly change is rejected.
    │
    ▼
Algorithmic equivalence verification
    │   Verify that the proposed change preserves the algorithm.
    │   Structural equivalence must be maintained: same operations,
    │   same order, same data layout.
    │
    ▼
Implementation
    │   Make the single targeted change.
    │   No unrelated cleanup is bundled into an optimization stage.
    │
    ▼
RFC validation
    │   Run the RFC 8439 test vectors immediately.
    │   A failing test vector stops the evaluation here.
    │   The implementation is reverted regardless of assembly or benchmark.
    │
    ▼
Assembly comparison
    │   Regenerate the assembly.
    │   Compare against the previous stage.
    │   Did the expected change occur?
    │   Did anything unexpected change?
    │
    ▼
Benchmark
    │   Run the benchmark across all input sizes.
    │   Compare against the previous stage at 100 MB (steady state).
    │   Noise threshold: ± 1%.
    │
    ▼
Decision
    │   Keep:   assembly improved AND benchmark improved above noise.
    │   Revert: assembly unchanged, OR benchmark regressed, OR
    │           assembly improved but benchmark shows no gain
    │           and no further benefit is anticipated.
    │
    ▼
Repeat from Assembly inspection
```

---

## Structural Equivalence as a Hard Constraint

Every optimization must preserve structural equivalence with the reference implementation (C scalar for OCaml scalar; C SIMD for OxCaml SIMD).

Structural equivalence means: the same operations, in the same order, on the same data layout. An implementation that achieves higher throughput by doing *fewer* operations — for example, by processing multiple ChaCha20 blocks simultaneously — is not structurally equivalent and cannot be compared directly with a single-block implementation. Any performance gap between such implementations reflects algorithmic differences, not compiler or language differences.

This constraint is non-negotiable. Violating it invalidates the comparison.

---

## What Counts as a Failed Optimization

A result is classified as a failure and reverted if any of the following hold:

- The RFC 8439 test vectors fail (correctness failure — immediate revert).
- The generated assembly is bitwise identical to the previous stage (the compiler undid the change).
- The assembly changed but the benchmark shows regression greater than noise.
- The assembly changed but the benchmark shows no improvement and no plausible downstream benefit exists.

A null result — assembly unchanged, benchmark unchanged — is also a failure. It means the compiler already performed the optimization or an equivalent one. Retaining null-result changes would create misleading stage names and a false appearance of progress.

---

## RFC Validation

The RFC 8439 test vectors are run after every implementation change, without exception. The test suite covers:

- The quarterround function
- The block function (full ChaCha20 core)
- The stream cipher (full encrypt/decrypt round-trip)

Passing RFC validation is a necessary but not sufficient condition for keeping an optimization. It confirms that the change did not break correctness. It does not confirm that the change was beneficial.

---

## Assembly Generation

Assembly is generated using the compiler's `-S` flag (for C) or `-S` option via `ocamlfind ocamlopt` (for OCaml/OxCaml). Each optimization stage produces a named assembly file stored under `benchmarks/results/<impl>/assembly/`. Assembly files are retained permanently — they are the primary record of what the compiler produced at each stage.

---

## Why Benchmarks Alone Are Insufficient

Three cases from this study illustrate the limitation:

**Opt03 (OCaml scalar — constant hoisting).** The hypothesis predicted that hoisting `0xFFFFFFFF` into a `let` binding would reduce reload count. The assembly was bitwise identical to the previous stage — the OCaml Clambda pass folded the constant back through the `[@inline]` boundary. The benchmark showed no change. Without assembly inspection, the null result would have been invisible — the benchmark numbers overlap within noise.

**Opt04 (OCaml scalar — `Array.unsafe_get`).** The hypothesis predicted that removing 16 preamble bounds checks would save 36 instructions. The assembly showed that 16 bounds checks were indeed removed from the preamble — but 16 equivalent checks reappeared in the output section, where they interrupt tighter code. Net instruction saving: 11 (not 36). Benchmark: −2% regression. Without assembly inspection, the mechanism of the regression would be opaque. With it, the cause is exact: range inference lost its validity proof and reinstated the checks in a worse location.

**OxCaml Opt02 (inline).** The hypothesis predicted a measurable throughput gain from inlining. The assembly change was real. The benchmark showed effectively no improvement (184.94 → 184.53 MB/s, within noise). The change was retained because the assembly improvement was confirmed and the implementation was on the correct trajectory; the benchmark noise did not contradict the assembly finding.

These cases demonstrate that assembly and benchmark evidence must be evaluated together. Neither is sufficient alone.
