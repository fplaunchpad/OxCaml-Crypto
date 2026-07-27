# Performance Engineering of Cryptographic Primitives in OCaml and OxCaml

*An assembly-guided compiler research study measuring how close OCaml and OxCaml can come to C for performance-critical cryptographic software.*

---

## 📄 Technical Report

This repository is accompanied by a comprehensive technical report that documents the complete research journey, methodology, optimization campaigns, assembly investigations, benchmark analysis, cross-primitive findings, compiler observations, and final conclusions.

**📄 Read the Technical Report (PDF):**  
https://drive.google.com/file/d/154SGHgUQp1JcT7LucBMZ2y2JqkcLOJxv/view?usp=sharing

**📁 Repository copy:**  
[report/Performance_Engineering_of_Cryptographic_Primitives_in_OCaml_and_OxCaml.pdf](report/Performance_Engineering_of_Cryptographic_Primitives_in_OCaml_and_OxCaml.pdf)

The report can be read independently as a technical case study, while this repository contains the complete source code, benchmarks, optimization logs, assembly investigations, and supporting documentation.

---

## Research Question

> How close can OCaml and OxCaml come to C for performance-critical cryptographic software — while retaining the safety advantages of the OCaml ecosystem? At what point does source-level optimization exhaust itself? What is the cost of the remaining gap, measured in instructions, hardware operations, and compiler limitations?

This is a compiler and runtime engineering study. The cryptographic primitives are measurement instruments, not the primary subject. Each primitive was chosen because it exposes a different dimension of OCaml's and OxCaml's overhead model. The results answer questions about how these languages compile, not only about how fast these algorithms run.

**OCaml** uses a native-code compiler with a uniform runtime representation: every `int` is stored as `2n + 1` (low bit reserved as a GC tag), and 32-bit arithmetic requires explicit masking against `0xFFFFFFFF`. **OxCaml** is Jane Street's extension of OCaml with unboxed types (`int32#`, `int64#`) and `[@@builtin]` SIMD intrinsics that compile to inline SSE/AVX instructions without FFI overhead.

The methodology is assembly-guided: generated machine code is the primary evidence for or against every optimization. Benchmark numbers are consistency checks, not primary evidence.

---

## Research Journey

The research did not begin with a fixed list of primitives. Each primitive was chosen because the previous one exposed a limitation or raised a question that demanded a different experimental design.

```
Research Question: Can OCaml/OxCaml approach C for performance-critical cryptography?
        │
        │  Need the simplest possible primitive to establish the
        │  measurement framework and confirm the gap exists.
        ▼
XOR stream cipher
        │  Finding: C ~400 MB/s, OCaml ~200 MB/s. The gap exists.
        │  Benchmark harness established: 6 input sizes (1–100 MB),
        │  identical inputs, byte-for-byte verification.
        │  Exposed: integer tagging overhead on bitwise operations.
        │
        │  Need a realistic block cipher to test whether the gap
        │  persists at algorithmic complexity.
        ▼
AES-128 (manual, no T-tables)
        │  Finding: C ~5 MB/s, OCaml ~4 MB/s. Both are slow — the
        │  algorithm is the bottleneck, not the language. Gap: ~20%.
        │  Lesson: a naïve implementation does not reveal OCaml-specific
        │  overhead. You need an algorithm where the language, not the
        │  algorithm, is the binding constraint.
        │
        │  Need an optimized scalar implementation where the algorithm
        │  is fast enough for language overhead to dominate.
        ▼
Rijndael (T-table AES-128)
        │  Finding: OCaml baseline ~33 MB/s vs C ~160 MB/s (5× gap).
        │  After eliminating Int32 boxing, bounds checks, function-call
        │  overhead, and GC allocation: OCaml matches C.
        │  Lesson: for algorithms whose arithmetic reduces to byte
        │  extraction and XOR, source-level optimization closes the gap
        │  completely. OCaml's safety infrastructure survives all
        │  optimizations — it was removed only where the algorithm
        │  guarantees safety independently of runtime checks.
        │  GC minor collections: 1,208 → 8 at 100 MB after Int32 removal.
        │  Exposed: Int32 boxing cost, bounds-check structure.
        │
        │  Need to test hardware acceleration and identify where
        │  OxCaml's SIMD falls short.
        ▼
AES-NI
        │  Finding: C with hardware AES instructions ~1,300 MB/s.
        │  OxCaml SIMD key expansion works correctly (xor/shuffle
        │  builtins available). AES round instructions not yet OxCaml
        │  builtins → 11 FFI calls per block → OxCaml SIMD ~130 MB/s.
        │  Lesson: OxCaml SIMD viability is binary — all hot operations
        │  need [@@builtin] coverage; one missing builtin at per-block
        │  frequency degrades throughput by ~10×.
        │  Exposed: [@@builtin] coverage gap in OxCaml's SIMD library.
        │
        │  Need an algorithm where OxCaml SIMD can be evaluated fairly
        │  (all builtins exist) and where the scalar ceiling is tested.
        ▼
ChaCha20
        │  Finding (scalar): OCaml reaches 54 MB/s vs C 171 MB/s.
        │  Gap ~99% irreducible: integer tagging (~13.5% of hot path),
        │  mask32 (~25.8%), rotate expansion (7 vs 1 instruction).
        │  Finding (SIMD): OxCaml SIMD reaches 275 MB/s vs C SIMD
        │  320 MB/s (86%). The [@@builtin] approach works. Dominant
        │  gain: eliminating outer-loop allocation (+35.3%). Dominant
        │  surprise: Array.unsafe_get regressed by 2% — the compiler
        │  was using preamble safe accesses as range-inference proofs.
        │  Exposed: Clambda constant folding, range-inference proof
        │  dependency, closure capture trap, outer-loop allocation.
        │
        │  Need an algorithm dominated by 32-bit arithmetic to test
        │  OxCaml's int32# unboxed integer type.
        ▼
SHA-256
        │  Finding: 134 andq masking instructions per compression call
        │  (vs 27 andl in C) is the dominant overhead. OxCaml int32#
        │  eliminates all masking (+39.2%). Dead code (W[64..79]) found
        │  by reading FIPS 180-4 against the implementation — survived
        │  7 OCaml optimizations and the OxCaml migration (+5.8%).
        │  Remaining ceiling: rotate idiom (3 instructions vs 1 roll)
        │  requires a compiler-level fix (~1.89B extra instructions per
        │  100 MB run).
        │  Exposed: Flambda2 closure capture for unboxed types, int32#
        │  initialization gap, dead-code inheritance from references.
        │
        │  Need a multiply-dominated authentication primitive to complete
        │  the arithmetic profile coverage and move toward AEAD.
        ▼
Poly1305 (future work)
           GF(2¹³⁰−5) arithmetic. Tests int32# benefits on
           multiplication-heavy workloads. Explores int64# for carry
           propagation. Completes ChaCha20-Poly1305 AEAD (RFC 8439).
```

---

## Executive Results

All figures at 100 MB input, steady state.

| Primitive | Implementation | Throughput (MB/s) | vs C reference | Gap classification |
|---|---|---|---|---|
| XOR | C scalar | ~400 | 1.00× | Reference |
| XOR | OCaml scalar | ~200 | ~0.50× | Partially irreducible (tagging) |
| AES-128 | C scalar | ~5 | 1.00× | Reference |
| AES-128 | OCaml scalar | ~4 | ~0.80× | Algorithm-limited (no T-tables) |
| Rijndael | C scalar | ~160 | 1.00× | Reference |
| Rijndael | OCaml scalar (optimized) | ~160 | ~1.00× | **Closed** |
| AES-NI | C | ~1,300 | 1.00× | Reference |
| AES-NI | OCaml C-bindings | ~1,030 | ~0.79× | FFI call overhead |
| AES-NI | OxCaml SIMD | ~130 | ~0.10× | Builtin-limited (missing AES round instructions) |
| ChaCha20 | C scalar | 170.57 | 1.00× | Reference |
| ChaCha20 | OCaml scalar (Opt02) | 53.70 | 0.31× | ~99% irreducible |
| ChaCha20 | C SIMD (Opt02) | 319.65 | 1.87× | Reference (SIMD) |
| ChaCha20 | OxCaml SIMD (Opt06) | 275.03 | 1.61× | 14% outer-loop gap |
| SHA-256 | C scalar | 148.53 | 1.00× | Reference |
| SHA-256 | OCaml scalar (Opt07) | 48.68 | 0.33× | ~99% irreducible |
| SHA-256 | OxCaml int32# (Ox03) | 73.99 | 0.50× | Rotate gap (compiler-level fix needed) |

---

## Repository Evolution

This section describes how the development workflow matured across the course of the project. These changes improved the reproducibility, consistency, and maintainability of the research. None of them affected benchmark performance.

```
Development begins (WSL2 toolchain setup)
        ↓
HTTPS Git workflow for early commits
        ↓
Benchmark input standardization (6 sizes: 1, 10, 30, 50, 75, 100 MB)
        ↓
Benchmark automation (shell scripts, CSV output per implementation)
        ↓
Assembly-first optimization workflow established
        ↓
perf investigations added for unexplained regressions
        ↓
Automated graph generation (Python + matplotlib, deterministic from CSV)
        ↓
SSH Git workflow (higher-frequency commit and push activity)
        ↓
Standardized optimization documentation (10-stage template)
        ↓
Cross-primitive analysis
        ↓
Repository-wide research artifact
```

**Environment setup.** The project began on WSL2 (Ubuntu 24.04.4 LTS) on an Intel Core i5-1240P. OCaml 5.4.1 was installed via opam. The OxCaml toolchain required a separate `oxcaml-dev` opam switch, managed alongside the standard OCaml environment throughout the project.

**Version control.** Early development used HTTPS-based Git operations. As repository activity increased — roughly at the ChaCha20 phase, where optimization campaigns generated frequent commits and pushes across multiple implementation directories — the workflow migrated to SSH-based Git authentication. This eliminated per-push credential prompts and reduced friction in daily iteration. The migration was a developer ergonomics improvement with no effect on the research.

**Benchmark standardization.** The six-input protocol (1, 10, 30, 50, 75, 100 MB) was established during the XOR phase and applied without modification to every subsequent primitive. Shell scripts were written for each implementation to compile, run the benchmark, and write results to CSV. The format was standardized: `InputSizeMB,Time,Throughput`. This made cross-primitive result comparison mechanical and ensured that benchmark conditions were identical across all case studies.

**Assembly as a first-class artifact.** Early optimization attempts used benchmark results as the primary decision criterion. The assembly-first discipline — generating a named `.s` file at each stage, comparing it instruction-by-instruction against the previous stage before running benchmarks — was established during the Rijndael campaign and applied without exception from that point forward. The ChaCha20 study produced the clearest demonstration of why this matters: both the constant-folding null result (Opt03) and the bounds-check relocation regression (Opt04) were diagnosed definitively only through assembly inspection.

**`perf` integration.** Hardware counter analysis was added as a supplementary tool during the SHA-256 campaign to explain the Opt05 regression (full loop unrolling). `perf stat` with `L1-icache-load-misses` confirmed I-cache overflow. `perf` was never used as a primary evidence source — it was invoked only when assembly analysis could not explain a result. This threshold was maintained consistently.

**Graph generation.** Python scripts using pandas and matplotlib were written for each primitive to generate PNG graphs from CSV benchmark results. The scripts are deterministic: the same CSV input always produces the same output, making visualizations reproducible without re-running benchmarks.

**Documentation standardization.** Beginning with the ChaCha20 case study, each optimization was documented using a fixed 10-stage template: Observation → Hypothesis → Expected Improvement → Implementation → Correctness/Safety → Assembly Verification → perf Analysis → Benchmark Results → Decision → Lessons Learned. Reverted experiments are documented to the same depth as successful ones. This template ensures that every optimization — whether kept or reverted — is traceable to its assembly evidence.

These workflow improvements were introduced to ensure that benchmark results are reproducible, that optimization decisions are traceable to their assembly evidence, and that the research record is complete, including failed experiments, which are as scientifically informative as successful ones.

---

## Common Optimization Workflow

Every optimization in every primitive followed this sequence without exception:

```
Study the algorithm specification
        ↓
Identify the hot path from a structural reading of the code
        ↓
Inspect the generated assembly for the current implementation
        ↓
Find the dominant bottleneck (instruction pattern, allocation, call overhead)
        ↓
State the hypothesis: what assembly change is predicted and why
        ↓
Implement the single targeted change (no bundling with unrelated cleanup)
        ↓
Validate correctness (RFC/FIPS/AES test vectors — fail = immediate revert)
        ↓
Verify the assembly changed as predicted
        ↓
Benchmark across all 6 input sizes
        ↓
Decision: Keep (assembly and benchmark both improve) or
          Revert (assembly unchanged, benchmark regresses, or
                  assembly improved but benchmark unchanged with no
                  plausible downstream benefit)
        ↓
Return to assembly inspection
```

A benchmark improvement without assembly evidence is treated as noise. An assembly improvement without benchmark improvement is real but may be below the measurement floor; such changes are evaluated on structural merits rather than accepted or rejected by benchmark numbers alone.

---

## Common Validation Strategy

| Primitive | Standard | Validation method |
|---|---|---|
| XOR | No formal standard | Byte-for-byte encrypt/decrypt round-trip |
| AES-128 | NIST AES-128 test vectors | Known-answer encrypt/decrypt |
| Rijndael | NIST AES-128 test vectors + C cross-check | Byte-for-byte vs reference C output |
| AES-NI | NIST AES-128 test vectors + Python/OpenSSL | Byte-for-byte vs OpenSSL AES |
| ChaCha20 | RFC 8439 | Quarterround, block function, stream cipher round-trip |
| SHA-256 | FIPS 180-4 | All standard known-answer tests |

Correctness validation is a hard gate: no benchmark number from any optimization stage was accepted without a passing correctness test. An optimization that changes algorithm output is a bug, regardless of its throughput effect.

`perf stat` hardware counters were used as supplementary evidence in one case: SHA-256 Opt05, where a throughput regression could not be explained by assembly alone. Hardware counters are not part of the standard workflow; they are reserved for cases where assembly analysis is insufficient.

---

## Threats to Validity / Experimental Scope

These limitations define the boundaries within which the results apply.

**Single CPU architecture.** All benchmarks were performed on one machine: Intel Core i5-1240P (12th Gen, Alder Lake, x86-64) running under WSL2. Results may differ on other x86-64 microarchitectures (different L1-I cache sizes, branch predictor behavior, instruction latencies) and are not claimed to generalize to ARM, RISC-V, or other ISAs.

**Large sequential inputs.** Throughput was measured on inputs of 1 MB to 100 MB, processed sequentially. Results characterize steady-state bulk-data throughput. Small-message performance, latency-sensitive applications, and concurrent multi-threaded workloads are outside scope.

**Source-level optimization only.** Every optimization was implemented at the source level. Compiler flag tuning beyond standard `-O2`/`-O3 -march=native`, link-time optimization, and profile-guided optimization were not applied. The results characterize what a developer writing idiomatic OCaml/OxCaml achieves without compiler flag engineering.

**Structural equivalence constraint.** SIMD comparisons required implementing a structurally equivalent C SIMD reference rather than using existing highly-optimized implementations. The ChaCha20 C SIMD reference was written specifically to mirror the OxCaml SIMD structure: single-block, SSE2/SSSE3, same state layout, same operation sequence. Comparison against an AVX2 multi-block implementation would not be valid — it would measure algorithmic difference, not language overhead.

**Architecture-specific instructions intentionally excluded.** SHA-NI (`SHA256RNDS2`, `SHA256MSG1`, `SHA256MSG2`), AVX2 multi-block ChaCha20, and AES-NI in scalar OCaml beyond C-binding measurements were excluded from primary optimization campaigns where they would change the research question. These are design decisions, not limitations: including them would measure hardware advantage, not the language overhead that is the subject of this study.

**Single-run benchmarks.** Each benchmark reports one throughput measurement per input size per stage. The ±1% noise threshold used in keep/revert decisions is conservative relative to the 5–35% gains that distinguished meaningful optimizations. Formal statistical confidence intervals were not computed.

**Compiler version dependency.** The behaviors documented here reflect OCaml 5.4.1 and the available OxCaml toolchain at time of study. Future compiler improvements — particularly rotate idiom recognition and additional SIMD builtins — would change some results.

---

## Compiler Behaviors Discovered

This repository is simultaneously a performance study and a compiler behavior catalog. The following behaviors were discovered during the optimization campaigns. They are not algorithm-specific.

**OCaml native compiler:**

- **Clambda constant folding through `[@inline]` boundaries.** A module-level `let mask = 0xFFFFFFFF` used only inside an `[@inline]` function is folded back to a literal at every call site before assembly generation. The binding does not survive to native code. Constant hoisting inside inlined functions is structurally a no-op. *(ChaCha20 Opt03)*

- **Range inference proof dependency.** Safe array accesses (`arr.(i)`) serve as validity proofs that suppress bounds checks on subsequent accesses to the same array within the same scope. Replacing preamble safe accesses with `Array.unsafe_get` removes those proofs and triggers check re-emission elsewhere — potentially at a worse location and with no net instruction saving. *(ChaCha20 Opt04; contrast with SHA-256 Opt02 and Rijndael Phase 2 where the same transformation was beneficial)*

- **`let rec` closure capture.** A `let rec` function defined inside another function captures free variables from the enclosing scope as a heap closure, allocated on every outer function call. Assembly signature: closure descriptor visible; `caml_alloc` path inside a function that should not allocate. Fix: pass all non-module values as explicit parameters. *(SHA-256 Opt03)*

- **Rotate idiom non-recognition.** `(x lsl n) lor (x lsr (32-n))` compiles to three instructions (`salq`, `shrq`, `orq`). C's equivalent compiles to one `roll`. The compiler does not recognize the rotate idiom. *(Confirmed: ChaCha20, SHA-256)*

- **`Int32` boxing.** OCaml's `int32` type heap-allocates every value. At hot-loop frequency this generates GC pressure proportional to operation count. Eliminating `Int32` in Rijndael dropped GC minor collections from 1,208 to 8 at 100 MB. *(Rijndael)*

**Flambda2 (OxCaml):**

- **Lambda-lifter closure capture for unboxed types.** Flambda2's lambda-lifter captures module-level `int32#` arrays as free variables in non-top-level `let rec` functions — the same behavior as OCaml's native compiler for regular arrays, extended to unboxed types. Fix: identical to the OCaml case. *(SHA-256 Ox01)*

- **`int32#` array initialization gap.** No literal syntax exists for `int32#` arrays. A 64-element constant array requires 64 explicit `aset` calls at initialization. This is not a hot-path cost, but it substantially affects code readability. *(SHA-256 OxCaml migration)*

- **`[@@builtin]` completeness.** When all hot operations have `[@@builtin]` coverage, every builtin call compiles to the intended SSE instruction with no call overhead, no boxing, and no tag operations. The SIMD arithmetic gap to equivalent C is effectively zero. *(ChaCha20 OxCaml SIMD)*

- **`[@@builtin]` coverage gap.** AES-specific instructions (`AESENC`, `AESDEC`, `AESKEYGENASSIST`, `AESIMC`, `AESENCLAST`, `AESDECLAST`) are not yet OxCaml builtins. Operations that require FFI at per-block frequency degrade throughput by approximately 10× relative to equivalent C. *(AES-NI)*

**Cross-compiler (confirmed in both):**

- **Tagged-integer arithmetic overhead on 32-bit modular arithmetic.** Tag maintenance adds `orq $1` after XOR and `leaq -1(%a,%b)` for addition. mask32 requires a 64-bit immediate load (`movabsq $8589934591; andq`). Together these account for approximately 40% of the OCaml hot-path instruction count in ChaCha20 and SHA-256. Irreducible in standard OCaml without `int32#` or SIMD.

- **Dead-code inheritance from reference implementations.** Reference C implementations used as starting points may contain algorithmic dead code that assembly inspection cannot detect. Spec verification is required. *(SHA-256 W[64..79])*

---

## Compiler Recommendations

These recommendations are directly supported by evidence from multiple primitives. Each has a documented impact on specific benchmark results.

**Rotate idiom recognition** *(affects ChaCha20, SHA-256, and any future ARX primitive)*
`(x lsl n) lor (x lsr (32-n))` should compile to `roll` — one instruction. Currently: 7 instructions in OCaml scalar (including tag operations), 3 in OxCaml. In SHA-256 alone, the rotate gap generates approximately 1.89 billion extra instructions per 100 MB run. This is the highest-priority compiler improvement identified by this study.

**AES-NI builtins** *(affects AES-NI; determines OxCaml SIMD viability for any AES-based primitive)*
Six AES-specific instructions are missing from OxCaml's `[@@builtin]` library. The implementation path is documented in `aes/aes-ni/BENCHMARK.md` Section 6.5: additions required in simdgen, `arch.ml`, and `simd_selection.ml`. AES-128 key expansion already works correctly with existing builtins; only the six round instructions are missing. Their addition would reduce the OxCaml SIMD gap from ~10× to a level comparable with ChaCha20.

**`int32#` array literal syntax** *(affects SHA-256 OxCaml and any future primitive using `int32#` constant tables)*
Initializing a 64-element `int32#` constant array currently requires 64 explicit `aset` calls. A literal array syntax would eliminate this. The current approach is not a hot-path performance concern, but it substantially affects code clarity and sets a poor precedent for future `int32#`-heavy implementations.

**Range inference diagnostics** *(affects OCaml; demonstrated in ChaCha20 Opt04)*
When `Array.unsafe_get` removes a validity proof that was suppressing downstream bounds checks, the compiler reinstates those checks silently. A developer-visible warning or annotation when unsafe access removes a load-bearing range inference proof would prevent this class of silent regression — one that currently requires assembly inspection to diagnose.

**32-bit little-endian `Bytes` store** *(affects ChaCha20 OxCaml SIMD)*
ChaCha20's per-block counter update requires 4 byte writes where C uses 1 integer store — approximately 16 instructions vs 2. A `Bytes.set_int32_le` or equivalent unboxed primitive is estimated to close 6–8 percentage points of the current 14% OxCaml SIMD gap.

---

## Engineering Decision Log

| Decision | Category | Primitive | Outcome | Reason |
|---|---|---|---|---|
| Full loop unrolling (Opt05) | Reverted | SHA-256 | −3.0% | I-cache overflow: ~30 KB generated code vs 32 KB L1-I |
| `Array.unsafe_get` on preamble | Reverted | ChaCha20 | −2.0% | Check relocation: preamble proofs removed; checks reappeared in output section |
| Constant hoisting (`let mask`) | Reverted | ChaCha20 | 0% | Clambda folded constant through `[@inline]`; assembly bitwise identical |
| SIMD for SHA-256 | Rejected | SHA-256 | N/A | Sequential data dependencies in message schedule and compression state; single-buffer SIMD is not practical |
| SHA-NI instructions | Rejected | SHA-256 | N/A | Changes the comparison ceiling; outside scalar scope |
| AVX2 multi-block C SIMD | Rejected | ChaCha20 | N/A | Structural non-equivalence with OxCaml single-block SIMD; comparison would be invalid |
| C bindings as optimization target | Rejected | All | N/A | Measures FFI overhead, not OxCaml language capability; does not answer the research question |
| Partial loop unrolling | Not attempted | SHA-256 | N/A | Full unrolling showed I-cache overflow; partial unrolling subject to the same constraint at a different threshold; no assembly evidence motivated the attempt |
| OxCaml SIMD for AES-NI rounds | Implemented, limited | AES-NI | ~130 MB/s | Missing round builtins force 11 FFI calls per block; key expansion works correctly, round instructions cannot be inlined |
| `perf` as primary evidence | Not adopted | All | N/A | Hardware counters are supplementary; assembly is the primary evidence source throughout |
| Early buffer reuse (Rijndael) | Reverted | Rijndael | Regression | Function-call overhead was the dominant cost; removing allocation without addressing it added indirection with no benefit |

---

## Practical Recommendations

**For OCaml developers:**

- `Array.unsafe_get` is not a blanket optimization. After applying it, regenerate the assembly and check whether new `cmpq/jae` pairs appear elsewhere. If they do, the preamble safe accesses were serving as validity proofs; `Array.unsafe_get` relocated the overhead rather than removed it. *(ChaCha20 Opt04: −2.0% vs SHA-256 Opt02: +26.4%)*
- Constant hoisting from inlined functions does not survive OCaml's Clambda pass. A module-level `let mask = 0xFFFFFFFF` inside an `[@inline]` function produces assembly bitwise identical to the original code. *(ChaCha20 Opt03)*
- Any `let rec` inside a function that references enclosing-scope values will heap-allocate a closure on every outer call. Inspect assembly for closure descriptors. Fix: pass all non-module values as explicit parameters. *(SHA-256 Opt03)*
- Audit the outer loop for per-iteration allocations before optimizing the inner computation. The inner computation may already be fast; the outer loop may be the binding constraint. *(ChaCha20 OxCaml Opt04: +35.3%)*
- For algorithms whose arithmetic involves only byte extraction and XOR (T-table implementations), native `int` with `land 0xFF` indexing achieves C-equivalent performance with source-level changes only. *(Rijndael)*
- For algorithms with continuous 32-bit modular arithmetic (ChaCha20, SHA-256), the scalar OCaml gap to C is approximately 99% irreducible at the source level.

**For OxCaml developers:**

- Verify `[@@builtin]` coverage for every hot operation before beginning an OxCaml SIMD implementation. A single missing builtin at per-block frequency can reduce throughput by ~10× relative to C. *(AES-NI: 9% vs ChaCha20: 86% of C)*
- `int32#` is the correct type for algorithms with continuous 32-bit modular arithmetic. The gain over OCaml scalar is approximately +39% for SHA-256, attributable entirely to eliminating `andq` masking instructions.
- Flambda2's lambda-lifter captures `int32#` arrays as free variables in non-top-level `let rec`. Fix: pass values as explicit parameters. Same diagnosis and same fix as the OCaml native compiler case. *(SHA-256 Ox01)*
- `int32#` constant arrays require explicit `aset` calls for initialization — no literal array syntax exists. This is a readability cost, not a hot-path performance cost.
- Functional-style OxCaml SIMD code does not impede code generation. After eliminating outer-loop overhead, OxCaml SIMD reaches 86% of equivalent C SIMD throughput. The remaining gap is in scaffolding around the block function, not in SIMD instruction quality. *(ChaCha20)*

**For compiler developers:**

See [Compiler Recommendations](#compiler-recommendations) above. Each recommendation is supported by evidence from at least two primitives and has a quantified impact on benchmark results.

---

## Future Work

```
Current repository
        │  6 primitives, 15 implementations, ~35 optimization stages.
        │  OCaml and OxCaml characterized across bitwise ciphers,
        │  block ciphers, stream ciphers, and hash functions.
        │
        │  Extends to multiply-dominated arithmetic to complete
        │  the arithmetic profile coverage.
        ▼
Poly1305
        │  GF(2¹³⁰−5) field arithmetic over 32-bit limbs.
        │  Multiply-dominated (vs bitwise-dominated SHA-256 and
        │  addition-dominated ChaCha20). Tests whether int32# benefits
        │  generalize from addition-heavy to multiplication-heavy
        │  workloads. Introduces int64# for carry propagation.
        │  Completes the ChaCha20-Poly1305 AEAD pair (RFC 8439).
        │  Research question: can OxCaml int32# approach C performance
        │  for a multiply-dominated 32-bit primitive?
        │
        │  Combines ChaCha20 and Poly1305 into a complete
        │  authenticated encryption scheme.
        ▼
ChaCha20-Poly1305 AEAD
        │  Complete authenticated encryption (RFC 8439).
        │  Evaluates composition overhead: does AEAD introduce cost
        │  beyond the sum of its constituent primitives?
        │  The natural unit for TLS 1.3 cipher suite evaluation.
        │  Research question: is OxCaml viable for production AEAD?
        │
        │  Extends to the full set of primitives used in TLS 1.3
        │  and common secure channel protocols.
        ▼
TLS cryptographic layer
        │  Remaining TLS 1.3 primitives: HKDF (SHA-256 based,
        │  partially covered by this repository), P-256 / X25519
        │  (elliptic curve — a new arithmetic profile: prime field
        │  arithmetic over large integers).
        │  Each introduces a distinct OCaml overhead signature.
        │
        │  Evaluates end-to-end performance of a complete TLS
        │  session using only OCaml/OxCaml implementations.
        ▼
End-to-end TLS performance
           Full handshake and data transfer measured at the protocol
           level, not the primitive level. Answers the original research
           question at system scale:
           Can OCaml/OxCaml approach C for production TLS workloads?
```

**Compiler prerequisites** (independent of the primitive roadmap; each unblocks further progress):

1. Rotate idiom recognition — affects every ARX primitive: ChaCha20, SHA-256, and future BLAKE2s, Salsa20, Poly1305
2. AES-NI builtins — implementation path documented in `aes/aes-ni/BENCHMARK.md`; would close the AES-NI OxCaml SIMD gap from ~10× to comparable with ChaCha20
3. `int32#` array literal syntax — affects SHA-256 and any future primitive using `int32#` constant tables
4. 32-bit little-endian `Bytes` store — reduces ChaCha20 OxCaml SIMD counter encoding from ~16 instructions to ~2 per block
5. Range inference diagnostics — prevents silent check-relocation regressions without requiring assembly inspection

---

## Repository Statistics

| Category | Count |
|---|---|
| Cryptographic primitives studied | 6 |
| Distinct implementations | 15 |
| Named optimization stages (kept + reverted) | ~35 |
| Assembly files archived (per-stage snapshots) | 32 |
| Benchmark CSV result files | 51 |
| Benchmark data rows | 351 |
| PNG graphs generated | 61 |
| OCaml source lines | ~6,700 |
| C source lines | ~4,500 |
| Documentation (Markdown files / lines) | 39 files / ~10,900 lines |
| Benchmark automation | 22 shell scripts + 22 Python scripts |
| `perf stat` investigations | 1 formal (SHA-256 Opt05); referenced in 2 additional contexts |

---

## Repository Structure

```
ocaml-c-cryptography/
├── README.md                          ← this file
├── docs/
│   ├── cross-primitive-analysis.md   ← synthesis across all primitives
│   └── repository-summary.md         ← executive summary
├── xor/                               ← XOR stream cipher; benchmark harness baseline
│   ├── README.md
│   └── BENCHMARK.md
├── aes/
│   ├── README.md                      ← AES family comparison and navigation
│   ├── aes-128/                       ← Manual AES-128; algorithm vs language distinction
│   ├── rijndael/                      ← T-table AES-128; full optimization to C parity
│   └── aes-ni/                        ← Hardware AES; OxCaml SIMD builtin gap study
├── chacha20/                          ← ARX cipher; scalar ceiling + OxCaml SIMD study
│   ├── README.md
│   └── docs/                          ← 13 documents + 3 appendices
└── sha-256/                           ← Hash function; int32# unboxed type study
    ├── README.md
    └── docs/                          ← 6 documents (00–05)
```

Each primitive directory contains: source implementations in language-named subdirectories (`c/`, `ocaml/`, `oxcaml/`, `c_simd/`, `oxcaml_simd/`), a `benchmarks/` directory with input files, CSV results, per-stage assembly archives, and generated graphs, and documentation in `docs/` or Markdown files at the primitive root.

---

# Conclusions

## What we learned about OCaml

Performance losses in OCaml for compute-intensive numerical code are traceable to a small set of sources: bounds checks, 32-bit masking, integer tagging, and allocation. Source-level optimization consistently recovered the first two — `Array.unsafe_get`/`Bytes.unsafe_get` eliminated bounds-check overhead, and structural changes (moving arrays onto the context, removing `Int32` boxing, eliminating per-block copies) eliminated allocation overhead. For algorithms that avoid 32-bit wrapping semantics entirely — T-table AES, whose arithmetic reduces to byte extraction and XOR — these changes were sufficient to reach C-level throughput.

For algorithms with continuous 32-bit modular arithmetic (ChaCha20 scalar, SHA-256), the masking overhead (`land 0xFFFFFFFF`, ~25.8% of ChaCha20's hot-path instructions; 134 `andq` per SHA-256 compression call) and integer tagging overhead (~13.5% in ChaCha20) are irreducible in standard OCaml. No source-level rearrangement addresses them. The scalar gap to C — approximately 3–5× at baseline, reducible to ~3× after all source-level optimizations — reflects these representational constraints, not the safety infrastructure.

---

## What we learned about OxCaml

The `int32#` unboxed integer type eliminates masking overhead at the type level: a pure representation change produced +39.2% throughput for SHA-256 with no algorithmic modification. This is the largest single-step gain in the entire repository, larger than any individual source-level OCaml optimization.

The `[@@builtin]` SIMD model is sound: when all hot operations have builtin coverage, each primitive compiles to the intended SSE instruction with no call overhead and no boxing. OxCaml SIMD reached 86% of equivalent C SIMD for ChaCha20. When key operations are missing from the builtin set — as with AES-NI's round instructions — partial SIMD coverage is worse than the plain C-binding approach.

Representation change and builtin coverage are more consequential than any individual source optimization. The remaining OxCaml gaps (rotate expansion, outer-loop structural overhead, missing builtins) require compiler changes, not source changes.

---

## What we learned about compiler behaviour

Several behaviors surfaced repeatedly across primitives and compilers:

- **Closure capture** in `let rec` functions is automatic for any free variable and generates heap closures at hot-loop frequency. It affected OCaml SHA-256 (Opt03) and OxCaml SHA-256 (Ox01) — and Flambda2 captures module-level `int32#` values that OCaml's native compiler does not. Explicit parameter convention is the universal fix.
- **Range inference** makes safe array accesses load-bearing proofs for downstream check elimination. Removing preamble safe accesses with `Array.unsafe_get` can relocate bounds checks to worse positions with no net saving.
- **Constant folding** through `[@inline]` is total: module-level constants inside inlined functions do not survive to assembly. Constant hoisting is a structural no-op.
- **Rotate lowering** is absent in both OCaml and OxCaml: `(x lsl n) lor (x lsr (32-n))` generates three instructions where GCC generates one `roll`. This is the dominant remaining overhead in SHA-256 and ChaCha20.
- **Dead-code inheritance**: W[64..79] in SHA-256's message schedule were computed but never consumed, inherited from the C reference implementation. Assembly inspection cannot detect this; specification comparison is required.
- **Flambda2 ILP scheduling** is already correct for independent operations: source-level restructuring to expose ILP adds no information to the SSA-based IR.

---

## Answering the Research Question

The answer depends on the algorithm's arithmetic character and the toolchain's coverage:

- **Full parity is achievable** for algorithms whose arithmetic is byte extraction and XOR. Rijndael OCaml matches and marginally exceeds the C reference after eliminating `Int32` boxing and bounds-check overhead. Safety properties are fully preserved.
- **OxCaml narrows but does not close the scalar gap** for 32-bit modular arithmetic. SHA-256 improved from 4.6× below C to 2.0× below C with `int32#`. The remaining factor is rotate expansion — a compiler gap, not a source gap.
- **OxCaml SIMD reaches 86% of C SIMD** when all required builtins exist. The 14% gap is outer-loop structural overhead, not SIMD instruction quality. When builtins are absent (AES-NI), OxCaml SIMD is substantially worse than the C-binding baseline.
- **The standard OCaml scalar floor** for ARX primitives is approximately 3× below C and is irreducible without OxCaml or compiler changes.

In every case, OCaml retains its core safety properties: type checking, memory safety, no undefined behaviour, automatic memory management. The remaining performance gaps are attributable to OCaml's integer representation model and the OxCaml toolchain's builtin coverage — neither of which is a consequence of providing safe defaults.

---

## Looking Forward

This repository established the methodology and evidence base for a natural extension: Poly1305 (GF(2¹³⁰−5) field arithmetic, multiply-dominated) would test whether `int32#`'s benefits generalize from the XOR-heavy SHA-256 workload to multiplication-heavy workloads. Combined with ChaCha20, it produces a complete ChaCha20-Poly1305 AEAD scheme (RFC 8439) — the natural step toward evaluating OxCaml for a full TLS 1.3 cryptographic stack.

## Generating the PDF Report

The full technical report is written in `technical-report.md` and converts to PDF via Pandoc and XeLaTeX. XeLaTeX is required (not pdfLaTeX).

**Prerequisites:** [Pandoc](https://pandoc.org/installing.html) and a TeX Live / MiKTeX installation with XeLaTeX.

Run from the repository root:

```bash
mkdir -p report

pandoc technical-report.md \
  --from markdown \
  --toc \
  --number-sections \
  --pdf-engine=xelatex \
  -V geometry:margin=1in \
  -V colorlinks=true \
  -V linkcolor=blue \
  -o report/Performance_Engineering_of_Cryptographic_Primitives_in_OCaml_and_OxCaml.pdf
```

The output is written to `report/Performance_Engineering_of_Cryptographic_Primitives_in_OCaml_and_OxCaml.pdf`. All figure paths in `technical-report.md` are relative to the repository root, so invoke `pandoc` from there.

> The complete synthesis of observations, cross-primitive comparisons, compiler behaviours, optimization patterns, and repository-wide findings is presented in `docs/cross-primitive-analysis.md` and, when complete, `docs/repository-summary.md`.

## Acknowledgements

This project was carried out by **V. Krishnan** under the guidance and supervision of **Prof. K. C. Sivaramakrishnan** as part of a research internship at IIT Madras.
