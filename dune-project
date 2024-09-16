(lang dune 3.16)

(name calculator)

(generate_opam_files true)

(source
 (github rdnajac/ocamlcalc))

(authors "Ryan D. Najac")

(maintainers "Ryan D. Najac")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name calculator)
  (synopsis "A simple calculator implemented in OCaml using lexer and parser generators (ocamllex, ocamlyacc)")
  (description "A calculator supporting basic arithmetic operations, variable assignments, and expression sequences")
(depends ocaml dune ounit2)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
