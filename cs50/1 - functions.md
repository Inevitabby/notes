# Functions

- Arguments: Inputs to a function

## Types of Function Outputs

1. Side-effect
2. Return values, variables

## Args

You must define args and return type. For example, the meow function, which takes void and returns void:
```c
void meow(void) {
	printf("meow");
}
```

## Example: Function Args

```c
void meow(int n) {
	for (int i = 0; i < n; i++)
	{
		printf("meow");
	}
}
```

## Style: Keeping main() at the top

Suppose we want to keep `main()` at the top of a file and some functions at the bottom.

We can tell the compiler to define the functions necessary by putting the `void meow(void);` pattern above main like this:
```c
#include <stdio.h>

void meow(int n);

int main(void)
{
	meow(3);
}

void meow(int n) {
	for (int i = 0; i < n; i++)
	{
		printf("meow");
	}
}
```

This (`void meow(void);`) creates a prototype that says what the function returns and takes without defining it yet.
- More recent languages don't require this compiler hint

We could also create a header file

## Returning a Value

Example:
```c
float discount(float price, float percentOff)
{
	return price * (100 - percentOff) / 100;
}
```

