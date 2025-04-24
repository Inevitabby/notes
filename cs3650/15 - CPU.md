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

# Computer Architecture

## Different Instruction Formats Require Different CPU Architectures

Suppose this operand format:

```
AC <- AC + 100
```

The realization of this may result in a huge delay if the same memory cell is required for the next instruction.

Thus, it's better to use an intermediate register to save the possible required data.

## Memory-Memory Architectures (Harvard)

```
Operation Operand1, Operand2, Operand3, Next Instruction
```
- In this architecture, the programmer manually sets the next address.

```
Operation Operand1, Operand2, Operand3
```
- The PC defines the next instruction.

```
Operation Operand1, Operand2
```
- Operand1 can be a source and a destination.

## Register-Memory Architectures (Harvard)

```
Operation Operand
```
- Accumulator, the default operand, is source and destination.

## Register-Memory Architectures (Von Neumann)

```
Operation Operand
```
- Uses MAR and MDR (memory address/data register) to work with one bus.

## Simple Fetch Architecture

Fetch: During the fetch cycle, the CPU retrieves the instruction from memory.
- PC typically points to instruction, and increments after execution.

> **Instruction Fetch**:
> - An instruction pointed by the PC is loaded from main memory into the PC before getting incremented by 4, because the word size is 4 bytes.

## Instruction Decode

1. Find out what is the instruction
2. Access register to read parameters.

# How to Speed Up Computers
