# 01 — Methodology

## Contents

1. [Objectives](#1-objectives)
2. [Optimization Workflow](#2-optimization-workflow)
3. [Measurement Methodology](#3-measurement-methodology)
4. [Assembly Analysis Methodology](#4-assembly-analysis-methodology)
5. [perf Methodology](#5-perf-methodology)
6. [Correctness Methodology](#6-correctness-methodology)
7. [Decision Criteria](#7-decision-criteria)
8. [Optimization Selection Strategy](#8-optimization-selection-strategy)
9. [Documentation Strategy](#9-documentation-strategy)
10. [Reproducibility](#10-reproducibility)
11. [Key Takeaways](#key-takeaways)

---

## 1. Objectives

This case study has five distinct goals, ordered from most fundamental to most specific.

**1.1 Produce a faithful OCaml translation of the C reference.**
The OCaml baseline must implement the same algorithm as the C reference — not a reimplementation that happens to produce the same hashes. Every structural difference between the OCaml and C source must be intentional and documented. An unfaithful baseline contaminates every downstream comparison: if the OCaml baseline is already faster or slower than expected for algorithmic reasons, the measured overheads cannot be attributed to the compiler.

**1.2 Identify and quantify every source of overhead at the assembly level.**
The gap between C and OCaml at the baseline is not a single number to minimize; it is a sum of distinguishable costs with identifiable assembly-level signatures. The goal is to enumerate those costs, associate each with a source-level construct, and verify the association by confirming that eliminating the source construct eliminates the corresponding assembly instructions.

**1.3 Recover as much performance as possible using only source-level optimizations.**
No changes to the compiler, no changes to the runtime, no C bindings, no architecture-specific intrinsics. Every optimization must be expressible as a change to the OCaml or OxCaml source file. This constraint is not a limitation — it is the research question. It forces every optimization to be justified by a claim about what the compiler does with a particular source pattern, and makes the results reproducible on any standard OCaml or OxCaml toolchain.

**1.4 Evaluate OxCaml's `int32#` unboxed representation.**
After exhausting source-level improvements in standard OCaml, migrate to OxCaml's `int32#` type and measure how much of the remaining gap is attributable to OCaml's 63-bit integer representation. The `int32#` migration is itself a controlled experiment: the source structure is held fixed while the representation changes, isolating the representational cost.

**1.5 Establish a clear account of what remains.**
After all source-level optimizations are applied, characterize the remaining gap in terms of specific compiler behaviors visible in the assembly. The goal is not to declare failure or success but to precisely describe what additional work — at the compiler level — would be required to close the gap further.

**The overarching goal is understanding, not maximization.** A campaign that reaches 73.99 MB/s with a documented account of every optimization step and its mechanism is more valuable than a campaign that reaches 80 MB/s through a series of changes whose effects cannot be individually explained. Every number in this study is accompanied by an assembly-level explanation; where the assembly does not explain the number, investigation continues until it does.

---

## 2. Optimization Workflow

Every optimization in this case study follows the same ten-stage pipeline, applied in order, without exception. The pipeline exists because each stage provides evidence that the next stage requires.

```
  ┌──────────────────────────────────────────────────────────────────┐
  │                     OPTIMIZATION PIPELINE                        │
  └──────────────────────────────────────────────────────────────────┘

  ┌─────────────────────┐
  │   1. Observation    │  Identify a specific overhead in assembly, perf output,
  └──────────┬──────────┘  or benchmark divergence. Never start from intuition alone.
             │
             ▼
  ┌─────────────────────┐
  │   2. Hypothesis     │  State explicitly: which source construct causes this overhead,
  └──────────┬──────────┘  and what change is predicted to eliminate it.
             │
             ▼
  ┌─────────────────────┐
  │  3. Expected        │  Predict the exact assembly-level change: which instruction
  │     Improvement     │  class will decrease, by how much, and why.
  └──────────┬──────────┘
             │
             ▼
  ┌─────────────────────┐
  │  4. Correctness /   │  Before touching performance: prove or argue that the change
  │     Safety Proof    │  is semantically equivalent to the original.
  └──────────┬──────────┘
             │
             ▼
  ┌─────────────────────┐
  │  5. Implementation  │  Make the source change. Keep it minimal and isolated.
  └──────────┬──────────┘
             │
             ▼
  ┌─────────────────────┐
  │  6. Assembly        │  Inspect the new assembly. Verify the predicted change
  │     Inspection      │  occurred. If it did not, return to Hypothesis.
  └──────────┬──────────┘
             │
             ▼
  ┌─────────────────────┐
  │  7. perf Analysis   │  Used only when assembly alone cannot explain the benchmark
  │     (when needed)   │  result. Adds hardware-counter evidence to the model.
  └──────────┬──────────┘
             │
             ▼
  ┌─────────────────────┐
  │  8. Benchmark       │  Measure at all six input sizes. Interpret relative to the
  └──────────┬──────────┘  assembly evidence, not in isolation.
             │
             ▼
  ┌─────────────────────┐
  │  9. Decision        │  KEEP / REVERT / SKIP. The decision is explained by the
  └──────────┬──────────┘  combined evidence, not by the benchmark number alone.
             │
             ▼
  ┌─────────────────────┐
  │  10. Lessons        │  State what this result reveals about the compiler, the
  │      Learned        │  runtime, or the hardware. This is the durable output.
  └─────────────────────┘
```

### Why every stage is necessary

**Observation before hypothesis.** Starting from a hypothesis without a grounding observation produces optimizations that "should work in theory" but do not correspond to any specific overhead in the actual binary. Every optimization in this study starts from a specific assembly signature — a count of `jbe`, `andq`, or `call` instructions, or a heap allocation visible as a `caml_alloc` site.

**Expected improvement before implementation.** Stating the predicted assembly change before implementing forces an explicit commitment: if the prediction is wrong, the hypothesis needs revision, not the implementation. This prevents the common failure mode of writing a change, seeing a benchmark improvement, and working backwards to explain it post hoc.

**Correctness before performance.** A faster-but-wrong implementation is not an improvement. Correctness tests are run after every change; no performance measurement is taken from an implementation that has not passed the full test suite. This ordering ensures that performance results are never implicitly discounting correctness bugs.

**Assembly inspection before benchmark interpretation.** Benchmark numbers are affected by process scheduling, CPU frequency scaling, memory layout, and branch predictor state at measurement time. Assembly output is deterministic: given the same source and the same compiler flags, the assembly is the same. An optimization whose benefit cannot be confirmed in the assembly is not yet understood; one whose assembly change matches the prediction is understood regardless of what the benchmark shows.

**Why benchmark numbers alone are insufficient.** Consider two scenarios: (a) a change improves throughput by 3% but the assembly shows no change in instruction count; (b) a change shows no throughput improvement but the assembly loses 16 `jbe` branches. In (a), the improvement is likely measurement noise and cannot be reliably reproduced. In (b), the structural change is real and its runtime benefit may be below the noise floor at the benchmark granularity, or may materialize at a different input size or CPU microarchitecture. The assembly is the ground truth; the benchmark is a consistency check.

---

## 3. Measurement Methodology

### 3.1 Benchmark Inputs

Six deterministic input files are used, generated by `benchmarks/generate_inputs.py` by repeating a fixed string:

| Input Size | Blocks (64-byte) | Primary Purpose |
|------------|------------------|-----------------|
| 1 MB       | 16,384           | Detect catastrophic regressions; warmup-sensitive |
| 10 MB      | 163,840          | Transition region; I-cache warming visible |
| 30 MB      | 491,520          | Near steady state; used for trend confirmation |
| 50 MB      | 819,200          | Steady state |
| 75 MB      | 1,228,800        | Steady state |
| 100 MB     | 1,638,400        | **Primary reference** — fully steady state |

All inputs are byte-identical across all three implementations (C, OCaml, OxCaml). The hash outputs are verified to be identical before any performance measurement is taken.

### 3.2 Timing Protocol

Each benchmark run hashes a single input file from start to finish. Time is measured with `clock_gettime(CLOCK_MONOTONIC)`, bracketing only the hash computation — context initialization and output verification are outside the timed region. The result is reported as elapsed wall time in seconds and derived throughput in MB/s.

Each benchmark is run as a single pass per input size per implementation build. No averaging over repeated runs is performed within a single invocation. When a result appears anomalous, the benchmark is re-run manually; if the anomaly does not reproduce, it is attributed to transient system interference (scheduler preemption, CPU frequency transition, page fault) and the clean run is used.

### 3.3 Why 100 MB is the Steady-State Reference

The 1 MB measurement consistently shows lower throughput than larger inputs across all three implementations:

- At 1 MB, the instruction cache may not yet be fully warmed for the compression function's hot path.
- The branch predictor requires several hundred iterations of the compression loop before it has seen every branch in the 64-round inner loop.
- OS scheduling effects are proportionally larger at shorter elapsed times.

Throughput stabilizes between 30 MB and 50 MB and remains flat through 100 MB, indicating that the measurement at 100 MB reflects the sustained steady-state cost of the algorithm, free from warmup effects. All cross-implementation comparisons use the 100 MB figure.

The smaller inputs are retained in the results because they are informative for a different purpose: they show that throughput trajectories are consistent across the range, ruling out input-size-specific effects such as data-dependent cache behavior.

### 3.4 System Configuration

Benchmarks were run on a single machine without explicit CPU affinity binding or frequency locking. No `taskset`, `numactl`, or `cpupower` settings were applied. This is a deliberate choice: the goal is to characterize what a standard system programmer would observe under standard conditions, not to produce idealized numbers achievable only under controlled laboratory settings. The tradeoff is that individual measurements carry more variance, which is acceptable because the assembly-level analysis provides independent evidence of improvement.

---

## 4. Assembly Analysis Methodology

Assembly output is the primary evidence source for every optimization. It is collected by passing `-S` (emit assembly, do not link) to the compiler, producing a `.s` file alongside the object file. All assembly files are retained in `benchmarks/results/` for reference.

### 4.1 What Is Inspected

The following metrics are examined after every optimization:

| Metric | Assembly Signal | What It Reveals |
|--------|----------------|-----------------|
| `jbe` count | Conditional branch on unsigned comparison | Bounds checks on array and bytes access |
| `andq` with `0xffffffff` | 64-bit AND with mask | `land mask32` operations on OCaml `int` |
| `andl` count | 32-bit AND | Algorithmic AND (CH, MAJ); also mask-like operations |
| `movslq` count | Sign-extending 32→64 bit move | OCaml widening of 32-bit results to 63-bit `int` |
| `movabsq` with `0xffffffff` | Load large immediate | Materializing the `mask32` constant into a register |
| Total `.s` file line count | Proxy for code size | I-cache pressure; effect of unrolling |
| `caml_alloc` call sites | Call to GC allocator | Heap allocation in the hot path |
| Closure descriptor labels | `.data` section closure objects | Closure construction from `let rec` capture |
| `call` vs `jmp` to `rounds` | Direct call vs tail-call | Whether tail-recursive `rounds` is compiled as a loop |
| Stack frame size | `sub $N, %rsp` in prologue | Register pressure / spills to stack |
| `movq`/`movl` between `[rsp+N]` and registers | Stack memory traffic | Register spills in the compression loop |

### 4.2 Inspection Procedure

After each optimization, the new assembly is diffed against the previous stage's assembly using `wc -l` for total size and `grep -c` for specific instruction patterns. The before-and-after counts for the relevant metrics are recorded in the optimization chapter. Where the change in counts does not match the prediction, the assembly is read manually to understand why.

For example: if a change is predicted to eliminate 8 `jbe` branches and the count drops by only 4, the remaining 4 are located in the assembly and their source origin is traced. This often reveals a secondary overhead not previously visible — which then becomes the observation for the next optimization.

### 4.3 Why Assembly Analysis Is More Informative Than Benchmarks for Optimization Work

Assembly output is a deterministic function of source and compiler flags. Given the same inputs, it does not vary between runs, between machines, or between days. A benchmark number, by contrast, is influenced by CPU frequency state, OS scheduler decisions, TLB and cache state at measurement time, and background system activity. For the purpose of confirming that a specific source change had the specific compiler effect it was intended to have, the assembly is the only reliable evidence.

This does not mean benchmarks are unimportant — they confirm that the assembly-level change translates to a wall-clock improvement at the relevant input sizes. But the causal mechanism must be established through assembly analysis first. A benchmark improvement that cannot be explained by an assembly change is not understood.

---

## 5. perf Methodology

`perf stat` was used as a supplementary analysis tool, not a primary one. It was applied only in cases where the assembly analysis established what the compiler produced, but could not explain why the benchmark result was what it was.

### 5.1 When perf Was Used

The single case in this campaign where `perf` was needed was Opt05 (full loop unrolling). The assembly showed that unrolling increased the transform function's code size from approximately 3,069 to 8,409 lines. The assembly change was expected to help (fewer loop-control instructions per round); the benchmark showed a regression of 3.0%. The discrepancy between prediction and result required hardware-counter evidence to resolve.

`perf stat -e cycles,instructions,L1-icache-load-misses` on the Opt05 binary confirmed elevated L1 instruction-cache miss rates. The unrolled transform function occupied approximately 30 KB of instruction memory against a 32 KB L1-I cache. The I-cache misses explained the regression: the cost of fetching cold instruction cache lines outweighed the savings from reduced loop-control overhead.

### 5.2 Counters Used

| Counter | Interpretation |
|---------|---------------|
| `cycles` | Total CPU cycles for the benchmark run |
| `instructions` | Total instructions retired |
| `IPC` (derived) | Instructions per cycle; a drop indicates a front-end bottleneck |
| `L1-icache-load-misses` | L1 instruction cache miss count; elevated for large code size |
| `L1-dcache-load-misses` | L1 data cache misses; not elevated in this campaign |
| `branch-misses` | Mispredicted branches; checked for Opt05 in case of predictor effects |

### 5.3 What perf Does Not Resolve

Hardware counters report aggregate behavior across the entire benchmark run, not behavior attributable to a specific function or loop. Attributing an elevated `L1-icache-load-misses` count specifically to the SHA-256 transform function (rather than to benchmark harness code, startup, or OS effects) requires combining the counter data with the assembly size evidence. In the Opt05 case, the assembly clearly showed the code size expansion, making the attribution confident. In cases where the assembly does not show a clear size change, hardware counter data alone would not be sufficient to draw conclusions.

---

## 6. Correctness Methodology

No performance measurement is taken from an implementation that has not passed the correctness suite. This ordering — correctness before benchmarking — is enforced procedurally: the benchmark scripts do not run unless the test binary exits cleanly.

### 6.1 FIPS 180-4 Known-Answer Tests

The primary correctness gate is the FIPS 180-4 known-answer test (KAT) suite, implemented independently for each language:

- `c/test_sha256_rfc.c` — C
- `ocaml/sha256_tests.ml` — OCaml
- `oxcaml/sha256_tests.ml` — OxCaml

Each KAT file tests the following FIPS 180-4 test vectors:

| Test Case | Input | Expected Digest |
|-----------|-------|-----------------|
| Empty string | `""` | `e3b0c44298fc1c14...` |
| "abc" | `"abc"` | `ba7816bf8f01cfea...` |
| 448-bit message | `"abcdbcdecdefdefg..."` | `248d6a61d20638b8...` |
| 1,000,000 'a' characters | repeated `'a'` | `cdc76e5c9914fb92...` |

The 1,000,000-character test is particularly important because it exercises the multi-block path and the counter arithmetic for message length encoding. An implementation that passes only the short tests may still have bugs in the block-boundary or length-encoding code.

### 6.2 Python/OpenSSL Cross-Checks

For additional confidence on the exact benchmark inputs, the deterministic input files are hashed with Python's `hashlib` (which delegates to the system OpenSSL library) and the resulting digests are compared against each implementation's output:

```python
import hashlib
with open('benchmarks/input_100mb.txt', 'rb') as f:
    expected = hashlib.sha256(f.read()).hexdigest()
```

This cross-check was performed once at the OCaml baseline and once at the OxCaml baseline. It was not re-run after every optimization, because the FIPS KATs provide sufficient coverage of the code paths modified by each individual optimization.

### 6.3 Arithmetic Transformation Proofs

Some optimizations required verifying that an arithmetic restructuring preserved semantics under OCaml's 63-bit integer arithmetic. The most significant case was Opt07 (sigma mask restructuring): moving `land mask32` from inside `rotr` to the output of each sigma function required verifying that the XOR of three already-truncated-to-32-bit values does not set bits 32–62.

The argument: if `x = rotr(v, n)` for some 32-bit value `v`, then `x` has bits 32–62 set only if OCaml's left-shift `v lsl (32 - n)` sets them. Since `v` has bits 32–62 clear (it was loaded from a `mask32`-ed value), `v lsl (32 - n)` may set bits 32–62 if `(32 - n) > 0`. Specifically, `rotr(v, 2)` shifts left by 30, which can place bits 1–2 of `v` at positions 31–32. XOR-ing three such values can set bit 32. Therefore, masking at the `rotr` output is needed — but masking at the sigma output (after all three XORs) achieves the same effect, since XOR of three 33-bit values is still at most 33 bits wide, and a single `land mask32` at the output clears bit 32. The restructuring reduces the number of mask operations from 3 per sigma call (one per `rotr` output) to 1.

This argument was verified by running the FIPS KATs on the restructured implementation before accepting it.

### 6.4 OxCaml `int32#` Validation

Before migrating any code to use `int32#`, a standalone validation module (`oxcaml/oxcaml_validate.ml`) was written to verify that OxCaml's `int32#` arithmetic semantics match the expected 32-bit wrapping behavior:

- Addition, subtraction, and multiplication wrap at `2^32` (not `2^63` as OCaml `int` does, and not with undefined behavior as C `unsigned int` does on signed overflow)
- Logical shift right (`lsr#`) is unsigned
- Logical operations (`lxor#`, `land#`, `lor#`) operate on the low 32 bits
- `rotr` implemented with `int32#` produces the same result as the masked OCaml `int` implementation for all tested inputs

The validation module runs 2,000 test cases with pseudorandom inputs before the migration begins. Its output is checked in CI as part of the OxCaml build.

---

## 7. Decision Criteria

Every optimization ends with a decision in one of three categories. The criteria for each are stated below.

### KEEP

An optimization is kept when all of the following hold:

1. The FIPS 180-4 KATs pass on the modified implementation.
2. The assembly confirms the predicted instruction-level change (e.g., the expected number of `jbe` or `andq` instructions decreased).
3. The benchmark result at 100 MB is consistent with the assembly evidence (an improvement is expected; no improvement is acceptable only if the assembly change is a structural correction with no expected throughput impact at this scale).
4. No new assembly patterns indicative of unintended side effects appear (e.g., unexpected `caml_alloc` sites, new `jbe` branches in unrelated functions).

Examples of kept optimizations and why:
- **Opt02**: `jbe` count dropped from 32 to 24; benchmark improved by 26.4%. Assembly and benchmark consistent.
- **Ox01**: Assembly showed closure descriptor removed; benchmark improvement was +0.9% — small but consistent with the overhead being a once-per-call allocation rather than a per-round cost. Kept as a structural correction.
- **Ox03**: Assembly effectively unchanged from Ox02; benchmark variation of +2.2% is within noise. Kept because the source restructuring is a valid ILP-exposure attempt that documents the investigation, not because a performance improvement was confirmed.

### REVERT

An optimization is reverted when:

1. The benchmark shows a regression (throughput decreases), AND
2. The assembly or perf analysis identifies a plausible causal mechanism for the regression, AND
3. No modified version of the approach avoids the mechanism.

The decision to revert is not taken until the cause of the regression is understood. A regression whose cause is unknown would be treated as a bug to investigate, not a reason to revert.

Example:
- **Opt05** (full 8× unrolling): Benchmark regressed by 3.0%. `perf stat` showed elevated L1 instruction-cache miss rates. Assembly line count grew from ~3,069 to ~8,409 lines, placing the hot function at approximately 30 KB against a 32 KB L1-I cache. The regression was attributed to I-cache pressure; the approach was reverted.

### INVESTIGATED / SKIPPED

An approach is marked investigated but not pursued when:

- It is outside the defined scope (SIMD, SHA-NI, C bindings — excluded by design constraint).
- The assembly evidence does not support a meaningful gain (e.g., partial unrolling: after the Opt05 failure, analysis showed that any useful degree of partial unrolling would consume enough of the 32 KB L1-I budget to risk similar cache pressure, without eliminating the loop-control instructions entirely).
- The required change is at the compiler or runtime level, not the source level.

| Approach | Status | Reason |
|----------|--------|--------|
| SIMD / `vec128` | Skipped | SHA-256 compression has sequential round dependencies; single-buffer vectorization is not applicable. Scope constraint. |
| SHA-NI | Skipped | Architecture-specific ISA extension; changes the comparison ceiling. Scope constraint. |
| C bindings (FFI) | Skipped | Would measure FFI overhead, not OxCaml. Scope constraint. |
| Full unrolling (Opt05) | Reverted | I-cache overflow; 3.0% regression with confirmed cause. |
| Partial unrolling | Investigated, not pursued | I-cache budget analysis showed diminishing headroom after Opt05; risk of marginal regression without eliminating the loop-control instruction overhead entirely. |
| Ox03 ILP restructuring | Kept as null result | Assembly unchanged; benchmark variation within noise; kept for source clarity and documentation. |

---

## 8. Optimization Selection Strategy

The next optimization was never chosen at random or by intuition. At each stage, the process was:

1. Inspect the current assembly for the largest remaining class of instructions that are not present (or present in much smaller quantity) in the C reference assembly.
2. Identify the source-level construct responsible for that instruction class.
3. Formulate a hypothesis about how to eliminate or reduce that construct.
4. Verify that the hypothesis is actionable (i.e., the change is expressible in OCaml/OxCaml source without violating scope constraints).

The sequence of optimizations follows directly from this process applied repeatedly to the same assembly:

| Stage | Dominant Overhead at Entry | Assembly Signal | Source Construct |
|-------|---------------------------|-----------------|------------------|
| Opt01 | Per-call heap allocation | `caml_alloc` in hot path | `Array.make 80 0` inside `transform` |
| Opt02 | Bounds checks on every array access | 32 `jbe` vs 1 in C | `Array.get`/`set` (safe variants) |
| Opt03 | Heap-allocated working variables; closure | `ref` indirection; closure descriptor | Mutable `ref` cells; `let rec` capture |
| Opt04 | Per-block buffer copy | `memcpy`-like call in inner loop | `Bytes.blit` in `add_data` hot path |
| Opt05 | Loop-control overhead in `rounds` | Back-edge branch per 8 rounds | Looping structure of `rounds` |
| Opt06 | Bounds checks in byte I/O functions | `jbe` in `get_be32`/`set_be32` | `Bytes.get`/`set` (safe variants) |
| Opt07 | Excess masking inside `rotr` | 3× `andq` per sigma call | `land mask32` placement |
| OxCaml Baseline | 63-bit integer masking (all remaining) | 93 `andq` with `0xffffffff` | OCaml `int` representation |
| Ox01 | Closure allocation per `transform_from` | Closure descriptor in assembly | `let rec rounds` captures `constants` |
| Ox02 | Dead message schedule computation | Schedule loop iterates to index 79 | Inherited C source structure |
| Ox03 | T₁ dependency chain depth | Sequential load → arithmetic chain | T₁ = h + Σ₁(e) + CH + K[i] + W[i] |

At each stage, the "dominant overhead at entry" was confirmed by assembly inspection before the optimization was designed. No optimization was chosen speculatively.

### Transitioning Between Phases

The transition from the OCaml phase to OxCaml was not driven by exhausting all possible source-level optimizations in OCaml. It was driven by a specific observation: after Opt07, the 93 remaining `andq` mask operations in the OCaml assembly are structurally required by OCaml's 63-bit integer representation and cannot be reduced further at the source level. The `mask32` constant must exist; the masking must happen at the final point before a value is stored or compared. OxCaml's `int32#` removes this constraint at the type level. The migration is not an optimization of the OCaml source — it is a change of representation that makes an entire class of overhead structurally impossible.

---

## 9. Documentation Strategy

Each optimization chapter in `docs/02` through `docs/04` uses the ten-section structure defined in the README. This section explains why that structure exists and why it is applied uniformly.

### Why uniform structure

The ten-section structure serves two purposes. First, it forces completeness: every optimization must have an observation (grounding in evidence), a hypothesis (explicit prediction), a correctness argument (not implicit), an assembly verification (not just a benchmark), and a lessons-learned section (durable output beyond the number). An optimization chapter that cannot fill every section is not yet fully understood. Second, it allows optimizations to be compared on identical terms. A reader can scan the Assembly Verification sections across all chapters to see the instruction-count progression, or scan the Lessons Learned sections to extract the compiler behavior observations, without reading each chapter in full.

### Why negative results are equally valuable

The Opt05 chapter is written in the same depth as any successful optimization. The I-cache overflow finding is more practically informative than most of the successful optimizations: it establishes a hard constraint on the unrolling strategy, explains the asymmetry between unrolling in C (which the compiler optimizes within the I-cache budget) and unrolling in OCaml (which the compiler does not), and motivates why the next direction (Opt06) targeted a different source of overhead rather than pursuing the unrolling direction further.

More broadly: a study that documents only successful optimizations is incomplete. It cannot tell a reader where the exploration stopped, why certain directions were not pursued, or what the compiler does with patterns that the study chose not to use. Negative results close these questions.

### Why lessons learned is a separate section

A benchmark result says what happened. A lessons-learned section says what that result means for a compiler engineer writing or optimizing OCaml code in a different context. The claim in a lessons-learned section must be supportable from the evidence in the chapter — it should not generalize further than the evidence allows — but it should be stated explicitly rather than left for the reader to infer.

---

## 10. Reproducibility

All artifacts necessary to reproduce the measurements and analysis are contained in the repository. No external dependencies are required beyond a standard OCaml toolchain, an OxCaml toolchain, GCC, and Python 3 with pandas and matplotlib.

### Repository layout relevant to reproducibility

```
sha-256/
├── benchmarks/
│   ├── generate_inputs.py          ← deterministic input generation
│   └── results/
│       ├── c_scalar_results.csv        ← C measurements (all input sizes)
│       ├── ocaml_scalar_results.csv    ← OCaml Opt07 measurements
│       ├── oxcaml_results.csv          ← OxCaml Ox03 measurements
│       ├── c_scalar/
│       │   ├── assembly/baseline.s     ← C scalar assembly (975 lines)
│       │   └── benchmarks/             ← per-run CSV files
│       ├── ocaml_scalar/
│       │   ├── assembly/               ← one .s file per optimization stage
│       │   └── benchmarks/             ← one .csv file per optimization stage
│       └── oxcaml/
│           ├── assembly/               ← one .s file per optimization stage
│           └── benchmarks/             ← one .csv file per optimization stage
├── scripts/
│   ├── run_sha256_c_scalar.sh      ← compile, dump assembly, run all inputs
│   ├── run_sha256_ocaml_scalar.sh  ← same, with <name> tag for output files
│   └── run_sha256_oxcaml.sh        ← same, OxCaml toolchain
└── docs/                           ← this documentation
```

### Reproducing a single optimization stage

To reproduce the Opt02 assembly and benchmark:

```bash
# 1. Restore the Opt02 source (from git history or from the archived source)
# 2. Run the benchmark script with the opt02 tag
bash scripts/run_sha256_ocaml_scalar.sh opt02_unsafe_array

# Output files:
#   benchmarks/results/ocaml_scalar/assembly/opt02_unsafe_array.s
#   benchmarks/results/ocaml_scalar/benchmarks/opt02_unsafe_array.csv

# 3. Count bounds-check branches in the new assembly
grep -c 'jbe' benchmarks/results/ocaml_scalar/assembly/opt02_unsafe_array.s
```

The assembly `.s` files checked into the repository represent the exact compiler output at each stage and serve as the reference for the instruction-count claims made in this document. A researcher reproducing the study should expect the same instruction counts if using the same compiler version and flags; differences may arise from compiler version changes, and are themselves informative.

### Reproducing the graphs

```bash
cd sha-256/benchmarks/results
python3 graphs.py          # generates hash_speed_comparison.png, hash_time_comparison.png
python3 progress_graphs.py # generates 4 optimization-progress PNGs
```

Both scripts read the committed CSV files and produce 300-DPI PNGs. They do not re-run benchmarks; they visualize the committed results. To regenerate results from scratch, the benchmark scripts must be re-run for each stage and the CSV files updated.

---

## Key Takeaways

- **Assembly inspection is the primary evidence source.** Benchmark numbers confirm that assembly-level improvements translate to wall-clock gains, but they do not identify the cause of those gains. Every optimization in this study is grounded in a specific, verifiable change in the compiler's output.

- **Correctness gates are enforced before every benchmark.** The FIPS 180-4 known-answer tests and Python/OpenSSL cross-checks run first; no performance number is recorded from an implementation that has not passed them. This ordering is non-negotiable.

- **The optimization sequence follows the assembly.** The next optimization was always chosen by identifying the dominant remaining overhead in the assembly — not by intuition, analogy to other implementations, or theoretical reasoning about what should matter.

- **Negative results are documented with the same rigor as positive ones.** Opt05 (reverted, I-cache overflow) and Ox03 (null result, assembly unchanged) are written at the same depth as successful optimizations. The methodology section exists partly to explain why this is the right approach.

- **A decision requires more than a benchmark number.** KEEP requires assembly confirmation of the predicted change and a passing correctness suite. REVERT requires identifying the cause of the regression, not just observing it. INVESTIGATED/SKIPPED requires a principled reason grounded in assembly or scope analysis.

- **The 100 MB measurement is the steady-state reference; smaller inputs are informative but warmup-sensitive.** Throughput stabilizes above 30 MB; the 1 MB result reflects cold-cache behavior and should not be used as the primary comparison figure.

- **perf counters are a supplementary tool, not a primary one.** They were needed only when the assembly could not explain the benchmark result (Opt05). Reaching for hardware counters before exhausting the assembly evidence is premature — the assembly is deterministic and free of the measurement noise that affects both benchmarks and perf counts.
