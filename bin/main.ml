open Calculator

let () =
  let env = Hashtbl.create 8 in
  try
    while true do
      print_string "> ";
      flush stdout;
      let input = read_line () in
      if input = "exit" then exit 0;
      try
        let lexbuf = Lexing.from_string input in
        let expr = Parser.expr Lexer.tokenize lexbuf in
        let result = Eval.eval env expr in
        print_endline (string_of_int result)
      with
      | Failure msg -> print_endline ("Error: " ^ msg)
      | Parsing.Parse_error -> print_endline "Parse error"
    done
  with End_of_file -> print_endline "\nGoodbye!"
