---
title: "Asynchronous Counters"
---

**Asynchronous Counter**: Use cascaded flip-flops to create binary counting sequences.

**Up/Down Counter**: Digital circuit that can increment up (count up) or down (count down) depending on the control inputs.
- Since it isn't controlled by a clock signal, it is asynchronous.

> **Example**: 1, 2, and 3-bit up counter
> ![](.images/doodle_45.png)
> 1. Clock
> 2. One bit Up Counter
> 2. Two bit Up Counter

> **Example**: 3-bit Up Counter Circuit
> 
> ![](.images/doodle_47.png)
> 
> Output:
> 
> q0: 0 1 0 1 0 1
> q1: 0 0 1 1 0 0 
> a2: 0 0 0 0 1 1
> 
> Or, looked at vertically, we can see how it counts up
> 
> | Step | q1 | q2 | q3 | Numeric |
> |------|----|----|----|---------|
> | 0    | 0  | 0  | 0  | 0       |
> | 1    | 0  | 0  | 1  | 1       |
> | 2    | 0  | 1  | 0  | 2       |
> | 3    | 0  | 1  | 1  | 3       |
> | 4    | 1  | 0  | 0  | 4       |
> | 5    | 1  | 0  | 1  | 5       |


> **Example**: 3-bit Down Counter Circuit
> 
> ![](.images/doodle_48.png)
> - This is the same design at the Up Counter, we just look at Q' instead of Q.

> **Example**: Up/Down Counter Part
> ![](.images/doodle_50.png)

> **Example**: Frequency Division
> ![](.images/doodle_51.png)
> - This divides the frequency by 2.
>	- Chain to divide by powers of 2. (2, 4, 8, ...)
> - This is the same behavior as the counter, except we only observe the final output
>	- Up or down counter doesn't matter for frequency division because we only look at the final Q in the chain.

> **Example**: Frequency Multiplication
> ![](.images/doodle_52.png)
> - This multiplies the frequency by 2.
>	- Chain to multiply by powers of 2. (2, 4, 8, ...)
> - Don't look at this as logic, look at this as frequencies.
> - The buffer functions as a delay
>	- The delay doesn't need to be super precise, though it'll affect the duration of how long it stays at high and low frequencies.
