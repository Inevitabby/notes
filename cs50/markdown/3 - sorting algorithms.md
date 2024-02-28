# Sorting Algorithms

Input $\to$ Output
- Unsorted $\to$ Sorted

## Selection Sort

```pseudocode
for i from 0 to n-1
	find the smallest number between numbers[i] and numbers[n-1]
	swap the smallest number with numbers[i]
```

This program takes $n$ steps:
$$
n + (n-1) + (n-2) + (n-3) + ... + 1 \\
\text{or, equivalently } \frac{n(n+1)}{2} \text{; or } \frac{n^2 + n}{2}
$$

Guestimating Big O ($\lim \text{ as } {n \to \infty}$), $O(n^2)$

In the best case (everything is already sorted), selection sort naively checks everything, so $\Theta(n^2)$

## Bubble Sort

```pseudocode
Repeat n-1 times
	for i from 0 to n-2
		if numbers[i] and numbers[i+2] out of order
			swap them
	if no swaps were made
		quit
```

```pseudocode
for i from 0 to n - 1
	for j from 0 to n - i - 1
		if numbers[i] and numbers[i+2] out of order
			swap them
	if no swaps were made
		break;
```

Outer loop and inner loop iterate $n-1$, so this takes $(n-1)^2$ steps

So bubble sort is on the order of $O(n^2)$, like selection sort

In the best case (when the numbers are already sorted), $\Omega(n)$

> Summary: In other words, bubble sort is only marginally better than selection sort—either is fine for small data sets.

