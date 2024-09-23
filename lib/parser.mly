%{ open Ast %}

%token PLUS MINUS TIMES DIVIDE EOF
%token LPAREN RPAREN
%token ASN SEQ
%token <int> LITERAL
%token <string> VARIABLE

%right SEQ
%right ASN
%left PLUS MINUS
%left TIMES DIVIDE

%start expr
%start rpn_expr
%type <Ast.expr> expr
%type <Ast.expr> rpn_expr

%%

expr:
| expr PLUS   expr { Binop($1, Add, $3) }
| expr MINUS  expr { Binop($1, Sub, $3) }
| expr TIMES  expr { Binop($1, Mul, $3) }
| expr DIVIDE expr { Binop($1, Div, $3) }
| LPAREN expr RPAREN { $2 }
| LITERAL          { Lit($1) }
| VARIABLE         { Var($1) }
| VARIABLE ASN expr { Asn($1, $3) }
| expr SEQ expr    { Seq($1, $3) }

rpn_expr:
| rpn_operand rpn_expr_tail { $2 $1 }

rpn_expr_tail:
| EOF { fun x -> x }
| rpn_operator rpn_expr rpn_expr_tail { fun x -> $3 (Binop(x, $1, $2)) }

rpn_operand:
| LITERAL { Lit($1) }
| VARIABLE { Var($1) }

rpn_operator:
| PLUS { Add }
| MINUS { Sub }
| TIMES { Mul }
| DIVIDE { Div }