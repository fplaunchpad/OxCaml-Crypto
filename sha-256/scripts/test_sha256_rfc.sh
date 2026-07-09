#!/bin/bash
set -e
cd "$(dirname "$0")"

CAML_INCLUDE=/usr/lib/ocaml
C_DIR=../c

gcc -O2 -I"$CAML_INCLUDE" -DEXPORT= \
    -o "$C_DIR/test_sha256_rfc" \
    "$C_DIR/sha256.c" "$C_DIR/test_sha256_rfc.c"

"$C_DIR/test_sha256_rfc"
