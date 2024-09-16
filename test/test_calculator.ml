open OUnit2
open Calculator_lib

let parse_and_eval input =
  let lexbuf = Lexing.from_string input in
  try
    let expr = Parser.expr Lexer.tokenize lexbuf in
    let env = Hashtbl.create 8 in
    Eval.eval env expr
  with Stdlib.Parsing.Parse_error -> raise (Failure "Parse error")

let test_arithmetic _ =
  assert_equal 3 (parse_and_eval "1 + 2") ~printer:string_of_int;
  assert_equal (-1) (parse_and_eval "1 - 2") ~printer:string_of_int;
  assert_equal 6 (parse_and_eval "2 * 3") ~printer:string_of_int;
  assert_equal 2 (parse_and_eval "6 / 3") ~printer:string_of_int

let test_precedence _ =
  assert_equal 7 (parse_and_eval "1 + 2 * 3") ~printer:string_of_int;
  assert_equal 9 (parse_and_eval "(1 + 2) * 3") ~printer:string_of_int;
  assert_equal 5 (parse_and_eval "10 - 2 - 3") ~printer:string_of_int

let test_variables _ =
  assert_equal 15 (parse_and_eval "x = 5; y = 10; x + y") ~printer:string_of_int

let test_sequences _ =
  assert_equal 3 (parse_and_eval "1; 2; 3") ~printer:string_of_int

let test_errors _ =
  assert_raises (Failure "Undefined variable z") (fun () -> parse_and_eval "z");
  assert_raises (Failure "Parse error") (fun () -> parse_and_eval "1 + * 2")

let suite =
  "calculator_test_suite"
  >::: [
         "test_arithmetic" >:: test_arithmetic;
         "test_precedence" >:: test_precedence;
         "test_variables" >:: test_variables;
         "test_sequences" >:: test_sequences;
         "test_errors" >:: test_errors;
       ]

let () = run_test_tt_main suite
