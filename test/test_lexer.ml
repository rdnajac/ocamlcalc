open Calculator_lib

let test_lexer input expected =
  let lexbuf = Lexing.from_string input in
  let rec aux acc =
    match Lexer.tokenize lexbuf with
    | Parser.EOF -> List.rev acc
    | token -> aux (token :: acc)
  in
  let result = aux [] in
  assert (result = expected)

let () =
  (* Test individual tokens *)
  test_lexer "+" [ Parser.PLUS ];
  test_lexer "-" [ Parser.MINUS ];
  test_lexer "*" [ Parser.TIMES ];
  test_lexer "/" [ Parser.DIVIDE ];
  test_lexer ";" [ Parser.SEQ ];
  test_lexer "=" [ Parser.ASN ];
  test_lexer "x" [ Parser.VARIABLE "x" ];
  test_lexer "42" [ Parser.LITERAL 42 ];

  (* Test compound expression *)
  test_lexer "x = 5 + y * 3;"
    [
      Parser.VARIABLE "x";
      Parser.ASN;
      Parser.LITERAL 5;
      Parser.PLUS;
      Parser.VARIABLE "y";
      Parser.TIMES;
      Parser.LITERAL 3;
      Parser.SEQ;
    ];

  (* Test whitespace handling *)
  test_lexer "  12   +  34  "
    [ Parser.LITERAL 12; Parser.PLUS; Parser.LITERAL 34 ];

  print_endline "All lexer tests passed!"
