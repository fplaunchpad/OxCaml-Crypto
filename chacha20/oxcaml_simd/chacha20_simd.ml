(* OxCaml SIMD ChaCha20 — RFC 7539 compliant.
   Each [@@builtin] compiles to a single x86 instruction in native code.
   Requires: -extension simd_beta, native compilation only. *)

(* ---- Load / store -------------------------------------------------------- *)
external load  : bytes -> int -> int32x4 = "%caml_bytes_getu128u"
external store : bytes -> int -> int32x4 -> unit = "%caml_bytes_setu128u"

(* ---- Raw SIMD primitives ------------------------------------------------- *)
(* PADDD: packed 32-bit add mod 2^32 per lane. *)
external vec_add : (int32x4[@unboxed]) -> (int32x4[@unboxed]) -> (int32x4[@unboxed])
  = "caml_vec128_unreachable" "caml_sse2_int32x4_add" [@@noalloc] [@@builtin]

(* XORPS: bitwise XOR across all 128 bits. *)
external vec_xor : (int32x4[@unboxed]) -> (int32x4[@unboxed]) -> (int32x4[@unboxed])
  = "caml_vec128_unreachable" "caml_sse_vec128_xor" [@@noalloc] [@@builtin]

(* PSLLD imm8: shift each 32-bit lane left by immediate. *)
external slli : (int[@untagged]) -> (int32x4[@unboxed]) -> (int32x4[@unboxed])
  = "caml_vec128_unreachable" "caml_sse2_int32x4_slli" [@@noalloc] [@@builtin]

(* PSRLD imm8: shift each 32-bit lane right (logical) by immediate. *)
external srli : (int[@untagged]) -> (int32x4[@unboxed]) -> (int32x4[@unboxed])
  = "caml_vec128_unreachable" "caml_sse2_int32x4_srli" [@@noalloc] [@@builtin]

(* PSHUFB: byte-permute within 128-bit register using a 16-byte control mask. *)
external pshufb : (int32x4[@unboxed]) -> (int32x4[@unboxed]) -> (int32x4[@unboxed])
  = "caml_vec128_unreachable" "caml_ssse3_vec128_shuffle_8" [@@noalloc] [@@builtin]

(* SHUFPS imm8: lower 2 words from src1, upper 2 from src2.
   When src1 = src2, identical to PSHUFD — single-source 32-bit word shuffle. *)
external shufps : (int[@untagged]) -> (int32x4[@unboxed]) -> (int32x4[@unboxed]) -> (int32x4[@unboxed])
  = "caml_vec128_unreachable" "caml_sse_vec128_shuffle_32" [@@noalloc] [@@builtin]

(* ---- PSHUFB masks for bit-rotations within each 32-bit lane -------------- *)
(* Words are little-endian: byte[0]=LSB.
   rot16: swap 16-bit halves → [b2,b3,b0,b1] per word.
   rot8:  cyclic byte left   → [b3,b0,b1,b2] per word. *)
let rot16_mask_bytes =
  let b = Bytes.create 16 in
  Array.iteri (Bytes.set b)
    [| '\x02';'\x03';'\x00';'\x01'; '\x06';'\x07';'\x04';'\x05';
       '\x0a';'\x0b';'\x08';'\x09'; '\x0e';'\x0f';'\x0c';'\x0d' |];
  b

let rot8_mask_bytes =
  let b = Bytes.create 16 in
  Array.iteri (Bytes.set b)
    [| '\x03';'\x00';'\x01';'\x02'; '\x07';'\x04';'\x05';'\x06';
       '\x0b';'\x08';'\x09';'\x0a'; '\x0f';'\x0c';'\x0d';'\x0e' |];
  b

(* ---- Bit-rotations within each 32-bit lane ------------------------------- *)
(* rotate_left_16 and rotate_left_8 accept a pre-loaded mask so callers can
   hoist the load out of hot loops rather than reloading on every invocation. *)
let[@inline] rotate_left_16 mask16 v = pshufb v mask16
let[@inline] rotate_left_12 v = vec_xor (slli 12 v) (srli 20 v)
let[@inline] rotate_left_8  mask8  v = pshufb v mask8
let[@inline] rotate_left_7  v = vec_xor (slli  7 v) (srli 25 v)

(* ---- Word-lane rotation inside int32x4 (SHUFPS with src1=src2 = PSHUFD) -- *)
(* imm8 encodes: bits[1:0]→dest[0], [3:2]→dest[1], [5:4]→dest[2], [7:6]→dest[3] *)
let[@inline] rot_w1 v = shufps 0x39 v v   (* [w0,w1,w2,w3] → [w1,w2,w3,w0] *)
let[@inline] rot_w2 v = shufps 0x4E v v   (* [w0,w1,w2,w3] → [w2,w3,w0,w1] *)
let[@inline] rot_w3 v = shufps 0x93 v v   (* [w0,w1,w2,w3] → [w3,w0,w1,w2] *)

(* ---- ChaCha20 quarter-round (RFC 7539 §2.1) ------------------------------- *)
(* a,b,c,d are each int32x4 — one call runs 4 independent QRs, one per lane.
   mask16/mask8 are the pre-loaded PSHUFB constants for the rot16/rot8 steps. *)
let[@inline] quarterround mask16 mask8 a b c d =
  let a = vec_add a b in let d = vec_xor d a in let d = rotate_left_16 mask16 d in
  let c = vec_add c d in let b = vec_xor b c in let b = rotate_left_12 b in
  let a = vec_add a b in let d = vec_xor d a in let d = rotate_left_8  mask8  d in
  let c = vec_add c d in let b = vec_xor b c in let b = rotate_left_7  b in
  (a, b, c, d)

(* ---- Double-round: column round then diagonal round (RFC 7539 §2.2) ------ *)
(*
   State rows: a=[s0..s3]  b=[s4..s7]  c=[s8..s11]  d=[s12..s15]
   Column QR: quarterround(a,b,c,d) hits all 4 columns simultaneously.
   Diagonal QR: rotate rows to bring diagonals into "column" position,
                run QR, then undo the rotations.
     b →rot_w1→ [s5,s6,s7,s4]   (undo: rot_w3)
     c →rot_w2→ [s10,s11,s8,s9] (undo: rot_w2)
     d →rot_w3→ [s15,s12,s13,s14](undo: rot_w1)
*)
let[@inline] double_round mask16 mask8 a b c d =
  let (a, b, c, d) = quarterround mask16 mask8 a b c d in
  let b = rot_w1 b in let c = rot_w2 c in let d = rot_w3 d in
  let (a, b, c, d) = quarterround mask16 mask8 a b c d in
  let b = rot_w3 b in let c = rot_w2 c in let d = rot_w1 d in
  (a, b, c, d)

(* ---- ChaCha20 constants: "expand 32-byte k" in LE ------------------------ *)
let constant_bytes = Bytes.of_string "expand 32-byte k"

(* ---- ChaCha20 block function (RFC 7539 §2.3) ------------------------------ *)
let chacha20_block ~(key : bytes) ~(nonce : bytes) ~counter =
  (* Build row3: [counter_le32 || nonce_12bytes] *)
  let ctr_nonce = Bytes.create 16 in
  Bytes.set ctr_nonce 0 (Char.chr ( counter         land 0xFF));
  Bytes.set ctr_nonce 1 (Char.chr ((counter lsr  8) land 0xFF));
  Bytes.set ctr_nonce 2 (Char.chr ((counter lsr 16) land 0xFF));
  Bytes.set ctr_nonce 3 (Char.chr ((counter lsr 24) land 0xFF));
  Bytes.blit nonce 0 ctr_nonce 4 12;
  let s0 = load constant_bytes 0 in
  let s1 = load key 0 in
  let s2 = load key 16 in
  let s3 = load ctr_nonce 0 in
  (* Load PSHUFB masks once here, outside the 10-iteration loop. *)
  let mask16 = load rot16_mask_bytes 0 in
  let mask8  = load rot8_mask_bytes  0 in
  (* 10 double-rounds = 20 rounds total *)
  let rec loop n a b c d =
    if n = 0 then (a, b, c, d)
    else let (a, b, c, d) = double_round mask16 mask8 a b c d in loop (n-1) a b c d
  in
  let (a, b, c, d) = loop 10 s0 s1 s2 s3 in
  let out = Bytes.create 64 in
  store out  0 (vec_add a s0);
  store out 16 (vec_add b s1);
  store out 32 (vec_add c s2);
  store out 48 (vec_add d s3);
  out

(* ---- ChaCha20 stream cipher (RFC 7539 §2.4) ------------------------------- *)
let chacha20_crypt ~(key : bytes) ~(nonce : bytes) ~(initial_counter : int) (msg : bytes) =
  let len = Bytes.length msg in
  let out = Bytes.copy msg in
  let nblocks = len / 64 in
  for i = 0 to nblocks - 1 do
    let ks   = chacha20_block ~key ~nonce ~counter:(initial_counter + i) in
    let base = i * 64 in
    store out  base      (vec_xor (load ks  0) (load out  base     ));
    store out (base+16)  (vec_xor (load ks 16) (load out (base+16) ));
    store out (base+32)  (vec_xor (load ks 32) (load out (base+32) ));
    store out (base+48)  (vec_xor (load ks 48) (load out (base+48) ));
  done;
  let rem = len land 63 in
  if rem > 0 then begin
    let ks   = chacha20_block ~key ~nonce ~counter:(initial_counter + nblocks) in
    let base = nblocks * 64 in
    for j = 0 to rem - 1 do
      Bytes.set out (base + j)
        (Char.chr (Char.code (Bytes.get out (base+j)) lxor Char.code (Bytes.get ks j)))
    done
  end;
  out
