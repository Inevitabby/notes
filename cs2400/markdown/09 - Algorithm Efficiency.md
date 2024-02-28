# The Efficiency of Algorithms

**Two Factors**:
1. Time
	- *aka: speed*
2. Space

**What is "Best"?**
$$
\text{Complexity}
=
\text{Time Complexity}
+
\text{Space Complexity}
$$
- We prefer fast and large programs over slow and tiny ones.
	* We can trade time for space, and vice versa.
- **Analysis of Algorithms**: Study of algorithm complexity.
	- The basic operation of an algorithm is the most signfiicant contributor to its total time requirement.

> **Example**: Two implementations of the sum formula
> 
> $$
> \text{Sum Formula: } \sum_{k = 1}^n k = 1 + 2 + 3 + ... + n
> $$
> 
> ```java
> # A: Slow Sum Formula
> # - O(n)
> int sum = 0;
> for (int i = 1; i <= n; i++)
> 	sum += i;
> # B: Fast Sum Formula
> # - O(1)
> sum = n * (n + 1) / 2;
> ```

> **Professor's Tangent**:
> - **Q**: How do you make an operation $O(1)$? 
> - **A**: Precompute the value and create a hash table!

## Counting Basic Operations

We count the number of basic operations.
- Instead of saying "this algorithm takes $n$ steps", we can measure things in the order of $n$s.
	- e.g., "this algorithm takes $O(n)$ steps"
	- *"What happens when $n$ is sufficiently large?"*

> **Example**: Counting basic operations
> ```java
> int sum = 0;
> for (int i = 1; i<=n; i++)
> 	for (int j = 1; i<=n; i++)
> 		sum++;
> ```
> - The basic operation is incrementing `sum`
>	- The algorithm is $O(n^2)$

## Notation

$$
\text{Efficiency (Best to Worst): }\\
1 > \log n > n > n \log n > n^2 \land 2^n \land n! \\
$$

<!--
Constant > Logarithmic > Linear Time Quasilinear Time Quadratic Time
-->

**Big O Notation**: The upper bound on an algorithm's running time.
- aka: "Worst case"
	* e.g., Doing linear search and searching the entire length of the array ($n$)

**Big $\Omega$ Notation**: The lower bound on an algorithm's running time.
- aka: "Best case"
	* e.g., Doing linear search and finding the thing at index 1.
- *(We generally only talk about Big O notation)*

Big $\Theta$ Notation: Used when the upper and lower bound of an algorithm's running time is the same.
- *(So that we can describe $\Omega$ and $O$ succinctly.)*

> **Remember**: When improving algorithm efficiency, we're concerned with improving $O$.

> **Example**: Efficiency of bag ADT implementations
> 
> | Operation        | Fixed Size Array       | Linked                 |
> |------------------|------------------------|------------------------|
> | `add`            | $O(1)$                 | $O(1)$                 |
> | `remove`         | $O(1)$                 | $O(1)$                 |
> | `clear`          | $O(n)$                 | $O(n)$                 |
> | `getFrequencyOf` | $O(n)$                 | $O(n)$                 |
> | `contains`       | $O(n) \land \Omega(1)$ | $O(n) \land \Omega(1)$ |
> | `toArray`        | $O(n)$                 | $O(n)$                 |
> | `getCurrentSize` | $O(1)$                 | $O(1)$                 |
