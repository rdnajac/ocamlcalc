{
open Parser
}

let digit = ['0'-'9']
let letter = ['a'-'z' 'A'-'Z']
let whitespace = [' ' '\t' '\r' '\n']+
let identifier = letter (letter | digit)*

rule tokenize = parse
  whitespace { tokenize lexbuf }
| '+' { PLUS }
| '-' { MINUS }
| '*' { TIMES }
| '/' { DIVIDE }
| ';' { SEQ }
| '=' { ASN }
| '(' { LPAREN }
| ')' { RPAREN }
| identifier as id { VARIABLE(id) }
| digit+ as lit { LITERAL(int_of_string lit) }
| eof { EOF }
| _ { raise (Failure ("Unexpected char: " ^ Lexing.lexeme lexbuf)) }
