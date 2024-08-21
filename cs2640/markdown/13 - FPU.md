---
title: "Floating-Points"
---

# Floating-Point Numbers

**Floating Point Numbers**: Real numbers.
- e.g., Fixed point notation: $1.2$, rational notation: $1 / 2$, floating-point notation $12345 \times 10^{-4}$

**Floating-Point Notation:**

$$
\text{Floating-Point Notation: } \text{Mantissa} \text{Base}^\text{Exponent}
$$

> **Example**:
> 
> | Number            | Scientific Notation | Floating-Point Notation |
> |-------------------|---------------------|-------------------------|
> | 1,245,000,000,000 | 1.24510^{12}        | 0.1245 10^{13}          |
> | 0.0000001245      | 1.245 10^{-7}       | 0.1245 10^{-6}          |

## Representations

**Binary Fixed-Point**:

We can place an imaginary binary point in a binary pattern to define an integer part and fraction part.
- Math works as normal as long as binary patterns have the same binary point.

> **Example**: Binary pattern with **two** fractional bits $\to$ decimal
> 
> $$
> 00101011_2 = 001010.11_2 = 10.75_{10}
> $$

> **Note**: For more precision you need to use more floating-point bits (you can shift with `sra`{.mips}) .
> - You also need to be consistent with the binary point for the math to work.

**Floating-Point IEEE-754**:

- Technical standard for floating-point arithmetic
- Made of: *(single precision / double precision)*
	1. Sign *(1 bit)*
	2. Exponent *(11 bits / 8 bits)*
	3. Mantissa *(52 bits / 23 bits)*
		- (Always normalized to `0.XXXX`)

# MIPS Floating Point Coprocessor 1

Instructions are split between single and double precision.
- Don't mix single and double precision!
	* Only even f-registers are valid operands for double precision operations.

```mips
	.data
radius:	.float	10.0
area:	.float	0.0
	.text
main:
	l.s	$f4, radius
	mul.s	$f5, $f4, $f4	# f4 = radius ^ 2
	li.s	$f6, 3.141592653589793	# f6 = pi
	mul.s	$f12, $f5, $f6	# area = pi * radius^2
	# Save result into area
	s.s	$f12, area
	# Print area
	li	$v0, 2
	syscall
	# Exit
	li	$v0, 10
	syscall
```
