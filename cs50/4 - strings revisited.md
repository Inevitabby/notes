# Strings Revisited

Strings are arrays of characters. They aren't a built-in data type like `int` or `bool`.

Consider this string:
```c
string s = "HI!";
```

In memory, this could be stored as:
| `H`     | `I`     | `!`     | `\0`    |
| :---:   | :---:   | :---:   | :---:   |
| `0x123` | `0x124` | `0x125` | `0x126` |

So... where is the variable `s`?
- `s` could be anywhere in the computer's memory (`0xWHATEVER`)
- `s` is storing (in this example) `0x123`, the pointer to the first character in `s`.

> Summary: A `string` variable is just a pointer to a place in memory that has the first character of the string. The rest of the string is in continuous memory, and it ends with `\0`.

Removing the `string` alias from the previous example, we get:
```c
char *s = "HI!";
```

## Example: Replacing `string` with `char *`

Original:
```c
#include <cs50.h>
#include <stdio.h>
int main(void)
{
	string s = "HI!";
	printf("%s\n", s);
}
```

Replaced:
```c
#include <stdio.h>
int main(void)
{
	char *s = "HI!";
	printf("%s\n", s);
}
```
- This code functions same as the one using `string` because the `%s` (character string) is built-in to `printf`.

## Pop Question: Different Addresses

```c
#include <cs50.h>
#include <stdio.h>
int main(void)
{
	string s = "HI!";
	char c = s[0];
	char *p = &c;
	printf("%p\n", p);
	printf("%p\n", s);
}
```

This code prints two different addresses separated by a newline, why?
- `c` is a copy of `s[0]` with its own unique address in memory.

## Example: Proving the Definition of a String in C (`&s[0] == &s`)

```c
#include <cs50.h>
#include <stdio.h>
int main(void)
{
	string s = "HI!";
	char *p = &s[0];
	printf("%p\n", p); // Address of the first character in s
	printf("%p\n", s); // Address of s
}
```

This program prints out the same pointer twice separated by a newline, why?
- `s` literally just points to the first character in the string.
	* We know the rest of the characters in the string is in contiguous chunks of memory terminated by `\0` (by definition/convention of a string)

For fun, lets print out the address of every character in the string:

```c
#include <cs50.h>
#include <stdio.h>
int main(void)
{
	string s = "HI!";
	printf("%p\n", s);
	printf("%p/n", &s[0]);
	printf("%p/n", &s[1]);
	printf("%p/n", &s[2]);
	printf("%p/n", &s[3]);
}
```
- Notice how this prints two identical addresses (s and s[0]) followed by 3 addresses incrementing by 1.

## Creating `string` 

Recall how we created a structure like so:
```c
struct
{
	string name;
	string number;
}
```

—and assigned it a definition like so:
```c
typedef struct
{
	string name;
	string number;
}
person;
```

So, to define a type called string, we can do this:
```c
typedef char *string;
```

> **Note**: The double quotes we've been using around our strings tells the compiler (1) where to put each char in memory (2) add the `\0` character at the end of the string and (3) return the pointer to the string

