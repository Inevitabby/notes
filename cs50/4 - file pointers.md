# File Pointers

- The ability to read/write data to files is the primary way of storing persistent data.
- **Persistent Data**: Data that doesn't disappear when your program stops running
- The abstraction of files that C provides is implemented in a data structure known as a `FILE`.
- File manipulation functions live in `stdio.h`, which all accept `FILE*` as one of their parameters, except `fopen()`.

# Important `stdio.h` Functions

`fopen()`
- Opens a file and returns a file pointer to it.
- Always check the return value to make sure you don't get back `NULL`.
```c
FILE* ptr1 = fopen("read.txt", "r");
FILE* ptr2 = fopen("write.txt", "w");
FILE* ptr3 = fopen("append.txt", "a");
```

`fclose()`
- Closes a file pointed to by the given file pointer.
```c
fclose(ptr1);
```

`fgetc()`
- Reads and returns the next character from the file pointed to.
- File must be `fopen`ed in reading (`"r"`) mode.
```c
char ch = fgetc(ptr1);
```
```c
// `cat` command: read all the characters from a file and print them to the screen, one-by-one
char ch;
while ((ch = fgetc(ptr)) != EOF)
	printf("%c", ch);
```

`fputc()`
- Writes or appends a character to the pointed-to file.
- File must be `fopen`ed in write or append more.
```c
fputc('A', ptr2);
fputc('!', ptr2);
```
```c
// `cp` command: copy contents of ptr1 to ptr2
char ch;
while ((ch = fgetc(ptr)) != EOF)
	fputc(ch, ptr2);
```

`fread()`
- Reads `<qty>` units of size `<size>` from the file pointed-to and store them in memory in a buffer (usually an array) pointed-to by `<buffer>`
	* Can be thought of as a wrapped for `fgetc()`
- File must be `fopen`ed in reading (`"r"`) mode.
```c
// Read 10 integers from ptr into arr
int arr[10];
fread(arr, sizeof(int), 10, ptr);
```
```c
// Store 80 doubles in a array of doubles size 80
double* arr2 = malloc(sizeof(double) * 80);
feead(arr2, sizeof(double), 80, ptr);
```
```c
// Work like fgetc()
char c;
fread(&c, sizeof(char), 1, ptr);
```

`fwrite()`
- Writes `<qty>` units of size `<size>` to the file pointed-to by reading them from a buffer (e.g., an array) pointed to by `<buffer>`.
- File must be `fopen`ed in write or append more.
```c
// Write ten elements an array of ints size 10 into ptr
int arr[10];
fwrite(arr, sizeof(int), 10, ptr);
```
```c
// Write 80 doubles from an array of 80 doubles into ptr
double* arr2 = malloc(sizeof(double) * 80);
fwrite(arr2, sizeof(double), 80, ptr);
```
```c
// Work like fputc()
char c;
fwrite(&c, sizeof(char), 1, ptr);
```

# Other Common Functions

- `fgets()`: Get string from file
- `fputs()`: Write string into file
- `fprintf()`: Print formatted string to file
- `fseek()`: Set position in stream
- `ftell()`: Tell position in stream
- `feof()`: Tells whether read to end of a file
- `ferror()`: Indicates whether an error has occurred in working with a file
