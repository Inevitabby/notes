---
title: "Half Adder & Full Adder"
---

# Half Adder

**Half Adder**: Digital logic circuit that performs binary addition of two single-bit binary numbers.
- Has two inputs, $A$ and $B$, and outputs SUM and CARRY. SUM is the least-significant bit of the result, and CARRY is the most-significant bit of the result.
- Can be implemented with basic gates like XOR and AND gates.

## Creating a Half Adder

**Behavior**:

$$
\begin{align*}
	\begin{align*}
		& 0 \\
		+ & 0 \\
		= & 00
	\end{align*}
	\qquad & \qquad 
	\begin{align*}
		& 0 \\
		+ & 1 \\
		= & 01
	\end{align*}
	\\
	\begin{align*}
		& 1 \\
		+ & 0 \\
		= & 01
	\end{align*}
	\qquad & \qquad 
	\begin{align*}
		& 1 \\
		+ & 1 \\
		= & 01
	\end{align*}
\end{align*}
$$

**Rewritten as a truth table:**

| A | B | Carry | Sum |
|---|---|-------|-----|
| 0 | 0 | 0     | 0   |
| 0 | 1 | 0     | 1   |
| 1 | 0 | 0     | 1   |
| 1 | 1 | 1     | 0   |

**Observations**:
- Carry functions like AB (AND)
- Sum functions like A'B + AB' (XOR)

> **Note**: Remember to think of the logic gates as minimum and maximum functions!

# Full Adder

**Full Adder**: Like a half adder, except it adds 3 bits instead of 2 bits.

## Creating a Full Adder

**Behavior**:

$$
\begin{align*}
	\begin{align*}
		& 0 \\
		+ & 0 \\
		+ & 0 \\
		= & 00
	\end{align*}
	\qquad & \qquad 
	\begin{align*}
		& 0 \\
		+ & 0 \\
		+ & 1 \\
		= & 01
	\end{align*}
	\qquad & \qquad 
	\begin{align*}
		& 0 \\
		+ & 1 \\
		+ & 0 \\
		= & 01
	\end{align*}
	\\
	\begin{align*}
		& 0 \\
		+ & 1 \\
		+ & 1 \\
		= & 10
	\end{align*}
	\qquad & \qquad 
	\begin{align*}
		& 1 \\
		+ & 0 \\
		+ & 0 \\
		= & 01
	\end{align*}
	\qquad & \qquad 
	\begin{align*}
		& 1 \\
		+ & 0 \\
		+ & 1 \\
		= & 10
	\end{align*}
	\\
	& &
	\begin{align*}
		& 1 \\
		+ & 1 \\
		+ & 1 \\
		= & 11
	\end{align*}
\end{align*}
$$

**Truth Table**:

| A | B | C | Carry | Sum |
|---|---|---|-------|-----|
| 0 | 0 | 0 | 0     | 0   |
| 0 | 0 | 1 | 0     | 1   |
| 0 | 1 | 0 | 0     | 1   |
| 0 | 1 | 1 | 1     | 0   |
| 1 | 0 | 0 | 0     | 1   |
| 1 | 0 | 1 | 1     | 0   |
| 1 | 1 | 0 | 1     | 0   |
| 1 | 1 | 1 | 1     | 1   |

**Observations**:
- Sum functions like a 3-input XOR (XOR3).
- Carry functions like a **majority function**

> **Majority Function**: A 2/3 of the bits must be 1 to output 1.
> - AB + AC + BC

# Positional Value

In a positional system, the value of a digit is the digit $\times$ place value. The total value is the sum of these products.

# Ripple Adder

To denote positional value in binary, we can use HA and FA to chain the carry-bit.

$$
\begin{align*}
	& a_1 a_2 a_3 \\
	+ & b_1 b_2 b_3 \\
\end{align*}
$$

**Steps for added two three-bit numbers**:
1. $a_3 + b_3$ are added by a HA. The carry bit is carried over to the next calculation ($c_0$).
2. $a_2 + b_2 + c_0$ is done by a FA. The carry bit goes to the next calculation ($c_1$)
3. $a_1 + b_1 + c_1$ is done by a FA. The carry bit is the MSBit.

> **Variation on HA**: You could also do step 1 with a FA, with the third input set to zero. Why? Because this design can be easily cascaded into another adder.
> - e.g., you can create a 6bit adder by connecting two 3bit adders, a 9bit adder using three 3bit adders, etc.

<!--
# On 2's Complement

> Relevant Notes: [CS2640 - Two's Complement](https://inevitabby.gitlab.io/notes/public/cs2640/03%20-%20Binary%20Operations%20and%20Sign.html#b.-twos-complement)
> 
> - *tl;dr two's complement is how we make negative numbers, and two's complement numbers play nice with addition.*

We know that the two's complement of a number is `NOT` on every bit, then `+1`. Why does this work? Because `A + (-B) = A - B` (???????????)
-->
