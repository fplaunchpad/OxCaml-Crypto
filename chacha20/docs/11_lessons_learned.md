# Lessons Learned

This document records the key insights from the study. These are transferable lessons about compiler behavior, optimization methodology, and language design — not project-specific results. The project-specific conclusions are in `docs/08_final_comparison.md` and `docs/12_conclusion.md`.

---

## 1. Assembly is a More Reliable Optimization Indicator Than Benchmarks Alone

Benchmarks measure wall-clock time, which reflects cache behavior, branch prediction, instruction scheduling, process scheduling, and thermal effects in addition to instruction count. Two implementations that differ by one instruction can produce identical benchmark numbers. Benchmark noise at the ± 1% level can mask genuine improvements or create false regressions.

Assembly inspection answers a different question: did the compiler do what was intended? If the assembly change did not occur, the optimization failed at the compiler level regardless of what the benchmark shows. If it did occur, the assembly change is real even if the benchmark shows no improvement (the bottleneck may lie elsewhere).

In this study, OCaml Opt03 produced bitwise-identical assembly despite a structural change in the source. Only assembly inspection revealed this; the benchmark was also unchanged, but the null benchmark alone could have been attributed to noise. The assembly was definitive: the optimization was a no-op.

**Practical rule:** Inspect assembly first. If the expected change did not occur, stop. A benchmark cannot distinguish "the optimization worked but is below noise" from "the compiler undid the optimization."

---

## 2. OCaml's Range Inference Can Outperform Naive Use of Array.unsafe_get

OCaml's bounds-check elimination is not simply "safe accesses check, unsafe accesses skip check." The compiler performs range inference: it tracks what the program has already proven about an array's length and eliminates subsequent redundant checks for the same array in the same function scope.

Safe array accesses serve as validity proofs. Once the compiler sees `i.(0)` through `i.(15)` as safe accesses, it knows `i` has at least 16 elements, and it suppresses bounds checks on subsequent accesses to `i` within the same scope.

Replacing preamble safe accesses with `Array.unsafe_get` removes those proofs. The compiler loses the validity information and reinstates bounds checks on subsequent safe accesses — in this case, in the output section where the add-backs occur. The total bounds-check count stays the same; only the location changes.

**Practical rule:** `Array.unsafe_get` is beneficial when the proof would otherwise be redundant and no subsequent safe accesses depend on it. In a function that uses both preamble-load and output-phase safe accesses, the preamble safe accesses are load-bearing: removing them causes downstream check re-emission.

---

## 3. Constant Hoisting Can Be Silently Undone by Compiler Optimization Passes

OCaml's Clambda intermediate representation performs constant folding through `[@inline]` boundaries. A module-level `let mask = 0xFFFFFFFF` binding that is used only inside an inlined function will be folded back to the literal `0xFFFFFFFF` at every call site before native code is generated. The `let` binding does not survive to the assembly stage.

This is a documented property of OCaml's compiler, but its completeness is easy to underestimate. The folding is not partial or conditional — it is total. The resulting assembly is bitwise identical to the pre-hoisting code.

**Practical rule:** Constant hoisting inside inlined functions is a no-op in OCaml unless the constant is passed as a parameter (which changes calling convention) or stored in a heap-allocated structure (which has its own overhead). The compiler already does the optimal thing for constant-valued arguments to inlined functions.

---

## 4. Structural Equivalence is a Prerequisite for Fair Cross-Language Comparison

Performance differences between two language implementations can arise from three sources: algorithmic differences, structural differences, and language/runtime overhead. Only the third is a valid basis for conclusions about the language.

If C and OCaml implementations use different algorithms (e.g., multi-block vs single-block SIMD), any performance gap reflects algorithmic choice, not language choice. If they use the same algorithm but different data structures (e.g., row-major vs column-major state), the gap may reflect cache behavior rather than arithmetic overhead.

This study enforced structural equivalence from the beginning: same state layout, same operation sequence, same API shape. Only then does a performance gap between C and OCaml tell us something about the language.

**Practical rule:** Before concluding that language X is faster than language Y for a given workload, verify that both implementations use the same algorithm and data layout. Structural equivalence is not automatic and must be verified explicitly.

---

## 5. The Keep/Revert Discipline Prevents Accumulation of Noise

In optimization work, it is tempting to retain changes that show small positive benchmark differences even when the assembly evidence is ambiguous. Over multiple optimization stages, this creates a false picture: the cumulative "improvement" may be benchmark noise that compounded.

This study reverted every optimization that did not show both assembly improvement and benchmark improvement above noise. Opt03 and Opt04 were reverted despite one having a neutral benchmark (Opt03) and the other a small regression (Opt04). The reversion kept the baseline honest.

The benefit: the Opt01 and Opt02 gains are clean. They are not contaminated by adjacent null-result stages that happened to land on the positive side of the noise floor. The +24.9% and +13.5% figures are genuine improvements, validated independently by assembly and benchmark.

**Practical rule:** Revert optimizations that fail to show assembly evidence. A neutral benchmark with assembly confirmation should prompt deeper investigation, not automatic retention. A benchmark improvement without assembly evidence should be treated with suspicion.

---

## 6. The Bottleneck May Not Be Where the Code Is

OxCaml SIMD Opt04 produced the largest single gain in the entire study (+35.3%) by eliminating heap allocations in the loop driver — not by changing the SIMD block function at all. The SIMD arithmetic was already fast. The outer loop was the bottleneck.

This is a general principle: for workloads with an expensive inner computation (here, the block function) and a loop driver (here, `chacha20_crypt`), the outer loop's overhead can dominate even when it appears cheap per iteration. At 1.6 million block calls per 100 MB, even a few allocations per call becomes millions of allocations.

**Practical rule:** Before optimizing the inner computation, audit the outer loop for per-iteration overhead: allocations, format conversions, redundant copies, redundant initializations. In this study, the inner SIMD computation was effectively optimal by Opt02; the remaining 35% gain came entirely from the outer loop.

---

## 7. OxCaml SIMD Builtins Compile to Competitive Machine Code

A skeptical reader might expect that functional-style SIMD code — with `[@inline]` functions, tuple returns, and OCaml's type system — would generate substantially worse code than C intrinsics even after all overhead is removed from the outer loop.

The evidence does not support this. After Opt04, the OxCaml block function generates a sequence of SSE instructions that is structurally identical to the C SIMD block function. The `[@@builtin]` mechanism works: each OxCaml primitive compiles to exactly the intended SSE instruction with no call overhead, no boxing, and no tag operations (the `int32x4` type is unboxed).

The remaining 14% gap after all optimizations is attributable to the outer loop (counter encoding, `Bytes` indirection, output allocation) — not to SIMD instruction quality. The SIMD computation itself has zero gap.

**Practical conclusion:** OxCaml's SIMD approach is viable for performance-critical code. Functional style does not inherently impede SIMD code generation. The barriers are in the scaffolding around the hot loop, not in the hot loop itself.
