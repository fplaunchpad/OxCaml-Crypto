# Nomenclature

This document defines every term used in this report. Terms are not redefined in later chapters; all documents rely on the definitions here.

---

## Algorithm Terms

**ChaCha20**
A stream cipher specified in RFC 8439. Operates on a 512-bit (16-word) state using add-rotate-XOR (ARX) operations. Produces a keystream by applying 20 rounds to the state and XORing the result with plaintext.

**ARX**
Add-Rotate-XOR. The operation class that ChaCha20 is built from. Every step modifies state words using 32-bit addition, bitwise rotation, and XOR. No S-boxes, no table lookups.

**quarterround**
The core operation of ChaCha20. Applies four ARX steps to four state words. Defined in RFC 8439, Section 2.1.

**double round**
Two successive quarterround applications: one to the columns of the 4×4 state matrix, one to the diagonals. A single double round constitutes two of the 20 ChaCha20 rounds. ChaCha20 applies 10 double rounds per block.

**block**
One invocation of the ChaCha20 core function. Produces 64 bytes of keystream from a 512-bit state. The counter field of the state is incremented between blocks.

---

## Implementation Terms

**scalar**
An implementation that processes data using ordinary integer arithmetic, one 32-bit word at a time, without SIMD vector instructions.

**SIMD (Single Instruction, Multiple Data)**
An implementation that uses vector instructions to operate on multiple data elements in a single instruction. In this study, all SIMD implementations use 128-bit SSE2 and SSSE3 vector operations, processing four 32-bit words simultaneously.

**baseline**
The initial, unoptimized implementation of a given variant. Serves as the starting point for optimization and the reference against which all subsequent stages are measured.

**structural equivalence**
Two implementations are structurally equivalent if they perform the same sequence of operations in the same order using the same data layout. Structural equivalence is a prerequisite for fair cross-language performance comparison. A gap between structurally equivalent implementations reflects compiler and runtime differences, not algorithmic differences.

**algorithmic equivalence**
Two implementations are algorithmically equivalent if they produce the same output for the same input through the same algorithm. Algorithmic equivalence is a weaker condition than structural equivalence: all structurally equivalent implementations are algorithmically equivalent, but not all algorithmically equivalent implementations are structurally equivalent.

---

## OCaml-Specific Terms

**integer tagging**
OCaml represents every `int` value at runtime as `2n + 1` (low bit always set to 1). Arithmetic operations must re-tag results. This adds instructions that have no equivalent in C.

**bounds check**
A runtime check emitted by the OCaml compiler before an array access to verify that the index is within bounds. Generates a `cmpq` / `jae` instruction pair in the assembly. The compiler eliminates bounds checks it can prove are unnecessary through range inference.

**range inference**
An OCaml compiler analysis that tracks provably safe array index ranges. When safe array accesses establish that an index is in bounds, the compiler eliminates subsequent redundant checks for the same array in the same function scope.

---

## Optimization Terms

**optimization stage**
A single named change applied to one implementation (for example, OCaml Opt01, OxCaml Opt03). Each stage begins from the previous stage's state and is evaluated independently.

**keep**
A decision to retain an optimization. Required evidence: measurable assembly improvement, benchmark improvement above noise, RFC validation passes.

**revert**
A decision to discard an optimization and restore the previous state. Triggered when assembly inspection, benchmarking, or RFC validation reveals no improvement or a regression.

**assembly-guided**
Describes the optimization methodology used throughout this study. Every optimization decision is grounded in changes to the generated machine code, not in benchmark results alone.

---

## Measurement Terms

**instruction count**
The number of machine instructions on the measured hot path, read directly from the generated assembly file. Used as the primary indicator of optimization impact before benchmarking. A change in instruction count that does not produce a benchmark change indicates instruction-level noise or compensating effects elsewhere.

**throughput**
Encryption or decryption speed expressed in megabytes per second (MB/s). Computed as input size divided by measured wall-clock time. The primary benchmark metric in this study.

**RFC validation**
Verification that an implementation produces the correct output for the test vectors defined in RFC 8439. Applied after every optimization stage to confirm correctness was preserved.
