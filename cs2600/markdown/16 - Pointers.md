# Pointers

Normally, a variable contains a direct reference to a specific value.

**Pointer variables** are variables that contain memory addresses as their values.

**Pointers** store the address of a variable with a particular value, establishing an indirect reference.
- Declared with the `*` operator
	* e.g., `int *p`{.c}, `char *d`{.c}
- Pointers can only point to data of the same type.
- Can be initialized to `0`, `NULL`, or a valid address.
	* It is good practice to initialize pointers to avoid using garbage values as pointers.
- Access the variable by dereferencing with `*` (e.g., `*p`).
	* Lets you read and write values to the given address.
	* Note: Dereferencing NULL pointers will cause a runtime error.

> **Examples**:
> ```c
> #include <stdio.h>
> int main()
> {
> 	int *p = NULL;
> 	int x = 42;
> 	p = &x;
> 	printf("%d", *p); // Dereferencing of the pointer
> 	return 0;
> }
> ```
> - This prints "`42`"
> 
> ```c
> #include <stdio.h>
> int main()
> {
> 	int *p = NULL;
> 	int x = 42;
> 	p = &x;
> 	x += 100;
> 	printf("%d", *p);
> 	return 0;
> }
> ```
> - This prints `142`
> 
> ```c
> #include <stdio.h>
> int main()
> {
> 	int *p = NULL;
> 	int x = 42;
> 	p = &x;
> 	x += 100;
> 	*p = *p + 200;
> 	printf("%d", *p);
> 	return 0;
> }
> ```
> - This prints `342`
<!--*-->

# Referencing and Dereferencing

**Addressof Operator**: `&`
* Gets the memory address of a variable.

**Dereference Operator**: `*`
* Lets you access the value stored in the memory address the pointer is storing.
	- You can only dereference pointers. All normal variables are implicitly dereferenced, so doing something like—


```c
int y = 2;
printf("%x \n", *y);
```

—will just result in a syntax error.

> **Note**: Most compilers will actually cancel out any `*` and `&` operators next to each other, as they are complements, regardless of their order, so `*&y`{.c} and `&*y`{.c} would be valid ways to access `y`.

# Void Pointer

`void *` is a pointer to an unspecified data type.
- e.g., `void *p` can point to an unspecified data type.
- Cannot be dereferenced.
	* Need to be cast to a particular data type before it can be dereferenced.

```c
int a = 4;
void *p;
int *c;
p = &a;
c = (int *)p; // Here we assign the value of pointer p to the point c, after casting it to be able to do so
```

# `const` and Pointers

`const`: Qualifier that indicates that the value of a variable should not be modified.
- Used when a function doesn't need to change the variable's value.
- Demonstrates principle of least privilege, function has only enough access to accomplish task.

## Protecting Pointer Arguments

Pointer arguments can be protected against accidental changed by using the qualifier `const`.

> **Example**: Making pointer arguments `const`
> ```c
> // Disallow modifying the value at the pointer's address,
> // Allow changing the pointer's address.
> void f (const int *p) // POINTER TO CONSTANT DATA
> {
> 	int j;
> 	*p = 0; // Not permitted
> 	p = &j; // Permitted
> }
> // Allow modifying the value at the pointer's address,
> // Disallow changing the pointer's address.
> void g (int * const p) // CONSTANT POINTER TO DATA
> {
> 	int j;
> 	*p = 0; // Permitted
> 	p = &j; // Not permitted
> }
> // Disallow modifying the value at the pointer's address,
> // Disallow changing the pointer's address.
> void h (const int * const p) // CONSTANT POINTER TO CONSTANT DATA 
> {
> 	int j;
> 	*p = 0; // Not permitted
> 	p = &j; // Not permitted
> }
> ```
<!--*-->

**Four Ways to Pass a Pointer to a Function:**
1. **Non-constant pointer to non-constant data**.
	- e.g., `void f(int *p)`{.c}
	- Highest amount of access.
	- Data can be modified through the dereferenced pointer.
	- Pointer can be modified to point to other data.
	- Pointer arithmetic.
	- Operator `++` moves array pointer to the next element.
	- Most trivial way of passing a pointer.
2. **Non-constant pointer to constant data**.
	- e.g., `void f(const int *p)`{.c}
	- Data cannot be modified through the pointer.
	- Pointer can be modified to point to any other valid data type.
	- Provides the performance of pass-by-reference and the protection of pass-by-value.
3. **Constant pointer to non-constant data**. (aka: **reference**)
	- e.g., `void f(int * const p)`{.c}
	- Always points to the same memory location.
	- Data can be modified through the pointer.
	- Default for an array name.
		* Can be used by a function to receive an array argument.
	- Must be initialized when declared.
		- Not initializing constant pointer will cause compilation error.
4. **Constant pointer to constant data**.
	- e.g., `void f(const int * const p)`{.c}
	- Least amount of access.
	- Always points to the same memory location.
	- Data cannot be modified using this pointer.

> **Note**: In most cases at least one `const` should be used. It's very rare that you want to modify both the pointer's value and address.

# Reference

**Reference**: A constant pointer.
- "Constant pointer to non-constant data."
- Arrays are references (see next section)
	* Thus, you cannot change the address of an array, e.g.,

```c
int a[3];
int b[5];
a = &b; // Invalid, because a is a constant pointer! (aka: reference!)
a = a + 1; // Invalid, because a is a constant pointer!
```

# Pointer Arrays

**Array**: Defines a contiguous location of memory for its elements.
- In C, arrays are actually just pointers with syntactic sugar.
	* Different elements can be accessed by incrementing the pointer.

```c
char a[] = "A string is just an array of chars!"
printf("%c", a[5]) // Prints "i"
```

When you subscript an array expression (`a[5]`{.c}), C is actually computing the offset from the address of the first element in the array (each data type takes up a certain amount of memory) and dereferencing the result.

> **General Formula**: addr(ptr + i) = addr(ptr) + sizeof(type) * i

`&a[0]` and `a` both actually point to the same location in memory: The start of the contiguous block of memory assigned to the array.
- **By definition, an array in C is a constant pointer, or a reference.**

```c
#include <stdio.h>
#include <string.h>
int main()
{
	char a[] = "A string is just an array of chars!";
	int SAME = memcmp(&a[0], a, sizeof(char));
	if (SAME == 0)
		printf("&a[0] and a point to the same address!");
}
```
- This will print `"&a[0] and a point to the same address!"`

C places the NULL terminal (`\0`) at the end of character arrays (null-terminated strings) so that the end of the string can be known.

```c
#include <stdio.h>
int main()
{
	char a[] = "A string is just an array of chars!";
	// Method A: Printing each character by using array syntax
	int index = 0;
	while (a[index] != '\0')
	{
		printf("%c", a[index]);
		index++;
			
	}
	puts("");
	// Method B: Printing each character by pointer arithmetic
	char *p = a;
	while (*p != '\0')
	{
		printf("%c", *p);
		p++;
	}
}
```

# Pre-and-Post Increment/Decrement

Like for `awk`, prefix and postfix only changes what is returned by the operator. The operator will still increment or decrement the target variable just fine, and which one you use only matters if you're using the return value.

- `++x`: Pre-increment $x$. Returns $x+1$.
- `--x`: Pre-decrement $x$. Returns $x-1$.
- `x++`: Post-increment $x$. Returns $x$.
- `x--`: Post-decrement $x$. Returns $x$.

## Incrementing/Decrementing Pointers

> *"Does it hurt when I do that?"*

| Expression                              | Meaning                                                 |
|-----------------------------------------|---------------------------------------------------------|
| `*aPtr++` or `*(aPtr++)` or `(*aPtr)++` | Post-increment `aPtr`. Returns `*aPtr` before increment |
| `*++aPtr` or `*(++aPtr)`                | Pre-increment `aPtr`. Returns `*aPtr` after increment   |
| `++*aPtr` or `++(*aPtr)`                | Pre-increment `*aPtr`. Returns `*aPtr` after increment  |

