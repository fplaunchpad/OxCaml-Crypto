#!/bin/bash
set -e
cd "$(dirname "$0")"

CAML_INCLUDE=/usr/lib/ocaml
C_DIR=../c
BENCH_DIR=../benchmarks
ASM_OUT=../benchmarks/results/c_scalar/assembly/baseline.s
CSV_OUT=../benchmarks/results/c_scalar/benchmarks/baseline.csv
ACTIVE=../benchmarks/results/c_scalar_results.csv

# Compile benchmark binary
gcc -O2 -I"$CAML_INCLUDE" -DEXPORT= \
    -o "$C_DIR/benchmark_sha256" \
    "$C_DIR/sha256.c" "$C_DIR/benchmark_sha256.c"

# Generate assembly for the core implementation
gcc -O2 -S -I"$CAML_INCLUDE" -DEXPORT= \
    -o "$ASM_OUT" "$C_DIR/sha256.c"

echo "Assembly written to $ASM_OUT"

# Run benchmark
echo "InputSizeMB,HashTime,HashSpeed" > "$CSV_OUT"

for f in \
  "$BENCH_DIR/input_1mb.txt"   \
  "$BENCH_DIR/input_10mb.txt"  \
  "$BENCH_DIR/input_30mb.txt"  \
  "$BENCH_DIR/input_50mb.txt"  \
  "$BENCH_DIR/input_75mb.txt"  \
  "$BENCH_DIR/input_100mb.txt"
do
    "$C_DIR/benchmark_sha256" "$f" | awk '
        /Message length/ { mb = $4 / (1024*1024) }
        /Hash time/      { t  = $4 }
        /Hash speed/     { s  = $4 }
        /Digest/         { printf "%.0f,%.6f,%.2f\n", mb, t, s }
    ' >> "$CSV_OUT"
done

cp "$CSV_OUT" "$ACTIVE"
echo "Results written to $CSV_OUT"
echo "Active results  : $ACTIVE"
