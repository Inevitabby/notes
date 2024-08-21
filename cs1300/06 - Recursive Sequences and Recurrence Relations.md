# Recursive Sequences

**Sequence**: An ordered list.
- Notation: $S(1), S(2), ..., S(n), ...$

**Recursive Sequence**: Sequence where later values are defined based on earlier values.
- Defined by explicitly naming the first value(s) and then defining later values based on earlier values.

> **Example**: Geometric Progression
> * $S(1) = 2$
> * $S(n) = 2S(n-1)$ for $n \ge 2$
> 	+ Sequence $S \to 2,4,8,16,32,...$
> * *Equivalent Explicit Definition: $S(n) = 2^n$*

> **Example**: Fibonacci
> * $S(1) = 1$
> * $S(2) = 1$
> * $S(n) = S(n-1) + S(n-2)$ for $n > 2$
> 	+ Sequence $S \to 1,1,2,3,5,8,13,...$
> * *Equivalent Explicit Definition: $S(n) = \frac{(1 + \sqrt{5})^n - (1 - \sqrt{5})^n}{2^n \sqrt{5}}$*

# Recursively-Defined Operations

**Exponential Operation**:
- $a^0 = 1$
- $a^n = a \times a^{n-1}$ for $n \ge 1$

**Multiplication Operation**:
- $m(1) = m$
- $m(n) = m(n-1) + m$ for $n \ge 2$

> **Example**: Find a recursive definition for factorial ($n!$)
> - Initialization: $F(0) = 1$ 
> 	- *Explicit: $0! = 1$*
> - Recursion: $F(n) = n \times F(n-1)$ for $n \ge 1$
> 	- *Explicit: $n != n \times (n-1)!$*
> 

## Implementing Recursive Algorithms

Once you figure out a recursive definition for a function, you can immediately turn it into a recursive algorithm in a programming language, like so:
```java
public static int factorial (int n) {
	if (n==0)
		return 1;
	else
		return n*factorial(n-1);
}
```

In general, starting a recursive function—
$$
f(n) =
\begin{cases}
	&\text{output}_1 \text{, if $n$ in } \text{range}_1 \\
	&\vdots \\
	&\text{output}_k \text{, if $n$ in } \text{range}_k
\end{cases}
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

**Recurrence Relation**: The equation that defines the later values in a recursive sequence based on the preceding values.
- *(We've already used them in prior examples, we just haven't called them out)*

> Example:
> - $S(n) = 2S(n-1)$ for $n \ge 2$

## Properties of Recurrence Relations

**Linear Recurrence Relation**: Recurrence relation where earlier values have a power of 1.
- Example: $F(n)=F(n-1)+F(n-2)$

**Nonlinear Recurrence Relation**: Recurrence relation where earlier values have powers other than 1.  
- Example: $F(n+1) = 2nF(n-1)(1 - F(n-1))$

**Homogeneous Recurrence Relation**: Recurrence relation that has nothing but proceeding terms.
- Example: $S(n) = 2S(n-1)$

**Inhomogeneous Recurrence Relation**:
- Example: $a(n) = a(n-1) + 2n$

## Constant Coefficients

A recurrence relation is said to have **constant coefficients** if the coefficients before the proceeding terms are all constants.

> Example: The Fibonacci relation is homogeneous, linear, and has constant coefficients:
> - $F(n)=F(n-1)+F(n-2)$

> Example: This recurrence relation doesn't have constant coefficients:
> - $T(n_ 2n T(n-1) + 3n^2 T(n-2)$

## Order of Recurrence Relation

**Order** of a relation is defined by number of previous terms in a relation for the $n$th term.
- Degree One: Depends on 1 previous term.
	* e.g., $S(n) = 2S(n-1)$
		+ $n$th term depends only on $n-1$
- Degree Two: Depends on 2 previous terms.
	* e.g., Fibonacci
		+ $n$th term depends only on $n-1$ and $n-2$
- Degree Three: Depends on 3 previous terms.
	* e.g., $T(n) = 3n T(n-2) + 2T(n-1) + T(n-3)$
		+ $n$th term depends only on $n-1$, $n-2$, and $n-3$
- *et cetera.*

> Note: Degree one, degree two, and degree three can also be referred to as "first order", "second order", and 
third order", respectively.

# Solving Recurrence Relations

> **Professor's Note**: In real-life, **explicit formulas** tend to outperform iterative solutions, essentially:
> - Iterative Solution: Easier to make (more intuitive), more expensive to run (overhead)
> - Explicit Solution: Harder to make (less intuitive), less expensive to run

**"Solving a Recurrence Relation"**: The process of converting a recursive definition to an explicit formula.

## Introduction

**Example**: Interest as a Recurrence Relation v.s. Explicit Form:

Suppose you have $1000 in a 5% APY savings account.

You could calculate your total savings as a *recurrence relation* like so:

$$
S(0) = \$1000 \\
S(n) = S(n-1) \times 1.05
$$

Or, you could use the simpler equivalent *explicit form*:
$$
1000(1.05)^n
$$

## The Characteristic Root Technique

The [only]{.underline} recurrence relations we can systematically convert to explicit form are recurrence relations of the form:
$$
a_n = c_1 a_{n-1} + c_2 a_{n-2} + ... + c_k a_{n-k} \\
$$
- Where $c_1, c_2, ..., c_k$ are real numbers, and $c_k \ne 0$

> Characteristics of recurrence relations that can be systematically solved:
> - Linear and homogeneous
> - Degree $k$ with constant coefficients

When solving these kinds of recurrence relations, our goal is to get a solution of the form:
$$
	a_n = r^n
$$
- Where $r$ is a constant.

To solve these recurrence relations we use the **characteristic equation**:
$$
	r^k - c_1 r^k-1 - c_2 r^{k-2} - ... - c_k = 0
$$
- The solutions of the characteristic equation are called the **characteristic roots** of the recurrence relation.

> **Note**: Deriving the Characteristic Equation
> $$
> \begin{aligned}
> 	a_n &= c_1 a_{n-1} + c_2 a_{n-2} + ... + c_k a_{n-k} \\
> 	r_n &= c_1 r^{n-1} + c_2 r^{n-2} + ... + c_k r^{n-k} \text{ (replace $a_n$ with $r^n$)} \\
> 	r^k &= c_1 r^k-1 + c_2 r^{k-2} + ... + c_k \text{ (divide by $r^{n-k}$)} \\
>	&\text{ (Then just move everything to one side)}
> \end{aligned}
> $$

## Theorem: Solving Relations of Degree Two

> **Theorem**: Solving Linear Homogeneous Recurrence Relations of Degree Two
> - Let:
> 	- $c_1$ and $c_2$ be real numbers
> 	- $r^2 - c_1 r -c^2 = 0$ have two distinct roots: $r_1$ and $r_2$
> - Then:
> 	* $\{a_n\}$ is the solution of a recurrence relation $a_n = c_1 a_{n-1} + c_2$ if and only if $a_n = \alpha_1 r_1^n + \alpha_2 r_2^n$ for $n=0,1,2,...,$ where $\alpha_1$ and $\alpha_2$ are constants.

---

> **Example**: Find the solution of the recurrence relation:
> - $\textcolor{blue}{a_n} = \textcolor{red}{a_{n-1}} \textcolor{green}{+ 2a_{n-2}}$
> - $a_0 = 2$
> - $a_1 = 7$
> 
> 1. **Getting the characteristic equation from $a_n$:**
> 	- $\textcolor{blue}{r^2} \textcolor{red}{- r} \textcolor{green}{- 2} = 0$
> 2. **Solve characteristic equation (finding roots):**
> 
> $$
> \begin{aligned}
> 	r^2 - r - 2 &= 0 \\
> 	(r-2) (r+1) &= 0 \\
> 	&\therefore r_1 = 2 \land r_2 = -1
> \end{aligned}
> $$
> 
> 3. **Plug the roots into $a_n$:**
> 
> $$
> a_n = \alpha_1 2^n + \alpha_2 (-1)^n
> $$
> - The sequence $\{a_n\}$ is a solution to the recurrence relation if and only if $a_n = \alpha_1 2^n + \alpha_2 (-1)^n$ for some constants $\alpha_1$ and $\alpha_2$.
> 
> 4. **Find $\alpha_1$ and $\alpha_2$ by plugging $a_0$ and $a_1$ into $a_n$:**
> 
> $$
> a_0 = 2 = \alpha_1 + \alpha_2 \\
> a_1 = 7 = 2\alpha_1 - \alpha_2
> $$
> - From this we can find that $\alpha_1 = 3$ and $\alpha_2 = -1$
> 
> 5. **Answer: Plug $\alpha$'s back into $a_n$**
> 
> $$
> a_n = 3 (2^n) - ( - 1 ) ^ n
> $$
> - For some constants $\alpha_1$ and $\alpha_2$
