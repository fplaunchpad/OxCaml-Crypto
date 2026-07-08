# C SIMD: Fair Reference for Vectorized Comparison

This document covers the C SIMD implementation: why it was introduced, why a single-block design was chosen, and how it was optimized to serve as a fair reference for OxCaml SIMD.

---

## Why C SIMD Was Introduced

After the OCaml scalar optimization journey reached its conclusion, the remaining gap to C scalar was classified as largely irreducible at the language level. The scalar comparison was complete.

To extend the study, OxCaml SIMD was introduced. OxCaml provides `[@@builtin]` SIMD primitives that compile to inline SSE2/SSSE3 instructions. The question: how close can functional SIMD code come to equivalent C SIMD code?

To answer this question fairly, a C SIMD implementation was required that is structurally equivalent to the OxCaml SIMD implementation — not simply "a fast C SIMD ChaCha20."

---

## The Structural Equivalence Problem

High-performance C SIMD ChaCha20 implementations typically process 4 or 8 blocks simultaneously. An AVX2 implementation uses 256-bit `__m256i` registers to run 8 ChaCha20 blocks in parallel, producing 512 bytes of keystream per call. AVX-512 implementations push this further. These implementations routinely exceed 1 GB/s on modern hardware.

The OxCaml SIMD implementation uses 128-bit `int32x4` registers. One `int32x4` holds four 32-bit state words — one row of the 4×4 ChaCha20 state matrix. One call to the OxCaml `quarterround` function processes four state columns simultaneously. The result is one 64-byte keystream block per function call.

Comparing OxCaml SIMD (1 block per call) against an AVX2 C SIMD (8 blocks per call) would mean comparing implementations that perform fundamentally different amounts of work per SIMD instruction. The performance gap would reflect the algorithmic difference, not the compiler difference. Any conclusion about OxCaml as a language would be invalid.

The C SIMD implementation was therefore written to mirror the OxCaml SIMD implementation exactly:
- Four `__m128i` registers (`a`, `b`, `c`, `d`) hold the four state rows
- One macro call to `QUARTERROUND` processes 4 ChaCha20 columns in parallel (one per SIMD lane)
- One call to `DOUBLE_ROUND` runs a column round and a diagonal round
- 10 `DOUBLE_ROUND` calls per block
- One 64-byte keystream block per call

Every macro in `chacha20_simd.c` maps 1-to-1 to an OxCaml builtin. The source file comments document this mapping explicitly.

---

## C SIMD Baseline

### Structure

The C SIMD baseline implements exactly the structure described above. The `chacha20_block` function:

1. Loads rotation-mask constants (`rot16_mask_data`, `rot8_mask_data`) into `__m128i` registers
2. Loads state rows into `a`, `b`, `c`, `d`
3. Saves initial state
4. Runs 10 `DOUBLE_ROUND` calls
5. Adds initial state back
6. Stores 64-byte output

The `QUARTERROUND` macro:

```c
#define QUARTERROUND(a, b, c, d, r16, r8) \
    (a) = VEC_ADD((a), (b));              \
    (d) = VEC_XOR((d), (a));              \
    (d) = ROTL16((d), (r16));             \
    (c) = VEC_ADD((c), (d));              \
    (b) = VEC_XOR((b), (c));              \
    (b) = ROTL12((b));                    \
    (a) = VEC_ADD((a), (b));              \
    (d) = VEC_XOR((d), (a));              \
    (d) = ROTL8((d), (r8));               \
    (c) = VEC_ADD((c), (d));              \
    (b) = VEC_XOR((b), (c));              \
    (b) = ROTL7((b));
```

This mirrors the OxCaml `quarterround` function line for line.

The `chacha20_transform` function in the baseline encrypts byte-by-byte using scalar XOR. This is the bottleneck that Opt01 addresses.

### Baseline Performance

| Input Size | Encrypt Speed (MB/s) | Decrypt Speed (MB/s) |
|---|---|---|
| 1 MB  | 102.28 | 142.38 |
| 10 MB | 215.86 | 227.98 |
| 30 MB | 226.61 | 226.62 |
| 50 MB | 227.03 | 222.70 |
| 75 MB | 213.91 | 215.15 |
| 100 MB | **224.40** | **225.70** |

Steady-state throughput: approximately **225 MB/s**. Note the variation at 75 MB — this is measurement noise from the benchmark environment. The block function itself is deterministic; the transform loop's cache behavior varies slightly with input size.

The baseline already substantially outperforms C scalar (~172 MB/s) due to SIMD parallelism in `chacha20_block`. The remaining gap to the final C SIMD state (~320 MB/s) is in the transform loop, not the block function.

---

## Opt01: SIMD XOR in the Transform Loop

### Observation

The baseline `chacha20_transform` function uses a scalar byte-by-byte XOR loop:

```c
while (len >= 64) {
    chacha20_block(ctx);
    for (int j = 0; j < 64; j++)
        *out++ = *in++ ^ ctx->output[n++];
}
```

The block function generates a 64-byte keystream using SIMD. But the application of that keystream to the plaintext is scalar — 64 individual byte XOR operations per block. This is a structural mismatch: the keystream is computed vectorially but applied byte by byte.

### Hypothesis

Replacing the scalar 64-byte XOR with four 16-byte SIMD XOR operations will reduce the transform loop from ~64 byte operations to 4 vector operations per block. The SIMD block function already stores the keystream in `ctx->output` as four contiguous 16-byte rows. Four `_mm_xor_si128` calls can XOR the entire block at once.

Expected assembly change: the inner loop body shrinks from 64 scalar `xorb` instructions to 4 `xorps` (or equivalent) SIMD instructions.

### Implementation

```c
while (len >= 64) {
    chacha20_block(ctx);
    __m128i k0 = _mm_loadu_si128((const __m128i *)(ctx->output));
    __m128i k1 = _mm_loadu_si128((const __m128i *)(ctx->output + 16));
    __m128i k2 = _mm_loadu_si128((const __m128i *)(ctx->output + 32));
    __m128i k3 = _mm_loadu_si128((const __m128i *)(ctx->output + 48));
    _mm_storeu_si128((__m128i *)(out),    _mm_xor_si128(_mm_loadu_si128((const __m128i *)(in)),    k0));
    _mm_storeu_si128((__m128i *)(out+16), _mm_xor_si128(_mm_loadu_si128((const __m128i *)(in+16)), k1));
    _mm_storeu_si128((__m128i *)(out+32), _mm_xor_si128(_mm_loadu_si128((const __m128i *)(in+32)), k2));
    _mm_storeu_si128((__m128i *)(out+48), _mm_xor_si128(_mm_loadu_si128((const __m128i *)(in+48)), k3));
    in += 64; out += 64; len -= 64;
}
```

This mirrors what the OxCaml SIMD implementation already does in `chacha20_crypt`:

```ocaml
store out  base      (vec_xor (load ks  0) (load out  base     ));
store out (base+16)  (vec_xor (load ks 16) (load out (base+16) ));
store out (base+32)  (vec_xor (load ks 32) (load out (base+32) ));
store out (base+48)  (vec_xor (load ks 48) (load out (base+48) ));
```

### Assembly Comparison

The inner loop body changes from 64 scalar `xorb` instructions to 4 `xorps`/`vpxor` vector XOR instructions. The transform loop's instruction count per 64-byte block drops dramatically.

### Benchmark

| Input Size | Encrypt Speed (MB/s) | Decrypt Speed (MB/s) | vs Baseline |
|---|---|---|---|
| 10 MB | 289.50 | 293.18 | +34.1% |
| 30 MB | 298.44 | 298.35 | +31.7% |
| 50 MB | 298.57 | 299.92 | +31.6% |
| 100 MB | **301.01** | **301.28** | **+34.1%** |

Steady-state improvement: **+34.1%** (224.40 → 301.01 MB/s encrypt). This is the largest single gain in the C SIMD optimization journey.

### Decision: Keep

Assembly confirmed the transform loop vectorization. Benchmark confirmed a large improvement. Opt01 is retained.

---

## Opt02: Unroll Double Rounds

### Observation

After Opt01, the hot path is now almost entirely the block function. The 10 double rounds were expressed as a `for` loop. The loop introduces overhead: a counter decrement, a comparison, and a conditional branch per iteration. More significantly, the loop prevents the compiler from scheduling the 10 iterations as a straight-line sequence, which could expose more instruction-level parallelism.

### Hypothesis

Explicitly unrolling the 10 `DOUBLE_ROUND` calls — replacing the loop with 10 sequential macro invocations — will:
- Eliminate loop overhead (10 iterations × ~3 instructions = ~30 instructions)
- Allow the compiler to schedule across round boundaries
- Match the OxCaml implementation's structure, which already uses 10 explicit `double_round` calls

### Implementation

The `for` loop is replaced with 10 explicit `DOUBLE_ROUND` macro calls:

```c
DOUBLE_ROUND(a, b, c, d, r16, r8)
DOUBLE_ROUND(a, b, c, d, r16, r8)
/* ... 8 more ... */
DOUBLE_ROUND(a, b, c, d, r16, r8)
```

### Assembly Comparison

The loop control instructions (`decl`, `jne`) are removed. The 10 double rounds compile to a straight-line sequence. The total instruction count in the block function decreases by the loop overhead, and the instruction scheduler has more freedom to reorder across round boundaries.

### Benchmark

| Input Size | Encrypt Speed (MB/s) | Decrypt Speed (MB/s) | vs Opt01 |
|---|---|---|---|
| 10 MB | 291.02 | 312.48 | +0.5% |
| 30 MB | 319.16 | 319.58 | +6.9% |
| 50 MB | 319.58 | 319.74 | +7.0% |
| 100 MB | **319.65** | **321.44** | **+6.2%** |

Steady-state improvement: **+6.2%** (301.01 → 319.65 MB/s encrypt).

### Decision: Keep

Assembly confirmed the unrolling. Benchmark confirmed a measurable improvement. Opt02 is the final C SIMD state.

---

## Why C SIMD Was Optimized After OxCaml SIMD

An important clarification: the C SIMD optimization was motivated not by a desire to maximize C SIMD speed, but by a fairness concern.

When OxCaml SIMD was first benchmarked and reached approximately 200 MB/s, it was compared against the C SIMD baseline at approximately 225 MB/s. The gap appeared small. But the C SIMD baseline was using a scalar XOR loop while OxCaml was using SIMD XOR. The two implementations were not applying the keystream in the same way.

To ensure a fair comparison, C SIMD was optimized to match what OxCaml was already doing. The result: C SIMD Opt02 at ~320 MB/s vs OxCaml Opt06 at ~275 MB/s — a ~16% gap that reflects genuine compiler and runtime differences between C and OxCaml, not algorithmic differences.

---

## Progress Summary

![C SIMD and OxCaml SIMD Optimization Progress — Encryption Throughput](../benchmarks/results/simd_encrypt_speed_progress.png)

The graph shows both C SIMD stages (blue tones, circles) and all OxCaml SIMD stages (warm tones, triangles) on the same axes.

C SIMD stages (lower to upper blue lines): Baseline at ~225 MB/s, Opt01 at ~301 MB/s, Opt02 at ~320 MB/s. The Opt01 jump is large because it vectorizes the transform loop. The Opt02 improvement is more modest — loop unrolling in the block function.

OxCaml stages are described fully in `docs/06_oxcaml_simd.md`. Visually: OxCaml starts below C SIMD baseline and climbs through Opt01–Opt03 gradually, then jumps sharply at Opt04 before leveling off.

The final C SIMD (dark blue, top) sits above the final OxCaml (dark red, second from top) by approximately 16% at steady state. This gap is analyzed in `docs/08_final_comparison.md`.

![C SIMD and OxCaml SIMD Progress — Decryption Throughput](../benchmarks/results/simd_decrypt_speed_progress.png)

![C SIMD and OxCaml SIMD Progress — Encryption Time](../benchmarks/results/simd_encrypt_time_progress.png)

![C SIMD and OxCaml SIMD Progress — Decryption Time](../benchmarks/results/simd_decrypt_time_progress.png)
