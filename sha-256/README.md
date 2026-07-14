# SHA-256: Scalar Optimization Case Study in OCaml and OxCaml

A compiler-engineering investigation into the runtime cost of OCaml's type and memory abstractions on a compute-intensive 32-bit hash kernel, and the degree to which OxCaml's `int32#` unboxed integer primitive can recover those costs at the source level.

---

## Overview

SHA-256 is a fixed-function hash: 64 rounds of bitwise arithmetic over 32-bit words, no branching on data, no dynamic allocation during compression. This makes it an unusually clean benchmark for measuring the overhead a language runtime imposes *independent of algorithmic variation*. Any performance gap between an OCaml and a C implementation of the same algorithm is attributable entirely to compiler output, not to differences in the program being expressed.

This case study begins with a C scalar reference (Xavier Leroy / INRIA Cryptokit, compiled with `gcc -O2`), translates faithfully to OCaml, then eliminates every source-level overhead through a sequence of seven optimizations. It then migrates the final OCaml implementation to OxCaml's `int32#` type and applies three further optimizations. Each step is documented with the full reasoning chain: observation, hypothesis, correctness argument, implementation, assembly verification, and benchmark result.

**Final results at 100 MB input:**

| Implementation       | Throughput  | Relative to C | Relative to OCaml Opt07 |
|----------------------|-------------|---------------|-------------------------|
| C scalar (reference) | 148.53 MB/s | 1.00×         | 3.05×                   |
| OxCaml int32# Ox03   | 73.99 MB/s  | 0.498×        | 1.52×                   |
| OCaml scalar Opt07   | 48.68 MB/s  | 0.328×        | 1.00×                   |

The OCaml optimization campaign improved throughput by **50.7%** over the baseline (32.29 → 48.68 MB/s). The OxCaml `int32#` migration added a further **52.0%** over OCaml Opt07 (48.68 → 73.99 MB/s). The remaining performance gap between OxCaml and C appears to stem primarily from compiler and runtime limitations rather than additional source-level optimization opportunities; its composition is analyzed in [docs/05_conclusions_and_future_work.md](docs/05_conclusions_and_future_work.md).

---

## Design Constraints

These constraints are not limitations of the implementation. They are deliberate scope decisions that define what this case study is measuring and what it is not.

### No SIMD Implementation

OxCaml does not currently expose a practical SIMD programming model suitable for this work. The ChaCha20 companion case study in this repository used OxCaml's `vec128` primitive for SSE2/SSSE3 block-parallel encryption, which fit naturally into ChaCha20's structure. SHA-256's message schedule and compression function have sequential data dependencies that do not admit the same straightforward vectorization: each message word `W[i]` depends on `W[i-2]`, `W[i-7]`, `W[i-15]`, and `W[i-16]`, and each compression round state depends on the previous round. Multi-buffer techniques (hashing independent messages in parallel) could exploit SIMD width, but that changes the interface contract and is outside the scope of a single-buffer scalar optimization study.

### No C Bindings

The objective of this case study is to evaluate what OxCaml's `int32#` type can recover compared to a plain OCaml scalar implementation, using only source-level changes. Calling into a C SHA-256 implementation via the FFI would produce a number close to the C reference, but it would not evaluate OxCaml at all — it would evaluate the FFI call overhead. The answer this study seeks is: *how much of the gap between OCaml and C can be closed by expressing the same algorithm in OxCaml with appropriate type annotations?*

### No SHA-NI or Architecture-Specific Instructions

Intel's SHA Extensions (`SHA256RNDS2`, `SHA256MSG1`, `SHA256MSG2`) would reduce the compression function to a handful of instructions per round and yield throughput well above the C scalar reference. This is outside scope for two reasons. First, hardware portability: the study targets a generic x86-64 scalar implementation that makes no assumptions about ISA extensions beyond the baseline. Second, comparability: a SHA-NI implementation is not a scalar implementation and cannot be fairly compared against the OCaml baseline being optimized. The C scalar reference (`gcc -O2`, no `-msha`) establishes the comparison ceiling.

### Why Optimization Stopped Where It Did

Optimization halted after OxCaml Ox03 because every remaining overhead identified in the assembly analysis requires a change to the compiler or runtime, not to the source program:

1. **Rotation cost.** C compiles `ROTR(x, n)` to a single `roll` instruction. OCaml and OxCaml both compile `(x lsr n) lor (x lsl (32 - n))` to three instructions (`shrq`, `salq`, `orq`). Eliminating this requires either a compiler pattern-matcher that recognizes the rotate idiom, or a source-level rotation intrinsic that OxCaml does not yet expose.

2. **Remaining bounds checks.** After Opt06, sixteen `jbe` instructions remain in the OCaml assembly. These correspond to `Bytes.blit` and `Bytes.set` calls in the partial-block paths of `add_data` and `finish` — paths that execute at most once per hash operation. Eliminating them would require unsafe operations in paths where the safety invariants are less mechanical to verify, for a gain that would be negligible on large inputs.

3. **Tag reads on array access.** Even with `Array.unsafe_get`, OCaml emits a tag-check load before the element load for polymorphic arrays. The `int32#` layout-polymorphic `aget`/`aset` primitives in OxCaml bypass this, but `aget`/`aset` are already in use from the OxCaml baseline onward.

4. **Call overhead in `rounds`.** The tail-recursive `rounds` function is compiled as a loop with a back-edge jump. Full inlining (Opt05) was tried and reverted due to I-cache overflow at approximately 30 KB of generated code against a 32 KB L1 instruction cache. Partial inlining was considered but not pursued; the lesson from Opt05 is that the I-cache budget is exhausted before meaningful round-count reduction is achieved.

No source-level change available within the current OCaml/OxCaml compiler chain can close the remaining gap without one of the architecture-specific approaches excluded above.

---

## Optimization Philosophy

Every optimization in this case study followed the same methodology, without exception:

**Observation → Hypothesis → Correctness / Safety Proof → Implementation → Assembly Inspection → perf Analysis → Benchmark → Decision → Lessons Learned**

Several principles governed how results were interpreted:

- **Benchmark numbers alone never determined acceptance.** A benchmark improvement without a corresponding assembly explanation was treated as noise until the machine-level evidence was found. Conversely, an optimization that produced no measurable improvement but removed a structural cost (such as Ox01, which eliminated a heap allocation path) was still evaluated on its merits.

- **Assembly inspection explains the mechanism.** Every optimization was accompanied by a side-by-side comparison of instruction counts — in particular `jbe` (bounds-check branches), `andq`/`andl` (mask operations), assembly file line counts (code size), and call/closure descriptors. The assembly was the ground truth for whether the compiler produced what the source intended.

- **perf analysis explains the microarchitecture.** Where assembly counts alone could not explain a result — specifically in the Opt05 regression — `perf stat` and L1 instruction-cache miss counters were used to identify the underlying cause (I-cache thrash). Hardware counters were not used as primary evidence for every optimization, only where the assembly analysis was insufficient.

- **Correctness precedes performance.** No optimization was accepted without first verifying that the FIPS 180-4 known-answer tests passed. For OxCaml, a separate validation suite (`oxcaml_validate.ml`) verified the semantics of `int32#` arithmetic before any migration began.

- **Negative results are documented.** Opt05 is described in the same depth as any successful optimization. The I-cache overflow finding is as informative as any speedup: it establishes a hard limit on the unrolling strategy and explains why the next direction (Opt06) targeted a different source of overhead.

- **Direction changes are explained.** When one optimization path was exhausted, the reasoning for moving to a different category of optimization is stated explicitly. No optimization was chosen because it was convenient; each was chosen because prior analysis identified it as the next largest remaining overhead.

- **Every hypothesis was validated rather than assumed.** Expected improvements were grounded in assembly analysis, compiler behavior, or hardware reasoning before any implementation was attempted. When benchmark results contradicted a hypothesis — as happened with Opt05, where an expected gain became a regression — investigation continued until the underlying cause was understood. The purpose of this campaign was not merely to accumulate faster benchmark numbers but to understand why the compiler generated the machine code it did.

---

## Documentation Conventions

Every optimization chapter in `docs/` uses the same section structure, in the same order:

1. **Observation** — what the assembly, perf output, or prior benchmark identified as the next overhead
2. **Hypothesis** — what change is predicted to help and why
3. **Expected Improvement** — the specific instruction-level or allocation-level change predicted
4. **Implementation** — the exact source change, with before/after code
5. **Correctness / Safety** — why the change is semantically equivalent to the original, and which tests verify this
6. **Assembly Verification** — the specific instruction counts or patterns that confirm the compiler produced what was intended
7. **perf Analysis** — hardware counter data where relevant
8. **Benchmark Results** — numbers at all six input sizes
9. **Decision** — kept, reverted, or modified, and why
10. **Lessons Learned** — what this result tells us about the OCaml/OxCaml compiler or the hardware

This structure allows every optimization to be compared on identical terms. Sections that are not applicable to a particular optimization (e.g., perf Analysis when hardware counters added nothing beyond the assembly evidence) are noted as such rather than omitted silently.

---

## Optimization Summary

Complete roadmap of every stage investigated, in chronological order. Throughput figures are at 100 MB input. Δ from Previous is relative to the immediately preceding stage.

| Stage | Description | Throughput (100 MB) | Δ from Previous | Status |
|-------|-------------|---------------------|-----------------|--------|
| C Scalar | Xavier Leroy / Cryptokit, `gcc -O2` | 148.53 MB/s | — | Reference ceiling |
| OCaml Baseline | Faithful translation; `mask32`, safe arrays, `Array.make` per transform | 32.29 MB/s | — | Starting point |
| Opt01 | Hoist `data[80]` from `transform` onto `ctx`; eliminate per-call allocation | 33.56 MB/s | +3.9% | **Kept** |
| Opt02 | `Array.unsafe_get`/`set` throughout `transform`; remove bounds checks | 42.42 MB/s | +26.4% | **Kept** |
| Opt03 | Replace 8 mutable refs with tail-recursive `rounds`; fix closure capture bug | 43.59 MB/s | +2.8% | **Kept** |
| Opt04 | `transform_from` reads directly from caller buffer; eliminate per-block `Bytes.blit` | 44.24 MB/s | +1.5% | **Kept** |
| Opt05 | Full 8× unrolling of outer rounds loop | 42.93 MB/s | −3.0% | **Reverted** — I-cache overflow (~30 KB vs 32 KB L1-I) |
| Opt06 | `Bytes.unsafe_get`/`set` and `Char.unsafe_chr` in `get_be32`/`set_be32` | 46.01 MB/s | +4.0% | **Kept** |
| Opt07 | Move `land mask32` from inside `rotr` to sigma outputs; reduce masks per round | 48.68 MB/s | +5.8% | **Kept** — final OCaml |
| OxCaml Baseline | `int32#` migration; `mask32` eliminated; packed 4-byte array slots | 67.80 MB/s | +39.2% | Starting point |
| Ox01 | Pass `constants` explicitly to `rounds`; eliminate closure allocation per transform call | 68.39 MB/s | +0.9% | **Kept** — structural correction |
| Ox02 | Truncate message schedule to indices 0–63; remove dead expansion | 72.39 MB/s | +5.8% | **Kept** |
| Ox03 | Restructure T1 to separate arithmetic chain from memory loads; assembly effectively unchanged; variation within noise | 73.99 MB/s | +2.2% | **Kept** — source clarity; documents ILP investigation |

---

## Repository Structure

```
sha-256/
├── README.md                             ← this file
├── c/
│   ├── sha256.h                          ← context type and function declarations
│   ├── sha256.c                          ← C scalar implementation (Cryptokit)
│   ├── test_sha256_rfc.c                 ← FIPS 180-4 known-answer tests
│   └── benchmark_sha256.c                ← throughput harness
├── ocaml/
│   ├── sha256.ml                         ← OCaml scalar (Opt07, final)
│   ├── sha256_tests.ml                   ← FIPS 180-4 known-answer tests
│   └── benchmark_sha256.ml               ← throughput harness
├── oxcaml/
│   ├── sha256.ml                         ← OxCaml int32# (Ox03, final)
│   ├── sha256_tests.ml                   ← FIPS 180-4 known-answer tests
│   ├── oxcaml_validate.ml                ← int32# arithmetic validation
│   └── benchmark_sha256.ml               ← throughput harness
├── scripts/
│   ├── run_sha256_c_scalar.sh
│   ├── run_sha256_ocaml_scalar.sh
│   └── run_sha256_oxcaml.sh
├── benchmarks/
│   ├── input_{1,10,30,50,75,100}mb.txt
│   ├── generate_inputs.py
│   └── results/
│       ├── c_scalar_results.csv
│       ├── ocaml_scalar_results.csv
│       ├── oxcaml_results.csv
│       ├── c_scalar/assembly/ + benchmarks/
│       ├── ocaml_scalar/assembly/ + benchmarks/
│       ├── oxcaml/assembly/ + benchmarks/
│       ├── graphs.py
│       ├── progress_graphs.py
│       └── *.png
└── docs/
    ├── 00_project_overview.md
    ├── 01_methodology.md
    ├── 02_ocaml_scalar_optimization.md
    ├── 03_oxcaml_migration.md
    ├── 04_oxcaml_optimization.md
    └── 05_conclusions_and_future_work.md
```

---

## Documentation

| File | Contents |
|------|----------|
| [00_project_overview.md](docs/00_project_overview.md) | SHA-256 algorithm, C reference analysis, the OCaml semantic gap |
| [01_methodology.md](docs/01_methodology.md) | Measurement protocol, toolchain, assembly analysis method |
| [02_ocaml_scalar_optimization.md](docs/02_ocaml_scalar_optimization.md) | Opt01–Opt07 with full evidence chains |
| [03_oxcaml_migration.md](docs/03_oxcaml_migration.md) | int32# migration: rationale, validation, architecture |
| [04_oxcaml_optimization.md](docs/04_oxcaml_optimization.md) | Ox01–Ox03 with full evidence chains |
| [05_conclusions_and_future_work.md](docs/05_conclusions_and_future_work.md) | Synthesis, lessons learned, compiler insights, and future work |

---

## Reproduction

### Prerequisites

- GCC (x86-64 Linux)
- OCaml with `opam` and `dune`
- OxCaml toolchain on the `oxcaml-dev` opam switch
- Python 3 with `pandas` and `matplotlib`

### Generate benchmark inputs

```bash
cd sha-256/benchmarks
python3 generate_inputs.py
```

Produces six deterministic inputs at 1, 10, 30, 50, 75, and 100 MB (repeated `"SHA256BenchmarkInputData_Deterministic123\n"`).

### Run benchmarks

```bash
# C scalar
bash scripts/run_sha256_c_scalar.sh

# OCaml (name tags the output CSV and assembly)
bash scripts/run_sha256_ocaml_scalar.sh <name>

# OxCaml
bash scripts/run_sha256_oxcaml.sh <name>
```

Each script compiles, dumps assembly with `-S`, runs all six inputs, and writes `InputSizeMB,HashTime,HashSpeed` CSV.

### Generate graphs

```bash
cd sha-256/benchmarks/results
python3 graphs.py          # final comparison (2 PNGs)
python3 progress_graphs.py # optimization progress (4 PNGs)
```
