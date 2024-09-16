# OCaml Calculator

A simple calculator in OCaml using a lexer and parser.

## Project Structure

1. `ast.mli`: Defines the Abstract Syntax Tree for our calculator language.
2. `parser.mly`: Specifies the grammar rules for parsing expressions.
3. `scanner.mll`: Defines the lexical analysis rules.
4. `calc.ml`: Contains the main evaluation logic and program entry point.
5. `Makefile`: Automates the build process.

## Features

- Basic arithmetic operations (addition, subtraction, multiplication, division)
- Integer literals
- Parentheses for grouping expressions
- Variable assignments
- Sequences of expressions

## Building the Project

To build the project, run:

```
make
```

This will compile all necessary files and create an executable named `calc`.

## Running the Calculator

After building, you can run the calculator using:

```
./calc
```

The calculator will read expressions from standard input and print the results.

## Testing

To run tests, use:

```
./calc < calc.tb
```
