# The Efficiency of Algorithms

**Two Factors**:
1. Time (Speed)
2. Space

**What is "Best"?**
$$
\text{Complexity}
=
\text{Time Complexity}
+
\text{Space Complexity}
$$
- We prefer time complexity over space complexity.
	* We can trade time for space, and vice versa.
- **Analysis of Algorithms**: Study of algorithm complexity.

> **Example**: Two implementations of the sum formula
> 
> $$
> \text{Sum Formula: } \sum_{k = 1}^n k = 1 + 2 + 3 + ... + n
> $$
> 
> ```java
> # A: Slow Sum Formula
> int sum = 0;
> for (int i = 1; i <= n; i++)
> 	sum += i;
> # B: Fast Sum Formula
> sum = n * (n + 1) / 2;
> ```
