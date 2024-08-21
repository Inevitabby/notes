---
title: "Procedures"
---


# Procedures

## `jal` and `jr`

> **Format**: `jal <proc>`{.mips}

`jal`: Call a procedure
- Sets `$ra` to current PC before jumping to the label.
	* `$ra`, the return address, is register 31 by convention.
- To return from the procedure, we use `jr`{.mips}

> **Format**: `jr $ra`{.mips}
, the return address
`jr`: Return from a procedure
- Set PC to `$ra`

> **Example**: Using `jal`{.mips} to call procedures
> 
> 1. High-Level Pseudocode
> 
> ```c
> main {
> 	print("enter n")
> 	int n = getint();
> }
> void prints(s) { output s; }
> int getint() { read number from keyboard }
> ```
> 
> 2. MIPS
> 
> ```mips
>         .data
> prommpt .asciiz "enter n"
>         .text
> main:
>         la	$a0, prompt
>         jal	print
>         jal	getint
>         # Exit
>         li	$v0, 10
>         syscall
> # End of main
> 
> print:
>         li	$v0, 0
>         syscall
>         jr	$ra
> # End of print
> 
> getint:
>         li	$v0, 5
>         syscall
>         jr	$ra
> # End of getint
> ```
> - Remember to save procedure results to avoid them getting overridden.

# Register Conventions

`$a0`—`$a3`: Parameters

`$v0`—`$v1`: Return values

`$ra`: Return address

`$t0`—`$t7`: Temporary registers
- These registers are fair game, use these however you want in procedures.

`$s0`—`$s7`: Saved registers
- These registers should be used to save values we want to persist.
- Before we use it, we have to save it, though.

**Convention**: Always start from the lowest register.
- *(i.e., If you have a procedure with one parameter, use `$a0`, not `$a1` or `$a2`, etc.)*

**Convention**: Procedure should not modify `$a0`
- So just save it onto the stack and pop it off once you're done

> **Note**: Calling sub-programs from within subprograms

**Example**: Suppose we have a method that uses `$t0` as a loop-control variable that calls another procedure.
- Problem: It is the responsibility of the caller to save and restore `$t0` before and after each call.

```mips
proc:
	# Push s to stack
	addiu	$s0, $sp, -4
	sw	$s0, $so
	# While Loop
	li	$s0, 1
while:	
	jal	proc2
	add	$s0, 1
	b	while
end:
	# Pop s from stack
	lw	$s0, ($sp)
	addiu	$sp, $sp, 4
	jr	$ra
```
