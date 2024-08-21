# File I/O

**File**: Represents a sequence of bytes on the disk where a group of related data is stored.
- Created for permanent storage of data.
- In C, we use file pointers to modify files.
	* `stdio.h` provides the `FILE` `struct` for us.

**Stream**: File is treated as a sequence of bytes,
- Access is sequential (i.e., in byte order).
- Cannot replace data in the middle of a file.

**Raw**: Files are sequences of blocks.
- Any block can be read and/or written independently.

# C File Functions

| Function    | Description                               |
|-------------|-------------------------------------------|
| `fopen()`   | create a new file or open a existing file |
| `fclose()`  | closes a file                             |
| `fgetc()`   | reads a character from a file             |
| `fputc()`   | writes a character to a file              |
| `fscanf()`  | reads a set of data from a file           |
| `fprintf()` | writes a set of data to a file            |
| `getw()`    | reads a integer from a file               |
| `putw()`    | writes a integer to a file                |
| `fseek()`   | set the position to desire point          |
| `ftell()`   | gives current position in the file        |
| `rewind()`  | set the position to the beginning point   |

> **Note**: `fclose()` returns zero on success and EOF if there's an error.
> - EOF is a constant defined in `stdio.h`
> - Failing to close can lead to corruption of data.

# Opening and Closing a File

## Filename and Mode

**Filename**: Name of the file.

**Mode**: Purpose of opening the file.
- Used when opening/creating a file.

| Mode | Description                                          |
|------|------------------------------------------------------|
| r    | opens a text file in reading mode                    |
| w    | opens or creates a text file in writing mode         |
| a    | opens a text file in append mode                     |
| r+   | opens a text file in both reading and writing mode   |
| w+   | opens a text file in both reading and writing mode   |
| a+   | opens a text file in both reading and writing mode   |
| rb   | opens a binary file in reading mode                  |
| wb   | opens or creates a binary file in writing mode       |
| ab   | opens a binary file in append mode                   |
| rb+  | opens a binary file in both reading and writing mode |
| w+   | opens a binary file in both reading and writing mode |
| a+   | opens a binary file in both reading and writing mode |

> **Notes**:
> - `w` will overwrite an existing file.
> - `r+`, `w+`, `a+` can be dangerous.
> - `b` is for dealing with raw data.


## Examples

> **Example**: Writing to a file
> ```c
> #include <stdio.h>
> int main() {
> 	// Open "one.txt" in write mode
> 	FILE *fp = fopen("one.txt", "w");
> 	char ch;
> 	// Write to the file with user inputted characters.
> 	printf("Enter data...\n");
> 	while( (ch = getchar()) != EOF) {
> 		putc(ch, fp);
> 	}
> 	// Close file and return
> 	fclose(fp);
> 	return 0;
> }
> ```

> **Example**: Reading from a file
> ```c
> #include <stdio.h>
> int main() {
> 	// Open "one.txt" in read mode
> 	FILE *fp = fopen("one.txt", "r");
> 	char ch;
> 	// Print contents character by character
> 	while( (ch = getc(fp)) != EOF) {
> 		printf("%c",ch);
> 	}
> 	// Close file and return
> 	fclose(fp);
> 	return 0;
> }
> ```
<!--*-->

# `fseek`

`fseek()`: Function used to move file pointer position to a given location.

> **Format**: `int fseek(FILE *fp, long int offset, int whence)`
- **fp**: file pointer
- **offset**: Number of bytes/characters to be offset/moved from whence/the current file pointer position
- **whence**: This is the current file pointer position from where offset is added.
	- Below 3 constants are used to specify this.

| File Operation | Declaration and Description                               |
|----------------|-----------------------------------------------------------|
| `SEEK_SET`     | Moves file pointer position to the beginning of the file. |
| `SEEK_CUR`     | Moves file pointer position to given location.            |
| `SEEK_END`     | Moves file pointer position to the end of file.           |

