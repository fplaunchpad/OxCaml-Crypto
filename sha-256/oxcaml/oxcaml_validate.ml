open Stdlib_upstream_compatible

(* Layout-polymorphic primitives for int32# arrays.
   makearray_dynamic: compiler built-in, creates a flat packed int32# array.
   aget/aset: layout-polymorphic %array_unsafe_get / %array_unsafe_set,
   require -extension layout_poly; produce direct 32-bit mov instructions. *)
external makearray_dynamic : int -> int32# -> int32# array = "%makearray_dynamic"
external aget : ('a : any mod non_float). 'a array -> int -> 'a = "%array_unsafe_get" [@@layout_poly]
external aset : ('a : any mod non_float). 'a array -> int -> 'a -> unit = "%array_unsafe_set" [@@layout_poly]

let () =
  (* --- 1. Create a 8-element int32# array (packed 32-bit slots) --- *)
  let a : int32# array = makearray_dynamic 8 #0l in

  (* --- 2. Store four known values --- *)
  aset a 0 #0xDEADBEEFl;
  aset a 1 #0x12345678l;
  aset a 2 #0xFFFF0000l;
  aset a 3 #0x0000FFFFl;

  (* --- 3. Read back and verify round-trip --- *)
  let v0 : int32# = aget a 0 in
  let v1 : int32# = aget a 1 in
  let v2 : int32# = aget a 2 in
  let v3 : int32# = aget a 3 in
  Printf.printf "store/load v0 = %08lx  (expected deadbeef)\n" (Int32_u.to_int32 v0);
  Printf.printf "store/load v1 = %08lx  (expected 12345678)\n" (Int32_u.to_int32 v1);
  Printf.printf "store/load v2 = %08lx  (expected ffff0000)\n" (Int32_u.to_int32 v2);
  Printf.printf "store/load v3 = %08lx  (expected 0000ffff)\n" (Int32_u.to_int32 v3);

  (* --- 4. Arithmetic and bitwise operations --- *)

  (* add: 0xFFFF_FFFF + 1 must wrap to 0 at 32 bits *)
  let r_add = Int32_u.add #0xFFFFFFFFl #0x00000001l in
  Printf.printf "add 0xffffffff+1 = %08lx  (expected 00000000)\n" (Int32_u.to_int32 r_add);

  (* logxor: ffff0000 ^ 0000ffff = ffffffff *)
  let r_xor = Int32_u.logxor v2 v3 in
  Printf.printf "xor ffff0000^0000ffff = %08lx  (expected ffffffff)\n" (Int32_u.to_int32 r_xor);

  (* logand: deadbeef & 0000ffff = 0000beef *)
  let r_and = Int32_u.logand v0 #0x0000FFFFl in
  Printf.printf "and deadbeef&0000ffff = %08lx  (expected 0000beef)\n" (Int32_u.to_int32 r_and);

  (* logor: ffff0000 | 0000ffff = ffffffff *)
  let r_or = Int32_u.logor v2 v3 in
  Printf.printf "or  ffff0000|0000ffff = %08lx  (expected ffffffff)\n" (Int32_u.to_int32 r_or);

  (* shift_left: 1 << 16 = 0x00010000 *)
  let r_shl = Int32_u.shift_left #0x00000001l 16 in
  Printf.printf "shl 1<<16 = %08lx  (expected 00010000)\n" (Int32_u.to_int32 r_shl);

  (* shift_right_logical: 0x80000000 >> 1 = 0x40000000 (unsigned, no sign extension) *)
  let r_shr = Int32_u.shift_right_logical #0x80000000l 1 in
  Printf.printf "shr 0x80000000>>1 = %08lx  (expected 40000000)\n" (Int32_u.to_int32 r_shr);

  (* --- 5. SHA-256 rotr analogue: rotate right by n bits --- *)
  (* rotr x n = (x lsr n) lor (x lsl (32-n)) — in int32# form *)
  let rotr32 (x : int32#) n : int32# =
    Int32_u.logor
      (Int32_u.shift_right_logical x n)
      (Int32_u.shift_left x (32 - n))
  in
  (* rotr 0x80000001 by 1: lsr 1 = 0x40000000, lsl 31 = 0x80000000
     result = 0xC0000000 *)
  let r_rotr = rotr32 #0x80000001l 1 in
  Printf.printf "rotr 0x80000001 by 1 = %08lx  (expected c0000000)\n" (Int32_u.to_int32 r_rotr);

  Printf.printf "All checks complete.\n"
