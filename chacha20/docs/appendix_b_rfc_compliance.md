# Appendix B: RFC 8439 Compliance Verification

This appendix documents the correctness verification methodology used throughout the study. RFC validation was run after every implementation change, without exception.

---

## The Standard

ChaCha20 is specified in RFC 8439 ("ChaCha20 and Poly1305 for IETF Protocols"). The RFC provides test vectors for:

- The quarterround function (Section 2.1.1)
- The block function (Section 2.1.2)
- The stream cipher (Section 2.4.2)

These three levels of testing provide layered verification: a failure at the quarterround level identifies an arithmetic error; a failure at the block level (with correct quarterround) identifies a state layout or round-count error; a failure at the stream cipher level (with correct block) identifies a keystream application error.

---

## Test Vectors Used

### Quarterround Test (RFC 8439 §2.1.1)

Input state:
```
0x11111111  0x01020304  0x9b8d6f43  0x01234567
```

Expected output after one quarterround:
```
0xea2a92f4  0xcb1cf8ce  0x4581472e  0x5881c4bb
```

### Block Function Test (RFC 8439 §2.1.2)

Key:
```
00:01:02:03:04:05:06:07:08:09:0a:0b:0c:0d:0e:0f
10:11:12:13:14:15:16:17:18:19:1a:1b:1c:1d:1e:1f
```

Nonce:
```
00:00:00:09:00:00:00:4a:00:00:00:00
```

Counter: 1

Expected keystream block (64 bytes, first 4 words):
```
10 f1 e7 e4  d1 3b 59 15  50 0f dd 1f  a3 20 71 c4
```

### Stream Cipher Test (RFC 8439 §2.4.2)

Key:
```
00:01:02:03:04:05:06:07:08:09:0a:0b:0c:0d:0e:0f
10:11:12:13:14:15:16:17:18:19:1a:1b:1c:1d:1e:1f
```

Nonce:
```
00:00:00:00:00:00:00:4a:00:00:00:00
```

Plaintext (114 bytes):
```
"Ladies and Gentlemen of the class of '99: If I could offer you 
only one tip for the future, sunscreen would be it."
```

Expected ciphertext (first 8 bytes):
```
6e 2e 35 9a  25 68 f9 80  ...
```

---

## Test Infrastructure

Each implementation contains a test module:

- `ocaml/chacha20_tests.ml` — OCaml scalar tests
- `oxcaml_simd/chacha20_simd_tests.ml` — OxCaml SIMD tests
- `c/chacha20_test.c` — C scalar tests (implicit in benchmark correctness check)

Tests are run via `dune test` (OCaml/OxCaml) or as part of the benchmark binary for C.

### OCaml/OxCaml Test Output

A passing run produces no output. A failing run prints the failing test case with expected and actual values and exits with a non-zero status.

### C Test Output

The C benchmark binary includes a correctness check that compares encrypt→decrypt→compare for a known message. The benchmark will not proceed past the correctness check if it fails.

---

## Application in the Optimization Process

RFC validation was applied as a gate, not as an afterthought.

**Position in the loop.** RFC validation occurs immediately after implementation and before assembly comparison or benchmarking. A correctness failure stops evaluation immediately. Assembly and benchmark results for an incorrect implementation are discarded.

**What passing means.** RFC validation confirms that the implementation computes the correct ChaCha20 keystream and applies it correctly. It does not validate performance.

**What failing means.** A test vector failure means the optimization changed the algorithm. This happened zero times in this study — all optimizations were purely structural. The check is nonetheless required because structural changes that preserve algorithm are not guaranteed by inspection alone; the compiler may generate different behavior than expected.

**All optimizations passed.** Every kept and reverted optimization in this study (OCaml Opt01–Opt04, C SIMD Opt01–Opt02, OxCaml Opt01–Opt06) passed RFC validation. The reverted optimizations (OCaml Opt03, Opt04) were reverted due to assembly/benchmark evidence, not correctness failures.

---

## Reproducibility

To run the RFC test suite for each implementation:

```bash
# OCaml scalar tests
cd ocaml && opam exec -- dune test

# OxCaml SIMD tests
cd oxcaml_simd && opam exec -- dune test

# C scalar: run benchmark with small input (includes correctness check)
cd c && ./benchmark_chacha20 ../benchmarks/input_1mb.txt \
    ../benchmarks/key.txt ../benchmarks/nonce.txt
# Look for "Correctness: PASS" in output
```

Full build and test commands are in `docs/appendix_c_reproduction.md`.
