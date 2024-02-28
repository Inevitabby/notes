# Recall: Proof Stategies

To solve $p \to q$
- Direct proof first
- If problem domain is finite and small, try exhaustive proof.
- If problem domain is infinite and difficult to prove without breaking it down, try proof by cases.
- If $q'$ is easier to manipulate than $p$, try proof by contraposition or contradiction.

# Class Exercises

> Instructions: Prove or disprove the following statements.

**Problem**: The sum of 3 consecutive integers is even.
- Mathematical Representation: $n + (n+1) + (n+2) = 2k$

$$
\begin{align*}
	n + (n+1) + (n+2) &= 2k \\
	3n + 3 &= 2k \\
	3(n + 1) &= 2k
\end{align*}
$$

- Attempt: I want to try proof by counterexample.
	* Let $n=2$, then $3(2 + 1) = 9$, which is odd.

**Problem**: The product of 3 consecutive integers is even.
- Mathematical Representation: $n * (n+1) * (n+2) = 2k$
- Case I: $n$ is even. $n * (n+1) * (n+2) = 2k$ has a factor of 2, therefore even.
$$
\begin{align*}
	n * (n+1) * (n+2) &= 2k \\
	2k * (2k+1) * (2k+2) &= 2k \\
\end{align*}
$$
- Case II: $n$ is odd. $n(n+1)(n+2)$ has a factor of 2, therefore even.
$$
\begin{align*}
	n * (n+1) * (n+2) &= 2k \\
	(2k+1) * ((2k+1)+1) * ((2k+1)+2) &= 2k \\
\end{align*}
$$

**Problem**: The sum of two rational numbers is rational
- Definition: Rational numbers are $\frac{p}{q}$  where $p,q$ are integers. 
- Mathematical Representation: $\frac{p}{q} + \frac{t}{r}$
	* $q \ne 0, r \ne 0$
$$
	\frac{p}{q} + \frac{t}{r} = \frac{pr + qt}{qr}
$$
- $pr + qt$ is an integer, therefore the sum of two rational numbers is rational.

# Induction

Suppose we have an infinite line of dominoes in a row, if we know that
a. If we knock down one domino
b. We will knock down the next domino

Then it follows that eventually every domino will be knocked down.

The principal of mathematical induction is a useful tool for proving that a certain statement is true for al positive integers.

---

If we have a propositional function $P(n)$, and we want to prove $P(n)$ is true for any positive integer $n$, we do the following:
1. Show that P(1) is true (basis step)
2. Show that if P(n) then P(n+1) for any positive integer (induction step)
3. Then P(n) must be true for any positive integer (conclusion)

> **Example**: Show than $n<2^n$ for all positive integers $n$
> 1. Proposition function: P(n)=n<2^n
> 2. Assume P(n) is true ($n<2^n$) to show P(n+1) is true ($n+1<2^{n+1}$)
> 
> $$
> \begin{align*}
> 	n &< 2^n \\
> 	n+1 &< 2^{n+1} \\
> \end{align*} \\
> \text{(... Because $1 < 2^n$)} \\
> \begin{align*}
> 	n+1 &< 2^n + 2^n \\
> \end{align*}
> $$
> 
> from 1 to 2, we get
> $$
> \begin{align*}
> 	n + 1 &< 2^n + 2^n \\
> 	n+ 1 &< 2 * 2^n \\
> 	n+1 &< 2^{n+1} \\
> 	&\therefore p(n+1) \text{is true}
> \end{align*}
> $$
> 
> 3. Then $P(n)$ must be true for any positive integer $n$.

> **Example**: Prove that $1+2+2^2 + ... + 2^n = 2^{n+1} - 1$ for any $n \ge 1$
> 1. When $n=1$:
> 	* LHS is $1+2=3$
> 	* RHS is $2^2 -1 = 3$
> 2. Assume $k$ is true.
> 
> $$
> P(k): 1 + 2 + 2^k + ... + 2^k = 2^{k+1} - 1
> $$
> - Goal: Show $P(k+1)$ is true
> 
> $$
> \begin{align*}
> \text{ LHS: }& 1 + 2 + 2^n + ... + 2^k + 2^{k+1} \\
> \text{ RHS: }& 2^{k+1+1} - 1
> \end{align*}
> $$
> 
> - Making LHS match RHS:
> $$
> \begin{align*}
> LHS &= 1 + 2 + 2^n + ... + 2^k + 2^{k+1} \\
> &= 2^{k+1} - 1 + 2^{k+1} \\
> &= 2^1 * 2^{k+1} -1 \\
> &= 2^{k+2} - 1 \\
> &= RHS
> \end{align*}
> $$
> 
> 3. Therefore, $1 + 2 + 2^n + ... + 2^k + 2^{k+1}$ verifies the proof.

> Example: P

# Example Problem

Prove that $n^2 > 3n$ for all $n>3$

1. Proposition Function: $P(n)$: $n^2 > 3n$

$$
\begin{align*}
	n &= 4 \\
	4^2 &= 16 \\
	3n &= 12 \\
	\therefore n^2 &> 3n \text{ when } n=4
\end{align*}
$$

2. Assume $P(k)$ is true ($k^2 > 3k$) to show $P(k+1)$ is true.

$$
\begin{align*}
	(k+1)^2 &> 3(k+1) \\
	k^2 + 2k + 1 &> 3k+3 \\
	\\
	\text{Testing P(3)}&:
	3^2 + 2 (3) + 1 > 3(3)+3 \\
	& \text{($\uparrow$ true)}
	\\
	\\
	&\therefore p(k+1) \text{ is true}
\end{align*}
$$
- *We can tell that $(n+1)^2$ will always be bigger than $3(n+1)$ because $P(3)$ is true and $n^1$ will never become bigger than $n^2$, so $P(n+1)$ is true.*
- Professor's explanation (???):

$$
a > b \\
a+c > b+c \\~\\
(k+1)^2 > 3(k+1) \\~\\
\begin{align*}
LHS &= k^2 + 2k + 1 \\
&> 3k+2k+1 \\
&> 3k+3 \\~\\
\end{align*}
\\
\text{Since } k> 3 \\
k > 1 \\
2k+1 > 3
$$

3. Therefore, $P(n)$ must be true for all $n>3$, because $P(n+1)$ verifies the proof.

---

Prove that $2^{n+1} < 3^n$ for all $n>1$

1. $P(n)$: $2^{n+1} < 3$
2. Assume $P(n)$ is true to show $P(n+1)$ is true.

---

Prove that $3^n - 1$ is a multiple of 2, for all $n>0$

1. Base case ($n=1$)

$$
3^n - 1 = 2 \textit{(true)}
$$

2. Assume $p(k)$ is true—

$$
p(k): 3^k - 1 = 2m
$$
- *Note: $2m$ is how we represent a multiple of 2*

—to prove $p(k+1)$ is true:

$$
p(k+1): 3^{k+1} - 1 = 2r \\~\\

\begin{align*}
	LHS &= 3 \times 3^k - 1 \\
	&\therefore 3^k - 1 = 2m \\
	&\therefore 3^k = 2m+1 \\~\\

	LHS &= 3(2m+1) - 1 \\
	&= 6m+3-1 \\
	&= 6m +2 \\
	&= 2(3m+1) = 2r
\end{align*}
$$

3. Therefore for all $n>0$, $n^n - 1$ is a multiple of $2$

