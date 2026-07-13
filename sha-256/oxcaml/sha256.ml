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

(* --- Migrated in OxStep03 --- *)

let create () = {
  state    = makearray_dynamic 8 #0l;
  length   = Array.make 2 0;
  numbytes = 0;
  buffer   = Bytes.make 64 '\x00';
  data     = makearray_dynamic 64 #0l;
}

let init ctx =
  aset ctx.state 0 #0x6a09e667l;
  aset ctx.state 1 #0xbb67ae85l;
  aset ctx.state 2 #0x3c6ef372l;
  aset ctx.state 3 #0xa54ff53al;
  aset ctx.state 4 #0x510e527fl;
  aset ctx.state 5 #0x9b05688cl;
  aset ctx.state 6 #0x1f83d9abl;
  aset ctx.state 7 #0x5be0cd19l;
  ctx.numbytes <- 0;
  ctx.length.(0) <- 0;
  ctx.length.(1) <- 0

let[@inline] get_be32 (buf : bytes) i : int32# =
  let b0 = Int32_u.of_int (Char.code (Bytes.unsafe_get buf  i      )) in
  let b1 = Int32_u.of_int (Char.code (Bytes.unsafe_get buf (i+1))) in
  let b2 = Int32_u.of_int (Char.code (Bytes.unsafe_get buf (i+2))) in
  let b3 = Int32_u.of_int (Char.code (Bytes.unsafe_get buf (i+3))) in
  Int32_u.logor
    (Int32_u.logor (Int32_u.shift_left b0 24) (Int32_u.shift_left b1 16))
    (Int32_u.logor (Int32_u.shift_left b2  8)  b3)

let[@inline] set_be32 (buf : bytes) i (v : int32#) =
  Bytes.unsafe_set buf  i      (Char.unsafe_chr (Int32_u.to_int (Int32_u.logand (Int32_u.shift_right_logical v 24) #0xffl)));
  Bytes.unsafe_set buf (i+1)   (Char.unsafe_chr (Int32_u.to_int (Int32_u.logand (Int32_u.shift_right_logical v 16) #0xffl)));
  Bytes.unsafe_set buf (i+2)   (Char.unsafe_chr (Int32_u.to_int (Int32_u.logand (Int32_u.shift_right_logical v  8) #0xffl)));
  Bytes.unsafe_set buf (i+3)   (Char.unsafe_chr (Int32_u.to_int (Int32_u.logand v #0xffl)))

(* --- Migrated in OxStep04 --- *)

let transform_from ctx (src : bytes) (src_offset : int) =
  let data = ctx.data in
  (* Load 16 big-endian words from src into data[0..15] *)
  for i = 0 to 15 do
    aset data i (get_be32 src (src_offset + (i lsl 2)))
  done;
  (* Expand message schedule: data[16..79] *)
  for i = 16 to 63 do
    aset data i
      (Int32_u.add
        (Int32_u.add
          (Int32_u.add
            (small_sigma1 (aget data (i-2)))
            (aget data (i-7)))
          (small_sigma0 (aget data (i-15))))
        (aget data (i-16)))
  done;
  (* Compression: 8 working variables carried as tail-recursive arguments.
     Pass data, ctx, and constants explicitly so rounds has no free variables. *)
  let rec rounds constants data ctx i a b c d e f g h =
    if i > 7 then begin
      aset ctx.state 0 (Int32_u.add (aget ctx.state 0) a);
      aset ctx.state 1 (Int32_u.add (aget ctx.state 1) b);
      aset ctx.state 2 (Int32_u.add (aget ctx.state 2) c);
      aset ctx.state 3 (Int32_u.add (aget ctx.state 3) d);
      aset ctx.state 4 (Int32_u.add (aget ctx.state 4) e);
      aset ctx.state 5 (Int32_u.add (aget ctx.state 5) f);
      aset ctx.state 6 (Int32_u.add (aget ctx.state 6) g);
      aset ctx.state 7 (Int32_u.add (aget ctx.state 7) h)
    end else begin
      let j = i lsl 3 in
      (* STEP(a,b,c,d,e,f,g,h,j): nd = d+t1, nh = t1+t2 *)
      let t1 = Int32_u.add (Int32_u.add (Int32_u.add (Int32_u.add h  (big_sigma1 e )) (ch e  f  g )) (aget constants  j   )) (aget data  j   ) in
      let t2 = Int32_u.add (big_sigma0 a ) (maj a  b  c ) in
      let nd  = Int32_u.add d  t1 in
      let nh  = Int32_u.add t1 t2 in
      (* STEP(nh,a,b,c,nd,e,f,g,j+1): nc = c+t1, ng = t1+t2 *)
      let t1 = Int32_u.add (Int32_u.add (Int32_u.add (Int32_u.add g  (big_sigma1 nd)) (ch nd e  f )) (aget constants (j+1))) (aget data (j+1)) in
      let t2 = Int32_u.add (big_sigma0 nh) (maj nh a  b ) in
      let nc  = Int32_u.add c  t1 in
      let ng  = Int32_u.add t1 t2 in
      (* STEP(ng,nh,a,b,nc,nd,e,f,j+2): nb = b+t1, nf = t1+t2 *)
      let t1 = Int32_u.add (Int32_u.add (Int32_u.add (Int32_u.add f  (big_sigma1 nc)) (ch nc nd e )) (aget constants (j+2))) (aget data (j+2)) in
      let t2 = Int32_u.add (big_sigma0 ng) (maj ng nh a ) in
      let nb  = Int32_u.add b  t1 in
      let nf  = Int32_u.add t1 t2 in
      (* STEP(nf,ng,nh,a,nb,nc,nd,e,j+3): na = a+t1, ne = t1+t2 *)
      let t1 = Int32_u.add (Int32_u.add (Int32_u.add (Int32_u.add e  (big_sigma1 nb)) (ch nb nc nd)) (aget constants (j+3))) (aget data (j+3)) in
      let t2 = Int32_u.add (big_sigma0 nf) (maj nf ng nh) in
      let na  = Int32_u.add a  t1 in
      let ne  = Int32_u.add t1 t2 in
      (* STEP(ne,nf,ng,nh,na,nb,nc,nd,j+4): nh2 = nh+t1, nd2 = t1+t2 *)
      let t1 = Int32_u.add (Int32_u.add (Int32_u.add (Int32_u.add nd (big_sigma1 na)) (ch na nb nc)) (aget constants (j+4))) (aget data (j+4)) in
      let t2 = Int32_u.add (big_sigma0 ne) (maj ne nf ng) in
      let nh2 = Int32_u.add nh t1 in
      let nd2 = Int32_u.add t1 t2 in
      (* STEP(nd2,ne,nf,ng,nh2,na,nb,nc,j+5): ng2 = ng+t1, nc2 = t1+t2 *)
      let t1 = Int32_u.add (Int32_u.add (Int32_u.add (Int32_u.add nc (big_sigma1 nh2)) (ch nh2 na nb)) (aget constants (j+5))) (aget data (j+5)) in
      let t2 = Int32_u.add (big_sigma0 nd2) (maj nd2 ne nf) in
      let ng2 = Int32_u.add ng t1 in
      let nc2 = Int32_u.add t1 t2 in
      (* STEP(nc2,nd2,ne,nf,ng2,nh2,na,nb,j+6): nf2 = nf+t1, nb2 = t1+t2 *)
      let t1 = Int32_u.add (Int32_u.add (Int32_u.add (Int32_u.add nb (big_sigma1 ng2)) (ch ng2 nh2 na)) (aget constants (j+6))) (aget data (j+6)) in
      let t2 = Int32_u.add (big_sigma0 nc2) (maj nc2 nd2 ne) in
      let nf2 = Int32_u.add nf t1 in
      let nb2 = Int32_u.add t1 t2 in
      (* STEP(nb2,nc2,nd2,ne,nf2,ng2,nh2,na,j+7): ne2 = ne+t1, na2 = t1+t2 *)
      let t1 = Int32_u.add (Int32_u.add (Int32_u.add (Int32_u.add na (big_sigma1 nf2)) (ch nf2 ng2 nh2)) (aget constants (j+7))) (aget data (j+7)) in
      let t2 = Int32_u.add (big_sigma0 nb2) (maj nb2 nc2 nd2) in
      let ne2 = Int32_u.add ne t1 in
      let na2 = Int32_u.add t1 t2 in
      rounds constants data ctx (i+1) na2 nb2 nc2 nd2 ne2 nf2 ng2 nh2
    end
  in
  rounds constants data ctx 0
    (aget ctx.state 0)
    (aget ctx.state 1)
    (aget ctx.state 2)
    (aget ctx.state 3)
    (aget ctx.state 4)
    (aget ctx.state 5)
    (aget ctx.state 6)
    (aget ctx.state 7)

let transform ctx = transform_from ctx ctx.buffer 0

(* --- Migrated in OxStep05 --- *)

let add_data ctx (data : bytes) len =
  (* mask32 only needed here for the int-domain bit-length counter; int32# arithmetic elsewhere *)
  let mask32 = 0xFFFF_FFFF in
  let t = ctx.length.(1) in
  let new_lo = (t + (len lsl 3)) land mask32 in
  ctx.length.(1) <- new_lo;
  if new_lo < t then
    ctx.length.(0) <- (ctx.length.(0) + 1) land mask32;
  ctx.length.(0) <- (ctx.length.(0) + (len lsr 29)) land mask32;
  let pos = ref 0 in
  let rem = ref len in
  let early = ref false in
  if ctx.numbytes <> 0 then begin
    let space = 64 - ctx.numbytes in
    if !rem < space then begin
      Bytes.blit data 0 ctx.buffer ctx.numbytes !rem;
      ctx.numbytes <- ctx.numbytes + !rem;
      early := true
    end else begin
      Bytes.blit data 0 ctx.buffer ctx.numbytes space;
      transform ctx;
      pos := space;
      rem := !rem - space
    end
  end;
  if not !early then begin
    while !rem >= 64 do
      transform_from ctx data !pos;
      pos := !pos + 64;
      rem := !rem - 64
    done;
    Bytes.blit data !pos ctx.buffer 0 !rem;
    ctx.numbytes <- !rem
  end

let finish ctx (output : bytes) =
  let i = ref ctx.numbytes in
  Bytes.set ctx.buffer !i '\x80';
  incr i;
  if !i > 56 then begin
    Bytes.fill ctx.buffer !i (64 - !i) '\x00';
    transform ctx;
    i := 0
  end;
  Bytes.fill ctx.buffer !i (56 - !i) '\x00';
  set_be32 ctx.buffer 56 (Int32_u.of_int ctx.length.(0));
  set_be32 ctx.buffer 60 (Int32_u.of_int ctx.length.(1));
  transform ctx;
  for j = 0 to 7 do
    set_be32 output (j lsl 2) (aget ctx.state j)
  done
