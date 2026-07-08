# Optimization Summary

One-page overview of every optimization across all implementations, including reverted experiments. The Motivation column states why each optimization was attempted. The Assembly column describes what the compiler actually produced. Reverted stages are shown with their reversion reason.

---

## All Optimizations

| Impl | Stage | Motivation | Assembly | Benchmark | Decision |
|---|---|---|---|---|---|
| OCaml | Baseline | Cryptokit derivation; structural equivalence with C scalar | — | Encrypt 37.86 MB/s | Baseline |
| OCaml | Opt01 | Replace heap-allocated work array with local let-bindings | ✓ work array and round-loop eliminated | +24.9% (→ 47.29 MB/s) | **Keep** |
| OCaml | Opt02 | Remove redundant mask32 inside rotate | ✓ movabsq/andq pair removed from rotate expansion | +13.5% (→ 53.70 MB/s) | **Keep** |
| OCaml | Opt03 | Hoist 0xFFFFFFFF constant to reduce per-call reload | ✗ Clambda folded constant back through [@inline] — bitwise identical to Opt02 | 0% | **Revert** |
| OCaml | Opt04 | Remove preamble bounds checks with Array.unsafe_get | ✓ preamble checks removed; identical checks reappeared in output section | −2.0% (→ 52.65 MB/s) | **Revert** |
| C SIMD | Baseline | Single-block SSE2/SSSE3 reference mirroring OxCaml SIMD | — | Encrypt 224.40 MB/s | Baseline |
| C SIMD | Opt01 | Vectorize transform loop: replace 64 scalar XORs with 4 SIMD XORs | ✓ inner loop body reduced from 64 xorb to 4 xorps | +34.1% (→ 301.01 MB/s) | **Keep** |
| C SIMD | Opt02 | Unroll 10 double rounds to eliminate loop overhead | ✓ loop control instructions removed, straight-line schedule | +6.2% (→ 319.65 MB/s) | **Keep** |
| OxCaml | Baseline | First working OxCaml SIMD; all 6 builtins correct | — | Encrypt 182.11 MB/s | Baseline |
| OxCaml | Opt01 | Hoist PSHUFB mask constants out of per-call load chain | ✓ per-call mask load sequence eliminated | +1.6% (→ 184.94 MB/s) | **Keep** |
| OxCaml | Opt02 | Ensure full inlining of quarterround / double_round | ✓ call/ret pairs for inner functions removed | flat (→ 184.53 MB/s) | **Keep** |
| OxCaml | Opt03 | Restructure double-round tuple bindings to reduce overhead | ✓ tighter SIMD instruction sequence | +8.9% (→ 200.81 MB/s) | **Keep** |
| OxCaml | Opt04 | Preallocate ctr_nonce and keystream buffers outside inner loop | ✓ per-block allocation removed from hot path | +35.3% (→ 271.79 MB/s) | **Keep** |
| OxCaml | Opt05 | Replace Bytes.set/Char.chr with unsafe variants for counter update | ✓ redundant bounds/range checks on counter writes removed | +0.8% (→ 274.05 MB/s) | **Keep** |
| OxCaml | Opt06 | Hoist s0/mask16/mask8 constants outside block loop | ✓ 7-instruction GOT→closure→field chain eliminated per block | +0.4% (→ 275.03 MB/s) | **Keep** |

---

## Pattern Analysis

**OCaml scalar** achieved two successful optimizations before reaching the irreducible limit. Both successful optimizations targeted heap traffic: Opt01 removed the work array entirely, Opt02 removed a redundant mask operation in the hot path. The two failed experiments targeted compiler-managed operations (constant folding, bounds-check inference) where the compiler was already handling the problem optimally or counteracted the change automatically.

**C SIMD** achieved its largest gain at Opt01 (transform loop vectorization, +34%) — a case where the baseline was doing obvious scalar work that SIMD could handle directly. Opt02 was incremental. The C SIMD optimization was motivated by fairness to OxCaml, not by a goal of maximizing C speed.

**OxCaml SIMD** shows a characteristic pattern: small gains at Opt01–Opt03 (+1.6%, flat, +8.9%) followed by a large jump at Opt04 (+35.3%), then two small finishing optimizations. The Opt04 jump is the most striking result in the entire study. It reveals that the OxCaml SIMD block function was performing at near-C speed all along; the bottleneck was the outer loop's repeated heap allocation, not the SIMD computation itself.

**Total cumulative gains:**
- OCaml scalar: +41.8% over baseline (37.86 → 53.70 MB/s)
- C SIMD: +42.4% over baseline (224.40 → 319.65 MB/s)
- OxCaml SIMD: +51.0% over baseline (182.11 → 275.03 MB/s)

OxCaml SIMD's larger cumulative gain reflects the greater number of optimization stages and the dominance of the Opt04 structural fix. The percentage gain from the baseline is similar across all three optimized implementations, suggesting that all three had comparable amounts of addressable overhead at their respective starting points.
