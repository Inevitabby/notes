> **Note**: It is assumed that you are already familiar with C++ or Java.

# C Communities

- [StackOverflow](https://stackoverflow.com/questions/tagged/c?sort=frequent&pageSize=15)
- [CodeChef](https://www.codechef.com/c-programming)

# Overview

## Keywords

- `auto`
- `double`
- `int`
- `struct`
- `break`
- `else`
- `long`
- `switch`
- `case`
- `enum`
- `register`
- `typedef`
- `char`
- `extern`
- `return`
- `union`
- `continue`
- `for`
- `signed`
- `void`
- `do`
- `if`
- `static`
- `while`
- `default`
- `goto`
- `sizeof`
- `volatile`
- `const`
- `float`
- `short`
- `unsigned`

> **Note**: C is a case-sensitive language, so all keywords must be written in lowercase.

## Operators

- `arithmetic`: `+`, `-`, `*`, `/`, `%`
- `assignment`: `=`
- `augmented assignment`: `+=`, `-=`, `*=`, `/=`, `%=`, `&=`, `|=`, `^=`, `<<=`, `>>=`
- `bitwise logic`: `~`, `&`, `|`, `^`
- `bitwise shifts`: `<<`, `>>`
- `boolean logic`: `!`, `&&`, `||`
- `conditional evaluation`: `?` `:`
- `equality testing`: `==`, `!=`
- `calling functions`: `( )`
- `increment and decrement`: `++`, `--`
- `member selection`: `.`, `->`
- `object size`: `sizeof`
- `order relations`: `<`, `<=`, `>,` `>=`
- `reference and dereference`: `&`, `*`, `[ ]`
- `sequencing`: `,`
- `subexpression grouping`: `( )`
- `type conversion`: `(`*typename*`)`

# Getting Started

Here is an example program:

```c
#include <stdio.h>
int main()
{
	printf("Hello, World\n");
	return 0;
}
```
- `stdio.h`: The standard input/output library.
	* Included in the program via the `#include` preprocessor.
	* Appears at the beginning of many C source files.
	* `printf()` is defined in here.
- `return 0`: Exit with code 0.
	* Tells operating system that the program exited normally.
	* Not necessary, but good practice.
- `printf()`: Sends formatted output to `stdout`.
	* A sequence of characters in double quotes like "`Hello, World\n`" is a **character string** or **string constant**
	* Can print characters, strings, floats, integers, octals, and hexadecimal values. 

Here's another example program:
```c
#include <stdio.h>
int main()
{
	puts("Hello, World");
	return 0;
}
```
- This time we use `puts()`, which prints a string to `stdout` with a newline.

<!--
```c
#include <stdio.h>
int main(int argc, char **argv)
{
	printf("Hello, World\n");
	return 0;
}
```
-->

> **Note on Comments**: Some versions of C only support multi-line comments (`/* */`), though C99 added support for single-line comments (`//`)

# Compiling and Running

Simplest: 
```bash
$ gcc hello.c
```

Change default name:
```bash
$ gcc hello.c -o hello
```

Take advantage of "recent" improvements:
```bash
$ gcc –o hello –std=c99 hello.c
```

See more warnings:
```bash
$ gcc –o hello –std=c99 -Wall hello.c
```

Turn on light optimization (helps us see more warnings like uninitialized variables):
```bash
$ gcc –o hello –std=c99 -Wall -O1 hello.c
```

# `make`

`make`: Goes through a *descriptor file* starting with the **target** it is going to create.
- Used to compile/build software made of many source files.
	* Can be used in conjunction with most programming languages.

> **Example**: Minimal makefile
> 
> ```makefile
> # Makefile
> all:    hello
> # This line says that hello.c is a dependency of hello
> hello:  hello.c
>	# Make runs this only if ./hello has a timestamp older than hello.c
> 	gcc -o hello -std=c99 -Wall -O1 hello.c
> clean:
> 	rm -f hello
> ```
> - Now we can just do `make && ./hello`{.bash}
>	- We can also do `make clean` to delete the `hello` file.

**How `make` Works:**
- Default descriptor files it searches for are `makefile` and `Makefile`.
- Looks at each target's *dependencies* to see if they're also listed as targets.
	* Follows chain of dependencies until it reaches the end of the chain, and then begins backing out executing the commands found in each target's rule.
		+ Looks at time stamp for each file in the chain and compiled from the point that is required to bring every file in the chain up to date.
			+ e.g., if a source file is changed, only its object file needs to be compiled and then linked into the executable instead of recompiling all the source files.
- Can also handle cleanup of leftover files.

> **Note**: Commands must be indented with tabs rather than spaces. 

> **Example**: Another Makefile
> ```makefile
> FLAGS = -std=c99 -Wall -O1
> all:    hello goodbye
> hello:  hello.c goodbye.c
> 	gcc ${FLAGS} -o hello hello.c
> 	gcc ${FLAGS} -o goodbye goodbye.c
> clean:
> 	rm -f hello
> 	rm -f goodbye
> ```

# More on `printf`

`printf()` is a function provided by the standard I/O library (`stdio.h`).
- Can print characters, strings, floats, integers, octals, and hexadecimals.

> **Example**: Using `printf()`
> ```c
> #include <stdio.h>
> int main()
> {
> 	char grade = 'A';
> 	# Print a char
> 	printf("Character grade is %c \n", grade);
> 	# Print a float
> 	float toll= 15.678;
> 	printf("Toll value is %f \n", toll);
> 	# Print an int
> 	int x = 125;
> 	printf("Integer x value is %d\n" , x);
> 	# Print a double
> 	double width= 23.123456;
> 	printf("Double value is %lf \n", width);
> 	# Print an octal
> 	printf("Octal value of x is %o \n", x);
> 	# Print a hexadecimal
> 	printf("Hexadecimal value of is %x \n", x);
> 	return 0;
> }
> ```

## Format Specifiers

| Format Specifier | Description                                         |
|------------------|-----------------------------------------------------|
| %d               | value of an integer variable                        |
| %c               | value of a character variable                       |
| %f               | value of a float variable                           |
| %lf              | value of a double variable                          |
| %s               | value of a string variable                          |
| %o               | octal value corresponding to integer variable       |
| %x               | hexadecimal value corresponding to integer variable |
| %\n              | newline character                                   |

<!--
| Format Specifier   | Description                   |
|--------------------|-------------------------------|
| `%c`               | Character                     |
| `%d`               | Signed integer                |
| `%e or %E`         | Scientific notation of floats |
| `%f`               | Float values                  |
| `%g or %G`         | Similar as `%e `or `%E`       |
| `%hi`              | Signed integer (short)        |
| `%hu`              | Unsigned Integer (short)      |
| `%i`               | Unsigned integer              |
| `%l or %ld or %li` | Long                          |
| `%lf`              | Double                        |
| `%Lf`              | Long double                   |
| `%lu`              | Unsigned int or unsigned long |
| `%lli or %lld`     | Long long                     |
| `%llu`             | Unsigned long long            |
| `%o`               | Octal representation          |
| `%p`               | Pointer                       |
| `%s`               | String                        |
| `%u`               | Unsigned int                  |
| `%x or %X`         | Hexadecimal representation    |
| `%n`               | Prints nothing                |
| `%%`               | Prints `%` character          |
-->

## Escape Sequences

| Escape Sequence | Description                                                                                            |
|-----------------|--------------------------------------------------------------------------------------------------------|
| \n              | Newline. Position cursor to the beginning of the next line.                                            |
| \t              | Horizontal tab. Move cursor to the next tab stop                                                       |
| \r              | Carriage return. Position cursor to the beginning of the current line; do not advance to the next line |
| \a              | Alert. Sound the system bell                                                                           |
| \\              | Backslash. Used to print a backslash character                                                         |
| \’              | Single quote. Use to print a single quote character                                                    |
| \”              | Double quote. Used to print a double quote character                                                   |

# `scanf()`

`scanf()`: Function to read character, string, numeric data from keyboard.
- Uses format specifiers to determine the type of data being read.
	* Will do *some* typecasting automatically for you (e.g., storing an integer in a float).

> **Example**: Reading a character from `stdin`
> ```c
> #include <stdio.h>
> int main()
> {
> 	char userChar;
> 	puts("Please enter a character: ");
> 	scanf("%c", &userChar);
> 	printf("Your character: %c\n", userChar);
> 	return 0;
> }
> ```

> **Example**: Doing math on user input.
> ```c
> #include <stdio.h>
> int main()
> {
> 	int x, y, z;
> 	printf("Input three different integers: \n");
> 	scanf("%d %d %d", &x, &y, &z);
> 
> 	int SUM = x + y + z;
> 	float AVG = (SUM / 3);
> 	int PRODUCT = x * y * z;
> 
> 	printf("Sum: %d \n", SUM);
> 	printf("Average: %f \n", AVG);
> 	printf("Product: %d \n", PRODUCT);
> 	return 0;
> }
> ```

> **Example**: Printing the squares and cubes of the first 10 positive integers.
> ```c
> #include <stdio.h>
> int main()
> {
> 	printf("Number\tSquare\tCube\n");
> 	for (int i = 1; i <= 10; i++)
> 	{
> 		int NUMBER = i;
> 		int SQUARE = i * i;
> 		int CUBE = i * i * i;
> 		printf("%d\t%d\t%d\n", NUMBER, SQUARE, CUBE);
> 	}
> 	return 0;
> }
> ```

# Math Library

**How-To Use**:
- `#include <math.h>`{.c}
- Add the `-lm` option to gcc.
	* e.g., `gcc -o hello -std=c99 -O2 -lm hello.c`{.bash}

**Common Functions:**

| Function | Description                                      |
|----------|--------------------------------------------------|
| `acos`   | Arc cosine                                       |
| `acosh`  | Hyperbolic arc cosine                            |
| `asin`   | Arc sine                                         |
| `asinh`  | Hyperbolic arc sine                              |
| `atan`   | Arc tangent                                      |
| `atan2`  | Arc tangent and determine quadrant using sign    |
| `atanh`  | Hyperbolic arc tangent                           |
| `cbrt`   | Cube root                                        |
| `ceil`   | Nearest integer greater than the argument        |
| `cos`    | Cosine                                           |
| `cosh`   | Hyperbolic cosine                                |
| `exp`    | Exponential                                      |
| `fabs`   | Absolute argument of floating point argument     |
| `floor`  | Nearest integer lower than the argument passed   |
| `hypot`  | Square root of sum of two arguments (hypotenuse) |
| `log`    | Natural logarithm                                |
| `log10`  | Logarithm of base 10                             |
| `pow`    | Number raised to given power                     |
| `sin`    | Sine                                             |
| `sinh`   | Hyperbolic sine                                  |
| `sqrt`   | Square root                                      |
| `tan`    | Tangent                                          |
| `tanh`   | Hyperbolic tangent                               |

# Random Number Generation (`srand` and `rand`)

`srand()`: Seeds the pseudo random number generator used by the `rand()`
- Default seed is 1.
- Defined in `stdlib.h`

> **Example**: Seeding the random number generator with the machine's current time.
> ```c
> #include <stdio.h>
> #include <stdlib.h>
> #include <time.h>
> int main()
> {
> 	srand(time(0));
>	int RANDOM = rand();
> 	printf("Random Number: %d", RANDOM);
> 	return 0;
> }
> ```

> **Example**: Generating a random number in a range.
> ```c
> #include <stdio.h>
> #include <stdlib.h>
> #include <time.h>
> int main()
> {
> 	srand(time(0));
>	int RANDOM = 5+rand()%16;
> 	printf("Random Number between 5 and 20: %d", RANDOM);
> 	return 0;
> }
> ```

# More Functions from `stdlib.h`

**Communication with the Environment**:
- `abort`: Abort program.
- `atexit`: Register function called at program exit.
- `exit`: Exit from a program.
- `getenv`: Get environment string.
- `system`: Perform operating system command.

**Integer Arithmetic**:
- `abs`: Absolute value of integer
- `div`: Integer division
- `labs`: Absolute value of long integer.
- `ldiv`: Long integer division.

**String Conversion**:
- `atof`: Convert string to floating point
- `atoi`: Convert string to integer
- `atol`: Convert string to long integer
- `strtod`: Convert string to double
- `strtol`: Convert string to long integer
- `strtoll`: Convert string to long long
- `strtoul`: Convert string to unsigned long integer

**Dynamically Allocated Arrays**:
- `calloc`: Allocate and clear memory block.
- `malloc`: Allocate memory block.
- `realloc`: Resize memory block.

**Deallocating Storage**:
- `free`: Free memory block

**Searching and Sorting Functions**:
- `bsearch`: Binary search
- `qsort`: Sort array

# More Functions from `string.h`

**Comparison:**
- `memcmp`: Compare memory blocks
- `stcmp`: String compare
- `strcoll`: String compare using locale-specific collating sequence
- `strncmp`: Bounded string compare
- `strxfrm`: Transform locale-specific string.

**Search**:
- `memchr`: Search memory block for character.
- `strchr`: Search string for character
- `strcspn`: Search string for initial span of characters not in set
- `strpbrk`: Search string for one of a set of characters
- `strrchr`: Search string in reverse for character
- `strspn`: Search string for initial span of characters in set
- `strstr`: Search string for substring
- `strtok`: Search string for token
- `strcat`: Search string for concatenation
- `strncat`: Search string for bounded string concatenation

**Copying**:
- `memcpy`: Copy memory block
- `memmove`: Copy memory block
- `strcpy`: String copy
- `strncpy`: Bounded string copy

**Miscellaneous**:
- `memset`: Initialize memory block. 
- `strerror`: Convert error number to string.
- `strlen`: String length.
