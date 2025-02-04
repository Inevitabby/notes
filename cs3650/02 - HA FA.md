---
title: "Half Adder & Full Adder"
---

# Half Adder (HA)

![](.images/doodle_12.png)
<center>
*C = AB*
*S = AB' + A'B = A XOR B*
</center>

**Half Adder**: Digital logic circuit that performs binary addition of two single-bit binary numbers.
- Has two inputs, $A$ and $B$, and outputs SUM (LSBit) and CARRY (MSBit).
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

# Full Adder (FA)

![](.images/doodle_18.png)
<center>
*C=AB+AC+BC=Majority Gate*
*S=A XOR B XOR C=A'B'C + A'BC' + AB'C'*
</center>

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
> ![](.images/doodle_19.png)
> - AB + AC + BC

# Positional Value

In a positional system, the value of a digit is the digit $\times$ place value. The total value is the sum of these products.

# Ripple Carry Adder

To denote positional value in binary, we can chain the carry-bit into another addition procedure.


![](.images/doodle_20.png)

<center>
*a 3-bit RCA (a + b)*
</center>


**Step-by-step addition of two 3-bit numbers**:
1. $a_0 + b_0$ are added by the rightmost FA. The carry bit ($c_0$) is carried over to the next calculation.
2. $a_1 + b_1 + c_0$ is done by the middle FA. The carry bit ($c_1$) goes to the next calculation
3. $a_2 + b_2 + c_1$ is done by the leftmost FA. The carry bit is the MSBit.

> **Variation with HA**: You could also do step 1 with a HA to save electricity and improve speed, but using a FA makes the design cascadeable.
> - *e.g., you can create a 6-bit adder by connecting two 3-bit adders; or a 9-bit adder using three 3-bit adders, etc.*

## Variation: Subtractor

> Recall: To get the two's complement (negative) of a binary number, you need to apply `NOT` to every bit and do `+1`


![](.images/doodle_22.png)

<center>
*We can `NOT` b and put 1 into the first FA to do a + (-b)*
</center>

## Example: Thinking Backwards

This is an incrementer:

![](.images/doodle_23.png)

<center>
(a+1)
</center>

> Q: What if we want to do (a-1)?
> 
> A: We just find $a + (-1)$ (add the two's complement of $1$ to $a$.
> 
> Let's find the two's complement of a 3-bit representation of 1 to find pattern.
> 
> $$
> 001_2 = 1_{10}
> $$
> 
> 1. `NOT`
> 
> $$
> (001_2)' = 110_2
> $$
> 
> 2. `+1`
> 
> $$
> \begin{align*}
>  &110 \\
> +&001 \\
> =&111
> \end{align*}
> $$
> 
> Thus, $111_2 = -1_{10}$
> 
> > **Note**: Alternatively, we could've used the shortcut of flipping all bits left of the rightmost `1` bit ([CS2640 - Two's Complement](https://inevitabby.gitlab.io/notes/cs2640/03%20-%20Binary%20Operations%20and%20Sign.html#b.-twos-complement)). 

Thus, a decrementer looks like this:

![](.images/doodle_24.png)

## Example: Adder and Subtractor Combo

To combine the adder and subtractor, we'll need to use this property of XOR:

![](.images/doodle_25.png)

<center>
*XOR can be a buffer or a NOT gate*
</center>

Using this switch technique, we can toggle between adding A+B and adding A+(-B).

![](.images/doodle_26.png)

# Variations of HA and FA

## Half Adder Plus (HA+)

![](.images/doodle_27.png)
<center>
*C=A+B*
*S=AB+A'B'=A XNOR B*
</center>

**Half Adder Plus**: Like a half adder, except it does A+B+1 rather than A+B.
- Can be implemented with OR and XNOR.

| A | B | C | S |
|---|---|---|---|
| 0 | 0 | 0 | 1 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 1 | 1 |

## Half Adder Minus (HA-)

![](.images/doodle_28.png)
<center>
*C=(A+B)'*
*S=AB+A'B'=A XNOR B*
</center>

**Half Adder Minus**: Like a half adder, except it does A+B-1 rather than A+B.
- Can be implemented with NOR and XNOR.

| A | B | C | S |
|---|---|---|---|
| 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 0 |
| 1 | 0 | 0 | 0 |
| 1 | 1 | 0 | 1 |

## Half Adder Minus Minus (HA- -)

![](.images/doodle_29.png)
<center>
*C=(AB)'*
*S=AB'+A'B=A XOR B*
</center>

**Half Adder Minus Minus**: Like a half adder, except it does A+B-2 rather than A+B.
- Can be implemented with NAND and XOR.

| A | B | C | S |
|---|---|---|---|
| 0 | 0 | 1 | 0 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 0 |

## Full Adder Minus Minus (FA- -)

![](.images/doodle_17.png)
<center>
*Carry = (AB + AC + BC)'*; 
*Sum = A XOR B XOR C = A'B'C + A'BC' + AB'C' + ABC*
</center>

**Fall Adder Minus Minus**: Like a full adder, except it does A+B+C-2 rather than A+B+C.
- Can be implemented with Minority Gate and XOR.

> **Note**: A minority gate is just the NOT of a majority gate.

| A | B | C | Carry | Sum |
|---|---|---|-------|-----|
| 0 | 0 | 0 | 1     | 0   |
| 0 | 0 | 1 | 1     | 1   |
| 0 | 1 | 0 | 1     | 1   |
| 0 | 1 | 1 | 0     | 0   |
| 1 | 0 | 0 | 1     | 1   |
| 1 | 0 | 1 | 0     | 0   |
| 1 | 1 | 0 | 0     | 0   |
| 1 | 1 | 1 | 0     | 1   |

> **Note**: We can't represent FA+ + because we can't represent $4_10$ with 2 bits.
