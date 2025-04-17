---
title: "ALU"
---

**ALU**: Arithmetic Logic Unit
- Circuit that does logical and arithmetic operations. (e.g., AND, NOR, addition, division).

> **On Speed v.s. Complexity**:
> - We can derive universal gates from an extremely simple add-only ALU, but the tradeoff is speed.  

> **Example**: Universal Gates from Simple ALU
> 
> ![Doodle](.images/doodle_64.png)
> 
> Within this simple adder-only ALU, we can see that:
> - The carry bit acts as a 2AND
> - The sum bit acts as a 2XOR
> 	* Further, wiring a 2XOR such that the two inputs going in are A and 1, the result will be $\bar{A}$
> 		+ This lets is do NAND, which is a universal gate.
