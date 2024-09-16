open Calculator_lib

let () =
  let env = Hashtbl.create 8 in
  try
    while true do
      print_string "> ";
      flush stdout;
      let lexbuf = Lexing.from_channel stdin in
      try
        let expr = Parser.expr Lexer.tokenize lexbuf in
        let result = Eval.eval env expr in
        print_endline (string_of_int result)
      with
      | Parser.Error -> print_endline "Parse error"
      | Failure msg -> print_endline ("Error: " ^ msg)
    done
  with End_of_file -> print_endline "\nGoodbye!"
