all: calculator

calculator: lib/parser.ml lib/lexer.ml lib/eval.ml bin/main.ml
	ocamlc -I lib -o calculator lib/ast.mli lib/parser.mli lib/parser.ml lib/lexer.ml lib/eval.ml bin/main.ml

lib/parser.ml lib/parser.mli: lib/parser.mly
	ocamlyacc lib/parser.mly

lib/lexer.ml: lib/lexer.mll
	ocamllex lib/lexer.mll

clean:
	rm -f calculator lib/parser.ml lib/parser.mli lib/lexer.ml
	rm -f *.cmi *.cmo

.PHONY: all clean