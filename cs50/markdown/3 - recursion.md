# Recursion

When a function calls itself.
- Allows us to solve problems more elegantly

Every function has 2 cases that could apply given any input:
- Base Case: When triggered, terminates the recursive process
- Recursive Case: Where the recursion will occur.

In general, recursive functions replace loops in non-recursive functions.

## Example: mario.c with recursion

Original:
```c
#include <cs50.h>
#include <stdio.h>
void draw(int n);
int main(void){
	int height = get_int("Height: ");
	draw(height);
}
void draw(int m) {
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < i + 1; j++) {
			printf("#");
		}
	}
	printf("\n");
}
```

These brick structures are recursive or, defined in terms of itself
- e.g., a pyramid of height 4 is a pyramid of height 3 + another row; etc.

Recursive:
```c
#include <cs50.h>
#include <stdio.h>
void draw(int n);
int main(void){
	int height = get_int("Height: ");
	draw(height);
}
void draw(int n) {
	if (n == 0) { return; }
	draw(n-1);
	for (int i =0; i < n; i++) { // Print n hashes
		printf("#");
	}
	printf("\n");
}
```

## Example: The Factorial Function ($n!$)

The factorial of $2$ is $2 * 1$, or $2 * fact(1)$...
- `fact(n) = n * fact(n-1)`

Base case is when `n==1`, where we `return 1` ($1!=1$); recursive case is `return n * fact(n-1)`.

## Example: The Collatz Conjecture (Multiple Base Cases)

The Collatz conjecture applies to positive integers and speculates that it's always possible to get "back to 1" if you follow these steps:
1. If $n$ is 1, stop
2. Otherwise, if $n$ is even, repeat this process on $n/2$
3. Otherwise, if $n$ is odd, repeat this process on $3n+1$

Goal: Write a recursive function `collatz(n)` that calculates how many steps it takes to get to $1$ if you start from $n$ and recurse as indicated above.

Thinking:
- Notice how we have two recursive cases

```c
int collatz(int n) {
	if (n==1) // Base Case
		return 0;
	else if ((n%2) == 0) // Even
		return 1 + collatz(n/2);
	else // Odd
		return 1 + collatz(3*n+1);
}
```

