# Conclusion

This study set out to answer one question: when C and OCaml implement the same algorithm in the same structure, how large is the performance gap, where does it come from, and how much of it is reducible?

The answer, with evidence, follows.

---

## What Was Achieved

Four ChaCha20 implementations were built and systematically optimized under a strict assembly-guided methodology:

- **C scalar**: the reference baseline, unchanged throughout
- **OCaml scalar**: 2 successful optimizations (Opt01, Opt02); 2 reverted experiments (Opt03, Opt04)
- **C SIMD**: 2 optimizations (Opt01, Opt02) to establish a fair vectorized reference
- **OxCaml SIMD**: 6 optimizations (Opt01–Opt06), all retained

Every optimization decision was grounded in generated machine code. Reverted experiments are documented with the same detail as successful ones — they are not omitted or minimized.

---

## Final Performance Numbers (100 MB, Steady State)

| Implementation | Encrypt (MB/s) | Decrypt (MB/s) | Ratio to C reference |
|---|---|---|---|
| C scalar | 170.57 | 174.09 | 1.00× |
| OCaml scalar Opt02 | 53.70 | 53.64 | 0.31× |
| C SIMD Opt02 | 319.65 | 321.44 | 1.87× |
| OxCaml SIMD Opt06 | 275.03 | 274.78 | 1.61× |

OCaml scalar reached 31% of C scalar speed. OxCaml SIMD reached 86% of C SIMD speed.

---

## Biggest Optimization Wins

**OCaml scalar Opt01 (+24.9%).** Replacing the heap-allocated work array with 16 local `let` bindings eliminated the single largest source of overhead: per-round array heap traffic, bounds checks on the work array, and round-loop control instructions.

**C SIMD Opt01 (+34.1%).** Replacing 64 scalar byte XORs with 4 SIMD XOR operations in the transform loop. The block function was already SIMD; the transform loop was not. Once aligned, C SIMD throughput jumped from 224 to 301 MB/s.

**OxCaml SIMD Opt04 (+35.3%).** Preallocating `ctr_nonce` and `ks` buffers outside the block loop. This single change added 70 MB/s — more than any other optimization in the study. The SIMD block function had been performing well all along; the outer loop's repeated allocations were the bottleneck.

---

## Biggest Surprises

**Array.unsafe_get regressed.** Replacing safe preamble array loads with `Array.unsafe_get` was expected to eliminate 36 instructions. Instead, it relocated 16 bounds checks to a worse position in the output section, caused a net regression of −2%, and required a revert. The compiler's range inference was providing protection that the manual optimization destroyed.

**Clambda folded the constant completely.** A module-level `let mask = 0xFFFFFFFF` was expected to survive to the native code stage as a register-resident constant. The Clambda pass folded it back to a literal through every `[@inline]` boundary before assembly was generated. The resulting code was bitwise identical to the unoptimized version.

**OxCaml SIMD nearly closed the gap.** The initial expectation was that a functional SIMD implementation with OCaml's type overhead would fall well short of C SIMD. The final result — 86% of C SIMD speed — shows that OxCaml's `[@@builtin]` SIMD compiles to competitive machine code. The remaining 14% gap is in the outer loop scaffolding, not in the SIMD arithmetic.

---

## Scientific Conclusions

**The scalar gap (3.17×) is approximately 99% irreducible in standard OCaml.** The three dominant costs — integer tagging overhead, mask32 cost, and rotate expansion — are consequences of OCaml's uniform integer representation and the absence of a rotate primitive. No technique within standard OCaml can address them. This is not a compiler quality issue; it is a language design trade-off.

**The SIMD gap (14%) is partially reducible.** OxCaml's SIMD arithmetic itself has zero gap to C SIMD. The remaining gap is in outer-loop operations: counter encoding, `Bytes` access indirection, and output buffer allocation. The counter encoding gap is addressable once OxCaml exposes an efficient unboxed 32-bit store. The allocation gap requires an API change.

**SIMD is the correct path for performance-critical OCaml code.** OxCaml SIMD at 275 MB/s is 5.1× faster than OCaml scalar at 54 MB/s. The SIMD approach eliminates the integer tagging overhead (unboxed `int32x4` carries no tag) and expresses the 4-wide ChaCha20 parallelism that scalar OCaml cannot access. For cryptographic workloads, SIMD is not optional — it changes the performance category.

**Assembly-guided optimization works.** The two reverted OCaml scalar experiments would both have appeared as neutral benchmarks without assembly inspection — noise could have obscured either result. Assembly inspection made the reversion decisions definitive. The methodology prevented noise from corrupting the optimization history.

---

## Practical Recommendations

**For ChaCha20 specifically:**
- Use the OxCaml SIMD implementation when OxCaml is available. It provides 86% of C SIMD throughput with correct RFC compliance and purely functional code.
- Use OCaml scalar when OxCaml is not available. The Opt02 implementation is 41% faster than the Cryptokit baseline and produces correct output.
- Do not use OCaml scalar for high-throughput applications where C is feasible — the 3.17× gap is irreducible.

**For OCaml performance work generally:**
- Eliminate heap allocations in hot loops before optimizing arithmetic. Opt04 demonstrates that allocation overhead can dominate even when the arithmetic is correct and efficient.
- Use assembly inspection before benchmarking. The compiler may have already done what you planned, or may undo what you implemented.
- Do not use `Array.unsafe_get` to eliminate bounds checks in functions that also use safe accesses to the same array — the safe accesses provide range inference proofs that `Array.unsafe_get` removes.
- Hoisting constants from inlined functions does not work in OCaml due to Clambda constant folding.

**For OxCaml SIMD work:**
- The `[@@builtin]` approach is viable. Each builtin compiles to the expected SSE instruction with no overhead.
- The outer loop is the bottleneck, not the inner SIMD computation. Audit for per-block allocations and redundant operations before optimizing the SIMD arithmetic.
