(* OxStep02 validation — core types and helper functions.
   Tests: constants, rotr, ch, maj, big_sigma0/1, small_sigma0/1.
   Full SHA-256 RFC tests will be added when transform/add_data/finish are migrated. *)

open Stdlib_upstream_compatible
open Sha256

let hex32 (v : int32#) = Printf.printf "%08lx" (Int32_u.to_int32 v)

let check label (got : int32#) (expected : int32#) =
  let pass = Int32_u.equal got expected in
  Printf.printf "%s: " label;
  hex32 got;
  if pass then print_string "  OK\n"
  else begin
    print_string "  FAIL (expected ";
    hex32 expected;
    print_string ")\n"
  end

let () =
  (* --- constants ---
     Spot-check first, last, and one interior value. *)
  Printf.printf "\n=== constants ===\n";
  check "constants[0]"  (aget constants  0) #0x428a2f98l;
  check "constants[1]"  (aget constants  1) #0x71374491l;
  check "constants[30]" (aget constants 30) #0x06ca6351l;
  check "constants[63]" (aget constants 63) #0xc67178f2l;

  (* --- rotr ---
     rotr 0x80000001 by 1:
       0x80000001 >> 1  = 0x40000000
       0x80000001 << 31 = 0x80000000
       result           = 0xC0000000 *)
  Printf.printf "\n=== rotr ===\n";
  check "rotr 0x80000001 by 1"  (rotr #0x80000001l  1) #0xc0000000l;
  (* rotr 0x12345678 by 4:
       0x12345678 >> 4  = 0x01234567
       0x12345678 << 28 = 0x80000000
       result           = 0x81234567 *)
  check "rotr 0x12345678 by 4"  (rotr #0x12345678l  4) #0x81234567l;
  (* rotr any by 32 = identity *)
  check "rotr 0xDEADBEEF by 32" (rotr #0xdeadbeefl 32) #0xdeadbeefl;

  (* --- ch ---
     ch(x,y,z) = z XOR (x AND (y XOR z)) = bitwise mux: x selects y when 1, z when 0 *)
  Printf.printf "\n=== ch ===\n";
  check "ch(0xFFFFFFFF,0xABCDEF01,0x12345678)" (ch #0xffffffffl #0xabcdef01l #0x12345678l) #0xabcdef01l;
  check "ch(0x00000000,0xABCDEF01,0x12345678)" (ch #0x00000000l #0xabcdef01l #0x12345678l) #0x12345678l;
  (* alternating mask: F0 selects upper nibbles from y=AA, lower from z=55 *)
  check "ch(0xF0F0F0F0,0xAAAAAAAA,0x55555555)" (ch #0xf0f0f0f0l #0xaaaaaaaal #0x55555555l) #0xa5a5a5a5l;

  (* --- maj ---
     maj(x,y,z) = majority vote per bit *)
  Printf.printf "\n=== maj ===\n";
  check "maj(0xFFFF,0xFFFF,0xFFFF)"       (maj #0xffffffffl #0xffffffffl #0xffffffffl) #0xffffffffl;
  check "maj(0xFFFF,0x0000,0x0000)"       (maj #0xffffffffl #0x00000000l #0x00000000l) #0x00000000l;
  (* AA | 55 = FF; maj(AA,55,FF) = (AA&55)|(FF&(AA|55)) = 00|(FF&FF) = FF *)
  check "maj(0xAAAAAAAA,0x55555555,0xFF)" (maj #0xaaaaaaaal #0x55555555l #0xffffffffl) #0xffffffffl;

  (* --- big_sigma0 / big_sigma1 ---
     Verified against Python:
       rotr(x,n) = ((x >> n) | (x << (32-n))) & 0xFFFFFFFF
       SIGMA0(x) = rotr(x,2)  ^ rotr(x,13) ^ rotr(x,22)
       SIGMA1(x) = rotr(x,6)  ^ rotr(x,11) ^ rotr(x,25)

     SIGMA0(1): rotr(1,2)=0x40000000, rotr(1,13)=0x00080000, rotr(1,22)=0x00000400
                XOR = 0x40080400
     SIGMA1(1): rotr(1,6)=0x04000000, rotr(1,11)=0x00200000, rotr(1,25)=0x00000080
                XOR = 0x04200080 *)
  Printf.printf "\n=== big_sigma0 / big_sigma1 ===\n";
  check "big_sigma0(0x00000001)" (big_sigma0 #0x00000001l) #0x40080400l;
  check "big_sigma1(0x00000001)" (big_sigma1 #0x00000001l) #0x04200080l;

  (* --- small_sigma0 / small_sigma1 ---
     sigma0(x) = rotr(x,7)  ^ rotr(x,18) ^ (x >> 3)
     sigma1(x) = rotr(x,17) ^ rotr(x,19) ^ (x >> 10)

     sigma0(1): rotr(1,7)=0x02000000, rotr(1,18)=0x00004000, 1>>3=0x00000000
                XOR = 0x02004000
     sigma1(1): rotr(1,17)=0x00008000, rotr(1,19)=0x00002000, 1>>10=0x00000000
                XOR = 0x0000a000 *)
  Printf.printf "\n=== small_sigma0 / small_sigma1 ===\n";
  check "small_sigma0(0x00000001)" (small_sigma0 #0x00000001l) #0x02004000l;
  check "small_sigma1(0x00000001)" (small_sigma1 #0x00000001l) #0x0000a000l;

  Printf.printf "\nAll OxStep02 checks complete.\n";

  (* --- OxStep03: create / init / get_be32 / set_be32 --- *)

  Printf.printf "\n=== create ===\n";
  let ctx = create () in
  Printf.printf "create: numbytes = %d  (expected 0)\n" ctx.numbytes;
  check "create: state[0] = 0" (aget ctx.state 0) #0l;
  check "create: data[0]  = 0" (aget ctx.data  0) #0l;

  Printf.printf "\n=== init ===\n";
  init ctx;
  check "init: state[0]" (aget ctx.state 0) #0x6a09e667l;
  check "init: state[1]" (aget ctx.state 1) #0xbb67ae85l;
  check "init: state[2]" (aget ctx.state 2) #0x3c6ef372l;
  check "init: state[3]" (aget ctx.state 3) #0xa54ff53al;
  check "init: state[4]" (aget ctx.state 4) #0x510e527fl;
  check "init: state[5]" (aget ctx.state 5) #0x9b05688cl;
  check "init: state[6]" (aget ctx.state 6) #0x1f83d9abl;
  check "init: state[7]" (aget ctx.state 7) #0x5be0cd19l;
  Printf.printf "init: numbytes = %d  (expected 0)\n" ctx.numbytes;

  Printf.printf "\n=== get_be32 ===\n";
  let buf16 = Bytes.of_string
    "\xde\xad\xbe\xef\x12\x34\x56\x78\x00\x00\x00\x00\xff\xff\xff\xff" in
  check "get_be32 @ 0  = deadbeef" (get_be32 buf16  0) #0xdeadbeefl;
  check "get_be32 @ 4  = 12345678" (get_be32 buf16  4) #0x12345678l;
  check "get_be32 @ 8  = 00000000" (get_be32 buf16  8) #0x00000000l;
  check "get_be32 @ 12 = ffffffff" (get_be32 buf16 12) #0xffffffffl;

  Printf.printf "\n=== set_be32 ===\n";
  let buf4 = Bytes.make 4 '\x00' in
  set_be32 buf4 0 #0xdeadbeefl;
  Printf.printf "set_be32 deadbeef bytes: %02x %02x %02x %02x  (expected de ad be ef)\n"
    (Char.code (Bytes.get buf4 0)) (Char.code (Bytes.get buf4 1))
    (Char.code (Bytes.get buf4 2)) (Char.code (Bytes.get buf4 3));
  check "set_be32→get_be32 deadbeef" (get_be32 buf4 0) #0xdeadbeefl;
  set_be32 buf4 0 #0x00000000l;
  check "set_be32→get_be32 zero"     (get_be32 buf4 0) #0x00000000l;
  set_be32 buf4 0 #0xffffffffl;
  check "set_be32→get_be32 all-ones" (get_be32 buf4 0) #0xffffffffl;
  set_be32 buf4 0 #0x80000000l;
  check "set_be32→get_be32 msb-only" (get_be32 buf4 0) #0x80000000l;

  Printf.printf "\nAll OxStep03 checks complete.\n";

  (* --- OxStep04: transform — empty-message known-answer test ---
     SHA-256("") = e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
     Padding block: 0x80 || 55×0x00 || 0x0000000000000000 (64-bit big-endian bit count = 0) *)
  Printf.printf "\n=== OxStep04: transform (empty-message block) ===\n";
  let ctx2 = create () in
  init ctx2;
  Bytes.set  ctx2.buffer 0 '\x80';
  Bytes.fill ctx2.buffer 1 63 '\x00';
  transform ctx2;
  check "transform: state[0] = e3b0c442" (aget ctx2.state 0) #0xe3b0c442l;
  check "transform: state[1] = 98fc1c14" (aget ctx2.state 1) #0x98fc1c14l;
  check "transform: state[2] = 9afbf4c8" (aget ctx2.state 2) #0x9afbf4c8l;
  check "transform: state[3] = 996fb924" (aget ctx2.state 3) #0x996fb924l;
  check "transform: state[4] = 27ae41e4" (aget ctx2.state 4) #0x27ae41e4l;
  check "transform: state[5] = 649b934c" (aget ctx2.state 5) #0x649b934cl;
  check "transform: state[6] = a495991b" (aget ctx2.state 6) #0xa495991bl;
  check "transform: state[7] = 7852b855" (aget ctx2.state 7) #0x7852b855l;

  Printf.printf "\nAll OxStep04 checks complete.\n"

let digest_of_string s =
  let ctx = create () in
  init ctx;
  let data = Bytes.of_string s in
  add_data ctx data (Bytes.length data);
  let output = Bytes.make 32 '\x00' in
  finish ctx output;
  output

let hex_of_bytes b =
  let buf = Buffer.create 64 in
  for i = 0 to Bytes.length b - 1 do
    Buffer.add_string buf (Printf.sprintf "%02x" (Char.code (Bytes.get b i)))
  done;
  Buffer.contents buf

let check_digest label got expected =
  let pass = got = expected in
  Printf.printf "%s:\n  got      %s\n  expected %s  %s\n"
    label got expected (if pass then "OK" else "FAIL")

let () =
  Printf.printf "\n=== OxStep05: add_data + finish (RFC 4634 known-answer) ===\n";
  check_digest {|SHA-256("")|}
    (hex_of_bytes (digest_of_string ""))
    "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855";
  check_digest {|SHA-256("abc")|}
    (hex_of_bytes (digest_of_string "abc"))
    "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad";
  check_digest {|SHA-256("abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq")|}
    (hex_of_bytes (digest_of_string "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"))
    "248d6a61d20638b8e5c026930c3e6039a33ce45964ff2167f6ecedd419db06c1";
  check_digest {|SHA-256("The quick brown fox jumps over the lazy dog")|}
    (hex_of_bytes (digest_of_string "The quick brown fox jumps over the lazy dog"))
    "d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592";
  Printf.printf "\nAll OxStep05 checks complete.\n"
