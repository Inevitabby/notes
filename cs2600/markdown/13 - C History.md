# Introduction

**Why C?**
- Most operating systems are written in C.
- Great for portability.
- Large number of programs written.
- Importance of programs written.
- Longevity
- Influence

> **Intro for C++ Programmers** (C++ v.s. C):
> 
> > *"You can do OOP in C, but not cleanly, and why would you want to?"*
> 
> **C++ -> C**:
> - Classes and Member Functions.
> 	* Use `struct` and global functions.
> - Derived Classes and Virtual Functions.
> 	* Use `struct`, global functions, and pointers to functions
> - Templates and Inline Functions
> 	* Use macros
> - Exceptions
> 	* Use error-codes, error-return values, etc.
> - Function Overloading
> 	* Give each function a separate name
> - `new`/`delete`
> 	* Use `malloc()`/`free()`
> - References
> 	* Use pointers
> - `const` in constant expressions
> 	* Use macros
> 
> **Missing in C**:
> - No class, only `struct`
> - No methods. No constructors. No destructors.
> - No `private` / `protected`.
> - No `string`, `iostream`, `ifstream`, `vector` ...
> - No overloading of operators
> - No overloading of functions
> - `<<` and `>>` have nothing to do with I/O!
> - No templates, STL,...
> - No inheritance

# History

In 1978, the first book of C programming, *The C Programming Language*, was published.

**ANSI C:**
- **C89**: The first standard of C was published by American National Standards Institute (ANSI) in 1989.
- **C99**: In late 1990’s, several new features like inline functions, several new data types and flexible array-members were added to the C standard.
- **C11**: The C11 standard has new features like type generic macros, atomic operations, anonymous structures that doesn’t exist in C99.

**C18/C17**:
- **C18**: Published in June 2018, C18 is the current standard for the C programming language. It introduces no new language features, only technical corrections, and clarifications to defects in C11.
