(* OxCaml SHA-256 — int32# migration.
   OxStep02: core type and helper functions only.
   transform / rounds / add_data / finish are stubs — not yet migrated.

   Key changes from Opt07:
     - mask32 eliminated: int32# wraps at 32 bits by construction.
     - rotr / ch / maj / sigma functions all operate on int32#.
     - constants / ctx.state / ctx.data use packed int32# arrays
       (4 bytes per slot instead of 8, better cache density).
     - get_be32 / set_be32 / create / init are stubs in this step. *)

open Stdlib_upstream_compatible

[@@@ocaml.flambda_o3]

(* Primitive array operations for int32# unboxed arrays.
   makearray_dynamic allocates a flat packed array; elements are 32-bit slots.
   aget/aset are layout-polymorphic versions of %array_unsafe_{get,set}. *)
external makearray_dynamic : int -> int32# -> int32# array = "%makearray_dynamic"
external aget : ('a : any mod non_float). 'a array -> int -> 'a = "%array_unsafe_get" [@@layout_poly]
external aset : ('a : any mod non_float). 'a array -> int -> 'a -> unit = "%array_unsafe_set" [@@layout_poly]

(* mask32 = 0xFFFF_FFFF is gone.
   Every int32# operation naturally produces a 32-bit result.
   There are no land mask32 calls anywhere in this file. *)

(* SHA-256 round constants — packed int32# array.
   Memory: 64 × 4 bytes = 256 bytes (vs 512 bytes for int array in Opt07). *)
let constants : int32# array =
  let a = makearray_dynamic 64 #0l in
  aset a  0 #0x428a2f98l; aset a  1 #0x71374491l; aset a  2 #0xb5c0fbcfl; aset a  3 #0xe9b5dba5l;
  aset a  4 #0x3956c25bl; aset a  5 #0x59f111f1l; aset a  6 #0x923f82a4l; aset a  7 #0xab1c5ed5l;
  aset a  8 #0xd807aa98l; aset a  9 #0x12835b01l; aset a 10 #0x243185bel; aset a 11 #0x550c7dc3l;
  aset a 12 #0x72be5d74l; aset a 13 #0x80deb1fel; aset a 14 #0x9bdc06a7l; aset a 15 #0xc19bf174l;
  aset a 16 #0xe49b69c1l; aset a 17 #0xefbe4786l; aset a 18 #0x0fc19dc6l; aset a 19 #0x240ca1ccl;
  aset a 20 #0x2de92c6fl; aset a 21 #0x4a7484aal; aset a 22 #0x5cb0a9dcl; aset a 23 #0x76f988dal;
  aset a 24 #0x983e5152l; aset a 25 #0xa831c66dl; aset a 26 #0xb00327c8l; aset a 27 #0xbf597fc7l;
  aset a 28 #0xc6e00bf3l; aset a 29 #0xd5a79147l; aset a 30 #0x06ca6351l; aset a 31 #0x14292967l;
  aset a 32 #0x27b70a85l; aset a 33 #0x2e1b2138l; aset a 34 #0x4d2c6dfcl; aset a 35 #0x53380d13l;
  aset a 36 #0x650a7354l; aset a 37 #0x766a0abbl; aset a 38 #0x81c2c92el; aset a 39 #0x92722c85l;
  aset a 40 #0xa2bfe8a1l; aset a 41 #0xa81a664bl; aset a 42 #0xc24b8b70l; aset a 43 #0xc76c51a3l;
  aset a 44 #0xd192e819l; aset a 45 #0xd6990624l; aset a 46 #0xf40e3585l; aset a 47 #0x106aa070l;
  aset a 48 #0x19a4c116l; aset a 49 #0x1e376c08l; aset a 50 #0x2748774cl; aset a 51 #0x34b0bcb5l;
  aset a 52 #0x391c0cb3l; aset a 53 #0x4ed8aa4al; aset a 54 #0x5b9cca4fl; aset a 55 #0x682e6ff3l;
  aset a 56 #0x748f82eel; aset a 57 #0x78a5636fl; aset a 58 #0x84c87814l; aset a 59 #0x8cc70208l;
  aset a 60 #0x90befffal; aset a 61 #0xa4506cebl; aset a 62 #0xbef9a3f7l; aset a 63 #0xc67178f2l;
  a

(* C macro: ROTR(x, n) — rotate x right by n bits.
   No land mask32: int32# shift_right_logical already produces a 32-bit value;
   shift_left wraps at 32 bits by the logor representation. *)
let[@inline] rotr (x : int32#) n : int32# =
  Int32_u.logor
    (Int32_u.shift_right_logical x n)
    (Int32_u.shift_left x (32 - n))

(* C macros: CH(x, y, z) and MAJ(x, y, z) — purely bitwise, no masking needed. *)
let[@inline] ch (x : int32#) (y : int32#) (z : int32#) : int32# =
  Int32_u.logxor z (Int32_u.logand x (Int32_u.logxor y z))

let[@inline] maj (x : int32#) (y : int32#) (z : int32#) : int32# =
  Int32_u.logor
    (Int32_u.logand x y)
    (Int32_u.logand z (Int32_u.logor x y))

(* SIGMA0 / SIGMA1 — compression round functions.
   No land mask32: rotr results are int32#; XOR of int32# values is int32#. *)
let[@inline] big_sigma0 (x : int32#) : int32# =
  Int32_u.logxor (Int32_u.logxor (rotr x  2) (rotr x 13)) (rotr x 22)

let[@inline] big_sigma1 (x : int32#) : int32# =
  Int32_u.logxor (Int32_u.logxor (rotr x  6) (rotr x 11)) (rotr x 25)

(* sigma0 / sigma1 — message schedule expansion.
   No land mask32: XOR of int32# values is int32#. *)
let[@inline] small_sigma0 (x : int32#) : int32# =
  Int32_u.logxor
    (Int32_u.logxor (rotr x 7) (rotr x 18))
    (Int32_u.shift_right_logical x 3)

let[@inline] small_sigma1 (x : int32#) : int32# =
  Int32_u.logxor
    (Int32_u.logxor (rotr x 17) (rotr x 19))
    (Int32_u.shift_right_logical x 10)

(* ctx record — state and data now use packed int32# arrays.
   length, numbytes, buffer: unchanged (not on the arithmetic hot path). *)
type ctx = {
  state    : int32# array;  (* 8 words × 4 bytes = 32 bytes, unboxed *)
  length   : int array;     (* 2 × OCaml int; bit-length counter, not hot *)
  mutable numbytes : int;
  buffer   : bytes;         (* 64-byte block buffer *)
  data     : int32# array;  (* 80 words × 4 bytes = 320 bytes, unboxed *)
}

(* --- Not migrated in OxStep02 --- *)

let create () = (assert false : ctx)
let init (_ctx : ctx) = assert false

let get_be32 (_buf : bytes) (_i : int) = (assert false : int32#)
let set_be32 (_buf : bytes) (_i : int) (_v : int32#) = assert false

let transform_from (_ctx : ctx) (_src : bytes) (_src_offset : int) = assert false
let transform (_ctx : ctx) = assert false
let add_data (_ctx : ctx) (_data : bytes) (_len : int) = assert false
let finish (_ctx : ctx) (_output : bytes) = assert false
