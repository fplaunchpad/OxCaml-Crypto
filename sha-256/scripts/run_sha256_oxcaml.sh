#!/bin/bash
set -e
NAME="${1:-baseline}"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
OXCAML_DIR="$SCRIPT_DIR/../oxcaml"
BENCH_DIR="$SCRIPT_DIR/../benchmarks"
ASM_OUT="$BENCH_DIR/results/oxcaml/assembly/${NAME}.s"
CSV_OUT="$BENCH_DIR/results/oxcaml/benchmarks/${NAME}.csv"
ACTIVE="$BENCH_DIR/results/oxcaml_results.csv"

mkdir -p "$(dirname "$ASM_OUT")" "$BENCH_DIR/results/oxcaml/benchmarks"

# Build benchmark binary
cd "$OXCAML_DIR"
opam exec --switch oxcaml-dev -- dune build 2>/dev/null

# Resolve stdlib_upstream_compatible include path at runtime
OXLIB="$(opam exec --switch oxcaml-dev -- ocamlfind query stdlib_upstream_compatible 2>/dev/null)"

# Generate assembly for sha256.ml
opam exec --switch oxcaml-dev -- ocamlopt \
    -I "$OXLIB" -extension layout_poly -O3 -S -c sha256.ml 2>/dev/null
mv sha256.s "$ASM_OUT"
rm -f sha256.cmi sha256.cmx sha256.o
echo "Assembly written to $ASM_OUT"

# Run benchmarks -> named csv and active results file
echo "InputSizeMB,HashTime,HashSpeed" > "$CSV_OUT"
for f in \
  "$BENCH_DIR/input_1mb.txt"   \
  "$BENCH_DIR/input_10mb.txt"  \
  "$BENCH_DIR/input_30mb.txt"  \
  "$BENCH_DIR/input_50mb.txt"  \
  "$BENCH_DIR/input_75mb.txt"  \
  "$BENCH_DIR/input_100mb.txt"
do
    ./_build/default/benchmark_sha256.exe "$f" | awk '
        /Message length/ { mb = $4 / (1024*1024) }
        /Hash time/      { t  = $4 }
        /Hash speed/     { s  = $4 }
        /Digest/         { printf "%.0f,%.6f,%.2f\n", mb, t, s }
    ' >> "$CSV_OUT"
done

cp "$CSV_OUT" "$ACTIVE"
echo "Results written to $CSV_OUT"
echo "Active results  : $ACTIVE"
