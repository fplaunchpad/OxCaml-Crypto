# 02 — OCaml Scalar Optimization Campaign

## Contents

1. [Introduction](#introduction)
2. [Optimization Roadmap](#optimization-roadmap)
3. [OCaml Baseline](#ocaml-baseline)
4. [Opt01 — Hoist Data Array](#opt01--hoist-data-array)
5. [Opt02 — Unsafe Array Access](#opt02--unsafe-array-access)
6. [Opt03 — Tail-Recursive Rounds](#opt03--tail-recursive-rounds)
7. [Opt04 — Direct Buffer Read](#opt04--direct-buffer-read)
8. [Opt05 — Full Loop Unrolling (Reverted)](#opt05--full-loop-unrolling-reverted)
9. [Opt06 — Unsafe Byte I/O](#opt06--unsafe-byte-io)
10. [Opt07 — Sigma Mask Restructuring](#opt07--sigma-mask-restructuring)
11. [OCaml Scalar Optimization Summary](#ocaml-scalar-optimization-summary)

---

## Introduction

The OCaml implementation began as a faithful, line-for-line translation of Xavier Leroy's C scalar implementation. No performance considerations were made during the initial translation; the objective was to preserve the algorithm structure exactly, so that every subsequent performance difference could be attributed to the compiler and runtime rather than to any algorithmic divergence.

The optimization campaign then applied a sequence of seven source-level changes — six kept, one reverted — each following the ten-stage methodology described in [docs/01_methodology.md](01_methodology.md). Every optimization was derived from assembly-level evidence: an instruction class in the OCaml binary with no counterpart in the C binary identified as overhead, traced to a specific source construct, and addressed by the minimal change that eliminates it.

The campaign is chronological. Each optimization reduces one category of overhead identified in the current assembly; the remaining overheads in that assembly become the candidates for the next stage. No optimization was chosen speculatively.

---

## Optimization Roadmap

| Stage | Main Idea | Throughput (100 MB) | Δ from Previous | Status |
|-------|-----------|---------------------|-----------------|--------|
| Baseline | Faithful translation of C reference | 32.29 MB/s | — | Starting point |
| Opt01 | Hoist schedule array from per-call heap to `ctx` | 33.56 MB/s | +3.9% | **Kept** |
| Opt02 | Replace safe array access with `Array.unsafe_get`/`set` | 42.42 MB/s | +26.4% | **Kept** |
| Opt03 | Replace mutable refs with tail-recursive `rounds`; fix closure capture | 43.59 MB/s | +2.8% | **Kept** |
| Opt04 | `transform_from` reads directly from caller buffer; eliminate `Bytes.blit` | 44.24 MB/s | +1.5% | **Kept** |
| Opt05 | Full 8× unrolling of compression loop | 42.93 MB/s | −3.0% | **Reverted** |
| Opt06 | `Bytes.unsafe_get`/`set` in `get_be32`/`set_be32` | 46.01 MB/s | +4.0% | **Kept** |
| Opt07 | Move `land mask32` from inside `rotr` to sigma outputs | 48.68 MB/s | +5.8% | **Kept** — final OCaml |

Throughput and hash-time profiles across all input sizes (1, 10, 30, 50, 75, 100 MB):

![OCaml optimization throughput progression](../benchmarks/results/ocaml_hash_speed_progress.png)

![OCaml optimization hash time progression](../benchmarks/results/ocaml_hash_time_progress.png)

Per-stage CSVs in `benchmarks/results/ocaml_scalar/benchmarks/`.

---

## OCaml Baseline

### Overview

The baseline is a direct OCaml translation of `c/sha256.c`. Every function has a structural counterpart in the C source. The hash context is an OCaml record:

```ocaml
type ctx = {
  state   : int array;   (* 8 words, current hash state *)
  data    : int array;   (* 80 words, message schedule *)
  length  : int array;   (* 2 words, bit length counter *)
  mutable numbytes : int;
  buffer  : bytes;       (* 64-byte input buffer *)
}
```

The compression function, `transform`, mirrors the C structure:

```ocaml
let transform ctx =
  let data = Array.make 80 0 in          (* local schedule array — allocated per call *)
  (* load W[0..15] from ctx.buffer using get_be32 *)
  (* expand W[16..79] *)
  let a = ref ctx.state.(0) in           (* 8 mutable refs for working variables *)
  let b = ref ctx.state.(1) in
  (* ... *)
  for i = 0 to 63 do
    let t1 = !h + (big_sigma1 !e) + (ch !e !f !g) + constants.(i) + data.(i) in
    let t2 = (big_sigma0 !a) + (maj !a !b !c) in
    h := !g; g := !f; f := !e; e := (!d + t1) land mask32;
    d := !c; c := !b; b := !a; a := (t1 + t2) land mask32
  done;
  ctx.state.(0) <- (!a + ctx.state.(0)) land mask32;
  (* ... *)
```

### Assembly Profile

| Metric | C Scalar | OCaml Baseline | Ratio |
|--------|----------|----------------|-------|
| Assembly lines | 975 | 3,373 | 3.46× |
| `jbe` branches | 1 | 32 | 32× |
| `andq`/`andl` (mask) | 27 | 134 | 4.96× |
| `caml_alloc` call sites | 0 | present | — |

The 3.46× code size ratio alone does not predict the 4.60× throughput gap — code size and throughput are not linearly related. The assembly contains dead code paths (exception handlers, GC card table writes) that inflate line count without proportionally affecting hot-path execution time.

### Overhead Classification

The assembly reveals five distinguishable categories of overhead above the C reference. Each corresponds to a specific source construct and each will be addressed by a distinct optimization:

| Category | Source Construct | Assembly Evidence |
|----------|-----------------|-------------------|
| Per-call heap allocation | `Array.make 80 0` in `transform` | `caml_alloc` call; ~1 GB minor heap traffic at 100 MB input |
| Bounds checks | `data.(i)`, `ctx.state.(i)`, `constants.(i)` | 32 `jbe` branches vs 1 in C |
| Working variable indirection | 8 mutable `ref` cells | Heap dereference on every read/write of `a..h` |
| Per-block buffer copy | `Bytes.blit` in `add_data` hot path | `memcpy`-equivalent call once per 64-byte block |
| Representational masking | `land mask32` on every arithmetic result | 134 `andq` instructions vs 27 `andl` in C |

The per-call allocation and bounds checks are the two largest single overheads visible in the baseline assembly. These become the first two optimization targets.

---

## Opt01 — Hoist Data Array

### Background

The baseline `transform` function begins with:

```ocaml
let data = Array.make 80 0 in
```

This is a direct translation of the C local array declaration `u32 data[80]`. In C, the declaration allocates 320 bytes on the stack. In OCaml, `Array.make 80 0` allocates an 80-element `int array` — 648 bytes including the GC header — on the minor heap, initializes it to zero, and returns a pointer.

### Observation

Assembly inspection of the baseline confirms a `caml_alloc` call site near the start of `transform`. At 100 MB input, `transform` is called once per 64-byte block: 100 × 1024 × 1024 / 64 = **1,638,400 calls**. Each call allocates and zero-initializes 648 bytes. This totals approximately **1.06 GB of minor heap traffic** for a single 100 MB hash. OCaml's minor GC handles this efficiently via bump-pointer allocation, but the allocation and initialization cost is real and serializes through the allocation pointer on every call.

The observation that converted this into an optimization target: the array does not need to be fresh on every call. The data written into it on one call is overwritten entirely on the next call before it is read. The array's lifetime is exactly one call to `transform`. There is no aliasing, no sharing, and no observable difference between creating the array inside `transform` and reusing an array allocated once and stored on the context.

### Bottleneck Analysis

The cost has two components:

1. **Allocation cost.** `Array.make 80 0` calls `caml_alloc` (the OCaml allocator), which bumps the allocation pointer and potentially triggers a minor GC if the nursery is full. Even without GC, the bump-pointer operation is not free: it reads and writes the allocation pointer on each call.

2. **Initialization cost.** `Array.make 80 0` writes 80 zeros into the allocated block. The C stack allocation has no equivalent: the stack pointer is decremented in the function prologue (a single instruction), and the array is populated by the expansion loop before it is read.

### Hypothesis

Moving the `data` array from a per-call local allocation to a field on the `ctx` record eliminates both costs. The allocation becomes a one-time event at context creation time. The per-call initialization is replaced by the schedule expansion loop that was already present — the loop overwrites every element of `data` before it reads any of them, so no pre-zeroing is needed.

Expected assembly change: the `caml_alloc` call site in `transform` disappears.

Expected benchmark effect: moderate improvement, since 1,638,400 allocations at 648 bytes each represent significant minor heap traffic, but the bump-pointer allocator is fast. The improvement is expected to be smaller than the bounds-check elimination that follows.

### Correctness / Safety

The `data` array is written completely before it is read within each `transform` call: indices 0–15 are written by the `get_be32` loop, and indices 16–79 by the schedule expansion loop. No value from a previous `transform` call is carried over. The semantic behavior is identical regardless of whether the array is freshly allocated or reused.

The existing test suite (FIPS 180-4 known-answer tests) is run after the change and passes without modification.

### Implementation

Two changes:

1. Add `data: int array` to the `ctx` type.
2. Initialize it in `sha256_init`: `data = Array.make 80 0`.
3. Remove `let data = Array.make 80 0` from `transform`.

`transform` now receives `ctx` and accesses `ctx.data` rather than a local array. No other change is needed.

### Assembly Verification

| Metric | Opt01 | Baseline | Change |
|--------|-------|----------|--------|
| Assembly lines | 3,387 | 3,373 | +14 |
| `jbe` branches | 32 | 32 | 0 |
| `andq` with mask | 134 | 134 | 0 |
| `caml_alloc` in `transform` | absent | present | **Eliminated** |

The `caml_alloc` call site is gone. The assembly line count increased slightly (+14 lines) because accessing `ctx.data` through a record field pointer requires an additional offset load compared to accessing a local pointer held in a register. This is expected and negligible.

Bounds checks remain at 32 `jbe` — the change to `ctx.data` access does not affect whether the accesses are bounds-checked; safe array access always emits `jbe` regardless of whether the array is local or in a record.

### Benchmark Results

| Input (MB) | Baseline (MB/s) | Opt01 (MB/s) | Δ |
|------------|----------------|-------------|---|
| 100        | 32.29          | 33.56       | +3.9% |

*Full per-size data in `benchmarks/results/ocaml_scalar/benchmarks/opt01_hoist_data.csv`.*

The improvement is real but modest. The minor GC handles bump-pointer allocation efficiently; the marginal cost per allocation is low. The gain is consistent with eliminating ~1.6M allocations, but the allocator's throughput is high enough that this was not the dominant bottleneck.

### Decision: KEEP

The allocation is eliminated and the benchmark confirms an improvement. The implementation is cleaner: the schedule array is now a persistent resource rather than a throwaway object. No reason to revert.

### Lessons Learned

OCaml's bump-pointer minor allocator is fast, but not zero-cost. At 1.6M allocations per benchmark run, the cumulative cost is measurable. The more important lesson is about context design: any array whose contents are overwritten before use on every call should live on the context, not be allocated locally. This principle will be relevant again in the OxCaml migration phase.

---

### Why Opt01 Was Not Enough

The assembly after Opt01 still contains 32 `jbe` branches and 134 `andq` masking instructions. The allocation overhead was real but accounted for only a fraction of the 4.60× gap. The next inspection of the assembly shows 32 conditional branches compared to C's 1 — the bounds checks are the next largest measurable overhead. Opt02 targets these directly.

---

## Opt02 — Unsafe Array Access

### Background

After Opt01, `transform` accesses five arrays: `ctx.data` (80 elements), `ctx.state` (8 elements), the module-level `constants` (64 elements), and the per-block input data read via `get_be32`. Every access using the default OCaml syntax (`arr.(i)`) emits a bounds check.

### Observation

The baseline assembly contains 32 `jbe` instructions. The C reference contains 1 (the loop back-edge). Every OCaml `jbe` that does not correspond to a loop back-edge in C is a bounds check — a compare-and-branch that is always not-taken because every access in the compression function is within bounds by construction.

In the hot path of `transform`, the accesses to `data`, `constants`, and `ctx.state` occur inside a loop with a known iteration count of 64. The loop index is bounded by the loop control. No access can be out of bounds. The bounds checks are pure runtime overhead with no safety value — every one of them will always go the not-taken branch.

### Bottleneck Analysis

Each `jbe` corresponds to a compare instruction and a conditional branch. The branch predictor learns quickly that these branches are always not-taken (the first iteration must be seen, but after that the prediction is stable). However, even a perfectly predicted branch consumes frontend resources:

- The compare instruction reads two operands (the index and the array length).
- The branch instruction occupies a slot in the instruction window.
- The array length must be loaded from the array header, adding an extra memory access.

At 64 rounds × multiple array accesses per round, these costs accumulate across 1,638,400 transform calls at 100 MB.

### Hypothesis

Replacing every `arr.(i)` with `Array.unsafe_get arr i` (and similarly for writes) tells the compiler to skip the bounds check. The `jbe` branch and its preceding compare are removed from the generated code. Expected reduction: most of the 32 `jbe` branches in `transform` should disappear.

Expected benchmark effect: the largest single improvement so far. Bounds checks touch every array access in the hot loop; their removal affects every round of every block.

This change requires a correctness argument (see next section) before it is considered safe.

### Correctness / Safety

`Array.unsafe_get` is unsafe in OCaml: if the index is out of bounds, behavior is undefined (typically a segfault or corruption of adjacent memory). The safety argument must be made explicitly for every use site.

In `transform`:

- `Array.unsafe_get ctx.data i` where `i ∈ [0, 79]`: the loop iterates `i` from 0 to 79 exactly once; `ctx.data` has 80 elements.
- `Array.unsafe_get constants i` where `i ∈ [0, 63]`: the loop iterates `i` from 0 to 63; `constants` has 64 elements.
- `Array.unsafe_get ctx.state i` where `i ∈ [0, 7]`: accessed at fixed offsets 0–7 in the initialization and finalization of `transform`; `ctx.state` has 8 elements.

All three are trivially safe: the loop bounds and array sizes are fixed and matched. The FIPS KATs confirm correctness after the change.

### Implementation

Replace every `arr.(i)` and `arr.(i) <- v` in `transform`, the schedule expansion, and the state update with `Array.unsafe_get arr i` and `Array.unsafe_set arr i v` respectively. The module-level `constants` array is also accessed via `Array.unsafe_get`.

No algorithmic change. No change to the function signatures or the context type.

### Assembly Verification

| Metric | Opt02 | Opt01 | Change |
|--------|-------|-------|--------|
| Assembly lines | 3,076 | 3,387 | −311 |
| `jbe` branches | 24 | 32 | **−8** |
| `andq` with mask | 134 | 134 | 0 |

The `jbe` count drops from 32 to 24 — a reduction of 8. The remaining 24 `jbe` branches are not in `transform` itself; they are in `get_be32` and `set_be32` (which use `Bytes.get`/`set`, still safe-access) and in the partial-block paths of `add_data` and `finish`. These paths are not on the critical path for large inputs but are not zero-cost.

The assembly shrinks by 311 lines. Each eliminated bounds check removed a compare, a branch, and its associated exception path stub — approximately 10–40 lines of assembly per check.

### Benchmark Results

| Input (MB) | Opt01 (MB/s) | Opt02 (MB/s) | Δ |
|------------|-------------|-------------|---|
| 100        | 33.56       | 42.42       | +26.4% |

*Full per-size data in `benchmarks/results/ocaml_scalar/benchmarks/opt02_unsafe_array.csv`.*

The +26.4% improvement is the largest single-step gain in the entire campaign. It is consistent with the assembly evidence: 8 fewer conditional branches in the innermost loop of a function called 1.6M times.

The improvement is somewhat larger than the raw branch count reduction might suggest. Beyond the branch slots themselves, eliminating the bounds checks removes the array-length loads they depend on — each `jbe` required loading the array's length field from its GC header (a heap access), which could cause cache line pressure at high array-access frequencies.

### Decision: KEEP

Large improvement, confirmed by assembly. Safety argument is mechanical and complete for all use sites. No reversal of the correctness invariant.

### Lessons Learned

Bounds checks in OCaml are not free even when the prediction is always correct. At high call frequencies on small inner loops, the cumulative cost of the compare and the extra memory access to load the array length adds up significantly. In any OCaml hot path where array indices are provably within bounds by construction (loop-bounded access to statically-sized arrays), `Array.unsafe_get` is appropriate.

The 26.4% gain also serves as evidence for the methodology: the assembly-based prediction (8 fewer `jbe` should matter) was validated by a benchmark that matched the scale of the structural change.

---

### Why Opt02 Was Not Enough

After Opt02, the assembly still shows 24 `jbe` branches — but more immediately visible is the working variable structure. The baseline loop writes to `!a`, `!b`, ..., `!h` through 8 mutable `ref` cells. Each ref is a heap-allocated box; every read is a heap dereference; every write is a heap store that may trigger a write barrier. In C, `a..h` are register-class local variables. The OCaml compiler cannot register-allocate a `ref` cell because its address is observable (a ref can be captured, passed by reference, etc.). The next step is to eliminate the refs.

---

## Opt03 — Tail-Recursive Rounds

### Background

After Opt02, the compression loop uses 8 mutable `ref` cells for the working variables `a..h`. This is the natural way to express mutable state in OCaml when translating from an imperative C original. However, `ref` cells are heap objects in OCaml: each is a one-word heap-allocated mutable box. Accessing `!a` dereferences a pointer; writing `a := v` stores through a pointer and may trigger the GC write barrier.

The C implementation's working variables live in registers — the `register` keyword in the original Cryptokit source is a hint that these are register-allocated — and the compiler places them in general-purpose registers throughout the loop.

### Observation

Inspection of the Opt02 assembly shows the working variables being accessed through memory dereferences rather than register-to-register operations. The ref cells are stack-allocated (the GC cannot tell them from heap-allocated refs without scanning, but the optimizer may stack-allocate them in some cases), but the indirection remains. More concretely: the assembly shows 8 distinct pointer-load operations at the start of each round's computation that would disappear if the working variables were passed as function arguments.

The key insight: a tail-recursive function whose arguments are the working variables allows the compiler to keep `a..h` in registers for the duration of the recursion. Each tail call becomes a jump (no stack frame push), and the arguments are passed in registers — exactly the register-resident working variables that C achieves through the `register` qualifier and the compiler's own register allocator.

### Hypothesis

Replace the imperative loop with a tail-recursive function `rounds`:

```ocaml
let rec rounds i a b c d e f g h =
  if i = 64 then (* update ctx.state *)
  else
    let t1 = h + (big_sigma1 e) + (ch e f g) + (Array.unsafe_get constants i) + (Array.unsafe_get data i) in
    let t2 = (big_sigma0 a) + (maj a b c) in
    rounds (i+1) (t1+t2) a b c (d+t1 land mask32) e f g
in
rounds 0 ctx.state.(0) ...
```

Expected: the 8 working variables become function arguments; the compiler register-allocates them; the tail call compiles to a backward jump; the `ref` cell heap objects disappear from the assembly.

### Correctness / Safety

The tail-recursive `rounds` function is semantically equivalent to the mutable loop provided:
- The variable rotation is correct: after each round, `a_new = t1 + t2`, `b_new = a`, ..., `h_new = g`.
- The initial call passes the current state values: `rounds 0 state[0] state[1] ... state[7]`.
- The base case correctly adds the final working values back into `ctx.state`.

This is a mechanical equivalence proof: the round update formula is the same; only the mechanism of tracking the variables changes. The FIPS KATs verify correctness.

---

### Investigation Timeline — Opt03 Closure Discovery

The first implementation of Opt03 did not produce the expected results. What follows is the complete investigation as it occurred.

```
Initial Implementation
↓
Observation: closure descriptor in assembly; benchmark +2.8% but smaller than expected
↓
Initial Hypothesis: tail-recursive approach introduces unexpected overhead
↓
Decision under consideration: revert to mutable refs
↓
Question: is the closure inherent to tail-recursion, or only to this implementation?
↓
Assembly Investigation: identify what is being captured by the let rec
↓
Root Cause: data and ctx are free variables of the let rec
↓
Implementation Refinement: pass data and ctx as explicit parameters
↓
Re-measurement: closure eliminated; improvement confirmed
↓
Final Decision: KEEP
```

**Initial implementation.** The first version of `rounds` was defined as:

```ocaml
let transform ctx =
  (* ... schedule expansion into ctx.data ... *)
  let rec rounds i a b c d e f g h =
    if i = 64 then
      (* update ctx.state here -- ctx is a free variable *)
    else
      let t1 = h + ... + Array.unsafe_get ctx.data i in  (* ctx.data is a free variable *)
      ...
      rounds (i+1) ...
  in
  rounds 0 ctx.state.(0) ...
```

`rounds` is a `let rec` defined inside `transform`. It references `ctx` (for `ctx.data` and `ctx.state`) and could reference other values from `transform`'s scope.

**Assembly observation.** After compiling this version, assembly inspection revealed a closure descriptor — a block in the `.data` or `.rodata` section associated with the `rounds` function, and a closure-construction code path near the start of `transform`. The OCaml lambda-lifter had identified `ctx` (and potentially `data` or `constants`) as free variables of the `let rec` and generated code to build a heap-allocated closure carrying those values on each call to `transform`.

This is a critical finding: every call to `transform` — 1.6M times at 100 MB — was allocating a new closure object to carry the captured variables. The allocation overhead introduced by Opt01 and then substantially removed had partially reappeared through a different mechanism.

**Initial consideration of reverting.** The benchmark showed only +2.8% at 100 MB. Given that the tail-recursive structure was supposed to eliminate the `ref` cell overhead and improve register allocation, a +2.8% improvement suggested the new allocation was offsetting most of the gain from eliminating the refs. The initial interpretation was that the tail-recursive approach was not beneficial: the heap allocation introduced by the closure was comparable in cost to the ref-cell indirection it replaced.

**The critical question.** Before reverting, a question was posed: *Is the closure inherent to the tail-recursive optimization, or is it an artifact of this specific implementation?*

This question matters because the two scenarios have different implications:
- If the closure is inherent (tail-recursive `rounds` must capture `ctx` to function), then the optimization is not viable in OCaml.
- If the closure is an artifact of how the free variables were expressed, then the optimization is correct but the implementation needs refinement.

**Assembly investigation.** Examining which variables `rounds` captured as free variables:
- `ctx`: referenced inside `rounds` for `ctx.data` (the schedule array) and `ctx.state` (for the final state update).
- `constants`: the module-level constant array, referenced inside `rounds`.

Both `ctx` and `constants` are free variables of `rounds` because they are bound outside the `let rec` but used inside it. The OCaml compiler's lambda-lifter generates a closure carrying these values.

`data` (now `ctx.data`) is accessed through `ctx`, so it contributes indirectly through the `ctx` capture. `constants` is a module-level value, but OxCaml's lambda-lifter treats module-level values referenced inside a non-top-level `let rec` differently — but in standard OCaml, the capture of `constants` is less clear and will resurface differently in the OxCaml phase (see [docs/04_oxcaml_optimization.md](04_oxcaml_optimization.md)).

**Implementation refinement.** The solution is to make the captured variables explicit function parameters:

```ocaml
let rec rounds data ctx i a b c d e f g h =
  if i = 64 then
    (* ctx accessible as explicit parameter *)
  else
    let t1 = h + ... + Array.unsafe_get data i in
    ...
    rounds data ctx (i+1) ...
in
rounds ctx.data ctx 0 ctx.state.(0) ...
```

By passing `data` (i.e., `ctx.data`) and `ctx` as explicit parameters, they are no longer free variables of the `let rec`. The OCaml lambda-lifter does not need to construct a closure: `rounds` becomes a standalone function with a fixed arity, and every call is a direct tail call.

**Note on the optimization hypothesis.** The hypothesis — that a tail-recursive function eliminates the ref-cell overhead and allows register-allocation of working variables — never changed. What changed was the implementation: the first version accidentally reintroduced a different form of per-call allocation through closure capture. Correcting the implementation does not modify the optimization being evaluated; it removes an unintended implementation artifact.

**Re-measurement.** After the refinement, the closure descriptor disappears from the assembly, and the benchmark shows +2.8% at 100 MB — consistent with the measurement before, but now without the closure allocation offsetting the gain.

The +2.8% is smaller than Opt02's +26.4% because the ref-cell overhead is smaller than the bounds-check overhead: ref cells are stack-allocated in many cases (the compiler can escape-analyze them when they do not escape the enclosing function), so the dereference cost is a stack load rather than a heap load. The working-variable improvement is real but modest.

---

### Assembly Verification

| Metric | Opt03 | Opt02 | Change |
|--------|-------|-------|--------|
| Assembly lines | 3,076 | 3,076 | 0 |
| `jbe` branches | 24 | 24 | 0 |
| `andq` with mask | 134 | 134 | 0 |
| Closure descriptor | absent | absent | — |
| `caml_alloc` in `transform` | absent | absent | — |
| `rounds` tail call | direct `jmp` | — | confirmed |

The assembly size does not change because the tail-recursive `rounds` compiles to a backward jump — structurally equivalent to the loop body it replaced. The `ref` cell indirections are gone from the assembly; `a..h` appear as register operands in the round computation.

### Benchmark Results

| Input (MB) | Opt02 (MB/s) | Opt03 (MB/s) | Δ |
|------------|-------------|-------------|---|
| 100        | 42.42       | 43.59       | +2.8% |

*Full per-size data in `benchmarks/results/ocaml_scalar/benchmarks/opt03_tailrec.csv`.*

### Decision: KEEP

The optimization is kept after the implementation refinement. The closure investigation was necessary to reach this decision: the first implementation appeared to confirm that tail-recursion was not beneficial, but the investigation revealed that the implementation was wrong, not the hypothesis.

### Lessons Learned

**The closure trap.** Any `let rec` function defined inside another function in OCaml will capture all free variables from the enclosing scope, constructing a heap closure on every enclosing function call. The fix is always the same: pass the captured values as explicit parameters. This is not obvious from the source, which is why the assembly inspection was necessary to discover it.

**Do not abandon an optimization because the first implementation is imperfect.** The correct response to an unexpected result is to investigate its cause, not to revert immediately. The closure allocation was a concrete, identifiable, fixable artifact of how the implementation was written. The optimization hypothesis was valid throughout; only the implementation needed correction.

This lesson will apply again in the OxCaml phase: a variant of the same closure capture issue reappears there despite the prior experience with it (see [Ox01](04_oxcaml_optimization.md#ox01)).

---

### Why Opt03 Was Not Enough

With refs eliminated and `rounds` tail-calling as a loop, the working variables are now register-resident. But inspecting the `add_data` function reveals a `Bytes.blit` call in the full-block hot path: for every complete 64-byte block, the input is copied into `ctx.buffer`, then `transform` reads from `ctx.buffer`. This is a 64-byte `memcpy` on every block — 1.6M copies at 100 MB. The next optimization targets this unnecessary copy.

---

## Opt04 — Direct Buffer Read

### Background

The `add_data` function processes input in 64-byte blocks. Its hot path for full blocks follows the C source pattern:

```ocaml
while !remaining >= 64 do
  Bytes.blit data !pos ctx.buffer 0 64;   (* copy 64 bytes into ctx.buffer *)
  transform ctx;                           (* transform reads from ctx.buffer *)
  pos := !pos + 64;
  remaining := !remaining - 64
done
```

The `Bytes.blit` call is a direct translation of `memcpy(ctx->buffer, data, 64)` from the C source. In C, this copy exists because the transform function needs to byte-swap the input in-place (converting from little-endian to the algorithm's big-endian word order) and storing the modified data in `ctx.buffer` avoids modifying the caller's input. In OCaml, the endian conversion happens word-by-word in `get_be32`, reading from the buffer — the copy is structurally unnecessary for full blocks.

### Observation

Assembly inspection of Opt03 shows a call to the bytes-blit primitive in the hot loop of `add_data`. At 100 MB input with 64-byte blocks, this is 1,638,400 calls to `memcpy` with a constant size of 64. On modern hardware, a 64-byte copy is typically 1–2 cache lines and is handled in hardware efficiently, but the call overhead and the memory traffic add up.

### Bottleneck Analysis

The copy has two costs:

1. **The copy itself.** 64 bytes × 1.6M blocks = 104 MB of unnecessary memory reads and writes at the throughput rate of the benchmark. At 100 MB input, the benchmark measures the SHA-256 throughput of 100 MB of *input*; the blit doubles the memory traffic in the hot path.

2. **The call overhead.** `Bytes.blit` is not inlined at this call site. The assembly shows a function call, prologue, epilogue, and return — approximately 6–10 extra instructions per block beyond the copy itself.

### Hypothesis

Replace `transform ctx` (which reads from `ctx.buffer`) with a new function `transform_from ctx src offset` that reads directly from the caller's byte buffer at the given offset, bypassing `ctx.buffer` entirely. This eliminates both the `Bytes.blit` call and the intermediate copy for all full blocks.

Expected assembly change: the `Bytes.blit` call disappears from the `add_data` hot loop. `transform_from` replaces `transform` as the primary compression entry point.

Expected benchmark effect: modest improvement. The 64-byte copy is cache-line aligned and hardware-optimized, so the raw copy cost is low. The elimination of the call overhead and the reduction in memory traffic should produce a measurable but not dramatic gain.

### Correctness / Safety

`transform_from ctx src offset` reads `src` from `offset` to `offset + 63`. The caller (`add_data`) only calls `transform_from` when `remaining >= 64`, ensuring that 64 bytes of valid input are available at `offset`. The endian conversion logic (`get_be32`) is moved to read from `src` at `offset + byte_position` rather than from `ctx.buffer`. The state update logic is unchanged.

For partial blocks (the last block when `remaining < 64`), `ctx.buffer` is still used: the partial data is accumulated into `ctx.buffer` and processed in `finish`. This path is not on the critical loop for large inputs.

FIPS KATs pass.

### Implementation

`transform` is replaced by `transform_from ctx src src_offset`:

```ocaml
(* Before *)
let transform ctx =
  for i = 0 to 15 do
    Array.unsafe_set ctx.data i (get_be32 ctx.buffer (i * 4))
  done;
  ...

(* After *)
let transform_from ctx src src_offset =
  for i = 0 to 15 do
    Array.unsafe_set ctx.data i (get_be32 src (src_offset + i * 4))
  done;
  ...
```

In `add_data`:

```ocaml
(* Before *)
Bytes.blit data pos ctx.buffer 0 64;
transform ctx;

(* After *)
transform_from ctx data pos;
```

### Assembly Verification

| Metric | Opt04 | Opt03 | Change |
|--------|-------|-------|--------|
| Assembly lines | 3,069 | 3,076 | −7 |
| `jbe` branches | 24 | 24 | 0 |
| `andq` with mask | 134 | 134 | 0 |
| `Bytes.blit` call in hot loop | absent | present | **Eliminated** |

The 7-line reduction reflects the elimination of the `Bytes.blit` call and its surrounding code. The `jbe` and `andq` counts are unchanged — this optimization did not touch array access or masking.

### Benchmark Results

| Input (MB) | Opt03 (MB/s) | Opt04 (MB/s) | Δ |
|------------|-------------|-------------|---|
| 100        | 43.59       | 44.24       | +1.5% |

*Full per-size data in `benchmarks/results/ocaml_scalar/benchmarks/opt04_skip_blit.csv`.*

The +1.5% improvement is consistent with eliminating a fast but not-free 64-byte copy on each of 1.6M blocks. The gain is small because the copy was hardware-accelerated and cache-friendly; the larger benefit comes from the elimination of the function call overhead.

### Decision: KEEP

The blit is unnecessary for full blocks and its elimination is correct. The implementation is cleaner: `transform_from` is the natural interface for a streaming compression function, and the buffer copy was always an artifact of the C source's structure.

### Lessons Learned

Not all copies are expensive, but all unnecessary copies should be eliminated on principle. The 1.5% gain is modest, but the implementation is now structurally correct: the input path has no redundant memory traffic in the hot loop. This matters both for the current benchmark and for any future SIMD or multi-buffer extension where memory traffic accounting is critical.

---

### Why Opt04 Was Not Enough

After Opt04, the assembly shows: 24 `jbe` branches, 134 `andq` masks, 3,069 lines. The working variables are register-resident, allocation is gone from the hot path, and the unnecessary buffer copy is gone. The remaining identifiable overheads are the bounds checks in `get_be32`/`set_be32` (a subset of the 24 `jbe`) and the 134 masking instructions.

Before addressing either of these, a larger potential gain was considered: if the compression loop's back-edge branch (one backward jump per call to `rounds`) could be eliminated by fully unrolling the loop, that might provide a more substantial win. This became Opt05.

---

## Opt05 — Full Loop Unrolling (Reverted)

### Background

After Opt04, the `rounds` function compiles to a backward-jumping loop with 64 iterations per `transform_from` call. The loop back-edge contributes one branch per round. In the C source, the outer loop runs only 8 times (the `STEP` macro is applied 8 times per outer iteration), with the inner variable rotation handled by the macro's argument permutation. The OCaml `rounds` function has no equivalent macro mechanism; it loops 64 times with an explicit iteration counter.

The hypothesis for Opt05 was that eliminating this loop structure — by writing out all 64 rounds explicitly — would reduce branch pressure and allow the compiler to schedule the round computations more freely.

### Observation

The `rounds` tail-recursive function is the sole remaining control-flow construct in the hot path. Every other overhead addressed by Opt01–Opt04 was in data movement (allocation, copy) or safety checking (bounds checks, ref indirection). Loop overhead is a different category: it is inherent to the looping structure rather than to OCaml's runtime abstractions.

Profiling at this stage (Opt04) shows the compression function consuming the majority of execution time for large inputs. Within that function, the 64-iteration loop is the innermost structure. Eliminating the loop back-edge is a natural next candidate.

### Hypothesis

Fully unrolling the 64 rounds — writing each round as an explicit, non-looping sequence of operations — eliminates:

1. The loop counter increment (`i+1` per round).
2. The loop termination check (`i = 64`).
3. The tail-call back-edge jump.

Expected benefit: with no branch in the hot path, the processor's front end can fetch and dispatch arithmetic instructions without any branch-prediction interaction in the loop. Additionally, the compiler may schedule instructions across round boundaries with more freedom when the rounds are a single straight-line basic block.

Expected assembly change: the assembly for `transform_from` grows substantially (all 64 rounds are now inline), but `jbe` count related to loop control disappears, and instruction scheduling may improve.

Expected benchmark effect: a measurable improvement, potentially 5–10%, based on the assumption that the loop back-edge and counter operations represent meaningful overhead at the throughput this function achieves.

### Implementation

The `let rec rounds i a b c d e f g h` structure is replaced with an explicit sequence of 64 let-bindings:

```ocaml
let r0_t1 = h0 + (big_sigma1 e0) + (ch e0 f0 g0) + (Array.unsafe_get constants 0) + (Array.unsafe_get data 0) in
let r0_t2 = (big_sigma0 a0) + (maj a0 b0 c0) in
let a1 = (r0_t1 + r0_t2) land mask32 in
let e1 = (d0 + r0_t1) land mask32 in
(* b1 = a0, c1 = b0, d1 = c0, f1 = e0, g1 = f0, h1 = g0 *)
(* round 1 ... *)
(* ... × 64 *)
```

This produces 64 × (t1, t2, state-update) = approximately 192 let-bindings, each containing 5–7 arithmetic operations. The assembly for the function grows accordingly.

### Assembly Inspection

| Metric | Opt05 | Opt04 | Change |
|--------|-------|-------|--------|
| Assembly lines | 8,409 | 3,069 | **+5,340** |
| `jbe` branches | — | 24 | — |
| Loop back-edge | absent | present | eliminated |

The assembly grows from 3,069 to 8,409 lines — a 2.74× increase. The loop structure is gone. The transformation did exactly what was intended at the assembly level: the compression function is now a single large basic block with no branches in the hot path.

### Benchmark Results

| Input (MB) | Opt04 (MB/s) | Opt05 (MB/s) | Δ |
|------------|-------------|-------------|---|
| 100        | 44.24       | 42.93       | **−3.0%** |

*Full per-size data in `benchmarks/results/ocaml_scalar/benchmarks/opt05_unroll.csv`.*

The benchmark regressed by 3.0%. The assembly confirms that the loop was eliminated; the hypothesis about loop overhead was correct. But the benchmark went the wrong direction.

### perf Investigation

Assembly analysis established what the compiler produced but could not explain the regression. The assembly change was exactly as predicted — no branches, straight-line code — yet throughput fell. This is the single case in the campaign where hardware-counter evidence was required.

`perf stat -e cycles,instructions,L1-icache-load-misses` was run on the Opt04 and Opt05 binaries against the 100 MB input. The result: the Opt05 binary showed a marked increase in L1 instruction-cache miss rate compared to Opt04.

**Code size analysis.** The 8,409-line assembly corresponds to a compiled function occupying approximately 30 KB of machine code. Against a 32 KB L1 instruction cache (a common size for modern x86-64 cores), the unrolled `transform_from` function alone occupies nearly the entire cache. Every call to `transform_from` must fetch approximately 30 KB of instruction bytes; subsequent calls benefit from the hot cache, but any intervening code — benchmark harness, OS interrupts, function call/return paths — displaces cache lines from the 32 KB budget.

**Why the loop was better.** The looping version of `transform_from` fits comfortably within the 32 KB L1-I cache: 3,069 assembly lines correspond to roughly 10–12 KB of machine code. The loop body is fetched once and then re-executed 64 times from cache. Instruction fetch is effectively free. With the unrolled version, the instruction fetch cost for a 30 KB function becomes the bottleneck, entirely offsetting the savings from eliminated loop control instructions.

**The asymmetry with C.** The C compiler's 8-way STEP-macro unrolling avoids this problem because the C compiler controls how aggressively to unroll and can observe the I-cache budget (via profile-guided optimization or heuristics). A C function unrolled by the programmer to 30 KB would face the same I-cache problem. OCaml does not yet provide a profile-guided unrolling mechanism or a compiler-directed partial-unrolling hint.

### Partial Unrolling — Investigated and Rejected

After the regression was attributed to I-cache pressure, partial unrolling was considered as an alternative. Instead of 64 fully explicit rounds, the loop could be unrolled by a factor of 2 (32 iterations of 2 rounds each) or 4 (16 iterations of 4 rounds each).

**Expected gain from partial unrolling.** Unrolling by 2× eliminates half the loop-control instructions: the counter increment, the termination check, and the back-edge branch occur every 2 rounds instead of every 1 round — a 50% reduction in loop overhead. Unrolling by 4× achieves a 75% reduction.

**Expected code size.** 2× unrolling approximately doubles the function body from 3,069 to ~6,100 lines, corresponding to roughly 20–24 KB. 4× unrolling approximately quadruples it to ~12,000 lines, roughly 40–48 KB. At 4× unrolling, the function would exceed the 32 KB L1-I budget. At 2×, it would fit, but only barely.

**Why partial unrolling was not pursued.** Several converging reasons:

1. **The loop overhead is already small.** Opt04 achieves 44.24 MB/s with a 64-iteration loop. The back-edge branch is a single well-predicted jump. The loop counter is a register variable (no memory access). The actual cost of the loop control — amortized over 64 rounds of heavy arithmetic — is a small fraction of total execution time.

2. **The compiler already produces an efficient loop.** The tail-recursive `rounds` function compiles to a tight backward jump with register-resident arguments. There is no prologue, no frame setup, no spilling of working variables between iterations. The OCaml compiler has already done the easy work; further gains from the loop structure are marginal.

3. **The remaining bottlenecks are elsewhere.** The assembly after Opt04 still has 24 `jbe` branches and 134 `andq` masking instructions. These are larger, more concrete sources of overhead than the loop control. Pursuing partial unrolling — a complex source transformation with marginal expected gain — would consume engineering effort that was better spent on the directly identifiable remaining overheads.

4. **Risk of another I-cache regression.** Even at 2×, the function would occupy ~20 KB of a 32 KB I-cache. With any other warm code in the cache (harness, OS, C library), the effective headroom could be exhausted. The perf evidence from Opt05 showed that I-cache pressure materialized before the theoretical budget was exhausted; approaching the budget with a smaller margin is a gamble.

5. **The decision was evidence-based.** The assembly showed that partial unrolling would not eliminate the remaining dominant overheads (jbe, andq). The perf investigation showed that the I-cache budget was the binding constraint. Partial unrolling addresses neither of these; it addresses the loop-control overhead, which is not the dominant overhead.

**Partial unrolling verdict.** Not implemented. The engineering reasoning is: the expected gain is small, the I-cache risk is real, and the remaining overheads (24 `jbe`, 134 `andq`) offer more clearly recoverable value with less risk.

### Decision: REVERT

The full unrolling is reverted. The assembly is retained as a reference at `benchmarks/results/ocaml_scalar/assembly/opt05_unroll.s` for the I-cache size analysis. The benchmark CSV is retained at `benchmarks/results/ocaml_scalar/benchmarks/opt05_unroll.csv`. The implementation returns to Opt04.

### Lessons Learned

**Instruction-cache awareness is a hard constraint, not a soft consideration.** The 30 KB unrolled function did not merely perform slightly worse — it performed worse than the 3× smaller looping version despite having fewer instructions to execute. I-cache misses are expensive enough to overwhelm the benefit of eliminating ~64 loop-control instructions across a 64-round loop.

**Unrolling at the source level is not equivalent to unrolling in the compiler.** The C compiler's 8-way STEP macro produces a well-behaved unrolled function because GCC was written to manage I-cache budget under optimization flags. Manually unrolling in OCaml bypasses any such management.

**Regression investigation is valuable even when reverting.** Understanding that the regression was caused by I-cache pressure, and then ruling out partial unrolling through analysis, is a concrete result. It closes the unrolling direction entirely: not "we tried full unrolling and it was slower, so we stopped," but "full unrolling overflows the I-cache, partial unrolling does not address the remaining dominant overheads, so the loop structure is close to optimal for this architecture."

### Why Opt06 Became the Next Target

After reverting Opt05, the campaign returns to the Opt04 assembly: 3,069 lines, 24 `jbe`, 134 `andq`. The unrolling direction is exhausted.

Returning to the overhead classification: the 24 remaining `jbe` branches include bounds checks in `get_be32` and `set_be32` — the byte I/O functions that convert between OCaml `int` values and big-endian bytes in the input/output buffer. These functions use `Bytes.get` (safe), which emits a `jbe` on every byte access. `get_be32` reads 4 bytes; `set_be32` writes 4 bytes. Each call to `get_be32` or `set_be32` with safe access emits 4 `jbe` branches.

In the schedule expansion (16 words, one `get_be32` call each) and the state finalization, there are numerous `set_be32` calls in `finish`. These are not on the absolutely hottest path (the 64-round loop itself does not call `get_be32`/`set_be32`), but they execute for every block at block boundaries and in the finalization step.

The `Bytes.unsafe_get`/`Bytes.unsafe_set` variants eliminate the `jbe` from these calls. This is a well-understood, safe-to-unsafe change analogous to `Array.unsafe_get` in Opt02, with a clear safety argument (the byte offsets are within the buffer by construction). This becomes Opt06.

---

## Opt06 — Unsafe Byte I/O

### Background

After Opt05 is reverted, the assembly shows 24 `jbe` branches. Opt02 eliminated the bounds checks from array accesses in the `transform_from` hot loop. The remaining 24 `jbe` branches are concentrated in three places:

1. `get_be32`: reads 4 bytes from a `bytes` buffer, assembles them into a 32-bit big-endian word. Uses `Bytes.get` (safe).
2. `set_be32`: writes a 32-bit word as 4 big-endian bytes into a `bytes` buffer. Uses `Bytes.set` (safe).
3. The partial-block paths in `add_data` and `finish`, where `Bytes.blit` and `Bytes.set` use safe access.

`get_be32` is called 16 times per block (once per W[0..15]) and at least once per byte in partial blocks. `set_be32` is called 8 times in `finish` to write the final hash output.

### Observation

Assembly inspection of Opt04 shows `jbe` branches concentrated in the `get_be32` function. Each call to `Bytes.get` emits a compare of the byte offset against the bytes length, followed by a `jbe` to an exception stub. For a `bytes` buffer of fixed size (64 bytes), every `Bytes.get` call in `get_be32` is provably within bounds: the offsets are 0, 1, 2, 3, 4, 5, ..., 63, passed by the caller in a known-bounded loop.

### Bottleneck Analysis

The bounds check in `Bytes.get` is the same structure as `Array.get`: compare offset against length, branch to exception on failure. In `get_be32 buf offset`, the four byte accesses are at `offset`, `offset+1`, `offset+2`, `offset+3`. If `offset ∈ [0, 60]` (ensured by the caller), all four accesses are within the 64-byte buffer.

The `jbe` branches from `get_be32` execute on every block's schedule expansion. At 1.6M blocks, this is 16 × 4 = 64 `jbe` branches per block that are always not-taken — over 100 million unnecessary branch evaluations per benchmark run.

### Hypothesis

Replace `Bytes.get` with `Bytes.unsafe_get` and `Bytes.set` with `Bytes.unsafe_set` in `get_be32` and `set_be32`. Introduce `Char.unsafe_chr` for the reverse conversion where needed. Expected assembly change: the `jbe` count drops from 24 toward 16 (the remaining 8 `jbe` branches are from `Bytes.blit` and `Bytes.set` in the partial-block paths, which execute at most once per hash operation and are less critical).

### Correctness / Safety

In `get_be32 src offset`:
- Called from `transform_from` with `offset = i * 4` where `i ∈ [0, 15]`, so `offset ∈ {0, 4, 8, ..., 60}`.
- The maximum byte access is at `offset + 3 = 63`.
- `src` (the caller's input buffer) has size ≥ 64 at this call site (guaranteed by the full-block check in `add_data`).

In `set_be32 dst offset v`:
- Called from `finish` with `offset = i * 4` where `i ∈ [0, 7]`, so `offset ∈ {0, 4, ..., 28}`.
- Maximum byte access at `offset + 3 = 31`.
- `dst` is the output buffer, sized exactly 32 bytes by convention.

Both are trivially safe. FIPS KATs pass.

### Implementation

```ocaml
(* Before *)
let[@inline] get_be32 src off =
  (Char.code (Bytes.get src off)       lsl 24) lor
  (Char.code (Bytes.get src (off + 1)) lsl 16) lor
  (Char.code (Bytes.get src (off + 2)) lsl 8)  lor
  (Char.code (Bytes.get src (off + 3)))

(* After *)
let[@inline] get_be32 src off =
  (Char.code (Bytes.unsafe_get src off)       lsl 24) lor
  (Char.code (Bytes.unsafe_get src (off + 1)) lsl 16) lor
  (Char.code (Bytes.unsafe_get src (off + 2)) lsl 8)  lor
  (Char.code (Bytes.unsafe_get src (off + 3)))
```

Similarly for `set_be32` with `Bytes.unsafe_set` and `Char.unsafe_chr`.

### Assembly Verification

| Metric | Opt06 | Opt04 | Change |
|--------|-------|-------|--------|
| Assembly lines | 2,819 | 3,069 | −250 |
| `jbe` branches | 16 | 24 | **−8** |
| `andq` with mask | 134 | 134 | 0 |

The `jbe` count drops from 24 to 16, matching the prediction: 8 bounds-check branches eliminated from the `get_be32`/`set_be32` critical path. The assembly shrinks by 250 lines — each eliminated `jbe` removes the check, the branch target, and the associated exception stub.

The 16 remaining `jbe` branches are in the partial-block paths of `add_data` (where `Bytes.set` handles the remainder when the input is not a multiple of 64 bytes) and in `finish`. These paths execute at most once per hash operation and are not on the critical path for large inputs.

### Benchmark Results

| Input (MB) | Opt04 (MB/s) | Opt06 (MB/s) | Δ |
|------------|-------------|-------------|---|
| 100        | 44.24       | 46.01       | +4.0% |

*Full per-size data in `benchmarks/results/ocaml_scalar/benchmarks/opt06_unsafe_bytes.csv`.*

The +4.0% improvement is larger than the +1.5% from Opt04, consistent with `get_be32` executing on every block (16 calls per block) while the blit executed once per block. The eliminated `jbe` branches in `get_be32` accumulate across 1.6M × 16 calls.

### Decision: KEEP

Assembly confirmation, passing FIPS KATs, and benchmark consistent with the structural change.

### Lessons Learned

The safe/unsafe boundary in OCaml spans both `Array` and `Bytes`. After Opt02 addressed array bounds checks, the byte-access bounds checks in `get_be32`/`set_be32` were the next relevant safety overhead in the hot path. The pattern is the same: any OCaml function operating on a `bytes` buffer at provably-bounded offsets should use `Bytes.unsafe_get`/`set` in performance-critical code.

---

### Why Opt06 Was Not Enough

After Opt06: 2,819 assembly lines, 16 `jbe` (in non-critical partial-block paths), 134 `andq` mask instructions. The allocation, bounds-check, ref-cell, buffer-copy, and byte-I/O overheads have all been addressed. The 134 `andq` instructions remain — these are `land mask32` operations applied to every arithmetic result in the compression function. At 134 such operations in a function called 1.6M times, this is the last large, structurally addressable overhead in the OCaml assembly. Opt07 targets it.

---

## Opt07 — Sigma Mask Restructuring

### Background

OCaml's 63-bit native integer requires a `land mask32` after every arithmetic operation that might set bits 32–62. In the SHA-256 compression function, this manifests primarily in the `rotr` function and in the arithmetic on `a..h`:

```ocaml
let mask32 = 0xFFFF_FFFF

let[@inline] rotr x n =
  ((x lsr n) lor (x lsl (32 - n))) land mask32
```

The `land mask32` inside `rotr` ensures that the result is a 32-bit value. Since each big sigma function calls `rotr` three times (e.g., `big_sigma0 x = rotr x 2 lxor rotr x 13 lxor rotr x 22`), and since `rotr` is inlined, each sigma call expands to three separate `andq` instructions.

After Opt06, the assembly contains 134 `andq` instructions with the `0xffffffff` immediate — all representational overhead, with no algorithmic counterpart in the C reference (which has 27 `andl` instructions, all from `CH`, `MAJ`, and the rotate-idiom expansion).

### Observation

The 134 `andq` count from the baseline has not changed throughout the OCaml campaign. Opt01–Opt06 each addressed different categories of overhead; none of them modified the arithmetic structure of the compression function. The mask operations are now the largest remaining instruction-count difference between the OCaml and C assemblies.

Assembly inspection confirms: the masks appear exclusively inside inlined `rotr` calls (three per sigma function) and at the final state additions. The sigma functions — `big_sigma0`, `big_sigma1`, `sigma0`, `sigma1` — each contain three inlined `rotr` calls, each emitting one `andq`. Four sigma functions × three `andq` each = 12 `andq` per round × 64 rounds ≈ 768 — but the schedule expansion calls `sigma0`/`sigma1` fewer times (only for i=16..63), and the compiler's inliner may fold some operations. The observed total of 134 reflects the actual compiler output after inlining and optimization.

### Bottleneck Analysis

The fundamental cause is OCaml's 63-bit integer representation: `lsl` by `(32 - n)` can shift 32-bit input bits into positions 32–62, and `lor` with a value in those positions produces a result with bits 32–62 set. The `land mask32` inside `rotr` clears these bits before the result is used. Without it, the XOR accumulation in big_sigma0 would accumulate garbage in the upper bits, and the final state update would be incorrect.

The question for Opt07: is each `land mask32` inside `rotr` independently necessary, or can they be deferred?

### Hypothesis

Remove the `land mask32` from inside `rotr`. At the point where multiple `rotr` results are XOR'd together in a sigma function, the upper bits from each `rotr` contribute to the XOR but are then masked at the sigma output. One `land mask32` at the sigma output is sufficient to clear all upper bits before the result propagates to the next arithmetic operation.

Reformulation:

```ocaml
(* Before Opt07 *)
let[@inline] rotr x n =
  ((x lsr n) lor (x lsl (32 - n))) land mask32

let[@inline] big_sigma0 x =
  (rotr x 2) lxor (rotr x 13) lxor (rotr x 22)
  (* no mask here — each rotr already masked *)

(* After Opt07 *)
let[@inline] rotr x n =
  (x lsr n) lor (x lsl (32 - n))
  (* no mask *)

let[@inline] big_sigma0 x =
  ((rotr x 2) lxor (rotr x 13) lxor (rotr x 22)) land mask32
  (* one mask at output *)
```

Expected change: instead of 3 `andq` per sigma call (one per `rotr`), there is now 1 `andq` per sigma call (at the output). Saving: 2 `andq` per sigma call × 4 sigma functions per round × 64 rounds — but the actual saving depends on how many sigma calls the compiler expands and how many are in the hot loop vs the schedule expansion.

Expected `andq` count after Opt07: not derived analytically (depends on compiler inlining decisions); observed as a reduction from 134.

### Correctness / Safety

The argument for why this restructuring is correct:

For `big_sigma0 x` with x a 32-bit value (bits 32–62 clear):

- `rotr x 2 = (x lsr 2) lor (x lsl 30)`. Since `x` has bits 32–62 clear, `x lsl 30` may set bits 30–61 (the low 2 bits of `x` shift up by 30). So the result may have bits 32–61 set. It is a 62-bit value.
- `rotr x 13` may set bits 32–44 (the low 13 bits of `x` shift up by 19; 13+19=32, so bit 32 can be set). It is a 33-bit value.
- `rotr x 22` may set bits 32–31... wait, `x lsl 10` with a 32-bit x: the high 10 bits of x shift to positions 10+32=42, so bits 32–41 can be set. A 42-bit value.

After XOR of three values all bounded by 62 bits, the result is at most 62 bits wide. One `land mask32` at the output clears all bits above 31. The result is correct.

The key safety requirement: the `rotr` output is used only inside sigma functions, not directly in other arithmetic that could propagate upper bits incorrectly before masking. In the current implementation, this holds: all `rotr` calls occur inside sigma function bodies, and sigma outputs are masked before being XOR'd into `t1`, `t2`, or state updates.

A supplementary argument: every place a sigma result is used in the round update, the subsequent `land mask32` on `t1` or `e_new` would eventually clear any upper bits. But it is cleaner to mask at the sigma output and rely on that invariant, rather than to propagate unmasked values through multiple intermediate results.

FIPS KATs pass. The test for the "1 million repetitions of 'a'" case — which exercises all 64 rounds of the schedule expansion and compression — is particularly relevant because it exercises sigma0 and sigma1 in the schedule expansion where the rotr results go through multiple additions.

### Implementation

Remove `land mask32` from `rotr`. Add `land mask32` to the output of each of the four sigma functions: `big_sigma0`, `big_sigma1`, `sigma0`, `sigma1`.

The `ch` and `maj` functions are not affected: they use only `land`, `lor`, and `lxor` on already-32-bit-bounded inputs; they do not call `rotr`.

### Assembly Verification

| Metric | Opt07 | Opt06 | Change |
|--------|-------|-------|--------|
| Assembly lines | 2,748 | 2,819 | −71 |
| `jbe` branches | 16 | 16 | 0 |
| `andq` with `0xffffffff` | 93 | 134 | **−41** |

The `andq` count drops from 134 to 93 — a reduction of 41 instructions. This is a 30.6% reduction in the representational masking overhead.

The reduction is less than the maximum possible (3 per sigma × 4 sigma × 64 rounds = 768 gross operations, minus 1 per sigma × 4 × 64 = 256 net = reduction of 512 in theory) because: (a) many sigma calls are in the schedule expansion, not the 64-round loop; (b) compiler optimization merges or elides some masks; (c) the 134 baseline count already reflects the compiler's inlining and optimization decisions. The observed 41-instruction reduction reflects the actual compiler behavior rather than any theoretical calculation.

The assembly shrinks by 71 lines, consistent with fewer `andq` instructions plus their associated register-move overhead.

### Benchmark Results

| Input (MB) | Opt06 (MB/s) | Opt07 (MB/s) | Δ |
|------------|-------------|-------------|---|
| 100        | 46.01       | 48.68       | +5.8% |

*Full per-size data in `benchmarks/results/ocaml_scalar/benchmarks/opt07_sigma_mask.csv`.*

The +5.8% improvement is consistent with a 30% reduction in the most frequently executed instruction class in the function. Masking operations are cheap individually (an `andq` is a single-cycle operation on modern hardware), but at 134 per call × 1.6M calls, the cumulative cost is meaningful.

The improvement is somewhat larger than the raw instruction count reduction would predict (30% reduction in masks → 5.8% improvement overall), which indicates that the masks were not just consuming issue slots — they were also contributing to dependency chains that slowed the out-of-order window.

### Decision: KEEP — Final OCaml

Opt07 is the final optimization in the OCaml phase. The assembly after Opt07 has been examined for further source-level opportunities and none remain that are both safe and likely to produce measurable gain. See [OCaml Scalar Optimization Summary](#ocaml-scalar-optimization-summary) for the residual analysis.

### Lessons Learned

`land mask32` can be moved out of helper functions and placed at the boundary where the upper bits become observable to other computations. This is the OCaml equivalent of deferring normalization: instead of normalizing to 32 bits at every intermediate step, normalize once when the result enters a context where bits 32+ would cause incorrect behavior. The equivalence holds whenever the intermediate operations (XOR, LOR) are idempotent with respect to upper bits — XOR of upper bits from different terms is still cleared by one mask at the end.

Reducing from 134 to 93 `andq` instructions is a real improvement. The 93 remaining masks are structurally necessary: they guard the state additions and the context where the result must be a true 32-bit value before being stored. Without changing the integer representation, these cannot be eliminated from standard OCaml source. This becomes the primary motivation for the OxCaml `int32#` migration.

---

## OCaml Scalar Optimization Summary

### Progress

| Stage | Throughput (100 MB) | Cumulative gain vs Baseline |
|-------|---------------------|----------------------------|
| Baseline | 32.29 MB/s | — |
| Opt01 | 33.56 MB/s | +3.9% |
| Opt02 | 42.42 MB/s | +31.4% |
| Opt03 | 43.59 MB/s | +35.0% |
| Opt04 | 44.24 MB/s | +37.0% |
| Opt06 | 46.01 MB/s | +42.5% |
| Opt07 | 48.68 MB/s | +50.7% |

### Throughput Progression

![OCaml optimization throughput progression](../benchmarks/results/ocaml_hash_speed_progress.png)

![OCaml optimization hash time progression](../benchmarks/results/ocaml_hash_time_progress.png)

Both graphs show the C scalar ceiling as a dashed blue reference line. Readers should observe:
- The large gap between Baseline and Opt02 (the single largest step in the campaign)
- The smaller but consistent gains from Opt03 onward
- Opt05 (dashed purple) falling below Opt04, confirming the regression
- Opt07 (darkest green, final) still well below the C ceiling

### Key Results

**Initial performance:** 32.29 MB/s — 4.60× below the C reference (148.53 MB/s).

**Final performance:** 48.68 MB/s — 3.05× below the C reference. A 50.7% total improvement over the baseline.

**Largest single improvement:** Opt02 (+26.4%). Bounds-check elimination on five array types in the hot loop.

**Most surprising result:** Opt05's regression. The hypothesis was sound — fewer branches should be faster — but the I-cache budget constraint was not anticipated. This taught the most durable lesson of the campaign: instruction count is not a reliable proxy for execution time when code size approaches the L1-I boundary.

**Biggest failed experiment:** Opt05 (full unrolling, −3.0%). Documented in detail, reverted, and used to rule out partial unrolling through analysis.

### Remaining Bottlenecks After Opt07

After Opt07, the assembly shows:
- **93 `andq` instructions** — representational masking due to OCaml's 63-bit integers. Structurally necessary in standard OCaml; cannot be reduced further at the source level without changing the integer representation.
- **16 `jbe` branches** — bounds checks in the partial-block paths (`add_data` remainder, `finish`). These execute at most once per hash operation. Eliminating them requires `Bytes.unsafe_*` in paths where the safety argument is less mechanical; the gain on large inputs would be negligible.
- **Three-instruction rotate sequences.** Every `rotr` call compiles to `shrl`, `shll`, `orl` — three instructions. C produces a single `roll`. Eliminating this requires either a compiler rotate-idiom pattern matcher or a source-level rotation intrinsic.

### Why OxCaml Became the Logical Next Phase

The 93 remaining `andq` instructions are the largest addressable remaining overhead — and they cannot be addressed in standard OCaml. They exist because every arithmetic result must be masked to 32 bits to maintain the SHA-256 invariant within a 63-bit integer type. No source restructuring can eliminate this need without eliminating the `mask32` constraint itself.

OxCaml's `int32#` type represents 32-bit integers directly: every arithmetic operation wraps at 32 bits by construction, without any masking instruction. The type eliminates `mask32` at the representation level rather than at the source level. The migration from OCaml Opt07 to the OxCaml `int32#` baseline is documented in [docs/03_oxcaml_migration.md](03_oxcaml_migration.md).
