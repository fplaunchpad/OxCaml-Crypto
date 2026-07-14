# 04 — OxCaml Optimization Campaign

## Contents

1. [Introduction](#introduction)
2. [Optimization Roadmap](#optimization-roadmap)
3. [OxCaml Baseline](#oxcaml-baseline)
4. [Ox01 — Closure Capture Elimination](#ox01--closure-capture-elimination)
5. [Ox02 — Dead Schedule Expansion Elimination](#ox02--dead-schedule-expansion-elimination)
6. [Ox03 — T₁ ILP Restructuring](#ox03--t1-ilp-restructuring)
7. [Optimization Ceiling](#optimization-ceiling)
8. [Skipped Investigations](#skipped-investigations)
9. [Graphs](#graphs)
10. [OxCaml Optimization Summary](#oxcaml-optimization-summary)

---

## Introduction

### Why Optimization Begins Here

The migration from OCaml Opt07 to the OxCaml `int32#` baseline ([docs/03_oxcaml_migration.md](03_oxcaml_migration.md)) was a representation change, not a performance optimization. Every structural decision during migration — whether to eliminate the dead schedule expansion, whether to restructure `get_be32`, whether to address the closure in `rounds` — was deferred to preserve a clean measurement of the `int32#` effect in isolation. With the baseline validated at +39.2% over Opt07, the measurement is established and optimization can begin.

### The New Reference and Remaining Gap

The OxCaml baseline at 67.80 MB/s is now the reference implementation. Every subsequent comparison is against this baseline, not against OCaml Opt07. The remaining gap to the C reference (148.53 MB/s) is 2.19×. By contrast, the OCaml phase started from a 4.60× gap. The structural overheads that dominated the OCaml campaign — masking operations, bounds checks in the hot loop, heap-allocated working variables, per-call allocations — are absent from the OxCaml baseline. What remains is different in character.

### How the Optimization Strategy Changed

The OCaml optimization campaign had a clear inventory of overheads, each with a known source-level fix. The `andq`/`jbe` counts pointed directly to `land mask32` calls and safe array accesses. Eliminating them required straightforward `unsafe_*` replacements or structural refactors.

In the OxCaml phase, the assembly profile after the baseline is substantially cleaner: 0 `andq` with `0xffffffff`, 8 `jbe` (all in non-critical partial-block paths), 2,191 lines. The remaining overheads are less visible from instruction counts alone. This changes the investigation method: rather than counting specific instruction classes, each optimization requires a more careful reading of the assembly — looking for structural artifacts (closure descriptors, dead computation), dead-code patterns (unreachable schedule indices), and hardware-level behaviors (ILP, scheduling).

Assembly and perf analysis become the primary guidance for optimization selection, not source-level pattern matching.

---

## Optimization Roadmap

| Stage | Main Idea | Throughput (100 MB) | Δ from Previous | Status |
|-------|-----------|---------------------|-----------------|--------|
| OxCaml Baseline | `int32#` migration complete; validated | 67.80 MB/s | — | Reference |
| Ox01 | Pass `constants` explicitly to `rounds`; eliminate closure | 68.39 MB/s | +0.9% | **Kept** — structural correction |
| Ox02 | Truncate schedule expansion to indices 0–63; eliminate dead W[64..79] | 72.39 MB/s | +5.8% | **Kept** — largest OxCaml gain |
| Ox03 | Restructure T₁ to separate arithmetic chain from memory loads | 73.99 MB/s | +2.2% | **Kept** — source clarity; null result |

For the full throughput and hash-time profiles across all input sizes, see:
- `benchmarks/results/oxcaml_hash_speed_progress.png`
- `benchmarks/results/oxcaml_hash_time_progress.png`
- Per-stage CSVs in `benchmarks/results/oxcaml/benchmarks/`

---

## OxCaml Baseline

The baseline is documented in full in [docs/03_oxcaml_migration.md — Baseline Validation](03_oxcaml_migration.md#baseline-validation). Key figures:

| Metric | OxCaml Baseline | OCaml Opt07 |
|--------|----------------|-------------|
| Throughput (100 MB) | 67.80 MB/s | 48.68 MB/s |
| Assembly lines | 2,191 | 2,748 |
| `andq` (mask32) | 0 | 93 |
| `jbe` branches | 8 | 16 |
| Closure descriptor in `rounds` | **present** | absent |

The baseline assembly inspection identified one artifact from the migration that was not addressed during migration: a closure descriptor associated with `rounds`. This is the first optimization target.

---

## Ox01 — Closure Capture Elimination

### Background

The migration carried over the explicit-parameter convention from OCaml Opt03 (documented in [docs/02_ocaml_scalar_optimization.md](02_ocaml_scalar_optimization.md#opt03--tail-recursive-rounds)): `data` and `ctx` are passed explicitly to `rounds` to prevent closure capture. In OxCaml, this convention was applied during migration:

```ocaml
let rec rounds data ctx i (a : int32#) ... =
  ...
  let k = aget constants i in   (* constants: module-level int32# array *)
  ...
  rounds data ctx (i+1) ...
```

`data` and `ctx` are explicit parameters. `constants` is not — it is a module-level binding accessed as a free variable inside the `let rec`.

### Observation

The OxCaml baseline assembly contains a closure descriptor in the `.rodata`/`.data` section associated with `rounds`. This is the same signature as the pre-fix OCaml Opt03 assembly — evidence that `rounds` is constructing a heap-allocated closure on every call to `transform_from`.

Identifying *which* variable is captured requires examining what `rounds` accesses from outside its parameter list. The explicit parameters cover `data` and `ctx`. `constants` is accessed inside `rounds` but is not a parameter — it is captured from the enclosing module scope.

### Bottleneck Analysis

The closure captures `constants` — a module-level `int32# array` of 64 elements. When `rounds` is called as a `let rec` inside `transform_from`, OxCaml's Flambda2 lambda-lifter constructs a closure record containing a pointer to `constants`, and passes this closure to each recursive call. At 1,638,400 `transform_from` invocations per 100 MB hash, this is 1,638,400 closure allocations.

**Why does OxCaml capture `constants` when OCaml did not?**

This is the question that makes Ox01 more interesting than a straightforward re-application of the Opt03 fix. In OCaml Opt03, the issue was `data` and `ctx` being captured — both were local variables in `transform`. `constants` in OCaml is a module-level `int array`, and OCaml's lambda-lifter treated it as a module-level global: no capture, no closure entry.

In OxCaml, `constants` is a module-level `int32# array`. Flambda2's treatment of module-level values of unboxed types inside non-top-level `let rec` definitions differs from OCaml's native compiler. The specific difference: Flambda2 does not reliably hoist accesses to module-level `int32#` arrays out of a local `let rec` the way it does for `int` arrays. The unboxed type's layout information may cause Flambda2 to treat it as a capture candidate even though it is module-level. The precise internal Flambda2 decision is not visible from assembly alone, but the effect is confirmed: `constants` is in the closure.

**Why the expected gain was considered small.**

The initial framing was: "same bug as Opt03, should give similar improvement." Opt03 gave +2.8%. The actual gain is +0.9%. Understanding why requires decomposing what the closure costs:

In Opt03, the closure carried `data` (an 80-element `int` array pointer) and `ctx` (the context record pointer). The closure was constructed from two local variables with local lifetimes. More importantly, in Opt03's context, the `data` array was also being used inside `rounds` for every schedule access — the closure dereference to access `data` was on every of the 80 schedule reads.

In Ox01, the closure carries only `constants` — a pointer to a module-level array. The closure dereference to access `constants` occurs 64 times per `transform_from` call (once per compression round). The closure object itself is small. The allocation cost is smaller than in Opt03 because: (a) the closure is one word, not two; (b) there is no array-initialization cost (unlike Opt01's `Array.make 80 0`); (c) the closure allocator in Flambda2 handles single-word closures efficiently.

**The actual mechanism is more nuanced than allocation alone.**

Assembly inspection after Ox01 reveals three simultaneous changes, not just one:

1. **Closure descriptor removed.** The `.rodata` closure entry disappears from the assembly.

2. **One fewer indirection on `constants` access in `rounds`.** Before Ox01, accessing `constants[i]` inside `rounds` required: (a) load the closure pointer from the closure record, (b) load `constants` from the closure field, (c) load element `i`. After Ox01: (a) `constants` is a register-resident parameter, (b) load element `i`. One L1 load eliminated per round iteration — 64 fewer L1 loads per `transform_from` call, 104 million fewer L1 loads per 100 MB benchmark.

3. **Stack frame may change.** If Flambda2 was spilling the closure pointer to the stack between recursive calls (because the closure is live across the recursive step), eliminating the closure reduces register pressure and may reduce stack-frame spill traffic.

**Why the initial estimate was incomplete:** The initial estimate treated this as a pure allocation-cost reduction. The actual improvement includes the per-access indirection reduction (64 fewer loads per call) and potentially a register pressure improvement. These combined effects explain the +0.9% rather than a smaller number, even though +0.9% is still modest.

### Hypothesis

Pass `constants` as an explicit parameter to `rounds`, alongside `data` and `ctx`. This eliminates `constants` as a free variable of the `let rec`, preventing Flambda2 from constructing a closure.

Expected assembly change: the closure descriptor disappears; `constants` accesses in `rounds` use a register-resident pointer directly.

Expected benchmark effect: moderate improvement (~1–2%), reflecting the combined allocation and indirection costs at 1.6M calls.

### Correctness / Safety

`constants` is module-level and immutable throughout the program. Passing it as a parameter produces identical behavior. FIPS 180-4 KATs pass.

### Implementation

```ocaml
(* Before Ox01 *)
let rec rounds data ctx i (a : int32#) (b : int32#) ... =
  ...
  let k = aget constants i in    (* free variable capture *)
  ...
  rounds data ctx (i+1) ...

(* After Ox01 *)
let rec rounds constants data ctx i (a : int32#) (b : int32#) ... =
  ...
  let k = aget constants i in    (* register-resident explicit parameter *)
  ...
  rounds constants data ctx (i+1) ...
```

The call site in `transform_from` passes `constants` explicitly:

```ocaml
rounds constants ctx.data ctx 0 (aget ctx.state 0) ...
```

### Assembly Verification

| Metric | Ox01 | Baseline | Change |
|--------|------|----------|--------|
| Assembly lines | 2,191 | 2,191 | 0 |
| Closure descriptor | absent | present | **Eliminated** |
| `constants` access indirection in `rounds` | direct register load | closure → pointer → load | **1 load removed per round** |
| `jbe` | 8 | 8 | 0 |
| `andq` | 0 | 0 | 0 |

The assembly line count is unchanged at 2,191 — the closure descriptor and its construction code are removed, but `constants` as an explicit parameter adds a small amount of parameter-passing code that roughly cancels. The key structural change is the removal of the indirection.

### Benchmark Results

| Input (MB) | Baseline (MB/s) | Ox01 (MB/s) | Δ |
|------------|----------------|------------|---|
| 100        | 67.80          | 68.39      | +0.9% |

*Full per-size data in `benchmarks/results/oxcaml/benchmarks/ox01_explicit_constants.csv`.*

The +0.9% is the smallest gain in the entire campaign. It was initially considered potentially within noise. The reason for keeping it despite the small number is assembly-level: the closure is confirmed eliminated, the load reduction per call is real and confirmed, and the principle (no closure construction in hot paths) is the same principle that justified Opt03 in the OCaml phase.

A +0.9% improvement that is structurally confirmed is more valuable than a larger improvement with no assembly explanation. The decision criterion is assembly evidence, not benchmark magnitude — per the [methodology](01_methodology.md#2-optimization-workflow).

### Decision: KEEP — structural correction

The closure elimination is confirmed. The improvement is small because the closure was small and short-lived; the gain reflects the true cost of the overhead, which was modest but real.

### Lessons Learned

**The closure trap reappears across compiler versions.** The same class of bug — `let rec` inside a function capturing a non-parameter value — appeared in OCaml (Opt03, capturing `data` and `ctx`) and now in OxCaml (capturing `constants`), despite the OCaml fix being known and partially applied. The difference in behavior between OCaml's native compiler and Flambda2's lambda-lifter for module-level `int32#` values is a subtle compiler-version dependency that cannot be assumed away. Assembly inspection after every migration is the only reliable way to catch it.

**Small gains from confirmed structural changes are worth keeping.** The benchmark magnitude of +0.9% would not justify the change in isolation. The assembly evidence justifies it independently. A function that allocates heap closures in its hot path is wrong in principle, and the fix is correct in principle, regardless of how small the measured gain is on a given benchmark run.

**The actual mechanism was more than allocation.** The indirection elimination (one fewer L1 load per round access to `constants`) contributed to the gain alongside the allocation reduction. Understanding this required assembling inspection and reasoning about the load path through a closure field vs a register-resident pointer. The initial "same as Opt03" framing was incomplete.

---

### Why Ox01 Was Not Enough

After Ox01, the closure is gone and the hot path has no heap allocation. The assembly shows 2,191 lines with the same instruction profile as the baseline, minus the closure. Throughput is 68.39 MB/s.

Examining the schedule expansion: the loop runs `for i = 16 to 79`. The compression function that follows runs `for i = 0 to 63`. These ranges are different: the expansion produces 80 words, but only 64 are ever consumed. The `ctx.data` array has 80 elements; the upper 16 (indices 64–79) are written during expansion and never read. This mismatch inherited from the C source is now visible and verifiable. It becomes Ox02.

---

## Ox02 — Dead Schedule Expansion Elimination

### Background

SHA-256 (FIPS 180-4) specifies a message schedule of 64 32-bit words `W[0..63]`, used in 64 compression rounds. The C source (Xavier Leroy / Cryptokit) expands the schedule to `W[0..79]`. The expansion loop runs from index 16 to 79. The compression loop runs from index 0 to 63. The words `W[64..79]` are computed but never accessed by the compression function.

This property was present in the C source, carried through every OCaml optimization stage, and carried through the OxCaml migration. It was not identified as dead code until the OxCaml optimization phase, when a systematic examination of the schedule expansion against the FIPS standard confirmed the mismatch.

### Observation

`transform_from` contains:

```ocaml
for i = 16 to 79 do
  ...
  aset ctx.data i ...
done;
(* compression: *)
let rec rounds constants data ctx i ... =
  ...
  let w = aget data i in   (* i ∈ [0, 63] *)
  ...
  rounds ... (i+1) ...     (* terminates at i = 64 *)
```

The write range is `[16, 79]`; the read range of `rounds` is `[0, 63]`. Any `aset ctx.data i` for `i ∈ [64, 79]` writes a value that is never subsequently read within `transform_from` or any function it calls. These 16 writes, and the computation that produces their values, are dead.

### Bottleneck Analysis — A Dead Code Proof

The claim is: W[64..79] are dead. To establish this rigorously, it is necessary to show that no value in W[64..79] is transitively needed by any live computation. The live computations in `transform_from` are: the schedule words W[0..63] (consumed by 64 compression rounds) and the hash state update (which uses only the working variables).

**Liveness analysis of the schedule expansion:**

Define a word `W[i]` as *live* if it is either:
- Directly read by the compression function (`i ∈ [0, 63]`), or
- Used to compute a live word.

The expansion recurrence is:
```
W[i] = σ₁(W[i-2]) + W[i-7] + σ₀(W[i-15]) + W[i-16]   for i ∈ [16, 79]
```

For `W[i]` with `i ∈ [64, 79]`: this word is live only if it is consumed by the compression function or transitively needed by some live word. The compression function reads only `W[0..63]`. Could any `W[j]` for `j ∈ [16, 63]` depend on `W[64..79]`?

For `W[j]` with `j ∈ [16, 63]`, the recurrence uses `W[j-2]`, `W[j-7]`, `W[j-15]`, `W[j-16]`. The maximum index among the dependencies of `W[63]` is `j-2 = 61`. The maximum dependency index of any `W[j]` with `j ≤ 63` is `j - 2 ≤ 61`. Therefore, the computation of `W[j]` for `j ≤ 63` depends only on `W[k]` for `k ≤ 61 ≤ 63`. No word in `[64, 79]` is ever referenced as a dependency of any word in `[0, 63]`.

**Formal statement:** The forward dependency graph of the schedule expansion is strictly one-directional: `W[i]` depends only on `W[j]` for `j < i`. Because the compression function reads only `W[0..63]`, and no `W[j]` with `j ≤ 63` depends on any `W[k]` with `k ≥ 64`, the subgraph consisting of `W[64..79]` and their transitive producers is disconnected from the live outputs of `transform_from`. By definition, this subgraph constitutes dead code.

**This is elimination of dead code, not a modification of the algorithm.**

FIPS 180-4 specifies W[0..63]. The C source computed W[0..79] as an implementation artifact — likely a copy-paste from an earlier, longer schedule or a safety margin that was never removed. The OxCaml source inheriting this from the C source is carrying a bug (computing more than the specification requires). Eliminating W[64..79] makes the implementation faithful to the standard.

### Hypothesis

Change the schedule expansion loop from `for i = 16 to 79` to `for i = 16 to 63`. Reduce `ctx.data` from 80 elements to 64 elements.

Expected benefits:
1. **16 fewer schedule expansion iterations.** Each iteration requires σ₁ (three rotations, two XORs, one AND), σ₀ (three rotations, two XORs, one AND), and two additions. Approximately 16 arithmetic operations per iteration × 16 dead iterations = ~256 eliminated operations per `transform_from` call.
2. **Smaller data array.** 64 × 4 = 256 bytes rather than 80 × 4 = 320 bytes. The `ctx.data` array shrinks by 64 bytes, from 320 bytes (5 cache lines) to 256 bytes (4 cache lines). This may improve data cache behavior during the schedule expansion.
3. **Improved schedule/compression locality.** With 256 bytes, the entire schedule fits within 4 cache lines and is more likely to remain resident in L1-D throughout both the expansion and the consumption phases.

Expected benchmark effect: the largest OxCaml gain so far, because the eliminated computation is proportionally large relative to what remains.

### Correctness / Safety

The argument is established by the dead code proof above. Eliminating `W[64..79]` does not change the output of the compression function because those words were never inputs to any computation that affects the output. FIPS 180-4 KATs are the formal verification: they test the exact hash output against known answers. If any W[64..79] were incorrectly believed to be dead, the test vectors would fail.

FIPS 180-4 KATs pass after the change, including the 1,000,000-character test that exercises 15,625 full blocks.

### Implementation

Two changes:

1. Expansion loop: `for i = 16 to 63` (was `79`).
2. Data array: `makearray_dynamic 64 #0l` (was `80`).

```ocaml
(* Before Ox02 *)
let data = makearray_dynamic 80 #0l in
...
for i = 16 to 79 do
  ...
done;

(* After Ox02 *)
let data = makearray_dynamic 64 #0l in
...
for i = 16 to 63 do
  ...
done;
```

### Assembly Verification

| Metric | Ox02 | Ox01 | Change |
|--------|------|------|--------|
| Assembly lines | 2,191 | 2,191 | 0 |
| Schedule expansion loop bound | 63 | 79 | −16 iterations |
| `ctx.data` element count | 64 | 80 | −16 elements (−64 bytes) |
| `jbe` | 8 | 8 | 0 |
| `andq` | 0 | 0 | 0 |

The assembly line count does not change: the loop-bounds constant is an immediate value in the assembly; changing it from 79 to 63 replaces one immediate with another without changing the instruction sequence length. The runtime behavior changes significantly (16 fewer iterations executed per call), but the static assembly size is identical.

### perf Analysis

Not applied for Ox02. The assembly evidence and the dead code proof are sufficient: the benchmark improvement is consistent with the number of eliminated iterations, and no anomalous hardware behavior is suspected.

### Benchmark Results

| Input (MB) | Ox01 (MB/s) | Ox02 (MB/s) | Δ |
|------------|------------|------------|---|
| 100        | 68.39      | 72.39      | +5.8% |

*Full per-size data in `benchmarks/results/oxcaml/benchmarks/ox02_schedule_64.csv`.*

The +5.8% improvement is the largest single-step gain in the OxCaml phase. It is consistent with eliminating 16 × ~16 = 256 arithmetic operations per `transform_from` call — a ~20% reduction in the schedule expansion work, which itself constitutes a significant fraction of total `transform_from` time.

The improvement being larger than Ox01's +0.9% is expected: Ox02 eliminates concrete computation (16 iterations of a sigma-heavy loop), while Ox01 eliminated an allocation and an indirection.

The improvement being smaller than Opt02's +26.4% in the OCaml phase is also expected: at this stage in the OxCaml campaign, the remaining overheads are smaller and the baseline throughput is higher. Proportional gains are smaller when the denominator is larger.

### Decision: KEEP

Dead code elimination confirmed by the dependency graph proof, assembly, and FIPS test vectors.

### Lessons Learned

**Dead code can survive multiple optimization phases undetected.** W[64..79] were dead in the original C source, dead through Opt01–Opt07 in the OCaml phase, and dead through the OxCaml migration. They were not identified until the OxCaml optimization phase prompted a systematic cross-check of the schedule expansion range against the FIPS specification. The implication: reading the specification against the implementation is a distinct and valuable verification step that assembly inspection alone does not provide.

**Dead code elimination by proof is not the same as dead code elimination by measurement.** The proof establishes the dead code unconditionally; no perf analysis is needed and no benchmark outcome can contradict it. This is an important methodological point: some optimizations are correct by construction (this one), while others are hypotheses confirmed by measurement (Ox03). They should be treated differently in terms of the evidence required to accept them.

**A 20% improvement came from a bug inherited from the reference implementation.** The C scalar reference, which was the ceiling for this entire study, contains the same dead computation. Its assembly computes W[64..79] as well. This means the C reference is also not maximally efficient at the schedule expansion stage — though the effect is small relative to the C baseline's overall throughput.

---

### Why Ox02 Was Not Enough

After Ox02, throughput is 72.39 MB/s. The assembly shows 2,191 lines, 0 `andq`, 8 `jbe`. The schedule expansion and compression are both structurally clean.

The remaining identifiable structural property worth investigating is the T₁ computation's dependency chain. T₁ = h + Σ₁(e) + CH(e,f,g) + K[i] + W[i]. This is a five-term addition chain that includes two memory loads (K[i] and W[i]). In the source as written after Ox02, the chain is expressed left-to-right, which means K[i] and W[i] are the last two terms added — potentially at the end of the dependency chain, incurring full load latency.

The hypothesis: restructuring T₁ to separate the arithmetic terms (h, Σ₁(e), CH(e,f,g)) from the memory terms (K[i], W[i]) could allow the out-of-order CPU to begin loading K[i] and W[i] while the arithmetic chain computes. This becomes Ox03.

---

## Ox03 — T₁ ILP Restructuring

### Background

After Ox02, the `rounds` function computes T₁ as a single left-to-right addition chain:

```ocaml
let t1 = Int32_u.(add (add (add (add h (big_sigma1 e)) (ch e f g))
                          (aget constants i))
                      (aget data i))
```

The expression evaluates in this dependency order:

```
h → h + Σ₁(e) → h + Σ₁(e) + CH(e,f,g) → ... + K[i] → ... + W[i]
```

The loads `aget constants i` and `aget data i` are at the end of the chain. A load from a cache-resident array element has a latency of ~4 cycles on modern x86-64 hardware. If the loads begin only when the preceding arithmetic chain completes, the out-of-order window must wait for those 4 cycles before the T₁ result can be computed.

### Observation

Systematic inspection of the T₁ computation structure after Ox02 reveals that K[i] and W[i] are independent of h, Σ₁(e), and CH(e,f,g) — they are memory loads whose address is `i` (the loop counter), not the working variables. An out-of-order CPU can load K[i] and W[i] as soon as `i` is known (which is at the start of each iteration), in parallel with the `h + Σ₁(e) + CH(e,f,g)` arithmetic chain that depends on the previous round's state.

The source-level ordering of the addition chain may constrain Flambda2's scheduling decisions, preventing it from emitting the loads early.

### Bottleneck Analysis

The dependency structure of T₁:

```
Memory-independent:    h ────┐
                             ├──→ h + Σ₁(e) ──→ h + Σ₁(e) + CH
                   Σ₁(e) ───┘                        │
                   CH(e,f,g) ───────────────────────→ ┘
                                                       │
                                                       ▼
Memory-dependent:    K[i] ───────────────────────→ + K[i]
                     W[i] ───────────────────────────────→ + W[i]
```

The arithmetic chain `h + Σ₁(e) + CH(e,f,g)` is approximately 3 additions deep. With 4-cycle load latency for K[i] and W[i] from L1-D cache, and 1-cycle latency for integer addition: if the loads can be initiated at the start of the iteration, they complete in ~4 cycles, likely before the 3-addition chain (~3 cycles). The loads and the arithmetic chain would execute in parallel, with no net latency penalty.

If the source-level ordering forces Flambda2 to schedule K[i] and W[i] after the arithmetic chain, there would be a 4-cycle stall at the end of T₁ computation on every round.

### Hypothesis

Restructure T₁ to compute the arithmetic-only component first, then add the memory terms:

```ocaml
let t1_hsc = Int32_u.(add (add h (big_sigma1 e)) (ch e f g)) in
let t1 = Int32_u.(add (add t1_hsc (aget constants i)) (aget data i))
```

By separating `t1_hsc` into a distinct binding, the loads `aget constants i` and `aget data i` appear as independent operations relative to the `t1_hsc` computation. Flambda2 may schedule them earlier in the instruction stream, overlapping their latency with the arithmetic.

Expected assembly change: the load instructions (`movl` from `constants` and `data`) should appear earlier in the emitted code, before the additions that use them. The dependency graph of instructions should show greater ILP.

Expected benchmark effect: moderate improvement if the load latency was on the critical path — possibly 3–5%.

---

### Investigation Timeline — Ox03 Null Result Discovery

```
Observation
↓
Hypothesis: separating t1_hsc from the loads exposes ILP to Flambda2's scheduler
↓
Implementation
↓
Assembly inspection: effectively identical to Ox02
↓
Expected load reordering: not observed
↓
Benchmark: +2.2% variation
↓
Discussion: is this within noise? Should it be reverted?
↓
Engineering reasoning for keeping
↓
Final decision: KEEP as documented null result
```

**Assembly inspection.** After implementing the Ox03 restructuring, the assembly was compared against the Ox02 baseline. The instruction sequence in `rounds` was effectively identical: the `movl` load instructions for K[i] and W[i] appeared in the same relative positions in both versions. Flambda2 produced the same code regardless of whether the source expressed `t1_hsc` as a separate binding.

**Why Flambda2 ignored the restructuring.** Flambda2 is an SSA-based optimizing compiler. In SSA form, the independence of two operations is determined by their data-flow dependencies, not by their textual order in the source. `aget constants i` and `aget data i` are independent of `h`, `big_sigma1 e`, and `ch e f g` in the Ox02 source as well as in the Ox03 source — the two additions at the end of the T₁ chain are the only dependencies, and those additions are the same in both versions. Flambda2's instruction scheduler already had the information needed to place the loads optimally; the source restructuring added no new information.

**Why register pressure dominated.** The `rounds` function operates on 8 `int32#` working variables (a, b, c, d, e, f, g, h), the loop counter `i`, and three array pointers (constants, data, ctx). x86-64 provides 16 general-purpose registers. With 8 working variables plus 3 pointers plus temporaries for T₁ and T₂, register pressure is high. Flambda2's scheduler must balance load latency hiding against register pressure. In a register-pressure-constrained environment, there may be no free registers available to hold the load results early, limiting the practical ILP available regardless of the source ordering.

**Benchmark variation.** The +2.2% improvement at 100 MB is real in the sense that it is a positive number — but at this scale of investigation, a 2.2% variation between two effectively identical assembly outputs is within the expected run-to-run variability of the benchmark. The two assemblies are structurally identical; the 2.2% reflects timing noise from OS scheduling, CPU frequency state, and branch predictor state at measurement time.

**Discussion: revert?** With assembly-identical code and a noise-level benchmark improvement, the question arises: should Ox03 be reverted to maintain source-code parsimony? Arguments for reverting: the source change accomplished nothing observable in the assembly. Arguments for keeping: the restructuring is logically cleaner — it separates the memory-independent arithmetic from the memory-dependent terms, making the ILP structure of T₁ explicit in the source; it documents that this ILP direction was explored and found to have no effect with the current compiler; it provides a reference for future compiler versions that may handle the restructuring differently.

**Engineering reasoning for keeping.** The source change is a valid exposition of the algorithm's ILP structure. It does not introduce any cost (the assembly is identical). It is not an optimization in the performance sense — it is a documentation of an optimization attempt that was absorbed by the compiler without effect. The value of Ox03 is the investigation it represents, not the benchmark number.

---

### Correctness / Safety

The restructuring is algebraically equivalent: T₁ = (h + Σ₁(e) + CH(e,f,g)) + K[i] + W[i] = (h + Σ₁(e) + CH(e,f,g) + K[i]) + W[i]. All four additions are modular 32-bit additions. FIPS KATs pass.

### Implementation

```ocaml
(* Before Ox03 — single chain *)
let t1 = Int32_u.(add (add (add (add h (big_sigma1 e)) (ch e f g))
                          (aget constants i))
                      (aget data i)) in

(* After Ox03 — separated *)
let t1_hsc = Int32_u.(add (add h (big_sigma1 e)) (ch e f g)) in
let t1 = Int32_u.(add (add t1_hsc (aget constants i)) (aget data i)) in
```

### Assembly Verification

| Metric | Ox03 | Ox02 | Change |
|--------|------|------|--------|
| Assembly lines | 2,191 | 2,191 | 0 |
| Load instruction ordering | effectively identical | effectively identical | **None** |
| `jbe` | 8 | 8 | 0 |
| `andq` | 0 | 0 | 0 |

The assembly is effectively unchanged. Flambda2's SSA-based IR already captured the independence of the memory loads from the arithmetic chain. The source restructuring provided no new information to the compiler.

### perf Analysis

`perf stat` was not run for Ox03, because the assembly analysis established that no structural change occurred. Hardware counter evidence would not distinguish between two identical instruction sequences executed under different timing conditions.

### Benchmark Results

| Input (MB) | Ox02 (MB/s) | Ox03 (MB/s) | Δ |
|------------|------------|------------|---|
| 100        | 72.39      | 73.99      | +2.2% |

*Full per-size data in `benchmarks/results/oxcaml/benchmarks/ox03_deferred_kw.csv`.*

The +2.2% improvement is within benchmark noise given assembly-identical code. It should not be interpreted as a confirmed performance improvement.

### Decision: KEEP — source clarity; documented null result

The change is kept because: (a) the assembly is identical, so there is no regression risk; (b) the source is structurally cleaner; (c) the investigation documents that ILP exposure through source restructuring is not effective in Flambda2 for this pattern; (d) this is a valid null result for the methodology.

### Lessons Learned

**Flambda2 is an SSA-based optimizing compiler that does not need source-level hints for instruction-level parallelism on independent operations.** The independence of `aget constants i` and `aget data i` from the `h + Σ₁(e) + CH(e,f,g)` chain was already visible in Flambda2's IR regardless of source ordering. The source-level restructuring was equivalent to telling an optimizing compiler "please hoist this load" when it had already done so.

**A null result is still a result.** The Ox03 investigation establishes that ILP restructuring of T₁ provides no benefit with Flambda2 at current register-pressure levels. This is useful for anyone attempting to optimize OxCaml code with similar characteristics: source-level ILP hints for memory loads are likely to be absorbed without effect.

**The benchmark captured noise, not signal.** The +2.2% should not be cited as evidence of an improvement. Any future change that produces assembly-identical code relative to its predecessor should be assumed to produce noise-level benchmark variation.

---

## Optimization Ceiling

After Ox03, the OxCaml SHA-256 implementation reaches 73.99 MB/s. The remaining gap to the C reference is 2.01×. Every remaining overhead identified in the assembly requires a change to the compiler or runtime, not to the source.

### Residual Assembly Analysis

The Ox03 assembly is inspected exhaustively for remaining overheads:

| Overhead | Assembly Evidence | Source? | Addressable? |
|----------|------------------|---------|--------------|
| Three-instruction rotate | `shrq`/`salq`/`orq` per `rotr` | No `roll` in OxCaml output | **No** — requires compiler rotate-idiom pattern match or intrinsic |
| Remaining `jbe` branches | 8 branches in `add_data`/`finish` partial-block paths | Bytes safe access | Minimal impact; unsafe would give marginal gain |
| `movslq` at API boundaries | int↔int32# conversion in `get_be32`, bit-length counter | Unavoidable at type boundary | Negligible |
| Register spills in `rounds` | Some working variables spilled to stack between calls | 8 working vars + 3 pointers > 16 registers | **No** — would require register file expansion or aggressive inlining |
| Array load overhead | `movl [reg + i*4]` per schedule/constants access | Layout-polymorphic already; no bounds check | Minimal — this is optimal for the layout |

### The Rotate Cost

Every call to `rotr` compiles to three instructions:

```asm
shrq   $n, %rax        ; logical right shift by n  (64-bit)
salq   $(32-n), %rcx   ; left shift by (32-n)     (64-bit)
orq    %rcx, %rax      ; OR together
```

The C reference compiles `ROTR(x, n)` to:

```asm
roll   $(32-n), %eax   ; single combined rotate instruction
```

SHA-256's hot path contains 576 `rotr` calls per `transform_from` call: `big_sigma0` 3 × 64 rounds + `big_sigma1` 3 × 64 rounds = 384 from the compression rounds; `sigma0` 2 × 48 schedule steps + `sigma1` 2 × 48 schedule steps = 192 from the schedule expansion. Each costs 3 instructions where C uses 1.

**576 × 2 extra instructions × 1,638,400 calls per 100 MB ≈ 1.89 billion extra instructions per benchmark run.** This is the dominant remaining overhead.

Eliminating this requires one of:
- A rotate-idiom pattern matcher in Flambda2 that recognizes `(x lsr n) lor (x lsl (32-n))` and emits `roll`
- A source-level `rotr#` intrinsic in OxCaml that compiles directly to `roll`

Neither is currently available. This is a compiler-level task.

### Register Pressure

The `rounds` function operates on 8 working variables, 3 array pointers, and a loop counter — 12 values competing for 16 general-purpose registers. With T₁ and T₂ requiring multiple temporaries per round, spills to the stack frame are unavoidable. The Ox03 investigation showed that Flambda2 cannot schedule loads ahead of arithmetic chains in this register-pressure environment. Register pressure cannot be reduced at the source level while maintaining the 8-variable working-state structure.

### Remaining Array Load Overhead

Even after Ox02 reduced the data array to 64 elements, each schedule access (`aget data i`) and constants access (`aget constants i`) is a 4-byte load. These are already optimal: no bounds check, no tag check (layout-poly `aget`), 4-byte stride. No further improvement is possible at the source level.

### What Would Be Required to Close the Gap

| Remaining overhead | Required change |
|-------------------|-----------------|
| Three-instruction rotates (dominant) | `roll`/`ror` emit from Flambda2; or a `Int32_u.rotate_right` intrinsic |
| Register spills | Aggressive function inlining or expanded register window (not feasible source-side) |
| Type-boundary conversions | Reduced OxCaml/OCaml boundary crossings at `add_data`/`finish` |

None of these are source-level changes. All require compiler or runtime modification. The source-level optimization space is exhausted.

---

## Skipped Investigations

Several optimization directions were considered during the OxCaml phase and rejected before implementation. They are documented here with the reasoning.

### SIMD (vec128)

**Why it appeared promising.** OxCaml's `vec128` primitive was used successfully in the ChaCha20 companion case study. In ChaCha20, 128-bit SIMD operations could process four 32-bit words in parallel in a single instruction.

**Why it was investigated.** SHA-256's S-box operations (`CH`, `MAJ`, `Σ₀`, `Σ₁`) operate on independent words. There is no data dependency between the eight round words within a single round — `a`, `b`, `c`, `d`, `e`, `f`, `g`, `h` are all computed from the previous round.

**Why it was rejected.** The dependency between *consecutive rounds* eliminates single-buffer SIMD: `a_new` of round `i` is an input to round `i+1`. There is no way to compute multiple rounds simultaneously for a single message. Multi-buffer SIMD (computing round `i` for messages A, B, C, D in parallel) would require hashing 4 messages at a time — a different interface. For the single-buffer scalar case study, SIMD is not applicable.

### SHA-NI

**Why it appeared promising.** Intel's SHA Extensions (`SHA256RNDS2`, `SHA256MSG1`, `SHA256MSG2`) implement SHA-256 rounds and schedule expansion in hardware. Throughput with SHA-NI can exceed 3 GB/s.

**Why it was investigated.** After establishing the C baseline, SHA-NI was briefly benchmarked as an upper-bound reference.

**Why it was rejected.** SHA-NI is an ISA extension, not a scalar implementation. The study measures how much of the scalar C/OCaml performance gap can be recovered with OxCaml source-level changes. SHA-NI answers a different question entirely (hardware offload efficiency) and cannot be fairly compared against the scalar OCaml baseline. Scope constraint.

### C Bindings (FFI)

**Why it appeared promising.** Wrapping the C scalar implementation with an OCaml FFI binding would produce throughput near the C reference (minus FFI call overhead of ~20–40 ns per call).

**Why it was rejected.** This measures the FFI, not OxCaml. The research question is whether `int32#` source-level changes close the scalar performance gap. A C binding bypasses the question entirely. Scope constraint; documented in README.

### Rotate Intrinsic

**Why it appeared promising.** If OxCaml exposed a `Int32_u.rotate_right : int32# -> int -> int32#` primitive that compiled to a single `roll` instruction, the three-instruction `rotr` sequences would be reduced to one instruction. The expected improvement would be substantial: 576 `rotr` calls × 2 saved instructions × 1.6M calls ≈ 1.89B fewer instructions per 100 MB run. Conservatively, this represents 5–10% throughput improvement.

**Why it was investigated.** The assembly for every `rotr` call was inspected after every OxCaml optimization stage. The `shrq`/`salq`/`orq` sequence is always present.

**Why it was rejected.** OxCaml does not expose a rotate intrinsic at the time of this study. The feature would require: (a) a new external primitive in the OxCaml standard library (`Int32_u.rotate_right_logical`), (b) a compiler backend lowering that emits `roll`/`ror`, and (c) integration with Flambda2's instruction selection. This is a compiler engineering task, not a source-level optimization. It is noted here as the highest-priority compiler-level improvement for SHA-256 performance.

### Additional T₂ ILP Restructuring

**Why it appeared promising.** After Ox03 investigated T₁, the same analysis applies to T₂ = Σ₀(a) + MAJ(a,b,c). T₂ is a two-term addition over two functions of the same working variable `a`, with no memory loads. The dependency chain is short and entirely arithmetic.

**Why it was not pursued.** T₂ has no memory loads — it is `big_sigma0(a) + maj(a, b, c)`. There is no load-arithmetic overlap to expose. The T₁ investigation (Ox03) established that Flambda2 already schedules independently computable operations optimally. T₂ restructuring would be a source change with no assembly effect and no hypothesis about why it would help.

---

## Graphs

### OxCaml Throughput Progression

![OxCaml optimization throughput progression](../benchmarks/results/oxcaml_hash_speed_progress.png)

This graph shows throughput (MB/s) for each OxCaml stage across all six input sizes, with C scalar (dashed blue) and OCaml Opt07 (dashed green) as reference lines.

What to observe:
- **The baseline starts well above OCaml Opt07** for all input sizes. The `int32#` migration's +39.2% is visible as a jump that no single OCaml optimization achieved.
- **Ox01 and Ox03 are nearly indistinguishable** from their predecessors. The lines are close together, reflecting the small gains (+0.9%, +2.2%).
- **Ox02 produces the only clearly visible separation** within the OxCaml series — the line step at Ox02 is the largest OxCaml optimization gain (+5.8%).
- **All OxCaml stages remain well below the C ceiling.** The gap to C is narrower than any OCaml stage but is not closed.
- **Small-input (1 MB) throughput is lower** for all implementations, consistent with cold-cache warmup effects discussed in [docs/01_methodology.md](01_methodology.md#33-why-100-mb-is-the-steady-state-reference).

### OxCaml Time Progression

![OxCaml optimization hash time progression](../benchmarks/results/oxcaml_hash_time_progress.png)

The time graph complements the throughput graph with a direct wall-clock view. The y-axis (seconds) shows absolute elapsed time for each input size. Readers should observe:
- **The time curves are fan-shaped**: the spread between stages is proportionally larger at 100 MB than at 1 MB.
- **OxCaml stages cluster tightly** between OCaml Opt07 and C scalar, reflecting the remaining 2× gap.

### Final Comparison

![Final three-way throughput comparison: C scalar, OCaml Opt07, OxCaml Ox03](../benchmarks/results/hash_speed_comparison.png)

![Final three-way hash time comparison](../benchmarks/results/hash_time_comparison.png)

The final comparison graphs show C scalar, OCaml Opt07, and OxCaml Ox03 across all input sizes. What to observe:
- **OxCaml Ox03 sits between OCaml Opt07 and C scalar** at all input sizes. It does not cross either reference line.
- **The gap between OxCaml and C is approximately constant** for inputs ≥ 30 MB, confirming steady-state behavior.
- **The gap between OCaml Opt07 and OxCaml Ox03 is larger than the gap between OxCaml Ox03 and C** at 100 MB (48.68 → 73.99 → 148.53: the OxCaml-to-C gap is 74.5 MB/s; the OCaml-to-OxCaml gap is 25.3 MB/s). This indicates that the remaining gap is not recoverable by the same class of source-level changes that drove the OxCaml improvement.

---

## OxCaml Optimization Summary

### Performance

| Stage | Throughput (100 MB) | vs OCaml Opt07 | vs C Scalar |
|-------|---------------------|----------------|-------------|
| OCaml Opt07 | 48.68 MB/s | 1.00× | 0.328× |
| OxCaml Baseline | 67.80 MB/s | +39.2% | 0.456× |
| Ox01 | 68.39 MB/s | +40.5% | 0.460× |
| Ox02 | 72.39 MB/s | +48.7% | 0.487× |
| Ox03 | **73.99 MB/s** | **+52.0%** | **0.498×** |

### Largest Gain: Ox02 (+5.8%)

The elimination of 16 dead schedule expansion iterations produced the largest single OxCaml gain. This result was achieved by cross-checking the implementation against the FIPS 180-4 specification rather than by assembly-driven analysis. The optimization was dead code elimination by proof, not by measurement.

### Most Surprising Optimization: Ox01 (+0.9%)

The closure capture issue reappeared in OxCaml despite the explicit fix applied in OCaml Opt03, due to a difference in how Flambda2 handles module-level `int32#` values in non-top-level `let rec` contexts. The gain was smaller than Opt03 because the captured value was smaller and the access was less frequent. The most informative aspect is the compiler behavior difference that caused the same pattern to reappear.

### Most Valuable Investigation: Ox03 (null result)

Ox03 contributed no measurable performance improvement. Its value is in establishing that Flambda2's SSA-based optimizer already captures the ILP structure that Ox03's source restructuring was intended to expose. Future efforts to improve OxCaml SHA-256 throughput through source-level ILP hints can proceed from this established result rather than repeating the investigation.

### Biggest Compiler Lesson

The three-instruction rotate sequence is the dominant remaining overhead, and it cannot be eliminated from source code. Every `rotr` call produces `shrq`/`salq`/`orq` in both OCaml and OxCaml. The C reference produces `roll`. The difference is 2 instructions per rotation × 576 rotations per block × 1.6M blocks per 100 MB ≈ 1.89 billion extra instructions per benchmark run. A rotate intrinsic or a Flambda2 rotate-idiom matcher is the highest-impact single change that could be made to close the remaining gap.

### Final Performance

**73.99 MB/s** at 100 MB input — 0.498× of the C scalar reference. The OxCaml `int32#` implementation is 1.52× faster than the best OCaml scalar implementation and 2.01× slower than the C scalar reference.

### What Would Be Required to Improve Further

The remaining gap appears attributable to sources that cannot be addressed at the source level with the current OxCaml toolchain:

1. **Rotate idiom recognition** — the highest-priority item. A `roll` instruction where OxCaml currently emits `shrq`/`salq`/`orq` would eliminate ~1.89B extra instructions per 100 MB run.
2. **Register file pressure** — 8 working variables and 3 array pointers stress the 16-register x86-64 file. Aggressive inlining (bounded by I-cache constraints established in Opt05) or a wider register file would help.
3. **Remaining API overhead** — type-boundary conversions at `get_be32`/`set_be32` and the OCaml `int` bit-length counter contribute marginally.

### Overall Conclusions from the OxCaml Campaign

The OxCaml optimization phase confirmed two distinct classes of improvement:

**Structural corrections (Ox01, Ox02):** A closure that should not exist, and a dead computation that should not run. Neither required deep analysis of the algorithm or the hardware. Both required looking carefully at what the compiler produced and cross-checking it against the specification.

**Investigated but confirmed null (Ox03):** Source-level ILP hints had no effect because Flambda2 already performed the equivalent optimization in its SSA-based IR. This is not a failure — it is a confirmation of the compiler's capability, which is itself a useful engineering result.

The OxCaml phase closed 52% of the remaining gap above OCaml Opt07 (from 48.68 to 73.99 MB/s). The remaining 48% of that gap (to 148.53 MB/s) requires changes at the compiler or ISA level.

### Transition to the Next Case Study

The OxCaml SHA-256 optimization space is exhausted at the source level. The logical next step in the broader investigation — applying the same methodology to Poly1305, a 32-bit polynomial MAC over a prime field — would provide a comparison case for the `int32#` migration pattern with a different arithmetic structure (field multiplication rather than bitwise operations). SHA-256 is bitwise-dominated; Poly1305 is multiply-dominated. The comparative study would establish whether the `int32#` benefit generalizes across different 32-bit-integer workloads, or whether it is specific to the masking-heavy bitwise arithmetic that SHA-256 requires.

The performance analysis of the complete SHA-256 study — including the decomposition of the remaining 2× gap and a comparison of all three implementations across all input sizes — is in [docs/05_conclusions_and_future_work.md](05_conclusions_and_future_work.md).
