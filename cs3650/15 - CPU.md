---
title: "CPU"
---

# Constructing a CPU

![](.images/doodle_59.png)

Constructing a CPU:
1. Add Register Bank/File
2. Add ALU (Arithmetic Logic Unit)
	- It must be able to read input from reg.
	- It must be able to write to reg.
3. Add Cache
	- We can have multiple levels of cache.
	- Important for taking instructions from outside the CPU into the CPU across the data bus.

> **On I/O**: There are only two ways for external devices to communitate with the CPU:
> 1. **Interrupt**: Stop what you're doing and respond.
> 	1. Reject means do nothing.
>	2. Accept means respond.
>	3. Delay means delay.
> 2. **Polling**: Periodically ask each device if they have input.
> 	- Parallel Polling: "Does anybody have a question?"
> 		* In this case, you have to decide on priority of responding.

> **Interrupt v. Polling**: If a device fails, interrupt won't catch it.
