# AES — Overview and Navigation Guide

This folder contains three independent AES implementations studied from different angles — manual table-lookup, reference software, and hardware-accelerated — plus a cross-variant benchmark comparison. Each subfolder has its own `.md` files that go deep on implementation details, results, and analysis.

Use this file to orient yourself and find exactly where to look.

---

## Folder Structure

```
aes/
├── aes-128/        Manual AES-128 in C and OCaml (no optimisation, baseline)
├── rijndael/       Rijndael AES-128 reference impl — full optimisation study
├── aes-ni/         Hardware AES-NI in C, OCaml bindings, and OxCaml SIMD
└── benchmarks/     Cross-variant comparison graphs (all three together)
```

---

## aes-128/

A from-scratch manual AES-128 implementation in C and OCaml. No hardware acceleration, no borrowed reference code. This is the slowest of the three variants and serves as a baseline to understand raw implementation cost.

**Performance:** ~4–5 MB/s encryption, ~0.9 MB/s decryption (both C and OCaml).

| If you want to know… | Read |
|---|---|
| Project structure, how to build and run | `aes-128/README.md` |
| Raw benchmark numbers (C vs OCaml tables + graphs) | `aes-128/BENCHMARK.md` |

### What's inside

```
aes-128/
├── c/                     C implementation + benchmark
├── ocaml/                 OCaml implementation + benchmark
├── scripts/               Shell scripts to run benchmarks
├── benchmarks/results/    CSVs and 4 comparison graphs
├── README.md              Build, run, structure
└── BENCHMARK.md           Results, observations, conclusion
```

---

## rijndael/

The Rijndael AES-128 reference implementation (T-table based) translated from C into OCaml, followed by a complete optimisation study that brought the OCaml implementation from ~34 MB/s to ~165 MB/s — matching the C reference.

**Performance (final):** ~150–180 MB/s (both C and optimised OCaml).

| If you want to know… | Read |
|---|---|
| Project structure, how to build and run all benchmark suites | `rijndael/README.md` |
| Baseline C vs OCaml comparison (before any optimisation) | `rijndael/BENCHMARK.md` |
| First optimisation phase — inlining, buffer reuse, block processing | `rijndael/BENCHMARK_OPT.md` |
| Complete optimisation journey, every step, GC analysis, final results | `rijndael/BENCHMARK_FINAL_OPT.md` |
| Why optimised OCaml matches C, safety analysis, full graph descriptions | `rijndael/ANALYSIS.md` |

### What's inside

```
rijndael/
├── c/                                  C reference implementation + benchmark
├── ocaml/                              OCaml baseline + optimised implementations
├── scripts/                            Benchmark scripts (baseline and optimised)
├── scripts_final_opt/                  Scripts for the final optimised benchmark
├── benchmarks/
│   ├── results/                        Baseline C vs OCaml results + graphs
│   ├── results_opt/                    Intermediate optimisation results + graphs
│   ├── results_final_opt/              Final C vs OCaml (opt) results, GC graphs, optimisation journey graphs
│   └── results_all_comparison/         All four implementations on one graph (baseline → opt → final → C)
├── README.md                           Build, run, structure, status
├── BENCHMARK.md                        Baseline results and analysis
├── BENCHMARK_OPT.md                    Optimisation phase 1 study
├── BENCHMARK_FINAL_OPT.md             Complete optimisation study with every step documented
└── ANALYSIS.md                         Final analysis — graph walkthrough and why optimised OCaml is better than C
```

### Reading order for rijndael

If you want to follow the full story in order:
1. `BENCHMARK.md` — where we started (~34 MB/s OCaml vs ~164 MB/s C)
2. `BENCHMARK_OPT.md` — first optimisation phase
3. `BENCHMARK_FINAL_OPT.md` — full journey to C-level performance
4. `ANALYSIS.md` — what the final results mean and why the optimisations are safe

---

## aes-ni/

Hardware-accelerated AES using Intel AES-NI instructions. Three implementations: pure C with inline intrinsics, OCaml driving C bindings (one FFI call per block), and OxCaml SIMD with key expansion inlined but AES round functions still through C stubs.

**Performance:** C ~1382 MB/s, OCaml ~1177 MB/s, OxCaml SIMD (partial) ~142 MB/s.

The OxCaml SIMD result is lower than plain OCaml because the AES round instructions (`AESENC`, `AESDEC`, etc.) are not yet builtins in OxCaml — each call crosses the C boundary, resulting in 11 FFI calls per block instead of 1.

| If you want to know… | Read |
|---|---|
| Project structure, what OxCaml SIMD was attempted, how to build and run | `aes-ni/README.md` |
| Deep technical analysis — why C is faster, why OxCaml SIMD is slow, how to add AES-NI builtins to OxCaml | `aes-ni/BENCHMARK.md` |

### What's inside

```
aes-ni/
├── c/                     C AES-NI implementation (Cryptokit/Xavier Leroy) + benchmark
├── oxcaml/                OxCaml SIMD implementation + C stubs + benchmark
├── scripts/               Scripts for C, OCaml, and OxCaml SIMD benchmarks
├── benchmarks/
│   ├── input_*.txt        Pre-generated benchmark inputs (1–100 MB)
│   └── results/           CSVs (c, ocaml, oxcaml_simd) + 4 comparison graphs
├── README.md              Project overview, OxCaml SIMD explanation, build and run
└── BENCHMARK.md           Technical deep-dive: FFI overhead, OxCaml SIMD analysis, comparison with Rijndael
```

---

## benchmarks/

Cross-variant comparison graphs that put all three AES implementations (AES-128, Rijndael, AES-NI) on the same axes. Produced by a single `graphs.py` script.

| If you want to know… | Read |
|---|---|
| What each of the 8 comparison graphs shows and what to observe in them | `benchmarks/GRAPHS.md` |

### What's inside

```
benchmarks/
├── graphs.py                               Generates all 8 graphs from the CSVs in the subfolders
├── GRAPHS.md                               Explains all 8 graphs
├── encryption_time_comparison.png          All 3 variants — encryption time
├── decryption_time_comparison.png          All 3 variants — decryption time
├── encryption_speed_comparison.png         All 3 variants — encryption throughput
├── decryption_speed_comparison.png         All 3 variants — decryption throughput
├── encryption_time_rijndael_vs_aes-ni.png  Rijndael vs AES-NI only — encryption time
├── decryption_time_rijndael_vs_aes-ni.png  Rijndael vs AES-NI only — decryption time
├── encryption_speed_rijndael_vs_aes-ni.png Rijndael vs AES-NI only — encryption throughput
└── decryption_speed_rijndael_vs_aes-ni.png Rijndael vs AES-NI only — decryption throughput
```

The `*_comparison.png` graphs include all 7 implementations. Because AES-128 operates at ~4–5 MB/s and AES-NI at ~1000–1900 MB/s, AES-128 dominates the scale and the Rijndael/AES-NI differences become hard to see. The `*_rijndael_vs_aes-ni.png` graphs remove AES-128 so those two are clearly readable.

To regenerate all 8 graphs:

```bash
python3 aes/benchmarks/graphs.py
```

---

## Performance Summary

| Implementation | Avg Enc (MB/s) | Avg Dec (MB/s) |
|---|---:|---:|
| AES-128 C | ~5 | ~0.9 |
| AES-128 OCaml | ~4 | ~0.9 |
| Rijndael C | ~155 | ~155 |
| Rijndael OCaml (optimised) | ~163 | ~163 |
| AES-NI C | ~1382 | ~1162 |
| AES-NI OCaml (C bindings) | ~1177 | ~818 |
| AES-NI OxCaml SIMD (partial) | ~142 | ~139 |

Key takeaways:
- Rijndael OCaml (optimised) matches C after eliminating Int32 boxing and GC pressure
- AES-NI is ~7–8× faster than software Rijndael even with FFI overhead
- OxCaml SIMD (partial) is slower than plain OCaml C-bindings because AES round instructions are not yet OxCaml builtins — adding them is a compiler contribution, not a configuration change
