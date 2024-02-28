# Pointer Drawbacks

> **Note**: Unlike C++, C has no smart pointers.

## Dangling Pointers

**Dangling Pointers**: Pointer that contains the address of a heap-dynamic variable that has been deallocated.
- This is why you should point pointers to NULL before deallocating a dynamic-heap variable.

> **Example**: Dangling pointer
> 
> 1.
> ```c
> int *x, *y;
> x = malloc(sizeof(int));
> *x = 1;
> y = x;
> free(x);
> printf("%d", *y); // Will print garbage
> ```
> 
> 2.
> ```c
> int *x, *y;
> x = malloc(sizeof(int));
> *x = 1;
> y = x;
> y = NULL;
> free(x);
> printf("%d", *y); // Will segfault
> ```
<!--*-->

## Memory Leak

**Memory Leak or Garbage Creation**: Lost-heap dynamic variables.
- Memory that was allocated but can't be accessed anymore.
	* The memory cannot be reallocated in the program.

> **Example**: Memory leaks
> ```c
> int *x = malloc(100);
> x = NULL;
> ```
> - The 100 bytes of memory we didn't `free()` won't be cleared until the program ends
> 
> ```c
> int *x = { 1, 2, 3 };
> int *y = { 4, 5, 6 };
> x = &y;
> ```
> - `{ 1, 2, 3 }` is now garbage we no longer have access to.
<!--*-->

# Memory Management Functions

`void *malloc(size_t size);`
- Allocates memory without initializing it.

> **Example `malloc`**: `int *x = malloc(100);`{.c}

`void *calloc(size_t nmemb, size_t size);`
- Allocates memory and initializes it.
- Slightly more computationally expensive than `malloc()`

> **Example `calloc`**: `int *x = calloc(0, sizeof(int));`{.c}

`void free(void *_Nullable ptr);`

> **Example `free`**: `free(x);`{.c}

`void *realloc(void *_Nullable ptr, size_t size);`
`void *reallocarray(void *_Nullable ptr, size_t nmemb, size_t size);`
- Attempts to change the size of a previously allocated block of memory.
	* New size can be larger or smaller.
- If block is made larger the contents will remain unchanged and memory is added to the end of the block.
- If the block is shrunk the contents will be truncated starting from the end of the array.
- If the original block size cannot be resized then `relloc` will attempt to assign a new block of memory and copy the old block contents.
	* A new pointer of different value will consequently be returned, you **must** use this value.
- Returns NULL if memory couldn't be reallocated.

> **Example**: `realloc`
> ```c
> #include <stdio.h>
> #include <stdlib.h>
> int main () {
> 	char *str;
> 	str = (char *) malloc(15);
> 
> 	strcpy(str, "Hello, How are");
> 	printf("String = %s, Address = %p\n", str, str);
> 
> 	str = realloc(str, 20);
> 	strcat(str, " you?");
> 	printf("String = %s, Address = %p\n", str, str);
> 
> 	free(str);
> 	return(0);
> }
> ```
