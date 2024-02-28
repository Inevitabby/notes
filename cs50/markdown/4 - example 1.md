# Example: Function Variable Scope

Broken code:
```c
#include <stdio.h>
void swap(int a, int b)
int main(void)
{
	int x = 1;
	int y = 2;
	printf("x is %i, y is %i\n", x, y);
	swap(x,y);
	printf("x is %i, y is %i\n", x, y);
}
void swap(int a, int b)
{
	int tmp = a;
	a = b;
	b = tmp;
}
```
- This code doesn't work because `a` and `b` are only copies of `x` and `y`.

A fixed `swap()` function needs to use pointers to modify the original `x` and `y` variables:
```c
#include <stdio.h>
void swap(int *a, int *b)
int main(void)
{
	int x = 1;
	int y = 2;
	printf("x is %i, y is %i\n", x, y);
	swap(&x,&y);
	printf("x is %i, y is %i\n", x, y);
}
void swap(int *a, int *b) // Address of x and y
{
	int tmp = *a; // Store the value at the address in a in tmp
	*a = *b; // Store the value at the address in location b in the value at location a
	*b = tmp; // Store the value in tmp in the value at location b
}
```
- We're still passing in a copy of a value, but the value we're passing in is a pointer that lets us modify the stuff further down the stack in `main()`

