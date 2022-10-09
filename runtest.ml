let process_raw_result (raw_result: string) : string =
    ((String.split_on_char ':' raw_result) |> List.nth) 1 |> String.trim
;;

let get_result (filename: string) : string =
    let chan = open_in filename in
    let result_line = input_line chan in
    close_in chan;
    process_raw_result result_line
;;

let cmd f = Printf.sprintf "./main -interpllvm -notypecheck -O1 tests/%s" f

let run_cmd cmd =
    let chan = Unix.open_process_in cmd in
    let inp = Stdio.In_channel.input_line chan in
    Stdio.In_channel.close chan;
    match inp with
    | Some raw_result -> process_raw_result raw_result
    | None -> "cannot parse result from stdout"
;;

let run_test f =
    let expected = get_result ("tests/" ^ f) in
    let result = (cmd f) |> run_cmd in
    if result = expected then Printf.printf "%s: passed\n" f
    else Printf.printf "%s: failed, expected \"%s\", got \"%s\"\n" f expected result
;;

let testfiles : string list =
    Sys.readdir "tests"
    |> Array.to_list
    |> List.filter (fun x -> Filename.extension x = ".c")
;;

let _ = List.iter run_test testfiles
