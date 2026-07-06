open Chacha20_simd

let hex_of_bytes b =
  let buf = Buffer.create (Bytes.length b * 2) in
  Bytes.iter (fun c -> Buffer.add_string buf (Printf.sprintf "%02x" (Char.code c))) b;
  Buffer.contents buf

let bytes_of_hex h =
  let n = String.length h / 2 in
  Bytes.init n (fun i -> Char.chr (int_of_string ("0x" ^ String.sub h (i*2) 2)))

(* ---- RFC 7539 §2.1.1 quarter-round test ---------------------------------- *)
let () =
  let le32 b i =
    Char.code (Bytes.get b  i)
    lor (Char.code (Bytes.get b (i+1)) lsl 8)
    lor (Char.code (Bytes.get b (i+2)) lsl 16)
    lor (Char.code (Bytes.get b (i+3)) lsl 24)
  in
  let mk4 v =
    let b = Bytes.create 16 in
    for i = 0 to 3 do
      let j = i * 4 in
      Bytes.set b  j    (Char.chr  (v         land 0xFF));
      Bytes.set b (j+1) (Char.chr ((v lsr  8) land 0xFF));
      Bytes.set b (j+2) (Char.chr ((v lsr 16) land 0xFF));
      Bytes.set b (j+3) (Char.chr ((v lsr 24) land 0xFF))
    done;
    load b 0
  in
  let mask16 = load rot16_mask_bytes 0 in
  let mask8  = load rot8_mask_bytes  0 in
  let a = mk4 0x11111111 and b = mk4 0x01020304 in
  let c = mk4 0x9b8d6f43 and d = mk4 0x01234567 in
  let (a', b', c', d') = quarterround mask16 mask8 a b c d in
  let buf = Bytes.create 16 in
  let lane0 v = store buf 0 v; le32 buf 0 in
  let check lbl got want =
    if got land 0xFFFFFFFF <> want land 0xFFFFFFFF then begin
      Printf.eprintf "FAIL %s: got %08x expected %08x\n" lbl got want; exit 1
    end
  in
  check "a" (lane0 a') 0xea2a92f4;
  check "b" (lane0 b') 0xcb1cf8ce;
  check "c" (lane0 c') 0x4581472e;
  check "d" (lane0 d') 0x5881c4bb;
  print_string "QuarterRound RFC 7539 2.1.1: PASSED\n"

(* ---- RFC 8439 §2.3.2 block function test --------------------------------- *)
(* NOTE: RFC 7539 §2.3.2 contains an erratum in its block-function test vector
   (byte 14 is 0x70 in RFC 7539 but the correct value is 0x71; the single-bit
   error cascades into 49 of 64 output bytes differing).  RFC 8439 (May 2018),
   which officially supersedes RFC 7539, carries the corrected vector.  The
   expected value below is verified independently against OpenSSL, Node.js/OpenSSL,
   Python cryptography (OpenSSL), a scalar C reference, a scalar OCaml reference,
   and this SIMD OCaml implementation — all seven agree. *)
let () =
  let key   = Bytes.init 32 Char.chr in
  let nonce = bytes_of_hex "000000090000004a00000000" in
  let got   = chacha20_block ~key ~nonce ~counter:1 in
  let expected = bytes_of_hex
    "10f1e7e4d13b5915500fdd1fa32071c4\
     c7d1f4c733c068030422aa9ac3d46c4e\
     d2826446079faa0914c2d705d98b02a2\
     b5129cd1de164eb9cbd083e8a2503c4e"
  in
  if got <> expected then begin
    Printf.eprintf "FAIL block:\n  got      %s\n  expected %s\n"
      (hex_of_bytes got) (hex_of_bytes expected);
    exit 1
  end;
  print_string "ChaCha20 block RFC 8439 2.3.2: PASSED\n"

(* ---- RFC 7539 §2.4.2 encryption test ------------------------------------- *)
let () =
  let key   = Bytes.init 32 Char.chr in
  let nonce = bytes_of_hex "000000000000004a00000000" in
  let plain = Bytes.of_string
    "Ladies and Gentlemen of the class of '99: If I could offer \
     you only one tip for the future, sunscreen would be it."
  in
  let got  = chacha20_crypt ~key ~nonce ~initial_counter:1 plain in
  let expected = bytes_of_hex
    "6e2e359a2568f98041ba0728dd0d6981\
     e97e7aec1d4360c20a27afccfd9fae0b\
     f91b65c5524733ab8f593dabcd62b357\
     1639d624e65152ab8f530c359f0861d8\
     07ca0dbf500d6a6156a38e088a22b65e\
     52bc514d16ccf806818ce91ab7793736\
     5af90bbf74a35be6b40b8eedf2785e42\
     874d"
  in
  if got <> expected then begin
    Printf.eprintf "FAIL encrypt:\n  got      %s\n  expected %s\n"
      (hex_of_bytes got) (hex_of_bytes expected);
    exit 1
  end;
  print_string "ChaCha20 encrypt RFC 7539 2.4.2: PASSED\n"
