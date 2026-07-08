# ChaCha20 Optimization Study

An assembly-guided performance study comparing C, OCaml, and OxCaml implementations of ChaCha20 under strict structural equivalence. Every optimization decision is grounded in generated machine code, not benchmark results alone.

---

## Final Results (100 MB, steady state)

| Implementation | Encrypt (MB/s) | Decrypt (MB/s) | vs C reference |
|---|---|---|---|
| C scalar | 170.57 | 174.09 | 1.00× |
| OCaml scalar (Opt02) | 53.70 | 53.64 | 0.31× |
| C SIMD (Opt02) | 319.65 | 321.44 | 1.87× |
| OxCaml SIMD (Opt06) | 275.03 | 274.78 | 1.61× |

See [docs/10_optimization_summary.md](docs/10_optimization_summary.md) for all 15 optimization stages at a glance.

---

## Repository Layout

```
c/                  C scalar implementation (reference baseline)
c_simd/             C SIMD implementation (SSE2/SSSE3)
ocaml/              OCaml scalar implementation
oxcaml_simd/        OxCaml SIMD implementation
benchmarks/
  input_*.txt       Benchmark inputs (1–100 MB)
  results/          CSV data, PNG graphs, per-stage assembly files
scripts/            Shell scripts to regenerate final CSVs
docs/               Full study documentation
```

---

## Reading Order

| Document | Contents |
|---|---|
| [docs/00_nomenclature.md](docs/00_nomenclature.md) | Term definitions used throughout |
| [docs/01_methodology.md](docs/01_methodology.md) | The optimization loop |
| [docs/02_project_overview.md](docs/02_project_overview.md) | Goals, timeline, design decisions |
| [docs/03_c_scalar.md](docs/03_c_scalar.md) | C scalar baseline |
| [docs/04_ocaml_scalar.md](docs/04_ocaml_scalar.md) | OCaml: 5 stages (2 kept, 2 reverted) |
| [docs/05_c_simd.md](docs/05_c_simd.md) | C SIMD: design rationale + 2 stages |
| [docs/06_oxcaml_simd.md](docs/06_oxcaml_simd.md) | OxCaml SIMD: 6 stages |
| [docs/07_benchmarks.md](docs/07_benchmarks.md) | Cross-implementation comparison graphs |
| [docs/08_final_comparison.md](docs/08_final_comparison.md) | Gap analysis + what surprised us |
| [docs/09_future_work.md](docs/09_future_work.md) | Remaining OxCaml SIMD opportunities |
| [docs/10_optimization_summary.md](docs/10_optimization_summary.md) | All optimizations in one table |
| [docs/11_lessons_learned.md](docs/11_lessons_learned.md) | Compiler and methodology insights |
| [docs/12_conclusion.md](docs/12_conclusion.md) | Executive summary |
| [docs/appendix_a_assembly_patterns.md](docs/appendix_a_assembly_patterns.md) | OCaml assembly pattern reference |
| [docs/appendix_b_rfc_compliance.md](docs/appendix_b_rfc_compliance.md) | RFC 8439 test vectors and methodology |
| [docs/appendix_c_reproduction.md](docs/appendix_c_reproduction.md) | Build, test, benchmark, graph commands |

---

## Quick Build and Run

Full instructions in [docs/appendix_c_reproduction.md](docs/appendix_c_reproduction.md).

```bash
# Requires oxcaml-dev opam switch for OCaml/OxCaml builds
opam switch oxcaml-dev && eval $(opam env)

# Build
cd c       && gcc -O3 -march=native -o benchmark_chacha20 benchmark_chacha20.c chacha20.c
cd c_simd  && make
cd ocaml   && opam exec -- dune build
cd oxcaml_simd && opam exec -- dune build

# Run benchmarks (regenerates final CSVs)
cd scripts && bash run_chacha20_c.sh && bash run_chacha20_ocaml.sh
cd scripts && bash run_chacha20_c_simd.sh && bash run_chacha20_oxcaml_simd.sh

# Generate graphs
cd benchmarks/results && python3 graphs.py && python3 progress_graphs.py
```
