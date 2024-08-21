---
title: Programming Guidelines
---

# Variables

1. Be cognizant of when to use a location in memory rather than a register, especially when writing code on paper.
	- *`int` is equivalent to `word`, char is equivalent to `byte`, etc.*

# Math

1. If multiplying or dividing by $2^n$, use the appropriate shift instructions.

> **Example**
> **Q:** Write the following pseudocode in assembly:
> ```c
> int total, n = 100
> t0 = 1
> t1 = 1
> while (t1 <= n) {
> 	t0 += t1
> 	t1++
> }
> total = t0
> ```
> 
> **A:**
> ```mips
> # Wrong
> add	$t3, $t5, $t6
> mul	$t3, $t3, 4
> sub	$t3, $t4. $t3
> # Correct
> add	$t3, $t5, $t6
> sll	$t3, $t3, 2
> sub	$t3, $t4. $t3
> ```
