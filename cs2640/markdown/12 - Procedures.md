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
> 	jal	getint
> 	# Exit
> 	li	$v0, 10
> 	syscall
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
> 	syscall
> 	jr	$ra
> # End of getint
> ```
> - Remember to save procedure results to avoid them getting overridden.

# Register Conventions

`$a0`—`$a3`: Parameters

`$v0`—`$v1`: Return values

`$ra`: Return address

**Convention**: Always start from the lowest register.
* *(i.e., If you have a procedure with one parameter, use `$a0`, not `$a1` or `$a2`, etc.)*
