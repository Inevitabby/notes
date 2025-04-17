---
title: Pipelining
---

# Pipelining

Majority of the time, we are writing data to registers.

To execute just one instruction, we have to do:
1. **F**etch: Bring the instruction into the CPU
2. **D**ecode: Find out what is this instruction
3. **E**xecute: Perform the instruction
4. **W**rite**b**ack: Write data to register/

Suppose each step takes 1 nanosecond to execute

| F1  | D1  | E1  | WB1 |
|-----|-----|-----|-----|
| 1ns | 1ns | 1ns | 1ns |

- This will take 4 ns.

Now, suppose we want to ad a second instruction

| F1  | D1  | E1  | WB1 | F2  | D2  | E2  | WB2 |
|-----|-----|-----|-----|-----|-----|-----|-----|
| 1ns | 1ns | 1ns | 1ns | 1ns | 1ns | 1ns | 1ns |

- This will 8 ns.
	* so on and so forth.

Pipelining is about looking at when the machine is at D1 and seeing that the hardware that was used for F1 is now free and needlessly idling, so instead we can do this:

| F1  | D1  | E1  | WB1 |     |
|-----|-----|-----|-----|-----|
|     | F2  | D2  | E2  | WB2 |
| 1ns | 1ns | 1ns | 1ns | 1ns |

- Now, every new instruction only adds 1ns rather than 4ns.

---

This is the execution of on instruction:

| F | D | E | WB |
|---|---|---|----|

**Modular v.s. Whole System**: You can swap parts out in a modular system, but not in a whole system. 

A real pipeline actually has overhead.

Here, we use buffers to control the flow of input.

![Doodle](.images/doodle_60.png)

- This is a synchronous solution.

> **Alternative**: Async
> - We won't go over async pipelining in this class.
> - Another solution, is ask and ack architecture (asyncronous).
>	- 1. Ask / Request: Can I send the information?
> 	- 2. 
>		- Ack: Yes (acknowledge)
> 		- Nack: No (reject)
> 
> ![Doodle](.images/doodle_61.png)

# Speed

To calculate speed, we need to calculate:
1. Delay without pipelining.
2. Delay with pipelining.

![Doodle](.images/doodle_63.png)

| # of Instructions | Delay without Pipelining | Delay with Pipelining |
|-------------------|--------------------------|-----------------------|
| 1                 | $k\tau$                  | $k\tau$               |
| 2                 | $2k\tau$                 | $k + 1\tau$           |
| 3                 | $3k\tau$                 | $k + 2\tau$           |
| N                 | $Nk\tau$                 | $k + (N-1)\tau$       |

- $k$: Parts
- $\tau$: Delay

$$
\text{Speedup} = \frac{
	\text{Delay without piplining}
}{
	\text{Delay with piplining}
} =
\frac{
	Nk\tau
}{
	k+(N-1)\tau
}
$$

Speedup as $n \to \inf$:

$$
\lim_{N \to \inf} \frac{
	Nk
}{
	k+(N-1)
} = k
$$
