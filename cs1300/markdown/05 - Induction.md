# Induction

## Theory

Suppose we have an infinite line of dominoes in a row, if we know that
a. If we knock down one domino
b. We will knock down the next domino

Then it follows that eventually every domino will be knocked down.

The principal of *mathematical induction* is useful for proving that a certain statement is true for all positive integers.

## Induction Proof

If we have a propositional function $P(n)$, and we want to prove $P(n)$ is true for any positive integer $n$, we do the following:
1. **Basis Step**: Show that $P(1)$ is true
2. **Induction Step**: Show that if $P(k)$, then $P(k+1)$ for any positive integer
3. **Conclusion**: Then, $P(n)$ must be true for any positive integer

> **Example**: Use mathematical induction to prove the following statement  for every positive integer $n$:
> 
> $$
> 2 + 4 + 6 + ... + 2n = n (n+1)
> $$
> 
> 1. Basis Step:
> - $P(1): 1(1+1) = 2$ *(base case is true)*
> 
> 2. Induction Step:
> - If $P(k)$ is $\textcolor{red}{2 + 4 + 6 + ... + 2k} = \textcolor{red}{k(k+1)}$,
> - Then $P(k+1)$ is $\textcolor{red}{2 + 4 + 6 + ... + 2k} + 2(k+1) \stackrel{?}{=} \textcolor{purple}{(k+1)(k+2)}$
> - Proving that $P(k+1)$ is true:
> $$
> \begin{aligned}
> 	\textcolor{red}{2 + 4 + 6 + ... + 2k} + 2(k+1) &= \textcolor{purple}{(k+1)(k+2)} \\
> 	\textcolor{red}{k(k+1)} + 2(k+1) &= \textcolor{purple}{(k+1)(k+2)} \\
> 	\textcolor{red}{k^2 + k} + 2k + 2 &= \textcolor{purple}{(k+1)(k+2)} \\
> 	k^2 + 3k + 2 &= \textcolor{purple}{(k+1)(k+2)} \\
> 	(k+1)(k+2) &= \textcolor{purple}{(k+1)(k+2)} \\
> \end{aligned}
> $$
>
> 3. Conclusion:
> - Thus, by mathematical induction, the statement is true for every positive integer $n$.

# Examples: Induction Proof

> **Example**: Use mathematical induction to prove the following statement for every positive integer $n$:
> 
> $$
> 5 + 10 + 15 + ... + 5n = \frac{5n(n+1)}{2}
> $$
> 
> 1. Basis Step:
> - $P(1): \frac{5(1)(1+1)}{2} = \frac{5(2)}{2} = 5$
> 
> 2. Induction Step:
> - $P(k): 5 + 10 + 15 + ... + 5k = \frac{5k(k+1)}{2}$
> - $P(k+1): 5 + 10 + 15 + ... + 5k + 5(k+1) = \frac{5(k+1)(k+2)}{2}$
> - Proving that $P(k+1)$ is true:
> $$
> \begin{aligned}
> 	5 + 10 + 15 + ... + 5k + 5(k+1) &= \frac{5(k+1)(k+2)}{2} \\
> 	\frac{5k(k+1)}{2} + 5(k+1) &= \frac{5(k+1)(k+2)}{2} \\
> 	\frac{5k(k+1)}{2} + \frac{10(k+1)}{2} &= \frac{5(k+1)(k+2)}{2} \\
> 	\frac{5k(k+1) + 10(k+1)}{2} &= \frac{5(k+1)(k+2)}{2} \\
> 	\frac{(k+1)(5k + 10)}{2} &= \frac{5(k+1)(k+2)}{2} \\
> 	\frac{5(k+1)(k + 2)}{2} &= \frac{5(k+1)(k+2)}{2} \\
> \end{aligned}
> $$
> 
> 3. Conclusion:
> - Thus, by mathematical induction, the statement is true for every positive integer $n$.

> **Example**: Use mathematical induction to prove the following statement for every positive integer $n$:
> 
> $$
> 1^3 + 2^3 + ... + n^3 = \frac{n^2 (n+1)^2}{4}
> $$
> 
> 1. Basis Step:
> - $P(1): \frac{1^2 (1+1)^2}{4}$
> 
> 2. Induction Step:
> - $P(k): 1^3 + 2^3 + ... + k^3 = \frac{k^2 (k+1)^2}{4}$
> - $P(k+1): 1^3 + 2^3 + ... + k^3 + (k+1)^3 = \frac{(k+1)^2 (k+2)^2}{4}$
> - Proving that $P(k+1)$ is true:
> $$
> \begin{aligned}
> 	1^3 + 2^3 + ... + k^3 + (k+1)^3 &= \frac{(k+1)^2 (k+2)^2}{4} \\
> 	\frac{k^2 (k+1)^2}{4} + (k+1)^3 &= \frac{(k+1)^2 (k+2)^2}{4} \\
> 	\frac{k^2 (k+1)^2}{4} + \frac{4(k+1)^3}{4} &= \frac{(k+1)^2 (k+2)^2}{4} \\
> 	\frac{k^2 (k+1)^2 + 4(k+1)^3}{4} &= \frac{(k+1)^2 (k+2)^2}{4} \\
> 	\frac{(k+1)^2 [ k^2 + 4(k+1) ]}{4} &= \frac{(k+1)^2 (k+2)^2}{4} \\
> 	\frac{(k+1)^2 ( k^2 + 4k + 4 )}{4} &= \frac{(k+1)^2 (k+2)^2}{4} \\
> 	\frac{(k+1)^2 (k+2)^2}{4} &= \frac{(k+1)^2 (k+2)^2}{4}
> \end{aligned}
> $$
> 
> 3. Conclusion:
> - Thus, by mathematical induction, the statement is true for every positive integer $n$.

> **Example**: Show than $n<2^n$ for all positive integers $n$
> 1. Basis Step: The proposition function is $P(n)=n<2^n$
> $$
> \begin{aligned}
> P(n)&:n<2^n \\
> P(1)&:1<2^1 \\
> P(1)&:1<2 \text{ (true, basis step verified)} \\
> \end{aligned}
> $$
> 2. Induction Step:\
> Assume $P(k): k < 2^k$ to prove $P(k+1): k+1 < 2^{k+1}$:
> 
> $$
> \begin{aligned}
> 	k + 1 < 2^k + 1 \le 2^k + 2k = 2^{k+1}
> \end{aligned}
> $$
> - Therefore, $P(k+1)$ is true. If $k < 2^k$, then $k+1 < 2^{k+1}$
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
> &= 2^{k+1+1} - 1 \\
> &= RHS
> \end{align*}
> $$
> 
> 3. Therefore, the statement is true.

# Second Principle

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

