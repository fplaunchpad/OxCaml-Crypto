(* Pure OCaml translation of Bernstein's chacha-regs.c (public domain) *)

let[@inline] mask32 x = x land 0xFFFFFFFF

let[@inline] u8to32_le (buf : bytes) pos =
  Char.code (Bytes.unsafe_get buf  pos)
  lor (Char.code (Bytes.unsafe_get buf (pos + 1)) lsl 8)
  lor (Char.code (Bytes.unsafe_get buf (pos + 2)) lsl 16)
  lor (Char.code (Bytes.unsafe_get buf (pos + 3)) lsl 24)

let[@inline] u32to8_le (buf : bytes) pos v =
  Bytes.unsafe_set buf  pos       (Char.unsafe_chr  (v          land 0xFF));
  Bytes.unsafe_set buf (pos + 1)  (Char.unsafe_chr ((v lsr  8)  land 0xFF));
  Bytes.unsafe_set buf (pos + 2)  (Char.unsafe_chr ((v lsr 16)  land 0xFF));
  Bytes.unsafe_set buf (pos + 3)  (Char.unsafe_chr ((v lsr 24)  land 0xFF))

let[@inline] rotate v c =
  let v = mask32 v in
  mask32 ((v lsl c) lor (v lsr (32 - c)))

(* Opt01: purely functional quarterround; inlined at every call site so the
   returned tuple is immediately destructured — OCaml eliminates the allocation
   and tracks all four values in registers without heap traffic. *)
let[@inline] quarterround a b c d =
  let a = mask32 (a + b) in let d = rotate (d lxor a) 16 in
  let c = mask32 (c + d) in let b = rotate (b lxor c) 12 in
  let a = mask32 (a + b) in let d = rotate (d lxor a)  8 in
  let c = mask32 (c + d) in let b = rotate (b lxor c)  7 in
  (a, b, c, d)

type ctx = {
  input    : int array;   (* 16 × uint32 state words *)
  output   : bytes;       (* 64-byte keystream block *)
  mutable next      : int;
  mutable iv_length : int;
}

let create () = {
  input = Array.make 16 0;
  output = Bytes.make 64 '\000';
  next = 64;
  iv_length = 12;
}

(* Opt01: load the 16 state words into local let-bindings once; all 80
   quarter-rounds operate on register/stack values rather than a heap array.
   The work array, Array.blit, and all per-step array reads/writes are gone.
   The 10 double-rounds are written out explicitly — the only way to use
   immutable local bindings across iterations in standard OCaml. *)
let chacha20_block ctx =
  let i = ctx.input in
  let x0  = i.(0)  and x1  = i.(1)  and x2  = i.(2)  and x3  = i.(3)  in
  let x4  = i.(4)  and x5  = i.(5)  and x6  = i.(6)  and x7  = i.(7)  in
  let x8  = i.(8)  and x9  = i.(9)  and x10 = i.(10) and x11 = i.(11) in
  let x12 = i.(12) and x13 = i.(13) and x14 = i.(14) and x15 = i.(15) in
  (* double-round 1 *)
  let (x0, x4, x8,  x12) = quarterround x0  x4  x8  x12 in
  let (x1, x5, x9,  x13) = quarterround x1  x5  x9  x13 in
  let (x2, x6, x10, x14) = quarterround x2  x6  x10 x14 in
  let (x3, x7, x11, x15) = quarterround x3  x7  x11 x15 in
  let (x0, x5, x10, x15) = quarterround x0  x5  x10 x15 in
  let (x1, x6, x11, x12) = quarterround x1  x6  x11 x12 in
  let (x2, x7, x8,  x13) = quarterround x2  x7  x8  x13 in
  let (x3, x4, x9,  x14) = quarterround x3  x4  x9  x14 in
  (* double-round 2 *)
  let (x0, x4, x8,  x12) = quarterround x0  x4  x8  x12 in
  let (x1, x5, x9,  x13) = quarterround x1  x5  x9  x13 in
  let (x2, x6, x10, x14) = quarterround x2  x6  x10 x14 in
  let (x3, x7, x11, x15) = quarterround x3  x7  x11 x15 in
  let (x0, x5, x10, x15) = quarterround x0  x5  x10 x15 in
  let (x1, x6, x11, x12) = quarterround x1  x6  x11 x12 in
  let (x2, x7, x8,  x13) = quarterround x2  x7  x8  x13 in
  let (x3, x4, x9,  x14) = quarterround x3  x4  x9  x14 in
  (* double-round 3 *)
  let (x0, x4, x8,  x12) = quarterround x0  x4  x8  x12 in
  let (x1, x5, x9,  x13) = quarterround x1  x5  x9  x13 in
  let (x2, x6, x10, x14) = quarterround x2  x6  x10 x14 in
  let (x3, x7, x11, x15) = quarterround x3  x7  x11 x15 in
  let (x0, x5, x10, x15) = quarterround x0  x5  x10 x15 in
  let (x1, x6, x11, x12) = quarterround x1  x6  x11 x12 in
  let (x2, x7, x8,  x13) = quarterround x2  x7  x8  x13 in
  let (x3, x4, x9,  x14) = quarterround x3  x4  x9  x14 in
  (* double-round 4 *)
  let (x0, x4, x8,  x12) = quarterround x0  x4  x8  x12 in
  let (x1, x5, x9,  x13) = quarterround x1  x5  x9  x13 in
  let (x2, x6, x10, x14) = quarterround x2  x6  x10 x14 in
  let (x3, x7, x11, x15) = quarterround x3  x7  x11 x15 in
  let (x0, x5, x10, x15) = quarterround x0  x5  x10 x15 in
  let (x1, x6, x11, x12) = quarterround x1  x6  x11 x12 in
  let (x2, x7, x8,  x13) = quarterround x2  x7  x8  x13 in
  let (x3, x4, x9,  x14) = quarterround x3  x4  x9  x14 in
  (* double-round 5 *)
  let (x0, x4, x8,  x12) = quarterround x0  x4  x8  x12 in
  let (x1, x5, x9,  x13) = quarterround x1  x5  x9  x13 in
  let (x2, x6, x10, x14) = quarterround x2  x6  x10 x14 in
  let (x3, x7, x11, x15) = quarterround x3  x7  x11 x15 in
  let (x0, x5, x10, x15) = quarterround x0  x5  x10 x15 in
  let (x1, x6, x11, x12) = quarterround x1  x6  x11 x12 in
  let (x2, x7, x8,  x13) = quarterround x2  x7  x8  x13 in
  let (x3, x4, x9,  x14) = quarterround x3  x4  x9  x14 in
  (* double-round 6 *)
  let (x0, x4, x8,  x12) = quarterround x0  x4  x8  x12 in
  let (x1, x5, x9,  x13) = quarterround x1  x5  x9  x13 in
  let (x2, x6, x10, x14) = quarterround x2  x6  x10 x14 in
  let (x3, x7, x11, x15) = quarterround x3  x7  x11 x15 in
  let (x0, x5, x10, x15) = quarterround x0  x5  x10 x15 in
  let (x1, x6, x11, x12) = quarterround x1  x6  x11 x12 in
  let (x2, x7, x8,  x13) = quarterround x2  x7  x8  x13 in
  let (x3, x4, x9,  x14) = quarterround x3  x4  x9  x14 in
  (* double-round 7 *)
  let (x0, x4, x8,  x12) = quarterround x0  x4  x8  x12 in
  let (x1, x5, x9,  x13) = quarterround x1  x5  x9  x13 in
  let (x2, x6, x10, x14) = quarterround x2  x6  x10 x14 in
  let (x3, x7, x11, x15) = quarterround x3  x7  x11 x15 in
  let (x0, x5, x10, x15) = quarterround x0  x5  x10 x15 in
  let (x1, x6, x11, x12) = quarterround x1  x6  x11 x12 in
  let (x2, x7, x8,  x13) = quarterround x2  x7  x8  x13 in
  let (x3, x4, x9,  x14) = quarterround x3  x4  x9  x14 in
  (* double-round 8 *)
  let (x0, x4, x8,  x12) = quarterround x0  x4  x8  x12 in
  let (x1, x5, x9,  x13) = quarterround x1  x5  x9  x13 in
  let (x2, x6, x10, x14) = quarterround x2  x6  x10 x14 in
  let (x3, x7, x11, x15) = quarterround x3  x7  x11 x15 in
  let (x0, x5, x10, x15) = quarterround x0  x5  x10 x15 in
  let (x1, x6, x11, x12) = quarterround x1  x6  x11 x12 in
  let (x2, x7, x8,  x13) = quarterround x2  x7  x8  x13 in
  let (x3, x4, x9,  x14) = quarterround x3  x4  x9  x14 in
  (* double-round 9 *)
  let (x0, x4, x8,  x12) = quarterround x0  x4  x8  x12 in
  let (x1, x5, x9,  x13) = quarterround x1  x5  x9  x13 in
  let (x2, x6, x10, x14) = quarterround x2  x6  x10 x14 in
  let (x3, x7, x11, x15) = quarterround x3  x7  x11 x15 in
  let (x0, x5, x10, x15) = quarterround x0  x5  x10 x15 in
  let (x1, x6, x11, x12) = quarterround x1  x6  x11 x12 in
  let (x2, x7, x8,  x13) = quarterround x2  x7  x8  x13 in
  let (x3, x4, x9,  x14) = quarterround x3  x4  x9  x14 in
  (* double-round 10 *)
  let (x0, x4, x8,  x12) = quarterround x0  x4  x8  x12 in
  let (x1, x5, x9,  x13) = quarterround x1  x5  x9  x13 in
  let (x2, x6, x10, x14) = quarterround x2  x6  x10 x14 in
  let (x3, x7, x11, x15) = quarterround x3  x7  x11 x15 in
  let (x0, x5, x10, x15) = quarterround x0  x5  x10 x15 in
  let (x1, x6, x11, x12) = quarterround x1  x6  x11 x12 in
  let (x2, x7, x8,  x13) = quarterround x2  x7  x8  x13 in
  let (x3, x4, x9,  x14) = quarterround x3  x4  x9  x14 in
  (* add initial state and serialise to output *)
  let o = ctx.output in
  u32to8_le o  0  (mask32 (x0  + i.(0) ));
  u32to8_le o  4  (mask32 (x1  + i.(1) ));
  u32to8_le o  8  (mask32 (x2  + i.(2) ));
  u32to8_le o  12 (mask32 (x3  + i.(3) ));
  u32to8_le o  16 (mask32 (x4  + i.(4) ));
  u32to8_le o  20 (mask32 (x5  + i.(5) ));
  u32to8_le o  24 (mask32 (x6  + i.(6) ));
  u32to8_le o  28 (mask32 (x7  + i.(7) ));
  u32to8_le o  32 (mask32 (x8  + i.(8) ));
  u32to8_le o  36 (mask32 (x9  + i.(9) ));
  u32to8_le o  40 (mask32 (x10 + i.(10)));
  u32to8_le o  44 (mask32 (x11 + i.(11)));
  u32to8_le o  48 (mask32 (x12 + i.(12)));
  u32to8_le o  52 (mask32 (x13 + i.(13)));
  u32to8_le o  56 (mask32 (x14 + i.(14)));
  u32to8_le o  60 (mask32 (x15 + i.(15)));
  let ctr = mask32 (i.(12) + 1) in
  i.(12) <- ctr;
  if ctr = 0 && ctx.iv_length = 8 then
    i.(13) <- mask32 (i.(13) + 1)

let constants32 = Bytes.of_string "expand 32-byte k"
let constants16 = Bytes.of_string "expand 16-byte k"

let init ctx (key : bytes) (nonce : bytes) (counter : int64) =
  let cs = if Bytes.length key = 32 then constants32 else constants16 in
  ctx.input.(0) <- u8to32_le cs 0;
  ctx.input.(1) <- u8to32_le cs 4;
  ctx.input.(2) <- u8to32_le cs 8;
  ctx.input.(3) <- u8to32_le cs 12;
  ctx.input.(4) <- u8to32_le key 0;
  ctx.input.(5) <- u8to32_le key 4;
  ctx.input.(6) <- u8to32_le key 8;
  ctx.input.(7) <- u8to32_le key 12;
  let off = if Bytes.length key = 32 then 16 else 0 in
  ctx.input.(8)  <- u8to32_le key (off + 0);
  ctx.input.(9)  <- u8to32_le key (off + 4);
  ctx.input.(10) <- u8to32_le key (off + 8);
  ctx.input.(11) <- u8to32_le key (off + 12);
  ctx.input.(12) <- mask32 (Int64.to_int counter);
  let nlen = Bytes.length nonce in
  if nlen = 8 then begin
    ctx.input.(13) <- mask32 (Int64.to_int (Int64.shift_right_logical counter 32));
    ctx.input.(14) <- u8to32_le nonce 0;
    ctx.input.(15) <- u8to32_le nonce 4;
  end else begin
    ctx.input.(13) <- u8to32_le nonce 0;
    ctx.input.(14) <- u8to32_le nonce 4;
    ctx.input.(15) <- u8to32_le nonce 8;
  end;
  ctx.iv_length <- nlen;
  ctx.next <- 64

let transform ctx (src : bytes) (dst : bytes) len =
  let n = ref ctx.next in
  for i = 0 to len - 1 do
    if !n >= 64 then begin chacha20_block ctx; n := 0 end;
    Bytes.unsafe_set dst i
      (Char.unsafe_chr
        (Char.code (Bytes.unsafe_get src i)
         lxor Char.code (Bytes.unsafe_get ctx.output !n)));
    incr n
  done;
  ctx.next <- !n
