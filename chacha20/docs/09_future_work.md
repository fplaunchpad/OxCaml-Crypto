# Future Work

This section identifies the remaining optimization opportunities for OxCaml SIMD. The scope is strictly limited to changes that preserve structural equivalence with the C SIMD reference and use only capabilities that OxCaml already has or that represent natural extensions of its current SIMD interface.

Techniques that violate the structural equivalence constraint — multi-block AVX2, Bigarray-based storage, unsafe C FFI wrappers — are explicitly out of scope. Using them would change the algorithm being compared and invalidate the cross-language conclusions.

---

## What Remains

The 14% gap between OxCaml SIMD Opt06 (~275 MB/s) and C SIMD Opt02 (~320 MB/s) was attributed in `docs/08_final_comparison.md` to three sources:

1. Counter update: 4 byte writes per block vs C's 1 integer store
2. `Bytes` field access indirection
3. Output buffer allocation (API-level, not an optimization target)

The first two are addressable once OxCaml exposes the appropriate capabilities.

---

## Counter Encoding: 32-bit Little-Endian Store

**Current state.** The per-block counter update in `chacha20_crypt` writes the 32-bit counter as four separate bytes:

```ocaml
Bytes.unsafe_set ctr_nonce 0 (Char.unsafe_chr ( ctr         land 0xFF));
Bytes.unsafe_set ctr_nonce 1 (Char.unsafe_chr ((ctr lsr  8) land 0xFF));
Bytes.unsafe_set ctr_nonce 2 (Char.unsafe_chr ((ctr lsr 16) land 0xFF));
Bytes.unsafe_set ctr_nonce 3 (Char.unsafe_chr ((ctr lsr 24) land 0xFF));
```

This compiles to approximately 16 instructions: 4 masks, 4 shifts, 4 `Char.unsafe_chr` calls, 4 `Bytes.unsafe_set` calls.

**C equivalent.** The C implementation stores the counter as a single 32-bit write:

```c
ctx->input[12] = (uint32_t)counter;
```

This compiles to 1–2 instructions.

**What is needed.** OxCaml would need a primitive for unboxed 32-bit little-endian store to a `Bytes` offset — something equivalent to `Bytes.set_int32_le`. If OxCaml exposes such a primitive (as an unboxed `[@builtin]` or as a direct `Bytes.set_int32_le`), the counter update reduces to one instruction and the gap from this source closes.

**Expected impact.** The per-block overhead is approximately 14 instructions vs 1 instruction. Across all blocks for a 100 MB message (100 MB / 64 bytes = ~1.6 million blocks), eliminating 13 instructions per block would account for a significant fraction of the remaining gap.

---

## Key Buffer Access: Direct 128-bit Loads from Struct-like Layouts

**Current state.** OxCaml loads the key from a `Bytes` value using `load key 0` and `load key 16` — two 128-bit load operations. These are correct and the `load` primitive compiles to `VMOVUPD`. The overhead here is the indirection through OCaml's `Bytes` representation (a pointer on the heap, a length, then the data). The compiler cannot always prove the alignment or eliminate the length check.

**C equivalent.** C loads the key from a `uint8_t *` array in a struct field — a direct pointer dereference with no intermediary.

**What is needed.** This is a minor gap and may close naturally as OxCaml's compiler improves. No specific new primitive is required — the existing `load` primitive is correct; the overhead is in the pointer indirection chain, which is an implementation quality issue rather than a missing feature.

**Expected impact.** Small (< 1% per block). Lower priority than the counter encoding issue.

---

## Summary

Once OxCaml exposes an efficient 32-bit little-endian store primitive for `Bytes`, the counter encoding overhead can be eliminated and the remaining 14% gap to C SIMD may reduce to 5–8% — primarily the output buffer allocation, which requires an API-level change rather than an optimization.

The SIMD block function itself is already at C-equivalent performance. All remaining work is in the scaffolding around the block function.

No other future work is proposed within the scope of this study. Extensions that require multi-block processing, different vector widths, or unsafe interop with C are out of scope because they change the structural equivalence relationship that makes the comparison valid.
