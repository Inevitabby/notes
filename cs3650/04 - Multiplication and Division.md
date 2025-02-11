---
title: "Multiplication and Division"
---

# Binary Multiplication

Binary multiplication is just like decimal multiplication, it's just a bunch of addition.

$$
\begin{align*}
  &110 \\
\times &101
\end{align*}
$$

—is equal to—

$$
\begin{align*}
	  &110 \\
	 0&00 \\
	+ 11&0 \\
	= 11&110
\end{align*}
$$

This is also known as partial product summation, and it requires a lot of addition.

# Compressors

**Compressor**:
1. Performs addition operation
2. # of inputs > # of outputs

> **Note**: Compressors are basic components in a lot of applications, like ones for multiplication.

> **Example**: Is it possible to create a 15-4 multiplier?
> - Reword: Can you represent the result adding 15 bits with 4 bits?
> - The biggest number you can get is $15_{10}$, the biggest number you can represent with 4 bits is $2n-1 = 16 - 1 = 15$, so yes.

## 3-2

## 7-3

## 10-4

## 15-4

# Advanced Compressors

**Advanced Compressor**:
1. Performs addition operation
2. # of inputs > # of outputs
3. Carry in(s) must not change carry out(s)

> **More on Carry Behavior**: Carry bits aren't compressed because they'll be generated and consumed by whatever circuit design uses advanced compressors.

## 4-2

# Dot Matrix Representation


