# GDB

**GDB (GNU Project Debugger)**: Lets you look inside programs and debug them.

> Three Types of Errors:
> 1. **Syntax Errors**: Occur during compilation. 
> 2. **Runtime Errors**: Occur while the program is executing.
> 	- Typically prevents program from continuing.
> 3. **Logical Errors**: Occur while the program is executing. 
> 	- Typically allows program to keep going.

> Debugger Terms:
> - **Step into** goes into the method and executes each piece step-by-step.
> - **Step over** executes the method as one step.
> - **Step return** runs the remainder of the current method as one step.
> - **Resume** leaves the debugger.
> - **Line breakpoint** temporarily pauses execution at this line.

## Common GDB Commands

**Basic Execution**:
- `break`: Place a breakpoints.
- `continue`: Continue executing until the next break point.
- `next`: Execute the next line as a single instruction.
	- Any functions in the next line will be executed in a single step.
- `step`: Execute the next line, *stepping into* any functions.
- `finish`: Execute until current function returns (*stepping out*).
- `print`: Print the value of a variable.

**Manipulation**:
- `set var <variable_name>=value`: Set the value of a variable.
- `return <expression>`: Force the current function to return immediately with the given value. 

**Help**:
- `help`: e.g., `help all`

## Demo: Debugging a Program with GDB

Here is a program with a logical error:
```c
#include <stdio.h>
int main()
{
	int i, num, j;
	printf("Enter a number: ");
	scanf("%d", &num);
	for (i=1;i<num;i++)
		j=j*i;
	printf("Factorial of %d is %d\n", num, j);
}
```

Here is an example interaction showing the error:
```bash
$ ./factorial
Enter a number: 6
Factorial of 6 is 3931680
```

To debug our program we need to compile our program with the `-g` flag before running it with gdb.

```bash
$ $ gcc -o factorial -std=c99 -g factorial.c
$ gdb --quiet factorial
Reading symbols from factorial...
(gdb) break 7
Breakpoint 1 at 0x119b: file factorial.c, line 7.
(gdb) run
Starting program: /tmp/temporary/factorial 
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib64/libthread_db.so.1".
Enter a number: 7

Breakpoint 1, main () at factorial.c:7
7               for (i=1;i<num;i++)
(gdb) print j
$1 = 32767
```
- Here we set a `break`point on line 7, `run` the program up until that breakpoint, and `print` the value of `j` (the variable supposed to store the result of the factorial calculation).
	* We can see that `j` has a garbage value in it (`32767`). To fix the program we just need to initialize `j` with a value of 1
		+ We could also manipulate the value of `j` inside gdb (e.g., `set var j=1`)

> **Note**: If compiled with `-Wall`, the following warning is given, warning us about `j` being uninitialized.
> ```
> hello.c:6:9: warning: ignoring return value of ‘scanf’ declared with attribute ‘warn_unused_result’ [-Wunused-re
> sult]
>     6 |         scanf("%d", &num);
>       |         ^~~~~~~~~~~~~~~~~
> In file included from /usr/include/stdio.h:906,
>                  from hello.c:1:
> In function ‘printf’,
>     inlined from ‘main’ at hello.c:9:2:
> /usr/include/bits/stdio2.h:86:10: warning: ‘j’ may be used uninitialized [-Wmaybe-uninitialized]
>    86 |   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> hello.c: In function ‘main’:
> hello.c:4:21: note: ‘j’ was declared here
>     4 |         int i, num, j;
>       |                     ^
> ```
<!--~~__-->

> **Example**: Playing with gdb
> ```bash
> $ gdb --quiet factorial
> Reading symbols from factorial...
> (gdb) break 6
> Breakpoint 1 at 0x1180: file factorial.c, line 6.
> (gdb) run
> Starting program: /tmp/temporary/factorial 
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib64/libthread_db.so.1".
> 
> Breakpoint 1, main () at factorial.c:6
> 6               scanf("%d", &num);
> (gdb) print num
> $1 = 32767
> (gdb) next
> Enter a number: 42
> 7               for (i=1;i<num;i++)
> (gdb) print num
> $2 = 42
> ```
> - `(gdb) break 6`: Set a breakpoint on the line containing `scanf`
> - `(gdb) run`: Run the program until the next breakpoint.
> - `(gdb) print num`: Print the value of `num`. We can see that it returns a garbage value (32767).
> - *we enter the number `42`*
> - `(gdb) print num`: Print the value of `num`. We can see that it returns the value of `42`.


