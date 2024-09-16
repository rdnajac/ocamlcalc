open OUnit2
open Calculator_lib
open Ast

let test_eval _ =
  let env = Hashtbl.create 8 in
  let eval expr = Eval.eval env expr in

  assert_equal 5 (eval (Lit 5)) ~printer:string_of_int;
  assert_equal 7 (eval (Binop (Lit 3, Add, Lit 4))) ~printer:string_of_int;
  assert_equal 10 (eval (Binop (Lit 15, Sub, Lit 5))) ~printer:string_of_int;
  assert_equal 20 (eval (Binop (Lit 4, Mul, Lit 5))) ~printer:string_of_int;
  assert_equal 3 (eval (Binop (Lit 9, Div, Lit 3))) ~printer:string_of_int;

  assert_equal 5 (eval (Asn ("x", Lit 5))) ~printer:string_of_int;
  assert_equal 5 (eval (Var "x")) ~printer:string_of_int;

  assert_equal 8
    (eval (Seq (Asn ("y", Lit 3), Binop (Var "y", Add, Lit 5))))
    ~printer:string_of_int;

  assert_raises (Failure "Undefined variable z") (fun () -> eval (Var "z"))

let suite = "eval_test_suite" >::: [ "test_eval" >:: test_eval ]
let () = run_test_tt_main suite
