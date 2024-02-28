# Solving Recurrence Relations

> Recall: **Recurrence Relation** — Equation that defines the later values in the sequence in terms of earlier values for a recursive sequence.

In general, we prefer to have an **explicit formula** to computer the value of $a_n$ rather than conducting $n$ iterations.

## Example: Interest as Recurrence Relation v.s. Explicit Form

Suppose you have $1000 in a 5% APY savings account, you could calculate your total savings as a recurrence relation like so:

$$
S(0) = 1000 \\
S(n) = S(n-1) \times 1.05 \\~\\

1000(1 + 5\%)^n \\
1000(1 + 5\%)^n (1 + 5\%)^n \\
$$

Or, the far simpler **explicit form**
$$
1000(1.05)^n
$$

## Recurrence Relations $\to$ Explicit Form

Linear homogenous recurrence relations are the only recurrence relations we can systematically convert to explicit form.
- Form:
	* Degree $k$ with constant coefficients is a recurrence relation of the form:
	* Where $c_1, c_2, ..., c_k$ are real numbers, and $c_k \ne 0$ 
$$
a_n = c_1 n_{n-1} + c_2 n_{n-2} + ... + c_k n_{n-k}
$$

Our goal is to get a solution of the form:
$$
	a_n = r^0
$$
- Where $r$ is a constant.

Application:
$$
	a_n = c_1 n_{n-1} + c_2 n_{n-2} + ... + c_k n_{n-k} \\
	\downarrow \text{$a_n = r^n$} \downarrow \\
	r_n = c_1 r^{n-1} + c_2 r^{n-2} + ... + c_k r^{n-k} \\
	\downarrow \text{Divide by $r^{n-k}$} \downarrow \\
	r^k = c_1 r^k-1 + c_2 r^{k-2} + ... + c_k
$$

We can derive the **characteristic equation**:
$$
	r^k - c_1 r^k-1 - c_2 r^{k-2} - ... - c_k = 0
$$
- The solutions of the equation are called the **characteristic roots** of the recurrence relation.

Theorem:
- Let
	- $c_1$ and $c_2$ be real numbers
	- $r^2 - c_1 r -c^2 = 0$ has two distinct root $r_1$ and $r_2$
- Then
	* ${a_n}$ is the solution of a recurrence relation
		- ???

> **Example**: What is the solution of the recurrence relation $a_n = a_{n-1} + 2a_{n-2}$ with $a_0 = 2$ and $a_1 = 7$
> 
> 1. **Getting the characteristic equation from $a_n$:**
> 	- $r^2 - r - 2 = 0$
> 2. **Solve equation (finding roots):**
> 
> $$
> \begin{aligned}
> 	r^2 - r - 2 &= 0 \\
> 	(r-2) (r+1) = 0 \\
> 	r_1 = 2 \\
> 	r_2 = -1
> \end{aligned}
> $$
> 
> 3. **Plug in the roots:**
> 
> $$
> a_n = \alpha_1 2^n + \alpha_2 (-1)^n
> $$
> 
> 4. **Find $\alpha_1$ and $\alpha_2$:**
> 
> $$
> \text{Starting Equations:} \\
> a_0 = 2 = \alpha_1 2^0 + \alpha_2(-1)^0 = \alpha_1 + \alpha_2 = 2 \\
> a_1 = 7 = \alpha 2^1 + \alpha_2(-1)^1 = 2\alpha_1 + \alpha_2 = 7 \\
> $$
> - From 1, 2, we have $\alpha_1 = 3$, therefore $\alpha_2 = -1$
> 
> 5. **Plug $\alpha$'s back in**
> 
> $$
> a_n = 3 (2^n) - ( - 1 ) ^ n
> $$

> **Example**: Find the explicit formula for:
> - $a_0 = 7$
> - $a_1 = 2$
> - $a_n = -a_{n-1} + 2a_{n-2}$
> 
> Solution:
> 
> 1. **Getting the characteristic equation:**
> 
> $$
> \begin{aligned}
> 	r^2 + r -2 &= 0
> \end{aligned}
> $$
> 
> 2. **Getting the roots**
> 
> $$
> r_1 = -2 \\
> r_2 = 1
> $$
> 
> 3. **Plug in roots**
> 
> $$
> a_n = \alpha_1(-2)^n + \alpha_2 (1)^n
> $$
> 
> 4. **Find $\alpha_1$ and $\alpha_2$**
> 
> $$
> a_0 = 7 = \alpha_1 + \alpha_2 \\
> a_1 = 2 = -2 \alpha_1 + \alpha_2 \\~\\
> 
> \alpha_1 = \frac{5}{3} \\
> \alpha_2 = \frac{16}{3}
> $$
> 
> 5. Answer
> 
> $$
> \therefore a_n = \frac{5}{3} (-2)^n + \frac{16}{3}
> $$

# Set Theory

**Sets**: Collection of distinct objects (elements).
- Powerful tool in computer science to solve real world problems.
- In a sequence, the order matters—not so for sets.
- We represent sets with capital letters and elements by lowercase letters.

$\in$ (belongs to): Used to represent that fact that an element bleongs to a particular set.
- a $\in$ A means that element a belongs to set A.
- b $\not \in$ A means that element b doesn't long to set A
- Braces ($\{\}$) are used to indicate a set.

E.g.,
$$
A = \{2,4,6,8,10\} \\
3 \not \in A \land 2 \in A
$$

Two sets are equal if and only if they contain the same elements.
	* Since order doesn't matter, listing elements twice is redundant.
$$
\text{Example: }
A = \{2,4,6,8,10\} = \{2,4,6,10,8\} \\~\\
\text{Can be Tested By: }
(\forall x)[(x \in A \to x \in B) \land (x \in B \to x \in A)]
$$

**Infinite Sets**:
- Members of infinite sets can't be listed, but a pattern for listing elements can be indicated, like so:

$$
S = \{x | x \text{ is a positive even integer} \} \\~\\
$$
- Can also be defined with predicate logic.
