open Sha256

let hex_of_digest d =
  let buf = Buffer.create 64 in
  for i = 0 to 31 do
    Buffer.add_string buf (Printf.sprintf "%02x" (Char.code (Bytes.get d i)))
  done;
  Buffer.contents buf

let hash_of_string s =
  let ctx = create () in
  let data = Bytes.of_string s in
  let digest = Bytes.make 32 '\x00' in
  init ctx;
  add_data ctx data (Bytes.length data);
  finish ctx digest;
  digest

let test label input expected =
  let got = hex_of_digest (hash_of_string input) in
  if got = expected then
    Printf.printf "PASS  %s\n%!" label
  else begin
    Printf.printf "FAIL  %s\n  got      %s\n  expected %s\n%!" label got expected;
    exit 1
  end

let () =
  test "SHA-256(\"\")"
    ""
    "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855";
  test "SHA-256(\"abc\")"
    "abc"
    "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad";
  test "SHA-256(FIPS-2)"
    "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"
    "248d6a61d20638b8e5c026930c3e6039a33ce45964ff2167f6ecedd419db06c1";
  test "SHA-256(\"The quick brown fox...\")"
    "The quick brown fox jumps over the lazy dog"
    "d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592";
  Printf.printf "\nAll RFC tests PASSED\n%!"
