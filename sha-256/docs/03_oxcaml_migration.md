# 03 — OxCaml int32# Migration

## Contents

1. [Introduction](#introduction)
2. [Migration Roadmap](#migration-roadmap)
3. [Step01 — Toolchain Validation](#step01--toolchain-validation)
4. [Step02 — Core Helper Functions](#step02--core-helper-functions)
5. [Step03 — Context, Constants, and Data Arrays](#step03--context-constants-and-data-arrays)
6. [Step04 — Compression Core](#step04--compression-core)
7. [Step05 — Remaining API](#step05--remaining-api)
8. [Baseline Validation](#baseline-validation)
9. [OxCaml Migration Summary](#oxcaml-migration-summary)

---

## Introduction

### Why OxCaml

After Opt07, the OCaml scalar implementation reached 48.68 MB/s — a 50.7% improvement over the baseline, but still 3.05× slower than the C reference at 148.53 MB/s. The remaining bottlenecks visible in the Opt07 assembly are analyzed in [docs/02_ocaml_scalar_optimization.md](02_ocaml_scalar_optimization.md#ocaml-scalar-optimization-summary):

- **93 `andq` instructions** — `land mask32` operations required by OCaml's 63-bit integer representation. Structurally necessary; no source-level rearrangement can eliminate them.
- **Three-instruction rotate sequences** — `shrq`/`salq`/`orq` where C produces a single `roll`.
- **16 `jbe` branches** — bounds checks in partial-block paths; negligible for large inputs.

The 93 masking operations are the dominant identifiable overhead. They exist not because SHA-256 requires masking, but because OCaml's native integer is 63 bits wide and every 32-bit arithmetic result must be truncated. The C reference has no such requirement: `u32` arithmetic wraps at 2³² by definition, no masking instruction required.

OxCaml's `int32#` type represents an unboxed 32-bit integer. Arithmetic on `int32#` values wraps at 2³² by construction. No `land mask32` call is ever emitted. An `int32#` array stores elements at 4 bytes per slot rather than 8 (the `int array` slot size on 64-bit platforms). The type eliminates an entire category of representational overhead at the type level.

### Why int32# Is the Right Primitive

Standard OCaml provides `Int32.t` — a heap-allocated box containing a 32-bit integer. Using `Int32.t` throughout SHA-256 would eliminate the masking overhead but introduce a different overhead: every arithmetic operation would require boxing the result (heap allocation), and every operand dereference would require unboxing. `Int32.t` is designed for interoperability, not for computational throughput.

OxCaml's `int32#` is fundamentally different: it is an *unboxed* type. An `int32#` value does not exist on the heap; it lives in a register or on the stack. Arithmetic operations on `int32#` produce `int32#` results directly, with no allocation. An `int32# array` is a contiguous block of 32-bit values with no heap pointers and no GC overhead per element. This is the representation SHA-256 requires: the C implementation's `u32` is essentially the same thing.

### Why Representation Change is Isolated from Optimization

The migration from OCaml Opt07 to the OxCaml `int32#` baseline is deliberately a pure representation change. Every algorithmic structure — the schedule expansion, the compression function, the `rounds` tail-recursive loop, the context layout, the byte I/O — is carried over without modification. No optimization is applied during migration.

This isolation is methodologically necessary. The OxCaml baseline must be directly comparable to OCaml Opt07: the only variable that changes is the integer representation. If the migration also changed the algorithm, applied loop restructurings, or eliminated dead code, it would be impossible to attribute the resulting performance improvement to `int32#` rather than to the algorithmic changes. The performance difference between Opt07 and the OxCaml baseline is the measurement of `int32#`'s contribution.

Algorithmic optimizations — including the dead schedule expansion discovered in the OxCaml phase — are applied only after the baseline is established and validated. They are documented separately in [docs/04_oxcaml_optimization.md](04_oxcaml_optimization.md).

### Why Opt07 Was the Migration Baseline

Opt07 is the endpoint of all viable source-level optimizations in standard OCaml. Taking Opt07 as the migration starting point means the comparison "OCaml best vs OxCaml baseline" reflects the representation change in isolation, with all common source-level improvements already applied to both sides.

Migrating from the OCaml baseline (rather than Opt07) would conflate the representation change with the unoptimized OCaml starting point, making the `int32#` effect harder to isolate.

---

## Migration Roadmap

| Step | Objective | Status |
|------|-----------|--------|
| Step01 | Toolchain validation; `int32#` familiarization; API discovery | Complete |
| Step02 | Core helper functions: `rotr`, `ch`, `maj`, sigma functions | Complete |
| Step03 | Context type, `constants` array, `data` array; packed layout | Complete |
| Step04 | Compression core: `transform_from`, `rounds` | Complete |
| Step05 | Remaining API: `get_be32`, `set_be32`, `add_data`, `finish` | Complete |
| Baseline | Full FIPS validation; Python/OpenSSL cross-check; baseline measurement | Complete |

Each step has a correctness gate: the FIPS 180-4 known-answer tests must pass before the next step begins. No benchmark measurement is taken until the complete implementation passes all correctness checks.

---

## Step01 — Toolchain Validation

### Background

Before writing any production `int32#` code, a systematic investigation of the OxCaml toolchain, the `int32#` type, and the relevant compiler APIs was necessary. The goals of this step were:

1. Establish that the OxCaml toolchain is correctly installed and functional.
2. Understand the `int32#` type: its representation, its arithmetic semantics, and its array behavior.
3. Discover the correct API for `int32#` array creation and access.
4. Validate that the `int32#` arithmetic properties required by SHA-256 hold — specifically, unsigned wrapping at 2³².
5. Confirm through assembly inspection that `int32#` eliminates masking instructions from the generated code.

This step produced `oxcaml/oxcaml_validate.ml` — a standalone validation program that must pass before any migration code is written. It also produced the understanding of the `makearray_dynamic`, `layout_poly`, and `Stdlib_upstream_compatible` idioms that the rest of the migration depends on.

### Objective

Validate the OxCaml toolchain and `int32#` primitives. No SHA-256 code is written in this step.

What is intentionally excluded in this step: any SHA-256 logic, any migration of the OCaml source, any performance measurement.

### Why SIMD, SHA-NI, and C Bindings Were Excluded

Before the OxCaml investigation, three other directions for recovering performance were considered and excluded. These are documented as scope constraints in the [README Design Constraints](../README.md#design-constraints) section; they are summarized here for completeness.

**SIMD (`vec128`).** OxCaml exposes a `vec128` primitive used in the ChaCha20 companion case study for SSE2/SSSE3 block-parallel encryption. SHA-256's compression function has sequential round dependencies (`a_new` depends on `e_new` of the same round; `W[i]` depends on `W[i-2]`, `W[i-7]`, `W[i-15]`, `W[i-16]`), which prevent straightforward single-buffer SIMD. Multi-buffer SIMD (hashing independent messages in parallel) would change the interface. Excluded as out of scope for a single-buffer scalar study.

**SHA-NI.** Intel's `SHA256RNDS2`, `SHA256MSG1`, and `SHA256MSG2` instructions perform rounds in hardware. Using them would produce throughput well above the C scalar reference, but the result is not a scalar implementation and cannot be compared fairly against the OCaml baseline. Excluded.

**C bindings (FFI).** A C binding would measure FFI overhead, not OxCaml. The research question is how much of the OCaml/C gap `int32#` can close. Excluded.

The OxCaml `int32#` migration is the only direction that is: (a) source-level, (b) within the scalar implementation scope, and (c) capable of addressing the 93 `andq` masking overhead that Opt07 left unresolved.

### Observation

The immediate motivation for the validation step was uncertainty. `int32#` is a novel type — not present in standard OCaml, not documented at the level of a stable API. The following questions required empirical answers before any migration code could be written:

1. Does `int32#` arithmetic wrap at 2³² with no masking instruction? Or does the compiler emit a mask?
2. Is `lsr` on `int32#` logical (zero-fill, unsigned) or arithmetic (sign-extend)?
3. How is an `int32#` array created? `Array.make` does not accept `int32#` values (the type requires a different primitive).
4. How is an `int32#` array element read or written? The standard `Array.get`/`Array.unsafe_get` are polymorphic over `'a array`, but `int32#` has a non-standard memory layout that the standard polymorphic accessor may not handle.
5. What assembly does a `rotr` function produce with `int32#`? Does the compiler produce a `roll` instruction, or still three separate shift/or instructions?
6. Does `[@inline]` work with `int32#` function arguments?

### Investigation

#### Toolchain Setup

OxCaml runs on a separate opam switch (`oxcaml-dev`) from standard OCaml. The switch provides the `oxcaml` compiler, `flambda2` optimizer, and an extended standard library.

The dune build file for OxCaml requires specific configuration:

```
(executable
 (name benchmark_sha256)
 (modes (native exe))
 (ocamlopt_flags (:standard -O3 -unbox-closures))
 ...)
```

At the module level, the OxCaml source includes:

```ocaml
open Stdlib_upstream_compatible
[@@@ocaml.flambda_o3]
```

`open Stdlib_upstream_compatible` brings in OxCaml-extended standard library bindings including operators and modules compatible with unboxed types. Without this, standard `lsr`, `lxor`, `land`, etc. operate on OCaml `int`; after the open, the equivalent operations for `int32#` are accessible.

`[@@@ocaml.flambda_o3]` enables the Flambda2 optimizer at level 3 for this compilation unit. This is necessary for `[@inline]` functions operating on `int32#` to be inlined aggressively enough to eliminate the function-call overhead.

#### Discovering makearray_dynamic

The first attempt to create an `int32#` array used:

```ocaml
let arr = Array.make 64 #0l
```

This does not compile. `Array.make` in standard OCaml (and its `Stdlib_upstream_compatible` counterpart) requires its element to be a regular heap value. `int32#` is an unboxed type; it cannot be passed where a `'a` type variable expects a regular heap value, because the GC polymorphism assumption requires that all elements of a polymorphic array are pointer-sized and GC-scannable.

OxCaml provides a dedicated external for unboxed array creation:

```ocaml
external makearray_dynamic : int -> int32# -> int32# array = "%makearray_dynamic"
```

`makearray_dynamic n v` creates an `int32#` array of `n` elements, initialized to `v`. The `%makearray_dynamic` primitive is a compiler builtin that emits the correct code for allocating a contiguous block of 32-bit values.

Correct usage:

```ocaml
let arr = makearray_dynamic 64 #0l
```

This creates a 64-element `int32#` array occupying 64 × 4 = 256 bytes (plus GC header), compared to 64 × 8 = 512 bytes for an OCaml `int array`. The memory layout is confirmed by computing the array's byte footprint in the validation program.

#### Discovering layout_poly Array Access

The second barrier was reading from and writing to an `int32#` array. Standard `Array.unsafe_get` has type `'a array -> int -> 'a`, where `'a` is a polymorphic type variable that implicitly assumes pointer-sized elements and GC-managed values. An `int32# array` has neither property.

OxCaml provides layout-polymorphic externals:

```ocaml
external aget : ('a : any mod non_float). 'a array -> int -> 'a
  = "%array_unsafe_get" [@@layout_poly]

external aset : ('a : any mod non_float). 'a array -> int -> 'a -> unit
  = "%array_unsafe_set" [@@layout_poly]
```

The `[@@layout_poly]` attribute tells the compiler that this external's type variable `'a` may be instantiated at any layout, including unboxed layouts like `int32#`. The `('a : any mod non_float)` kind constraint admits any layout except float (which has special representation rules).

These declarations are the correct way to perform unsafe array access on `int32#` arrays. There is no bounds-checked variant for `int32#` arrays in OxCaml at the time of this migration; all `int32#` array accesses use `aget`/`aset` directly (equivalent in safety requirement to `Array.unsafe_get`/`unsafe_set`).

#### Discovering Int32 Literal Syntax

In OxCaml, unboxed `int32#` literals are written with a `#` prefix and an `l` suffix:

```ocaml
let zero : int32# = #0l
let one  : int32# = #1l
let mask : int32# = #0xFFFFFFFFl
```

The `#` indicates an unboxed value; the `l` suffix matches OCaml's `Int32.t` literal convention. This syntax is distinct from:
- `0l` — a boxed `Int32.t`
- `0` — an OCaml `int`

#### Writing oxcaml_validate.ml

With the basic API established, `oxcaml_validate.ml` was written to validate the six properties listed in the Observation section. The validation uses 2,000 pseudorandom test cases generated from a fixed seed, comparing `int32#` operations against the reference OCaml masked-int implementation for each input pair.

**Property 1: Wrapping at 2³².**

The test adds `#0xFFFFFFFFl` and `#0x00000001l` and checks that the result is `#0x00000000l`. In the OCaml masked-int implementation, this required `land mask32` to truncate the carry. With `int32#`, the result is `#0x00000000l` directly — no mask instruction.

Assembly inspection confirms: the addition compiles to a single `addl` (32-bit add) with no subsequent `andq`.

**Property 2: Unsigned right shift.**

The test applies a right-shift of 1 to `#0x80000000l` and checks for `#0x40000000l`. If the shift were arithmetic (sign-extending), the result would be `#0xC0000000l`. The result `#0x40000000l` confirms logical (unsigned) shift-right.

This is necessary for `rotr`: the expression `x lsr# n` in the OxCaml source must be unsigned, because SHA-256's rotate-right is an unsigned operation.

**Property 3: rotr correctness.**

A reference implementation of `rotr` using masked OCaml `int`:

```ocaml
let rotr_ref (x : int) (n : int) : int =
  ((x lsr n) lor (x lsl (32 - n))) land 0xFFFF_FFFF
```

And the `int32#` implementation:

```ocaml
let[@inline] rotr (x : int32#) (n : int) : int32# =
  Int32_u.(logor (shift_right_logical x n) (shift_left x (32 - n)))
```

For 2,000 pseudorandom `(x, n)` pairs (with `n ∈ [1, 31]`), both functions must produce the same result (after converting `int32#` to `int` for comparison). All 2,000 cases pass.

**Property 4: Sigma function output.**

`big_sigma0`, `big_sigma1`, `sigma0`, `sigma1` implemented with `int32#` are compared against the Opt07 OCaml implementations for 2,000 pseudorandom inputs. All pass.

**Property 5: int32# array packed layout.**

Creating a `makearray_dynamic 4 #0l` array and writing values `#1l`, `#2l`, `#3l`, `#4l` to indices 0–3, then reading them back, verifies that element access is correct. A secondary check examines that accessing index 4 (out of bounds) is not silently reading adjacent memory by checking that the array's backing store is 4 × 4 = 16 bytes, not 4 × 8 = 32 bytes. This is confirmed by inspecting the generated assembly's immediate operand in the multiplication for element offset calculation: the stride is 4, not 8.

**Property 6: [@inline] with int32#.**

A helper function marked `[@inline]` that takes and returns `int32#` arguments is verified to produce inlined code in the validation assembly output. Without `[@@@ocaml.flambda_o3]`, the function is not inlined even with `[@inline]`. With it, the function body appears inline at each call site in the assembly.

#### Assembly Inspection of Validation Code

The validation program's assembly was inspected to confirm the key property: no `andq` with `0xffffffff` appears in the `rotr` or sigma function bodies. The C reference's `roll` instruction for rotate-right is still not produced — OxCaml compiles `rotr` to `shrq`/`salq`/`orq` (64-bit variants) rather than the 32-bit `shrl`/`shll`/`orl`, since OxCaml stores `int32#` in 64-bit registers. This is noted but accepted: the rotate-idiom limitation is a compiler issue, not an `int32#` issue, and is outside the scope of source-level optimization.

### Correctness Validation

The validation program runs 2,000 test cases for each of the six properties described above. All pass before any migration code is written. The validation program is committed to `oxcaml/oxcaml_validate.ml` and remains runnable as a regression check for any future changes to the OxCaml source.

### Decision: COMPLETE

The toolchain is validated. The `int32#` type behaves as required. The API (`makearray_dynamic`, `aget`/`aset`, `[@@layout_poly]`, `Stdlib_upstream_compatible`, `[@@@ocaml.flambda_o3]`) is understood. Migration can begin.

### Lessons Learned

**OxCaml's `int32#` API requires discovery; it is not a drop-in replacement for OCaml `int`.** Three separate primitives — `makearray_dynamic`, `aget`/`aset` with `[@@layout_poly]`, and `Stdlib_upstream_compatible` — must be understood before any production code can be written. Writing the validation program before the migration code is the correct order: it establishes the invariants before they are relied upon in production logic.

**`[@@@ocaml.flambda_o3]` is load-bearing.** Without it, `[@inline]` functions with `int32#` arguments are not inlined, and the performance properties of the `int32#` implementation cannot be realized. It must be present in the production source.

**The rotate-idiom limitation is a compiler issue, not an `int32#` issue.** OxCaml does not emit `roll` for the `(x lsr n) lor (x lsl (32 - n))` idiom. This gap between C and OxCaml on the rotate cost was confirmed here and is outside the scope of any source-level fix.

---

## Step02 — Core Helper Functions

### Background

The helper functions — `rotr`, `ch`, `maj`, `big_sigma0`, `big_sigma1`, `sigma0`, `sigma1` — form the arithmetic kernel of SHA-256. In the OCaml Opt07 implementation, they operate on `int` with `mask32` applied at the sigma outputs (per the Opt07 restructuring). In the OxCaml implementation, they operate on `int32#` with no masking.

### Objective

Migrate `rotr`, `ch`, `maj`, and the four sigma functions from `int`-with-mask to `int32#`.

What is intentionally not migrated in this step: the context type, the compression core, any byte I/O. The helper functions are migrated in isolation so their assembly can be inspected before they are embedded in larger functions.

### Observation

The helper functions are the only locus of `land mask32` in the Opt07 implementation's arithmetic hot path. After the Opt07 restructuring, there are no `land mask32` calls inside `rotr` — only at the sigma outputs. Migrating these functions to `int32#` is the first direct application of the toolchain validation findings.

### Investigation

**Type signature changes.** Every helper function changes its argument and return types from `int` to `int32#`. The function bodies change from:

```ocaml
(* OCaml Opt07 *)
let[@inline] rotr x n =
  (x lsr n) lor (x lsl (32 - n))

let[@inline] big_sigma0 x =
  ((rotr x 2) lxor (rotr x 13) lxor (rotr x 22)) land mask32
```

to:

```ocaml
(* OxCaml *)
let[@inline] rotr (x : int32#) (n : int) : int32# =
  Int32_u.(logor (shift_right_logical x n) (shift_left x (32 - n)))

let[@inline] big_sigma0 (x : int32#) : int32# =
  Int32_u.(logxor (logxor (rotr x 2) (rotr x 13)) (rotr x 22))
  (* no land mask32 *)
```

The `land mask32` disappears from `big_sigma0` because `int32#` XOR cannot produce bits above position 31. The result is always a valid 32-bit value.

**`ch` and `maj`.** These functions use only `lxor`, `land`, and `lor` — no `rotr` calls, no masking in the Opt07 version. The migration is a direct type change:

```ocaml
(* OCaml Opt07 *)
let[@inline] ch e f g =
  g lxor (e land (f lxor g))

(* OxCaml *)
let[@inline] ch (e : int32#) (f : int32#) (g : int32#) : int32# =
  Int32_u.(logxor g (logand e (logxor f g)))
```

No masking was needed in the OCaml version for `ch`/`maj`, and none is needed in OxCaml.

**Verifying no masking was accidentally introduced.** The first draft of `big_sigma0` in OxCaml included a precautionary `land #0xFFFFFFFFl` at the output — carried over by habit from the OCaml implementation. Assembly inspection showed that this produced an `andl` instruction in the output. The mask was removed; the `andl` disappeared. Final assembly: no masking instructions in any helper function body.

### Assembly Verification

| Function | OCaml Opt07 `andq` count | OxCaml `andq`/`andl` count |
|----------|--------------------------|---------------------------|
| `rotr` | 0 (mask moved to sigma output in Opt07) | 0 |
| `big_sigma0` | 1 (at output) | **0** |
| `big_sigma1` | 1 (at output) | **0** |
| `sigma0` | 1 (at output) | **0** |
| `sigma1` | 1 (at output) | **0** |
| `ch` | 0 | 0 |
| `maj` | 0 | 0 |

All sigma masking instructions are eliminated. The `rotr` body compiles to a three-instruction shift-or sequence in both versions — no change in rotate encoding. (OxCaml emits 64-bit `shrq`/`salq`/`orq`; OCaml emits the same logical form on 64-bit registers.)

### Correctness Validation

Each `int32#` helper function is verified against its OCaml Opt07 counterpart using the same 2,000 pseudorandom test cases from `oxcaml_validate.ml`. All pass.

### Decision: COMPLETE

### Lessons Learned

**The mask habit must be actively resisted during migration.** The first draft included a precautionary `land #0xFFFFFFFFl` — an artifact of writing OCaml integer code. Assembly inspection caught it immediately: the `andl` instruction was visible and its removal verified that the `int32#` type does not require it. The validation discipline (write, inspect, verify) is as important for correctness of the migration as for its performance.

---

## Step03 — Context, Constants, and Data Arrays

### Background

The `ctx` record type holds the hash state. In OCaml Opt07:

```ocaml
type ctx = {
  state   : int array;   (* 8 × 8 bytes = 64 bytes *)
  data    : int array;   (* 80 × 8 bytes = 640 bytes; Opt01 moved this from transform *)
  length  : int array;   (* 2 × 8 bytes for bit-length counter *)
  mutable numbytes : int;
  buffer  : bytes;
}
```

The `constants` array is module-level:

```ocaml
let constants : int array = [| 0x428a2f98; ... (* 64 entries *) |]
(* 64 × 8 bytes = 512 bytes *)
```

### Objective

Migrate `state`, `data`, and `constants` to `int32#` arrays. Document the implications for array creation, element access, and memory layout.

What is intentionally not migrated: `length` (the bit-length counter, discussed in Step05), `numbytes`, and `buffer`. These remain as OCaml types.

### Observation

Three types of overhead are addressed by migrating these arrays to `int32#`:

1. **Memory footprint.** An `int array` stores each element at 8 bytes. An `int32# array` stores each element at 4 bytes. `constants` shrinks from 512 bytes to 256 bytes. `state` shrinks from 64 bytes to 32 bytes. This has cache-line implications: the full `state` array fits in a single 64-byte cache line (32 bytes data + 8-byte GC header = 40 bytes, within one line). The OCaml version required 64 + 8 = 72 bytes — straddling two cache lines.

2. **Tag reads on array access.** Even with `Array.unsafe_get`, OCaml emits a tag-check load before the element load for `int array`. The `aget` with `[@@layout_poly]` bypasses this.

3. **Type mismatch propagation.** Until the array types are migrated, the helper functions (now `int32# → int32#`) cannot be called with values loaded from `int array`. The array migration must precede the compression core migration.

### Investigation

#### int32# Array Creation

As established in Step01, `Array.make` does not work for `int32#`. The `makearray_dynamic` primitive is required:

```ocaml
(* Fails to compile *)
let state = Array.make 8 #0l

(* Correct *)
external makearray_dynamic : int -> int32# -> int32# array = "%makearray_dynamic"
let state = makearray_dynamic 8 #0l
```

#### Constant Array Declaration

The module-level `constants` array presents a challenge: there is no `int32#` array literal syntax equivalent to `[| 0x428a2f98; ... |]`. The OCaml literal syntax produces an `int array`; there is no `int32#` array literal in OxCaml.

Two approaches were considered:

**Approach A: Declare as `int array`, convert at use site.**

```ocaml
let constants_int : int array = [| 0x428a2f98; ... |]
(* Convert element at each access *)
let k = Int32_u.of_int (Array.unsafe_get constants_int i)
```

This is functionally correct but reintroduces a conversion instruction at each access. Assembly inspection confirmed that `Int32_u.of_int` compiles to a `movl` (truncating to 32 bits), which is one instruction — cheaper than `andq`/`andl` masking, but still an extra instruction per round per constant load.

**Approach B: Populate an `int32#` array at initialization time.**

```ocaml
let constants : int32# array =
  let arr = makearray_dynamic 64 #0l in
  aset arr 0 #0x428a2f98l;
  aset arr 1 #0x71374491l;
  (* ... 64 entries ... *)
  arr
```

This is more verbose but produces an `int32#` array whose elements require no conversion at access time. The constants are loaded as `movl` (32-bit loads from memory to register) with no widening or conversion.

**Approach B was chosen.** The extra initialization verbosity is a one-time cost at module initialization; the access-time benefit persists across every block of every benchmark run.

#### aget/aset Usage

Array reads and writes use the layout-polymorphic externals declared in Step01:

```ocaml
let k = aget constants i   (* : int32# *)
let w = aget ctx.data i    (* : int32# *)
aset ctx.state 0 a         (* write int32# into slot 0 *)
```

No bounds check is emitted (equivalent in safety to `Array.unsafe_get`). The safety argument is identical to the Opt02/Opt06 arguments in the OCaml phase: indices are loop-bounded and statically verified to be within array sizes.

#### Context Type Migration

The `ctx` type becomes:

```ocaml
type ctx = {
  state    : int32# array;   (* 8 × 4 bytes = 32 bytes + header *)
  data     : int32# array;   (* 80 × 4 bytes = 320 bytes + header *)
  length   : int array;      (* 2 × 8 bytes; kept as int for bit-length counter *)
  mutable numbytes : int;
  buffer   : bytes;
}
```

`length` remains as `int array` because the bit-length counter tracks the message length in bits as a 64-bit value, maintained using OCaml `int` arithmetic. The bit manipulation for the counter (shifting, OR-ing, comparing) is simpler and safer to keep in the familiar `int` domain. The counter contributes negligibly to hot-path execution time (it is updated once per block, not once per round). The mask32 that appears in the bit-length update in `add_data` is an OCaml artifact that remains in that path; it does not affect the compression core.

### Assembly Verification

| Metric | OxCaml Step03 | OCaml Opt07 |
|--------|--------------|-------------|
| `constants` array size | 256 bytes | 512 bytes |
| `state` array size | 32 bytes | 64 bytes |
| `data` array size | 320 bytes (80 elements) | 640 bytes |
| Element access stride | 4 bytes (confirmed by assembly offset arithmetic) | 8 bytes |
| Tag-check load on `aget` | absent | present (even with `unsafe_get`) |

The element access stride of 4 bytes is confirmed by observing the assembly: element offset is computed as `base + i * 4` rather than `base + i * 8`.

### Correctness Validation

Partial FIPS validation is run after this step: the constants and state arrays are used to hash the "abc" test vector, verifying that the constant values were populated correctly and that array access produces the right results. Full validation awaits the complete compression core in Step04.

### Decision: COMPLETE

### Lessons Learned

**`int32#` arrays require a different creation path.** `makearray_dynamic` is the correct primitive; `Array.make` and array literal syntax do not work for unboxed types. This requires explicit initialization code but produces the correct packed layout.

**The 2× memory footprint reduction is immediately visible.** The `constants` array fits in exactly four 64-byte cache lines (256 bytes). The OCaml version required eight. For a function called 1.6M times per 100 MB input, this cache-line density benefit accumulates.

---

## Step04 — Compression Core

### Background

The compression core is the most complex migration step. It encompasses `transform_from` and `rounds` — the functions that account for essentially all of the hot-path execution time. After Step03, the `ctx` record fields are `int32#` arrays and the helper functions are `int32#`-typed. `transform_from` and `rounds` must be migrated to complete the type-coherent implementation.

### Objective

Migrate `transform_from` (schedule expansion + call to `rounds`) and the tail-recursive `rounds` function from `int`-typed working variables to `int32#`.

What is intentionally not changed: the algorithmic structure (schedule expansion loop 0–79, 64 compression rounds, the same rotation/sigma formulas). The only change is the type of every intermediate value.

### Observation

After Step03, the OCaml Opt07 implementation and the partially-migrated OxCaml implementation have a type mismatch: `ctx.state` and `ctx.data` are now `int32#` arrays, but `transform_from` and `rounds` still operate on `int` working variables. This mismatch requires explicit conversion at every boundary (`Int32_u.to_int`, `Int32_u.of_int`) and would defeat the purpose of the migration. Step04 resolves this by making the working variables `int32#` throughout.

### Investigation

#### Type Propagation in transform_from

`transform_from` initializes the working variables `a..h` from `ctx.state` and passes them to `rounds`. With `ctx.state` as an `int32#` array:

```ocaml
let a = aget ctx.state 0  (* : int32# *)
let b = aget ctx.state 1  (* : int32# *)
(* ... *)
```

The working variables are now `int32#`. This requires `rounds` to accept `int32#` arguments.

#### Schedule Expansion

The schedule expansion computes `W[0..79]` from the input bytes. In Opt07:

```ocaml
(* Load W[0..15] from input *)
for i = 0 to 15 do
  Array.unsafe_set ctx.data i (get_be32 src (src_offset + i * 4))
done;
(* Expand W[16..79] *)
for i = 16 to 79 do
  let w2  = Array.unsafe_get ctx.data (i - 2) in
  let w7  = Array.unsafe_get ctx.data (i - 7) in
  let w15 = Array.unsafe_get ctx.data (i - 15) in
  let w16 = Array.unsafe_get ctx.data (i - 16) in
  Array.unsafe_set ctx.data i
    ((sigma1 w2 + w7 + sigma0 w15 + w16) land mask32)
done
```

With `ctx.data` as `int32#` array:

```ocaml
for i = 0 to 15 do
  aset ctx.data i (get_be32 src (src_offset + i * 4))  (* get_be32 returns int32# after Step05 *)
done;
for i = 16 to 79 do
  let w2  = aget ctx.data (i - 2) in
  let w7  = aget ctx.data (i - 7) in
  let w15 = aget ctx.data (i - 15) in
  let w16 = aget ctx.data (i - 16) in
  aset ctx.data i Int32_u.(add (add (sigma1 w2) w7) (add (sigma0 w15) w16))
  (* no land mask32 — int32# addition wraps automatically *)
done
```

The `land mask32` on the schedule expansion additions disappears. The `Int32_u.add` wraps at 2³² without any masking instruction.

**Note on schedule range 16–79:** At migration time, the schedule is expanded to index 79, mirroring the OCaml source. The dead expansion (indices 64–79 are computed but never used by the compression function) is inherited from the C source and is present in the migration baseline. It is eliminated in Ox02, documented in [docs/04_oxcaml_optimization.md](04_oxcaml_optimization.md). Eliminating it during migration would conflate the migration with the first optimization.

#### rounds with int32# Working Variables

The tail-recursive `rounds` function changes its argument types from `int` to `int32#`. The round update formula:

```ocaml
(* OCaml Opt07 *)
let rec rounds data ctx i a b c d e f g h =
  if i = 64 then begin
    Array.unsafe_set ctx.state 0 ((Array.unsafe_get ctx.state 0 + a) land mask32);
    (* ... *)
  end else
    let t1 = (h + big_sigma1 e + ch e f g + Array.unsafe_get constants i + Array.unsafe_get data i) land mask32 in
    let t2 = (big_sigma0 a + maj a b c) land mask32 in
    rounds data ctx (i+1) (Int32.add t1 t2 |> land mask32) a b c ((d + t1) land mask32) e f g

(* OxCaml *)
let rec rounds constants data ctx i (a:int32#) (b:int32#) (c:int32#) (d:int32#)
                                    (e:int32#) (f:int32#) (g:int32#) (h:int32#) =
  if i = 64 then begin
    aset ctx.state 0 Int32_u.(add (aget ctx.state 0) a);
    (* ... no mask32 *)
  end else
    let t1 = Int32_u.(add (add (add (add h (big_sigma1 e)) (ch e f g))
                         (aget constants i)) (aget data i)) in
    let t2 = Int32_u.(add (big_sigma0 a) (maj a b c)) in
    rounds constants data ctx (i+1)
      Int32_u.(add t1 t2) a b c Int32_u.(add d t1) e f g
```

Every `land mask32` on the arithmetic results disappears. Every intermediate value that previously required masking now stays within 32 bits by the `int32#` type's wrapping semantics.

The explicit `constants` parameter is kept from the Opt03 fix applied in OCaml. As will be documented in [docs/04_oxcaml_optimization.md](04_oxcaml_optimization.md#ox01), the closure capture issue reappears in OxCaml for `constants` specifically, but the migration baseline carries the explicit-parameter convention from OCaml.

#### State Update

The final state update in `rounds`:

```ocaml
(* OCaml Opt07 *)
Array.unsafe_set ctx.state 0 ((Array.unsafe_get ctx.state 0 + a) land mask32)

(* OxCaml *)
aset ctx.state 0 Int32_u.(add (aget ctx.state 0) a)
```

The `land mask32` on the modular addition disappears. The `Int32_u.add` wraps at 2³².

### Assembly Verification

| Metric | OxCaml Step04 | OCaml Opt07 |
|--------|--------------|-------------|
| `andq` with `0xffffffff` | 0 | 93 |
| `andl` | 0 | 0 |
| `jbe` branches | 8 | 16 |
| Assembly lines | 2,191 | 2,748 |

The 93 `andq` masking instructions from OCaml Opt07 are entirely absent. The assembly line count drops from 2,748 to 2,191. The `jbe` count drops from 16 to 8: the remaining 8 are in the partial-block paths of `add_data` and `finish` (where `Bytes.set`/`Bytes.blit` use safe access), not in the compression core.

### Correctness Validation

After Step04, the full FIPS 180-4 known-answer test suite is run for the first time on the partially-complete OxCaml implementation (using a temporary shim for `get_be32` that still returns `int` and converts at the boundary). All four test vectors pass, including the 1,000,000-character test.

### Decision: COMPLETE

### Lessons Learned

**The `land mask32` elimination is pervasive.** When every working variable and every intermediate value is `int32#`, the mask disappears from additions, from state updates, from schedule expansion additions — everywhere that the OCaml implementation had a masking operation on an arithmetic result. The type system enforces the invariant that was previously enforced by a runtime instruction.

**The tail-recursive `rounds` pattern transfers cleanly to `int32#`.** The tail call compiles to a backward jump with register-resident `int32#` arguments, exactly as in the OCaml version. No new closure issues are introduced by the type change itself.

---

## Step05 — Remaining API

### Background

After Step04, the compression core is fully migrated. The remaining OCaml-typed boundary is in `get_be32` and `set_be32`: the functions that convert between byte sequences and 32-bit words. These functions sit at the boundary between the `bytes` input buffer (always OCaml `bytes`) and the `int32#` schedule array.

### Objective

Migrate `get_be32` to return `int32#` instead of `int`. Migrate `set_be32` to accept `int32#` instead of `int`. Adjust `add_data` and `finish` accordingly. Document why the bit-length counter remains as OCaml `int`.

### Observation

In the partially-migrated state after Step04, `get_be32` returns `int` and a conversion (`Int32_u.of_int`) is needed before the result can be stored into `ctx.data`. This conversion:

```ocaml
aset ctx.data i (Int32_u.of_int (get_be32 src (src_offset + i * 4)))
```

emits a `movl` (sign-extending 32-bit move) to truncate the OCaml `int` to 32 bits. This is cheaper than `andq` masking but is still an extra instruction per W[0..15] load — 16 extra instructions per block. Migrating `get_be32` to return `int32#` eliminates these conversions.

### Investigation

#### get_be32 Migration

In OCaml Opt07, `get_be32` reads four bytes and assembles them into a 32-bit OCaml `int`:

```ocaml
let[@inline] get_be32 src off =
  (Char.code (Bytes.unsafe_get src off)       lsl 24) lor
  (Char.code (Bytes.unsafe_get src (off + 1)) lsl 16) lor
  (Char.code (Bytes.unsafe_get src (off + 2)) lsl 8)  lor
  (Char.code (Bytes.unsafe_get src (off + 3)))
```

The `Char.code` returns an OCaml `int` in `[0, 255]`. The shifts and OR operations produce an OCaml `int` in `[0, 0xFFFFFFFF]`. No masking is needed in OCaml because `Char.code` is always 8-bit and the shifts produce values that fit in 32 bits.

The OxCaml version:

```ocaml
let[@inline] get_be32 (src : bytes) (off : int) : int32# =
  let b0 = Int32_u.of_int (Char.code (Bytes.unsafe_get src off)) in
  let b1 = Int32_u.of_int (Char.code (Bytes.unsafe_get src (off + 1))) in
  let b2 = Int32_u.of_int (Char.code (Bytes.unsafe_get src (off + 2))) in
  let b3 = Int32_u.of_int (Char.code (Bytes.unsafe_get src (off + 3))) in
  Int32_u.(logor (logor (shift_left b0 24) (shift_left b1 16))
                 (logor (shift_left b2 8)  b3))
```

Each `Int32_u.of_int` converts a `[0, 255]` OCaml `int` to `int32#`. The shifts and ORs produce the big-endian 32-bit word as `int32#`. The result is stored directly into `ctx.data` via `aset` without any intermediate conversion.

#### set_be32 Migration

`set_be32` takes a 32-bit word and writes it as four bytes. In OCaml Opt07:

```ocaml
let[@inline] set_be32 dst off v =
  Bytes.unsafe_set dst off       (Char.unsafe_chr ((v lsr 24) land 0xFF));
  Bytes.unsafe_set dst (off + 1) (Char.unsafe_chr ((v lsr 16) land 0xFF));
  Bytes.unsafe_set dst (off + 2) (Char.unsafe_chr ((v lsr 8)  land 0xFF));
  Bytes.unsafe_set dst (off + 3) (Char.unsafe_chr (v land 0xFF))
```

The `land 0xFF` operations mask to 8 bits for the `Char.unsafe_chr` conversion. In the OxCaml version:

```ocaml
let[@inline] set_be32 (dst : bytes) (off : int) (v : int32#) =
  let to_char x = Char.unsafe_chr (Int32_u.to_int (Int32_u.logand x #0xFFl)) in
  Bytes.unsafe_set dst off       (to_char (Int32_u.shift_right_logical v 24));
  Bytes.unsafe_set dst (off + 1) (to_char (Int32_u.shift_right_logical v 16));
  Bytes.unsafe_set dst (off + 2) (to_char (Int32_u.shift_right_logical v 8));
  Bytes.unsafe_set dst (off + 3) (to_char v)
```

The `land 0xFF` becomes `Int32_u.logand x #0xFFl` — still needed because `Char.unsafe_chr` requires a value in `[0, 255]` and the shift results may have bits 8–31 set.

#### Why the Bit-Length Counter Stays as OCaml int

The bit-length counter in `add_data` and `finish` accumulates the total message length in bits. In the OCaml implementation:

```ocaml
ctx.length.(0) <- (ctx.length.(0) + ctx.numbytes * 8) land mask32;
if ctx.length.(0) < ctx.numbytes * 8 then
  ctx.length.(1) <- ctx.length.(1) + 1
```

This counter tracks a 64-bit value as two `int` words. The `land mask32` is the only remaining mask in `add_data`'s hot path after migration.

**Why not migrate to `int32#`?** Three reasons:

1. **Message length is conceptually a 64-bit quantity.** The bit-length field in SHA-256's padding is a 64-bit big-endian integer. Representing it as two `int32#` values would be correct but requires managing overflow between the two halves using `int32#` comparison (`Int32_u.compare`), which is more cumbersome than the current OCaml int comparison.

2. **This code path is not in the compression hot loop.** The counter update executes once per call to `add_data`, not once per block or per round. Its performance impact on large inputs is negligible.

3. **Migration cost exceeds benefit.** The `land mask32` in the counter update is outside the compression core. Its cost is bounded by the number of `add_data` calls, which is far fewer than the number of `transform_from` calls. The assembly for the final baseline confirms that this mask contributes negligibly to total execution time.

### Assembly Verification

| Function | OxCaml | OCaml Opt07 | Key Change |
|----------|--------|-------------|------------|
| `get_be32` | 0 `andq` | 0 `andq` | `movl` conversion removed from call sites |
| `set_be32` | `andl #0xFF` only | `land 0xFF` | Equivalent; `andl` vs `andq` (32-bit vs 64-bit AND) |
| `add_data` | 1 `andq` (counter) | 1 `andq` (counter) | Counter mask unchanged |
| `transform_from` | 0 `andq` | 93 `andq` | **All compression-path masks eliminated** |

### Correctness Validation

Full FIPS 180-4 test suite runs on the complete OxCaml implementation. All four test vectors pass. A Python/OpenSSL cross-check on the 100 MB benchmark input confirms that the hash output matches the reference implementation.

### Decision: COMPLETE

---

## Baseline Validation

### Overview

With all migration steps complete, the OxCaml implementation is verified before any benchmark measurement is taken. The validation protocol follows the correctness methodology described in [docs/01_methodology.md](01_methodology.md#6-correctness-methodology).

### FIPS 180-4 Known-Answer Tests

All four test vectors from `oxcaml/sha256_tests.ml` pass:

| Test Case | Status |
|-----------|--------|
| Empty string | Pass |
| `"abc"` | Pass |
| `"abcdbcdecdef..."` (448 bits) | Pass |
| 1,000,000 × `'a'` | Pass |

The 1,000,000-character test is the most demanding: it hashes 15,625 full blocks plus a partial block, exercising the complete `add_data` loop, the block-boundary counter update, and the `finish` padding. Its passing confirms that the migration preserved all structural paths, not just the compression core.

### Python/OpenSSL Cross-Check

The six benchmark input files (1, 10, 30, 50, 75, 100 MB) are hashed and their outputs compared against Python's `hashlib.sha256`. All six match. This cross-check is independent of the FIPS vectors (which test specific known inputs) and exercises the benchmark inputs that will be used in performance measurements.

### oxcaml_validate.ml

Re-run after the full migration to confirm that `int32#` arithmetic properties still hold in the context of the full implementation. All 2,000 test cases pass.

### Baseline Assembly Profile

| Metric | OxCaml Baseline | OCaml Opt07 | Change |
|--------|----------------|-------------|--------|
| Assembly lines | 2,191 | 2,748 | −557 |
| `jbe` branches | 8 | 16 | −8 |
| `andq` (mask32) | 0 | 93 | **−93** |
| `andl` (byte I/O helpers) | 0 | 16 | −16 |
| `caml_alloc` | 0 | 0 | 0 |
| Closure descriptors | present (see Ox01) | 0 | introduced |

OCaml Opt07's 16 `andl $511` instructions are from `get_be32` (4 byte reads) and `set_be32` (12 byte writes), where `Char.code` values are masked to the tagged-integer range. OxCaml's `Int32_u`-based I/O eliminates these. The algorithmic AND operations from `ch` and `maj` compile to register-to-register `andq` in both implementations and are not shown separately.

One finding that was not expected: the OxCaml baseline assembly contains a closure descriptor associated with the `rounds` function, despite the explicit-parameter fix carried over from OCaml Opt03. Assembly inspection shows that `constants` is being captured as a free variable of `rounds` in OxCaml, even though the OCaml version did not capture it at this stage. The mechanism differs between OCaml and OxCaml's lambda-lifters in their treatment of module-level values referenced inside a non-top-level `let rec`. This is confirmed by the assembly but not resolved at the migration baseline — it is deferred to the first OxCaml optimization (Ox01), documented in [docs/04_oxcaml_optimization.md](04_oxcaml_optimization.md#ox01).

### Baseline Benchmark

| Input (MB) | OCaml Opt07 (MB/s) | OxCaml Baseline (MB/s) | Δ |
|------------|-------------------|-----------------------|---|
| 100        | 48.68             | 67.80                 | +39.2% |

*Full per-size data in `benchmarks/results/oxcaml/benchmarks/baseline.csv`.*

The +39.2% improvement from the Opt07 to the OxCaml baseline is entirely attributable to the representation change. The algorithm is identical; the structure is identical; only the integer type changed. The 93 eliminated `andq` instructions explain most of this gain, with the smaller assembly size and reduced memory traffic from the packed array layout contributing the remainder.

The baseline is not the final OxCaml result. The closure descriptor identified in assembly inspection, the dead schedule expansion (16 iterations beyond the 64 consumed), and a potential ILP improvement in the T₁ computation remain. These are addressed in [docs/04_oxcaml_optimization.md](04_oxcaml_optimization.md).

---

## OxCaml Migration Summary

### What Changed

| Component | OCaml Opt07 | OxCaml Baseline |
|-----------|-------------|-----------------|
| Working variables `a..h` | `int` | `int32#` |
| `ctx.state` | `int array` (64 bytes) | `int32# array` (32 bytes) |
| `ctx.data` | `int array` (640 bytes) | `int32# array` (320 bytes) |
| `constants` | `int array` (512 bytes) | `int32# array` (256 bytes) |
| `get_be32` return type | `int` | `int32#` |
| `set_be32` argument type | `int` | `int32#` |
| Helper function types | `int → int` | `int32# → int32#` |
| Arithmetic masking | `land mask32` on every result | none |

### What Did Not Change

| Component | Status |
|-----------|--------|
| Algorithm | Identical to OCaml Opt07 (SHA-256 FIPS 180-4) |
| Schedule expansion range | 0–79 (dead expansion inherited; eliminated in Ox02) |
| `rounds` structure | Tail-recursive, explicit-parameter convention from Opt03 |
| `transform_from` interface | Unchanged |
| `add_data` / `finish` logic | Unchanged except type boundaries |
| `ctx.length` counter | OCaml `int array` (unchanged) |
| `ctx.buffer` | `bytes` (unchanged) |
| `Bytes.unsafe_get`/`set` | Preserved from Opt06 |

### Correctness Guarantees Established

- All four FIPS 180-4 known-answer test vectors pass on the OxCaml implementation.
- Python/OpenSSL cross-check passes on all six benchmark input sizes.
- `oxcaml_validate.ml` confirms that `int32#` arithmetic semantics (wrapping, unsigned shift, rotr) match the reference for 2,000 pseudorandom test cases.
- The migration is staged across four commits, each with a correctness gate. No benchmark measurement was taken from an implementation that had not passed the full test suite.

### Assembly Improvements Observed

- **93 `andq` instructions eliminated** — all representational masking from arithmetic operations.
- **8 fewer `jbe` branches** — not directly from the type migration, but from the `aget`/`aset` layout-polymorphic access path, which does not emit bounds checks.
- **557 fewer assembly lines** — combined effect of eliminated masks, smaller instructions from 32-bit operations, and packed array access.
- **Array footprints halved** — `constants`, `state`, and `data` arrays each occupy half the memory of their OCaml equivalents.

### Remaining OCaml Artifacts

- **`ctx.length` counter** — the bit-length counter remains as OCaml `int` arithmetic with one `land mask32`. This is on a non-critical path and has negligible impact on large-input throughput.
- **`ctx.buffer`** — `bytes`, unchanged. The partial-block accumulation buffer has no `int32#` equivalent and does not need one.
- **Closure on `rounds`** — the `constants` module-level value is captured by `rounds` in OxCaml's lambda-lifter, creating a per-call closure. This is the first OxCaml optimization target (Ox01).
- **Three-instruction rotates** — `shrq`/`salq`/`orq` for every `rotr` (64-bit variants). Confirmed in toolchain validation; not addressable at source level.

### Why the Implementation is Now a Valid Optimization Baseline

The OxCaml baseline satisfies the conditions for a valid optimization starting point:
1. Correct output on all FIPS test vectors and benchmark inputs.
2. Structurally identical to OCaml Opt07 in all aspects except integer representation.
3. All source-level improvements from the OCaml phase (Opt01–Opt07) are present.
4. No optimization has been applied ahead of schedule — the dead schedule expansion and the closure issue are present and documented, not silently fixed.

The baseline is the point from which the `int32#` contribution can be measured in isolation, and from which OxCaml-specific optimizations can be applied one at a time.

### Transition to docs/04

The OxCaml baseline assembly reveals two actionable overheads not present in OCaml Opt07: the per-call closure on `rounds` (Ox01) and the 16 dead iterations of the schedule expansion (Ox02). A third investigation — the T₁ ILP restructuring (Ox03) — is attempted after Ox02. These are the subjects of [docs/04_oxcaml_optimization.md](04_oxcaml_optimization.md). They are purely OxCaml-phase optimizations; none of them would have been visible or applicable in the OCaml implementation.
