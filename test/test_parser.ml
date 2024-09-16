open Calculator
open Ast

let parse input =
  let lexbuf = Lexing.from_string input in
  Parser.expr Lexer.tokenize lexbuf

let test_parser input expected =
  let result = parse input in
  assert (result = expected)

let () =
  (* Test literal *)
  test_parser "42" (Lit 42);

  (* Test variable *)
  test_parser "x" (Var "x");

  (* Test binary operations *)
  test_parser "1 + 2" (Binop (Lit 1, Add, Lit 2));
  test_parser "3 - 4" (Binop (Lit 3, Sub, Lit 4));
  test_parser "5 * 6" (Binop (Lit 5, Mul, Lit 6));
  test_parser "8 / 2" (Binop (Lit 8, Div, Lit 2));

  (* Test precedence *)
  test_parser "1 + 2 * 3" (Binop (Lit 1, Add, Binop (Lit 2, Mul, Lit 3)));
  test_parser "1 * 2 + 3" (Binop (Binop (Lit 1, Mul, Lit 2), Add, Lit 3));

  (* Test assignment *)
  test_parser "x = 5" (Asn ("x", Lit 5));

  (* Test sequence *)
  test_parser "1; 2" (Seq (Lit 1, Lit 2));

  (* Test complex expression *)
  test_parser "x = 1 + 2; y = 3 * x"
    (Seq
       ( Asn ("x", Binop (Lit 1, Add, Lit 2)),
         Asn ("y", Binop (Lit 3, Mul, Var "x")) ));

  print_endline "All parser tests passed!"
