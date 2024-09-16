open Ast

type env = (string, int) Hashtbl.t

let rec eval env = function
  | Lit x -> x
  | Binop (e1, op, e2) -> (
      let v1 = eval env e1 in
      let v2 = eval env e2 in
      match op with
      | Add -> v1 + v2
      | Sub -> v1 - v2
      | Mul -> v1 * v2
      | Div -> v1 / v2)
  | Seq (e1, e2) ->
      let _ = eval env e1 in
      eval env e2
  | Asn (var, e) ->
      let value = eval env e in
      Hashtbl.replace env var value;
      value
  | Var var ->
      if Hashtbl.mem env var then Hashtbl.find env var
      else failwith ("Undefined variable " ^ var)
