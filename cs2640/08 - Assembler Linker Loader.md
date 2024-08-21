---
title: "Assembler, Linker, & Loader" 
---

# Compiler $\to$ Linker $\to$ Loader

**Compiler**: Turns high-level source code into machine code.

**Assembler**: **Encodes** assembly code into machine code.

> **Note**: Javac
> - Java is special in that it compiles into bytecode for the JVM rather than a particular CPU's machine code.
> 	* "Write once, run everywhere"

**Linker**: Combine object files into an executable.
- e.g., Doing `-lm` in gcc to link the math library for a C program.
- Makes separate compilation/assembly possible.

**Loader**: Brings executable into memory and starts execution.
- Initializes registers, stack, arguments to first functions
- Jumps to entry point

> **Example**: Manually calling the compiler, assembler, and linker
> ```bash
> # Compiler
> gcc -S sum.c
> # Assembler
> as -o sum.o sum.s
> # Linker
> ld -o sum sum.o
> # Execute (Uses Loader)
> ./sum
> ```
> - **Etymology**: The linker is unintuitively named `ld` because it stands for "**l**ink e**d**itor"

# Assembly and Machine Language

$$
\text{Assembly Language} \to
\text{(Assembler)} \to
\text{Machine Language}
$$

**Assembly Language**: Symbolic representation of machine language.
- More readable, use symbols for bits
- Uses labels for address

**Machine Language**: Set of instruction codes used to represent operations and date.
- Binary form.

> **When to Use Assembly:**
> 1. Speed and size is critically important
> 2. To use specialized instructions not available in high-level languages
>	 - e.g., INT, single instruction loop, SIMD, etc.
> 3. Platform only supports assembly. 

> **Assembly Drawbacks**:
> - ISA dependent (architecture dependent)
>	- Not portable
> - Longer than high-level language
> - No high-level constructs
> - Hard to read.
>	- This is why *good* comments are important.

> **More on Assembly:**
> - A programming language
> - Provides only a few, simple types of data and control flow
> - Typically no types.
> 	* Programmers define the type
> - All control flow implemented via go to.
> - Difficult and error-prone

# More on Assemblers

$$
\text{Assembler's Job: }
\text{Source} \to
\text{Object}
$$

**Assembler**: Translate a file of assembly language statements (source) into a file of binary machine instructions and binary data (object).

**Two Major Parts**
1. Identifies memory locations with symbolic references (labels), both code and data
2. Translate assembly statement into opcodes, register specifies, and labels not valid instructions.

**Object File Contains:**
- Machine instructions
- Data
- Other information
	* e.g., Symbol table, references, etc.
- Can't be executed until it's processed by the linker
