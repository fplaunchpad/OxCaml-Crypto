open Chacha20

let hex_of_bytes b =
  let buf = Buffer.create (Bytes.length b * 2) in
  Bytes.iter (fun c -> Buffer.add_string buf (Printf.sprintf "%02x" (Char.code c))) b;
  Buffer.contents buf

let bytes_of_hex h =
  let n = String.length h / 2 in
  Bytes.init n (fun i -> Char.chr (int_of_string ("0x" ^ String.sub h (i*2) 2)))

(* ---- RFC 8439 §2.3.2 block function test ---------------------------------- *)
(* NOTE: RFC 7539 §2.3.2 contained an erratum (byte 14 was 0x70 instead of
   0x71); RFC 8439 carries the corrected vector, verified against OpenSSL,
   Node.js, Python cryptography, the C scalar reference, and the SIMD
   OxCaml implementation. *)
let () =
  let key   = Bytes.init 32 Char.chr in
  let nonce = bytes_of_hex "000000090000004a00000000" in
  let zeros = Bytes.make 64 '\x00' in
  let ks    = Bytes.make 64 '\x00' in
  let ctx   = create () in
  init ctx key nonce 1L;
  transform ctx zeros ks 64;
  let expected = bytes_of_hex
    "10f1e7e4d13b5915500fdd1fa32071c4\
     c7d1f4c733c068030422aa9ac3d46c4e\
     d2826446079faa0914c2d705d98b02a2\
     b5129cd1de164eb9cbd083e8a2503c4e"
  in
  if ks <> expected then begin
    Printf.eprintf "FAIL block:\n  got      %s\n  expected %s\n"
      (hex_of_bytes ks) (hex_of_bytes expected);
    exit 1
  end;
  print_string "ChaCha20 block RFC 8439 2.3.2: PASSED\n"

(* ---- RFC 7539 §2.4.2 encryption test -------------------------------------- *)
let () =
  let key   = Bytes.init 32 Char.chr in
  let nonce = bytes_of_hex "000000000000004a00000000" in
  let plain = Bytes.of_string
    "Ladies and Gentlemen of the class of '99: If I could offer \
     you only one tip for the future, sunscreen would be it."
  in
  let cipher = Bytes.make (Bytes.length plain) '\x00' in
  let ctx = create () in
  init ctx key nonce 1L;
  transform ctx plain cipher (Bytes.length plain);
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
  if cipher <> expected then begin
    Printf.eprintf "FAIL encrypt:\n  got      %s\n  expected %s\n"
      (hex_of_bytes cipher) (hex_of_bytes expected);
    exit 1
  end;
  print_string "ChaCha20 encrypt RFC 7539 2.4.2: PASSED\n"
