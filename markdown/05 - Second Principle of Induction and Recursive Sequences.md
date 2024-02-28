# Second Principle

> Note: We probably won't be questioned about this in homework or tests.

When assuming $P(k)$ isn't enough to prove $P(k+1)$, use an extended version of basic induction proof: The second principle.

**Second Principle**:
$$
P(1) \text{ is true} \\
P(1) \land P(2) \land ... \to P(k+1) \text{ is true}
$$

> **Example**: Prove that the amount of postage greater than or equal to 8 cents can be built using only 3-cent and 5-cent stamps.
> 
> Using the second principle of induction, we have to prove that $P(n)$ is true for $n \ge 8$ where $P(n)$ is that $n$ cents worth of postage can be built using only 3-cent and 5-cent stamps.
> 
> Assuming $k$ can be built with 3's and 5's, we want to prove $k+1$
> 
> Base Cases:
> $$
> p(8) = 3 + 5 \\
> p(9) = 3 + 3 + 3 \\
> p(10) = 5 + 5
> $$
> 
> To get 11, 12, 13, we can just add 3 to 8, 9, and 10-case, respectively.
> - By proving $p(9)$ and $p(10)$, we've proven $P(k+1)$
>
> Therefore, for any $n \ge 8$, n cents worth of postage can be built using only 3-cent and 5-cent stamps.

# Recursive Sequences

**Sequence**: Ordered list.
- Indexing: $S(1), S(2), ..., S(n), ...$

**Recursive Sequence**: Sequence is defined recursively by explicitly naming the first value (or first few values) and defining later values based terms of earlier values.

> **Example**:
> * $S(1) = 2$
> * $S(n) = 2S(n-1)$ for $n \ge 2$
> 	+ Sequence $S \to 2,4,8,16,32,...$
> * *Equivalent Explicit Definition: $S(n) = 2^n$*

> **Example**:
> * $S(1) = 1$
> * $S(2) = 1$
> * $S(n) = S(n-1) + S(n-2)$ for $n > 2$
> 	+ Sequence $S \to 1,1,2,3,5,8,13,...$
> * *Equivalent Explicit Definition: $S(n) = 2^n$*

# Recursively Defined Operations

Exponential Operation:
- $a^0 = 1$
- $a^n = a \times a^{n-1}$ for $n \ge 1$

Multiplication Operation:
- $m(1) = m$
- $m(n) = m(n-1) + m$ for $n \ge 2$

# Recursive Function Example (Factorial)

Q: Find recursive definition for $n!$

A:
- Initialization: $F(0) = 1$ 
	- *Explicit: $0! = 1$*
- Recursion: $F(n) = n \times F(n-1)$ for $n \ge 1$
	- *Explicit: $n != n \times (n-1)!$*

From here, we can create naive implementation in Java:
```java
public static int factorial (int n) {
	if (n==0)
		return 1;
	else
		return n*factorial(n-1);
}
```

## From Recursive Definitions to Recursive Algorihms

In general, starting a recursive function—
$$
f(n) = output_1, \text{if $n$ in range_1}
f(n) = output_k, \text{if $n$ in range_k}
$$

—gives a recursive algorithm:
```pseudocode
Function f(n) {
	if (n in range_1)
		return output_1
	...
	if (n in range_k)
		return output
}
```

# Recurrence Relations

**Recurrence Relation**: Equation that defines the later values in the sequence in terms of earlier values for a recursive sequence.

Example:
- $S(n) = 2S(n-1)$ for $n \ge 2$

**Linear Recurrence Relation**: When the earlier values in the definition of S)n) have a power of 1.
- Example: $$

**Nonlinear Recurrence Relation**: Has earlier values in the definition as power other than 1. 
- Example: $F(n+1) = 2nF(n-1)(1 - F(n-1))$

Homogeneous Recurrence Relation: Relation that has nothing but proceeding terms.
- Example: $S(n) = 2S(n-1)$

Inhomogeneous Recurrence Relation:
- Example: $a(n) = a(n-1) + 2n$

# Constant Coefficients

A recurrence relation is said to have **constant coefficients** if the coefficients before the proceeding terms are all constants.

Fibonacci relation is homogeneous and linear and has constant coefficients:

Non-constant coefficients: $T(n_ 2n T(n-1) + 3n^2 T(n-2)$

# Order of Recurrence Relation

**Order** of a relation is defined by number of previous terms in a relation for the $n$th term.
- Degree One: Depends on 1 previous term.
	* e.g., $S(n) = 2S(n-1)$
		+ $n$th term depends only on $n-1$
- Degree Two: Depends on 2 previous terms.
	* e.g., Fibonacci
		+ $n$th term depends on $n-1$ and $n-2$
- Degree Three: Depends on 3 previous terms.
	* e.g., $T(n) = 3n T(n-2) + 2T(n-1) + T(n-3)$
		+ $n$th term depends on $n-1$ and $n-2$ and $n-3$
