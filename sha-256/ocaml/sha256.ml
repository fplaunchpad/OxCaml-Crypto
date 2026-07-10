(* Faithful OCaml translation of sha256.c (Xavier Leroy / Cryptokit).
   Behavioural equivalences preserved:
     - 32-bit unsigned wrap: every word-sized result is masked with land mask32
     - Unsigned right shift: OCaml lsr is logical, identical to C >> on u32
     - Endianness: get_be32/set_be32 replace SHA256_copy_and_swap (little-endian path)
     - data[80]: expansion loop computes indices 16-79; only 0-63 are consumed,
       matching the C source exactly
   Safe OCaml primitives throughout — bounds checks are part of the baseline. *)

let mask32 = 0xFFFF_FFFF

(* C macros: ROTR, CH, MAJ, SIGMA0, SIGMA1, sigma0, sigma1 *)
let[@inline] rotr x n = (x lsr n) lor ((x lsl (32 - n)) land mask32)

let[@inline] ch  x y z = z lxor (x land (y lxor z))
let[@inline] maj x y z = (x land y) lor (z land (x lor y))

(* SIGMA0 / SIGMA1 — compression round functions *)
let[@inline] big_sigma0 x = (rotr x  2) lxor (rotr x 13) lxor (rotr x 22)
let[@inline] big_sigma1 x = (rotr x  6) lxor (rotr x 11) lxor (rotr x 25)

(* sigma0 / sigma1 — message schedule expansion *)
let[@inline] small_sigma0 x = (rotr x  7) lxor (rotr x 18) lxor (x lsr  3)
let[@inline] small_sigma1 x = (rotr x 17) lxor (rotr x 19) lxor (x lsr 10)

let constants = [|
  0x428a2f98; 0x71374491; 0xb5c0fbcf; 0xe9b5dba5;
  0x3956c25b; 0x59f111f1; 0x923f82a4; 0xab1c5ed5;
  0xd807aa98; 0x12835b01; 0x243185be; 0x550c7dc3;
  0x72be5d74; 0x80deb1fe; 0x9bdc06a7; 0xc19bf174;
  0xe49b69c1; 0xefbe4786; 0x0fc19dc6; 0x240ca1cc;
  0x2de92c6f; 0x4a7484aa; 0x5cb0a9dc; 0x76f988da;
  0x983e5152; 0xa831c66d; 0xb00327c8; 0xbf597fc7;
  0xc6e00bf3; 0xd5a79147; 0x06ca6351; 0x14292967;
  0x27b70a85; 0x2e1b2138; 0x4d2c6dfc; 0x53380d13;
  0x650a7354; 0x766a0abb; 0x81c2c92e; 0x92722c85;
  0xa2bfe8a1; 0xa81a664b; 0xc24b8b70; 0xc76c51a3;
  0xd192e819; 0xd6990624; 0xf40e3585; 0x106aa070;
  0x19a4c116; 0x1e376c08; 0x2748774c; 0x34b0bcb5;
  0x391c0cb3; 0x4ed8aa4a; 0x5b9cca4f; 0x682e6ff3;
  0x748f82ee; 0x78a5636f; 0x84c87814; 0x8cc70208;
  0x90befffa; 0xa4506ceb; 0xbef9a3f7; 0xc67178f2
|]

type ctx = {
  state    : int array;   (* 8 x 32-bit words *)
  length   : int array;   (* 2 x 32-bit words: [0] = high bits, [1] = low bits *)
  mutable numbytes : int;
  buffer   : bytes;       (* 64-byte block buffer *)
  data     : int array;   (* 80-word message schedule; hoisted to avoid per-transform alloc *)
}

let create () = {
  state    = Array.make 8 0;
  length   = Array.make 2 0;
  numbytes = 0;
  buffer   = Bytes.make 64 '\x00';
  data     = Array.make 80 0;
}

(* Replaces SHA256_copy_and_swap (little-endian path only).
   get_be32: load 4 bytes from buf at offset i as a big-endian 32-bit word.
   set_be32: store a 32-bit word into buf at offset i in big-endian order. *)
let[@inline] get_be32 buf i =
  (Char.code (Bytes.get buf  i      ) lsl 24)
  lor (Char.code (Bytes.get buf (i+1)) lsl 16)
  lor (Char.code (Bytes.get buf (i+2)) lsl  8)
  lor  Char.code (Bytes.get buf (i+3))

let[@inline] set_be32 buf i v =
  Bytes.set buf  i      (Char.chr ((v lsr 24) land 0xFF));
  Bytes.set buf (i+1)   (Char.chr ((v lsr 16) land 0xFF));
  Bytes.set buf (i+2)   (Char.chr ((v lsr  8) land 0xFF));
  Bytes.set buf (i+3)   (Char.chr ( v         land 0xFF))

(* SHA256_transform *)
let transform ctx =
  let data = ctx.data in
  (* Convert buffer data to 16 big-endian integers *)
  for i = 0 to 15 do
    data.(i) <- get_be32 ctx.buffer (i lsl 2)
  done;
  (* Expand into 80 integers (indices 64-79 computed but not consumed, matching C) *)
  for i = 16 to 79 do
    data.(i) <-
      (small_sigma1 data.(i-2)
       + data.(i-7)
       + small_sigma0 data.(i-15)
       + data.(i-16)) land mask32
  done;
  (* Initialize working variables *)
  let a = ref ctx.state.(0) in
  let b = ref ctx.state.(1) in
  let c = ref ctx.state.(2) in
  let d = ref ctx.state.(3) in
  let e = ref ctx.state.(4) in
  let f = ref ctx.state.(5) in
  let g = ref ctx.state.(6) in
  let h = ref ctx.state.(7) in
  (* Perform rounds: 8-way unrolled STEP macro *)
  let[@inline] step a_r b_r c_r d_r e_r f_r g_r h_r i =
    let t1 =
      (!h_r
       + big_sigma1 !e_r
       + ch !e_r !f_r !g_r
       + constants.(i)
       + data.(i)) land mask32 in
    let t2 = (big_sigma0 !a_r + maj !a_r !b_r !c_r) land mask32 in
    d_r := (!d_r + t1) land mask32;
    h_r := (t1 + t2) land mask32
  in
  for i = 0 to 7 do
    let j = i lsl 3 in
    step a b c d e f g h  j;
    step h a b c d e f g (j+1);
    step g h a b c d e f (j+2);
    step f g h a b c d e (j+3);
    step e f g h a b c d (j+4);
    step d e f g h a b c (j+5);
    step c d e f g h a b (j+6);
    step b c d e f g h a (j+7)
  done;
  (* Update chaining values *)
  ctx.state.(0) <- (ctx.state.(0) + !a) land mask32;
  ctx.state.(1) <- (ctx.state.(1) + !b) land mask32;
  ctx.state.(2) <- (ctx.state.(2) + !c) land mask32;
  ctx.state.(3) <- (ctx.state.(3) + !d) land mask32;
  ctx.state.(4) <- (ctx.state.(4) + !e) land mask32;
  ctx.state.(5) <- (ctx.state.(5) + !f) land mask32;
  ctx.state.(6) <- (ctx.state.(6) + !g) land mask32;
  ctx.state.(7) <- (ctx.state.(7) + !h) land mask32

(* SHA256_init — SHA-256 (256-bit) only *)
let init ctx =
  ctx.state.(0) <- 0x6A09E667;
  ctx.state.(1) <- 0xBB67AE85;
  ctx.state.(2) <- 0x3C6EF372;
  ctx.state.(3) <- 0xA54FF53A;
  ctx.state.(4) <- 0x510E527F;
  ctx.state.(5) <- 0x9B05688C;
  ctx.state.(6) <- 0x1F83D9AB;
  ctx.state.(7) <- 0x5BE0CD19;
  ctx.numbytes <- 0;
  ctx.length.(0) <- 0;
  ctx.length.(1) <- 0

(* SHA256_add_data *)
let add_data ctx (data : bytes) len =
  (* Update bit count: low 32 bits with carry into high 32 bits *)
  let t = ctx.length.(1) in
  let new_lo = (t + (len lsl 3)) land mask32 in
  ctx.length.(1) <- new_lo;
  if new_lo < t then
    ctx.length.(0) <- (ctx.length.(0) + 1) land mask32;
  ctx.length.(0) <- (ctx.length.(0) + (len lsr 29)) land mask32;
  let pos = ref 0 in
  let rem = ref len in
  let early = ref false in
  (* If data was left in buffer, fill it and transform *)
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
    (* Process data in 64-byte chunks *)
    while !rem >= 64 do
      Bytes.blit data !pos ctx.buffer 0 64;
      transform ctx;
      pos := !pos + 64;
      rem := !rem - 64
    done;
    (* Save remaining data *)
    Bytes.blit data !pos ctx.buffer 0 !rem;
    ctx.numbytes <- !rem
  end

(* SHA256_finish — SHA-256 (256-bit) only *)
let finish ctx (output : bytes) =
  let i = ref ctx.numbytes in
  (* Append 0x80 padding byte — there is always room *)
  Bytes.set ctx.buffer !i '\x80';
  incr i;
  (* If no room for 8-byte length, pad to 64 and transform *)
  if !i > 56 then begin
    Bytes.fill ctx.buffer !i (64 - !i) '\x00';
    transform ctx;
    i := 0
  end;
  (* Pad to byte 56 *)
  Bytes.fill ctx.buffer !i (56 - !i) '\x00';
  (* Append 64-bit big-endian bit length: length[0] (high) || length[1] (low) *)
  set_be32 ctx.buffer 56 ctx.length.(0);
  set_be32 ctx.buffer 60 ctx.length.(1);
  transform ctx;
  (* Write 8-word digest in big-endian *)
  for j = 0 to 7 do
    set_be32 output (j lsl 2) ctx.state.(j)
  done
