# Array

Allows you to store multiple values of the same type back-to-back (contiguously), with the same name.

- Arrays are zero-indexed in C.

Example:
```c
int scores[3];
scores[1] = 100;
scores[2] = 75;
scores[3] = 50;
```

## Strings, Again

Strings are arrays of `char`'s!
- We can index into them
- We can cast them into integers

### NUL Characters

How does the computer know where one string ends and begins in memory?

Answer: `\0`, or `00000000` bits serve as delimiters.
- e.g., So `"HI!"` is actually stored with 4 bytes represented in ASCII as decimal as `72 73 33 0`
- Data types that have well-defined byte lengths (e.g., ints, longs, floats, bools, chars, etc.) don't need NUL chars.

Example: Using `\0` to find when a string ends (determine length of string)
```c
int string_length(string x)
{
	int length = 0;
	while(x[i] != '\0')
	{
		length++;
	}
	return length;
}
```

- Or, you can use the built-in `strlen()` function in the `#include <string.h>` library instead of re-inventing the wheel

## Some More Contrived Examples

### Printing a String by `printc`

Suppose we have a string we want to print using `printc`.

We would have to iterate over every char in the string and print it out using a loop, like so:

```c
void print_string(string x)
{
	// Syntactic Sugar: Storing strlen in a var instead of re-running it every loop
	for (int i = 0; length = strlen(x); i < length; i++)
	{
		printc("%c", s[i]);
	}
}
```

### Upper-casing a String

Resource: https://asciichart.com

```c
string uppercase_string(string s)
{
	for (int i = 0; length = strlen(x); i < length; i++)
	{
		// Detect lowercase ASCII (96 <= s[i] <= 122)
		if (s[i] >= 'a' && s[i] <= 'z') 
		{
			s[i] -= 32;
		}
		printc("%c", s[i]);
	}
}
```

- Or, you can use the built-in `islower()` function in `ctypes.h` instead of `s[i] >= 'a' && s[i] <= 'z'`; or just the `toupper()` function in `ctypes.h`

