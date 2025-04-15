---
title: Pipelining
---

**Pipelining**: 

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

![](.images/doodle_60.png)

Another solution, is ask and ack architecture (asyncronous).
- 1. Ask / Request: Can I send the information?
- 2. 
	- Ack: Yes (acknowledge)
	- Nack: No (reject)

![](.images/doodle_61.png)

> We won't be going over ask/ack in this class.
