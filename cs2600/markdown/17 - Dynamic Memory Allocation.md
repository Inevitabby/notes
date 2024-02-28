# Dynamic Memory Allocation using Pointers

We can use pointers to request memory on the fly at runtime.
- `malloc()`: Allocate block of memory.
	* Returns a void pointer.
- `free()`: Deallocate that block of memory.
	* Returns the memory to the heap.
	* To be on the safe side you can set the dangling pointer to NULL after `free`ing it (to avoid accidentally dereferencing a junk value).

> **Note**: Check after allocation that memory was indeed allocated.
> - Done by seeing if your pointer points to a valid memory location instead of NULL.

> **Example**: Dynamically creating a single-dimensional array
> ```c
> #include <stdio.h>
> #include <stdlib.h>
> int main() {
> 	int n, *ptr = 0;
> 	// Prompt user for array length
> 	printf("Enter number of elements: ");
> 	scanf("%d", &n);
> 	// Dynamic memory allocation using malloc()
> 	ptr = malloc(n*sizeof(int));
> 	// Exit if no memory was allocated 
> 	if(ptr == NULL)
> 	{
> 		printf("\nError! Memory not allocated\n");
> 		return 0;
> 	}
> 	// Prompt user for array elements
> 	printf("\nEnter elements of array: \n");
> 	for(int i = 0; i < n; i++) {
> 		scanf("%d", ptr+i);
> 	}
> 	// Printing the array elements
> 	printf("\nThe elements of the array are: ");
> 	for(int i = 0; i < n; i++) {
> 		printf("%d ",ptr[i]); // ptr[i] is same as *(ptr + i)
> 	}
> 	// Deallocate the block of memory
> 	free(ptr);
> 	// Print newline and return
> 	puts("");
> 	return 0;
> }
> ```
> - Note: As `malloc()`{.c} returns a void pointer, `ptr = malloc(n*sizeof(int));`{.c} automatically promotes it to an `int` pointer.
>	- In older versions of C we might need to cast it with `ptr = (int *) malloc(n*sizeof(int));`{.c}

# Pointer to a Pointer

**Pointer to a Pointer**: Declared with two `*` symbols.
- Used primarily to allocate memory to a 2D array.
- Dereferencing is done by using the dereference operator twice.
- The gateway to multidimensional arrays.

> **Example**: A pointer to a pointer
> ```c
> int main() {
> 	int a = 10;
> 	int *p1 = &a;
> 	int **p2 = &p1;
> 	printf("&a : Ox%u\n", &a);
> 	printf("&p1: Ox%u\n", &p1);
> 	printf(" - *p1: %d\n", *p1);
> 	printf("&p2: Ox%u\n", &p2);
> 	printf(" - *p2 : %u (garbage)\n", *p2);
> 	printf(" - **p2: %d\n", **p2);
> 	return 0;
> }
> ```
> **Example Output**:
> ```
> &a : Ox278518276
> &p1: Ox278518280
>  - *p1: 10
> &p2: Ox278518288
>  - *p2 : 278518276 (garbage)
>  - **p2: 10
> ```

# Multidimensional Pointer Arrays

A multidimensional array can be thought of as an array of arrays.
- Conceptually we begin with a 1D array of pointers, and
- Then we make each pointer in that 1D array points to a different array.
- To add another dimension we can just turn the new arrays into arrays of pointers to more arrays.
	
<!--
(IS THIS TRUE?)
	* This is different from a traditional 2D array because each array takes up its own contiguous blocks of memory, meaning they can be located in various places, be different lengths, etc. In a traditional 2D array the entire array would take up one entire contiguous chunk of memory.
-->

> **Example**: Creating a 2D array (`**array`) dynamically without bracket notion.
> ```c
> #include <stdio.h>
> #include <stdlib.h>
> int main()
> {
> 	int **array;
> 	int row, col;
> 	printf("Give me rows and columns: \n");
> 	scanf("%d%d", &row, &col);
> 	// Allocate memory for the 1D array.
>	// - Note how we are doing sizeof(int *), not sizeof(int)!
> 	array = malloc(row * sizeof(int *));
> 	if (array == NULL)
> 	{
> 		printf("out of memory\n");
> 		exit(1);
> 	}
> 	// Allocate memory for the rest of the 2D array.
> 	for (int i = 0; i < row; i++)
> 	{
> 		*(array+i) = malloc(col * sizeof(int));
> 		if(array[i] == NULL)
> 		{
> 			printf("out of memory\n");
> 			exit(1);
> 		}
> 	}
> 	// Assign values and print contents of array
> 	for (int i = 0; i < row; i++)
> 	{
> 		for (int j = 0; j < col; j++)
> 		{
> 			*(*(array+i)+j) = i;
> 			// ^ Same thing as array[i][j] = i;
> 			printf("%d \t", *(*(array+i)+j));
> 		}
> 		printf("\n");
> 	}
> 	// Deallocate the array and exit
> 	for (int i = 0; i < row; i++)
> 	{
> 		free(*(array+i));
> 	}
> 	free(array);
>	array = NULL;
> 	return 0;
> }
> ```

# Exercises: Reading Pointers

> **Instructions**: Read each piece of code and determine the output of each numbered section.
> - (Code with answers is provided below the uncommented code)

> **Question**: Pointer Arithmetic
> ```c
> #include <stdio.h>
> int main()
> {
> 	int *p;
> 	int sample[3] = { -1, 6, 5 };
> 
> 	// I. 
> 	p = sample;
> 	printf("%d\n", *p);
> 
> 	// II. 
> 	*p = *(p)*3;
> 	printf("%d\n", *p);
> 
> 	// III. 
> 	p = ++p;
> 	printf("%d\n", *p);
> 
> 	// IV. 
> 	p = p++;
> 	printf("%d\n", *p);
> 
> 	// V. 
> 	*p = *(p - 1);
> 	printf("%d\n", *p);
> 
> 	// VI.  
> 	++(*p);
> 	printf("%d\n", *p);
> }
> ```
> 
> ```c
> #include <stdio.h>
> int main()
> {
> 	int *p;
> 	int sample[3] = { -1, 6, 5 };
> 
> 	// I. Prints "-1"
> 	p = sample;
> 	printf("%d\n", *p);
> 
> 	// II. Prints "-3" (-1 x 3)
> 	*p = *(p)*3;
> 	printf("%d\n", *p);
> 
> 	// III. Prints "6" (pre-incremented returns x+1)
> 	p = ++p;
> 	printf("%d\n", *p);
> 
> 	// IV. Prints "6" (post-incremented returns x)
> 	p = p++;
> 	printf("%d\n", *p);
> 
> 	// V. Prints "-3"
> 	*p = *(p - 1);
> 	printf("%d\n", *p);
> 
> 	// VI. Prints "-2" (-3 + 1)
> 	++(*p);
> 	printf("%d\n", *p);
> }
> ```

<!--
**More Explanation:**

1. `p` points to the first element in the `sample` array.
2. `p` pointers to the first element in the `sample` array times 3.
3. `p` points to the second element in the `sample` array.
	- `++p` returns the incremented `p`, so `p = ++p`, while redundant, still increments `p`.
4. `p` points to the second element in the `sample` array.
	- `p++` returns the original value of `p` before incrementation, so `p = p++` doesn't actually increment `p`.
5. `p` points to the first element in the `sample` array.
6. `p` points to the first element in the `sample` array + 1;
-->

> **Question**: Pointer Confusion
> ```c
> #include <stdio.h>
> #include <stdlib.h>
> int main() {
> 	int *x, *y, *z, *a, b[3] = {-4, 5, -6};
> 	a = malloc(3 * sizeof(int));
> 	x = a;
> 
> 	for (int k = 1; k < 4; k++)
> 		a[k - 1] = k;
> 	// I. 
> 	printf("%d\t%d\t%d\n", a[0], a[1], a[2]);
> 
> 	z = &b[2];
> 	y = (++x) + 1;
> 	*x = *x + 4;
> 	// II. 
> 	printf("%d\t%d\t%d\n", *x, *y, *z);
> 
> 	*(--z) = *(y - 1) + *x;
> 	*(z + 1) = *(x + 1) - 3;
> 	// III. 
> 	printf("%d\n", *z);
> 
> 	*y-- = (*++z) - (*&a[2]);
> 	// IV. 
> 	printf("%d\n", *y);
> 
> 	// V. 
> 	printf("%d\n", *x + 2);
> 
> 	for (int j = 0; j < 3; j++) {
> 		// VII. 
> 		printf("%d\t%d\n", a[j], b[j]);
> 	}
> 
> 	free(a);
> 	a = NULL;
> 	return 0;
> }
> ```
> 
> ```c
> #include <stdio.h>
> #include <stdlib.h>
> int main() {
> 	int *x, *y, *z, *a, b[3] = {-4, 5, -6};
> 	a = malloc(3 * sizeof(int));
> 	x = a;
> 
> 	for (int k = 1; k < 4; k++)
> 		a[k - 1] = k;
> 	// I. 1       2       3
> 	printf("%d\t%d\t%d\n", a[0], a[1], a[2]);
> 
> 	z = &b[2];
> 	y = (++x) + 1;
> 	*x = *x + 4;
> 	// II. 6       3	-6
> 	printf("%d\t%d\t%d\n", *x, *y, *z);
> 
> 	*(--z) = *(y - 1) + *x;
> 	*(z + 1) = *(x + 1) - 3;
> 	// III. 12
> 	printf("%d\n", *z);
> 
> 	*y-- = (*++z) - (*&a[2]);
> 	// IV. 6
> 	printf("%d\n", *y);
> 
> 	// V. 8
> 	printf("%d\n", *x + 2);
> 
> 	for (int j = 0; j < 3; j++) {
> 		// VII. 1       -4
>		//	6       12
>		//	-3      0
> 		printf("%d\t%d\n", a[j], b[j]);
> 	}
> 
> 	free(a);
> 	a = NULL;
> 	return 0;
> }
> ```
