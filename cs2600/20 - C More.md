# Error Handling

C does not provide any direct support for error handling.
- Some methods and variables are defined in `errno.h`.
- Returning `-1` or `NULL` when a function fails is common practice.
	* `errno` should also be updated.

`errno`: Global variable that stores program's state.
- Set to zero at program startup.
- Interacts with some functions of the standard C library. 
- You can modify its value at your convenience.

| errno value | Error                     |
|-------------|---------------------------|
| 1           | Operation not permitted   |
| 2           | No such file or directory |
| 3           | No such process           |
| 4           | Interrupted system call   |
| 5           | I/O error                 |
| 6           | No such device or address |
| 7           | Argument list too long    |
| 8           | Exec format error         |
| 9           | Bad file number           |
| 10          | No child processes        |
| 11          | Try again                 |
| 12          | Out of memory             |
| 13          | Permission denied         |

> **Example**: Using errno
> 
> ```c
> #include <stdio.h>
> #include <errno.h>
> #include <string.h>
> int main () {
> 	FILE *fp;
> 
> 	printf("Value of errno: %d\n ", errno);
> 
> 	fp = fopen("IWillReturnError.txt", "r");
> 
> 	printf("Value of errno: %d\n ", errno);
> 
> 	printf("The error message is : %s\n", strerror(errno));
> 	perror("Message from perror");
> 	return 0;
> }
> ```
<!--*-->

## Division by Zero

Division by zero leads to an error with no handling/status.
- Always check the value of the divisor being doing division.

## `exit()`

Used to indicate exit status.
- Good practice to exit with an exit status. 
- `EXIT_SUCCESS` (`0`) and `EXIT_FAILURE` (`-1`) are two macros to show exit status.

> **Example**: Using `exit()`
> ```c
> if (ptr == NULL)
> {
> 	puts("malloc failed");
> 	puts(strerror(errno));
> 	exit(EXIT_FAILURE);
> }
> ```

# Preprocessor Statements

The preprocessors will process directives inserted in the C source code.
- Allow additional actions to be taken on the C source code before it is compiled into object code.
- Directive are not part of the C language itself.
- Begin with a pound symbol, may have several arguments.

| Directive | Description                                                                                                                                     | Example                                   |
|-----------|-------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------|
| #include  | Include another C file into the current file at the location of the #include statement prior to compiling the source code.                      | #include <stdio.h>                        |
| #define   | Define a macro which can be used as a constant throughout the source code.                                                                      | #define AGE 50                            |
| #undef    | Clear a macro which was previously defined.                                                                                                     | #undef AGE                                |
| #if       | Conditional expresssion which can be used to include source code for compilation.                                                               | #if AGE > 50                              |
| #ifdef    | Allows the inclusion of source code if the provided macro identifier has been defined. Equivalent to #if defined(identifier).                   | #ifdef SOLARIS                            |
| #ifndef   | Allows the inclusion of source code if the provided macro identifier has not been defined.                                                      | #ifndef WINDOWS                           |
| #elif     | Provides an alternate inclusion of source code when used with the #if, #ifdef, or #ifndef directives and the #elif condition evaluates to true. | #elif YEARS_OLD > 10                      |
| #else     | Allows the inclusion of source code if the preceeding #if, #ifdef, or #ifndef directive expression evaluates to false.                          | #else                                     |
| #endif    | Signals the end of a #if, #ifdef or #ifndef condition .                                                                                         | #endif                                    |
| #warning  | Report a warning message and continue preprocessing.                                                                                            | #warning Non-critical error found         |
| #error    | Report error and stop preprocessing.                                                                                                            | #error Windows is an unsupported platform |

> **Example**: Using #define
> ```c
> #include <stdio.h>
> #define height 100
> #define number 3.14
> #define letter 'A'
> #define letter_sequence "ABC"
> #define backslash_char '\?'
> void main()
> {
> 	printf("value of height : %d \n", height );
> 	printf("value of number : %f \n", number );
> 	printf("value of letter : %c \n", letter );
> 	printf("value of letter_sequence : %s \n", letter_sequence);
> 	printf("value of backslash_char : %c \n", backslash_char);
> }
> ```

> **Example**: Using `#ifdef`, `#else`, and `#endif`
> ```c
> #include <stdio.h>
> #define COUNT 100
> int main()
> {
> 	#ifdef COUNT
> 	printf(”COUNT is defined. So, this line will be added in " \
> 	"this C file\n");
> 	#else
> 	printf(”COUNT is not defined\n");
> 	#endif
> 	return 0;
> }
> ```

> **Example**: Using `#error`
> ```c
> #include <stdio.h>
> #include <limits.h>
> #define MILLISECONDS(age) (age * 365 * 24 * 60 * 60 * 1000)
> int main() {
> 	int age;
> 	#if INT_MAX < MILLISECONDS(12)
> 	#error Integer size cannot hold our age in milliseconds
> 	#endif
> 	age = MILLISECONDS(12);
> 	printf("John is %d milliseconds old\n", age);
> 	return 0;
> }
> ```
> - The `#error` directive is typically used to prevent compilation if a known condition exists that could cause a runtime error.
>	- e.g., Being compiled on an incompatible platform.

# String Tokenizer in `string.h`

> **Format**: `char* strtok(char* s1, const char* s2);`
> - `s1`: String to break into tokens.
> - `s2`: String containing delimiter characters.

> **Example**: Using `strtok()`
> ```c
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> char line[] = "2x^0 - 4x^1 + 3x^3 + 54x^4";
> int main() {
> 	int counter=0;
> 	printf("Polynomial is %s\n",line) ;
>	// Reading terms of a polynomial, ignoring whitespace
> 	char *tok = strtok(line, "x^");
> 	while (tok) {
> 		printf("*%s*\n", tok);
> 		tok = strtok(NULL, "x^");
> 		counter++ ;
> 	}
> 	printf("Number of terms are %d\n", counter-1);
> }
> ```

# `extern` Variables

`extern` variables are like global variables, except they can be shared among multiple files.
- When you use the `extern` keyword before the global variable declartion, the compiler understands you want to access a variable being defined in another program or file, so it doesn't allocate any memory and points to the global variable defined in the other file.
- So you can use the `extern` keyword in any number of programs to access the global variable *globalVar*.
	* However, the definition should only be at one place.

> **Example**: Using `extern`
> 
> `f1.c`:
> ```c
> global variable
> #include <stdio.h>
> int globalVar=3;
> void fun();
> int main() {
> 	fun();
> 	printf("Global var in f1 is %d\n", globalVar);
> 	return 1;
> }
> ```
> 
> `f2.c`:
> ```c
> #include <stdio.h>
> extern int globalVar;
> void fun() {
> 	printf("Global var in f2 is %d\n",
> 	globalVar);
> 	globalVar++;
> }
> ```

# `system()` call in `stdlib.h`

Lets you run system calls in UNIX systems.

> **Example**: Using system calls
> ```c
> #include <stdio.h>
> #include <stdlib.h>
> system() call in stdlib.h
> extern char **environ;
> int main() {
> 	puts("Looping with index");
> 	for (int index = 0; environ[index] != NULL; ++index)
> 		puts(environ[index]);
> 	puts("===============");
> 	puts("Looping with pointer");
> 	for (char **p = environ; *p != NULL; ++p)
> 		puts(*p);
> 	puts("===============");
> 	puts("system(\"env\")");
> 	system("env"); //system command env at prompt
> }
> ```
