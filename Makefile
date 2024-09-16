all: calc

calc: calculator.cma bin/main.ml
	ocamlc -I lib -o calc calculator.cma bin/main.ml

calculator.cma: lib/ast.mli lib/parser.mli lib/parser.ml lib/lexer.ml lib/eval.ml lib/calculator.ml
	ocamlc -I lib -a -o calculator.cma lib/ast.mli lib/parser.mli lib/parser.ml lib/lexer.ml lib/eval.ml lib/calculator.ml

lib/parser.ml lib/parser.mli: lib/parser.mly
	ocamlyacc lib/parser.mly

lib/lexer.ml: lib/lexer.mll
	ocamllex lib/lexer.mll

clean:
	rm -f calc calculator.cma lib/parser.ml lib/parser.mli lib/lexer.ml
	rm -f *.cmi *.cmo lib/*.cmi lib/*.cmo

.PHONY: all clean