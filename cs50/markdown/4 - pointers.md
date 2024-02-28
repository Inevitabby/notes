# Pointers

> **Important**: A pointer is nothing more than an address

A variable that stores the address of some value
- The specific byte in which that value is stored
- Lets us pass data between functions we previously couldn't
	* Up until this point, we have passed data by value (copies of data)
		+ Exception: Arrays.
	* With pointers, we can pass the actual variable itself

A pointer typically takes up 8 bytes of memory in C
* Old norm used to be 32 bits or even 8 bits.
	+ In other words, 32-bit systems can only represent $2^{32}$ unique memory (`0x`) addresses, which is approximately 4 GB of RAM.
		+ 64-bit systems can handle $2^{64}$ unique memory addresses, which is approximately 18 billion GB of RAM.

## Memory

Disk drives are just storage space, manipulation and use of data can only take place in RAM.

Memory is basically a huge array of 8-bit wide bytes.
- 512 MB, 1 GB, 2GB, 4GB, etc.
- RAM is cleared on every shutdown, it's temporary

Different data types take up different amounts of bytes of RAM.
- e.g., `int` is 4 bytes, `char` is 1 byte, `float` is 4 bytes, `double` is 8 bytes, et cetera.

## Interacting with Pointers in C

- **`&` is the address-of/address-extraction operator**
	- Onus is on you to say the type
	- **To store an address in a variable, use: `<type>* <variable_name> = &<expression>`**
		* You can't store a pointer in a regular int
		* You can also store a pointer of a pointer, but we won't be doing that much
- **`*` lets us dereference pointers—it retrieves what's stored at a pointer**
	* e.g., `*<pointer>`)

```c
#include <stdio.h>
int main(void)
{
	int n = 50;
	int *p = &n; // Get the address of n in memory
	printf("%p\n", p); 
	printf("%i\n", *p); // Get what is stored at the address in p
}
```

- The power to interact with memory is what makes C so powerful and dangerous.
- We typically display pointers as arrows pointing to a value
	* Imagine a grid of mailboxes, each mailbox can store anything, including the address of another mailbox.

## NULL Pointer

Pointer that points to nothing.
- If you create a pointer and don't set its value immediately, always set the pointer to `NULL` (see: Garbage)
- Can be checked with the equality operator. (e.g., `if (<pointer> == NULL)`)

If you try to dereference a NULL pointer (e.g., `*<NULL pointer>`), you'll segfault, which is better than accidental dangerous manipulation of unknown pointers.

