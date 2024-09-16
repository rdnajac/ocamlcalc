# OCaml Calculator Project

A simple calculator implemented in OCaml using a lexer and parser.

## Features

- Basic arithmetic operations (addition, subtraction, multiplication, division)
- Integer literals and parentheses for grouping
- Variable assignments and expression sequences

## Project Structure

- `bin/`: Main executable code
- `lib/`: Core logic (AST, parser, lexer, evaluator)
- `test/`: Test files
- `Makefile`: Alternative build process

## Building and Running

### Using dune (Recommended)

```
dune build
dune exec calc
dune test
```

### Using Makefile (Alternative)

```
make
./calc
make clean
```

> [!NOTE]
> The Makefile doesn't handle tests. Use dune for comprehensive testing.

## Usage

Enter expressions at the prompt:

```
> 2 + 3
5
> x = 10
10
> y = 5
5
> x * y
50
> exit
```

> [!TIP]
> Type "exit" to quit.

