open Calculator.Ast

let test_ast_types () =
  let _ = Add in
  let _ = Sub in
  let _ = Mul in
  let _ = Div in
  let _ = Binop (Lit 1, Add, Lit 2) in
  let _ = Seq (Lit 1, Lit 2) in
  let _ = Asn ("x", Lit 1) in
  let _ = Var "x" in
  true

let () = assert (test_ast_types ())
