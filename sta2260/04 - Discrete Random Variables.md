---
title: "Discrete Random Variables"
---

# Discrete Random Variables

## Random Variables

**Random Variable**: A real-valued function defined on the sample space.
- A function of example outcomes.

**Range of Random Variable**, $R(X)$: All possible values $X$ can take on.

**Discrete Random Variable**: A random variable with finite or countable $R(X)$

**Two Types of Numerical Variables**:
1. **Discrete**: Countable
	- e.g., # of students in a room
2. **Continuous**: Uncountable
	- e.g., 1—10

**Probability Mass Function**: $P_X (i) = P(X = i)$, where $i \in R(X)$
- $\sum_{i \in R(X)} P(X = i) = 1$

<details><summary>Example: Random variable</summary>
Suppose we want to define $X$ to be the number of heads we get after flipping a coin three times.

Our sample space would be:
- HHH
- HHT
- HTH
- HTT
- THH
- THT
- TTH
- TTT

In our sample space, heads can be gotten between 0—3 times. By putting the count above $n$, we can define the probability mass function in a table like so:

| $i$   | $P(X=i)$ |
|-------|----------|
| 0     | 1/8      |
| 1     | 3/8      |
| 2     | 3/8      |
| 3     | 1/8      |
| Total | 1        |

For example to find P(at most one heads), or $P(X \le 1)$:

$$
\begin{aligned}
	P(X \le 1) &= P(X = 0) + P(X = 1) \\
	&= \frac{1}{8} + \frac{3}{8} \\
	&= \frac{1}{2}
\end{aligned}
$$
</details>

<details><summary>Example: Probability mass function</summary>
Q: Each of the following tables lists certain values of $X$ and their probabilities $P(x)$.

Determine whether each table represents a valid probability mass function.

a.

| $i$ | $P(X=i)$ |
|-----|----------|
| 3   | 0.5      |
| 5   | 0.2      |
| 7   | 0.4      |

b.

| $i$ | $P(X=i)$ |
|-----|----------|
| 0   | 0.3      |
| 1   | 0.9      |
| 2   | -0.2     |

c.

| $i$ | $P(X=i)$ |
|-----|----------|
| 2   | 0.2      |
| 3   | 0.6      |
| 6   | 0.1      |
| 9   | 0.1      |

A:

> Remember: A valid probability mass function will have its probabilities add up to 1.0, and each individual probability must be a valid probability (between 0 and 1).

a. No, probabilities add up to 1.1
b. No, -0.2 is not a possible probability
c. Yes, probabilities add up to 1.0 and all probabilities are valid.

</details>

## Expectation of Random Variables

**Expectation of Random Variables**; $E(X) \lor \mu$: Weighted average of a random variable's outcomes.
- aka: Mean of random variables.

$$
\boxed{
	E(X) = \sum_{i \in R(X)} i P(X=i) = \mu
}
$$

<details><summary>Example: Random variable</summary>
Q: Find the expectation of the random variable.

Ex: Flip a coin three times.
- $X$: Number of heads
- $R(X)=\{ 0, 1, 2, 3 \}$

A: 

$$
\begin{aligned}
	E(X) &= \sum_{i \in \{ 0, 1, 2, 3 \}} i P(X=i)
	&= 0P(X=0) + 1P(X=1) + 2P(X=2) + 3P(X=3)
	&= 0 \times \frac{1}{8} + 1 \times \frac{3}{8} + 2 \times \frac{3}{8} + 3 \times \frac{1}{8}
	&= \frac{3}{2}
\end{aligned}
$$

| $i$   | $P(X=i)$ | $i P(X=i)$                 |
|-------|----------|----------------------------|
| 0     | 1/8      | $0 \times \frac{1}{8}$     |
| 1     | 3/8      | $1 \times \frac{3}{8}$     |
| 2     | 3/8      | $2 \times \frac{6}{8}$     |
| 3     | 1/8      | $3 \times \frac{3}{8}$     |
| Total | 1        | $E(X) = \mu = \frac{3}{2}$ |

</details>

## Variance of Random Variables

$$
\boxed{
	Var(X) = E(X^2) - \mu^2 = \sigma^2
} \\~\\
\small\textit{where } E(X^2) = \sum_{i \in R(X)} i^2 P(X=i)
$$

<details><summary>Example: Why?</summary>
$$
\begin{aligned}
	Var(X) &= E [ (X - \mu)^2 ] = \sum_{i \in R(X)} (i - \mu)^2 P(X-i) = \sigma^2 \\
	&= E(X^2) - \mu^2 \quad \text{where } E(X^2) = \sum_{i \in R(X)} i^2 P(X=i)
\end{aligned}
$$
</details>

# Binomial R.V.

# Poisson R.V.

# Geometric R.V.

# Hypergeometric R.V

