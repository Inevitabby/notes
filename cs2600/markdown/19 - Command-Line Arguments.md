# Command Line Arguments

Command-line arguments are accessible through two parameters in `main()`:
- `int argc`: Argument count.
	* Includes the name of the executable itself.
- `int * argv`: Argument values stored as strings in a 2D array.
	* Rows are fixed to value of `argc`.
	* Columns are strings that save the various command line arguments.
	* Explicit allocation not needed.

> **Example**: Printing command arguments
> ```c
> #include <stdio.h>
> int main(int argc, char **argv) {
> 	for (int i = 0; i < argc; ++i) {
> 		printf("%s\n", argv[i]);
> 	}
> 	return 0;
> }
> ```
> 
> Example Interaction:
> ```
> ```bash
> $ ./a.out -x -c -v -b
> ./a.out
> -x
> -c
> -v
> -b
> ```
<!--**-->

# String Conversion Functions from `stdlib.h`

| Function  | Description                             |
|-----------|-----------------------------------------|
| `atof`    | Convert String to Floating-Point        |
| `atoi`    | Convert String to Integer               |
| `atol`    | Convert String to Long Integer          |
| `strtod`  | Convert String to Double                |
| `strtol`  | Convert String to Long Integer          |
| `strtoll` | Convert String to Long Long             |
| `strtoul` | Convert String to Unsigned Long Integer |


