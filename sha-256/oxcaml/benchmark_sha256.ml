open Sha256

let read_file path =
  let ic = open_in_bin path in
  let n = in_channel_length ic in
  let buf = Bytes.create n in
  really_input ic buf 0 n;
  close_in ic;
  buf

let hex_of_digest d =
  let buf = Buffer.create 64 in
  for i = 0 to 31 do
    Buffer.add_string buf (Printf.sprintf "%02x" (Char.code (Bytes.get d i)))
  done;
  Buffer.contents buf

let () =
  if Array.length Sys.argv <> 2 then begin
    Printf.eprintf "Usage: %s <input_file>\n" Sys.argv.(0);
    exit 1
  end;
  let data   = read_file Sys.argv.(1) in
  let n      = Bytes.length data in
  let digest = Bytes.make 32 '\x00' in
  let ctx    = create () in
  let start  = Unix.gettimeofday () in
  init ctx;
  add_data ctx data n;
  finish ctx digest;
  let stop = Unix.gettimeofday () in
  let t  = stop -. start in
  let mb = float_of_int n /. (1024.0 *. 1024.0) in
  Printf.printf "Message length : %d bytes\n" n;
  Printf.printf "Hash time      : %.6f sec\n" t;
  Printf.printf "Hash speed     : %.2f MB/s\n" (mb /. t);
  Printf.printf "Digest         : %s\n" (hex_of_digest digest)
