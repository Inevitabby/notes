# Dynamic Memory Allocation

Two new commands to use in concert:
- `malloc(size_t size)`: Allocates `size` bytes of contiguous memory for you. Returns the address of that memory block.
- `free(void* ptr)`: Deallocates the memory previously allocated by `malloc()` and other memory functions.

## Example: Copying a String Instead of Its Pointer

```c
string s = get_string();
string t = malloc(strlen(s) + 1); // (The extra byte is for the \0 char)
if (t == NULL)
	return 1; // (quit if memalloc fails)
/*
for (int i = 0, n = strlen(s) + 1; i < n; i++) {
	t[i] = s[i];
}
*/
strcpy(t, s); // Alternative to the for loop using stdlib.h
t[0] = toupper(t[0]);
printf("%s\n", s);
printf("%s\n", t);

free(t);
```
- The reason we don't free `s` is because the cs50 library does it for us automatically
- `if (strlen(t) > 0)` should be used to stop the program from crashing on a length 0 string.

