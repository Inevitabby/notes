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

> **Example**: Suppose we have a method that uses `$t0` as a loop-control variable that calls another procedure.
> - Problem: It is the responsibility of the caller to save and restore `$t0` before and after each call.
> 
> ```mips
> proc:
> 	# Push s0 to stack
> 	addiu	$s0, $sp, -4
> 	sw	$s0, $sp
> 	# While Loop
> 	li	$s0, 1
> while:	
> 	jal	proc2
> 	add	$s0, 1
> 	b	while
> end:
> 	# Pop s0 from stack
> 	lw	$s0, ($sp)
> 	addiu	$sp, $sp, 4
> 	jr	$ra
> # End of program
> ```

# Command-Line Arguments

When `main` is called, `$a0` equivalent to C's `argc`{.c} while `$a1` is equivalent to C's `argv`{.c}.
- `$a0`: Number of command-line arguments.
- `$a1`: Array of pointers to strings.

> **Example**: Reading command-line arguments
> 
> ```mips
> main:
>       # Load address of first arg
>       lw	$a0, ($a1)
>       # Print it
>       li	$v0, 4
>       syscall
> 
>       # Load address of second arg
>       lw	$a0, 4($a1)
>       # Print it
>       li	$v0, 4
>       syscall
> # Etc...
> ```

> **Note**: The zeroth element of the argument array (`0($a1)`) is the program's name.

## Converting a String to an Integer

To convert a single character to an integer, you must do math to the ASCII code.

In ASCII, numbers start at value 48, or char `'0'`, so:

$$
\boxed{
	\text{Numeric Value of ASCII Char: } 
	\text{c} - '0'
}
$$

Suppose we advance through the string to the next char in the string.
- We must multiply the previous value by 10, calculate the numeric value, and add it to the previous value.
- We stop this process once we reach the null char.

> **Note**: Other Number Systems
> - To convert a string to other number systems, instead of multiplying by 10, multiply it by the number system's base.
>	- Ex: If you're converting to octal, you simply need to multiply by 8 instead if 10 (or; shift left by 3 bits). 

> **Example**: Parseint Procedure

```mips
# a0: String
# v0: Value
# v1: 0 if valid, 1 if invalid
parseint:
```

## Lowercase-to-Uppercase ASCII with a Bit Mask

**Lowercase to Uppercase**:
```mips
andi	$t0, $t0, 0xdf
```

**Uppercase to Lowercase**:
```mips
ori	$t0, $t0, 0x20
```

<details>
<summary>Why? (Deriving the bit mask)</summary>
> **Why?**:
> - $1000001$ is the ASCII value for "A"
> - $1100001$ is the ASCII value for "a"
> 
> This one-bit difference can be observed for all ASCII chars A—Z, hence we just need to clear the bit $0100000$ to convert a lowercase char to uppercase.
> 
> The bit mask to use is $1011111$, or `0xdf` in hexadecimal, to convert a lower-case ASCII code to uppercase.
> 
> The opposite of this mask is `0x20`, which we use with the `ori` command to convert an uppercase ASCII value to lowercase.
</details>

> **Example**: Converting a lowercase hexadecimal value to a numeric value
> ```mips
> andi	$t0, $t0, 0xdf
> sub	$t0, $t0, 'A'
> add	$t0, $t0, 10
> ```

<!--
Note: To iterate through each char in a stirn,g us lb
-->

# Passing More Than 4 Parameters

**Steps**:
1. Make room for parameters on the stack
	- By convention, allocate space even for the registers (`$a0`—`$a3`)
2. Set the values of the parameters
3. Call the function
4. Readjust the stack

> **Example**: Calling a function that takes 5 parameters
> ```mips
> main:
>     # 1. Make room for 5 parameters
>     addiu	$sp, $sp, -20
>     # 2. Set values
>     li	$a0, 1
>     li	$a1, 2
>     li	$a2, 3
>     li	$a3, 4
>     li	$t0, 5
>     sw	$t0, ($sp)
>     # 3. Call function
>     jal	sum5
>     # 4. Readjust the stack
>     sw	$v0, n
>     addiu	$sp, $sp, 20
>     # Exit
>     li	$v0, 10
>     syscall
> sum5:
>     # Add first four registers
>     add	$v0, $a0, $a1
>     add	$v0, $v0, $a2
>     add	$v0, $v0, $a3
>     # Add the fifth param (stack)
>     lw	$t0, ($sp)
>     add	$v0, $v0, $t0
>     jr	$ra
> # End
> ```
> - **Important**: Note the convention of allocating space for the first four params!

# Frame Pointer Register

**Frame Pointer** (`$fp`): Lets us keep track of where the frame of a procedure is.
- Register 29
- Treat it like the s-registers.
- Frame pointers let us save the state of a procedure and use `jal` and whatever else to our heart's content.

## Stack Frame

Things we can store in the stack frame:
- Parameters
- S-Registers
- Local Variables

> **Example Stack Frame**:
> - `$a0`
> - `$a1`
> - `$a2`
> - `$a3`
> - `$p4` (not a real register)
> - `$fp`
> - `$s0`
> - `$s1`
> - `$ra`
> 
> > Note how everything can be accessed relative to `$fp` (e.g., `$p4` is `4($fp)`)

> **Example**: Saving and restoring the stack frame
> 
> ```mips
> main:
>     # Save the stack frame
>     addiu	$sp, $sp, -4
>     sw	$fp, ($sp)
>     move	$fp, $sp
>     # Make room for s0, s1, and ra
>     addiu	$sp, $sp, -12
>     # Save s0, s1, and ra
>     sw	$s0, 8($sp)
>     sw	$s1, 4($sp)
>     sw	$ra, 0($sp)
> 
>     # DO WHATEVER WE WANT HERE
>     # - We can jal, ra, and s0—s3 to our heart's content
> 
>     # Restore stack frame
>     lw	$s0, 8($sp)
>     lw	$s1, 4($sp)
>     lw	$ra, 0($sp)
>     lw	$fp, ($fp)
>     addiu	$sp, $sp, 16
>     jr	$ra
> ```

> **Example**: Passing parameters and returning values with stack instead of registers
> 
> ```mips
> # Goal: Do n = sum(1,2)
> main:
>     addiu	$sp, $sp, -12
>     li	$t0, 1
>     sw	$t0, 4($sp)
>     li	$t0, 2
>     sw	$t0, 0($sp)
>     jal	sum
>     lw	$t0, ($sp)
>     sw	$t0, n
>     addiu	$sp, $sp, 12
> sum5:
>     lw	$t0, 8($sp)
>     lw	$t1, 4($sp)
>     add	$t0, $t0, $t1
>     sw	$t0, ($sp)
>     jr	$ra
> # End
> ```
> - Somewhat trite example, but kinda illustrates how things need to be done on Intel.

## Local Variables

**Local Variable**: Variable that's only allocated while function is running.

> **Example**: Creating local variables
> 
> 1. C
> 
> ```c
> int proc(int m, int n) {
> 	int k;
> 	int a[20];
> }
> ```
> 
> 2. MIPS
> 
> Our stack should look like this:
> - `$sp`
> - `$fp`
> - k
> - a[19]
> - ...
> - a[0]
> 
> ```mips
> proc:
>     # Set up the frame pointer (our anchor point)
>     addiu	$sp, $sp, -4
>     sw	$fp, ($sp)
>     move	$fp, sp
>     # Make room for k and a
>     addiu	$sp, $sp, -84
>     # k is at -4($fp) 
>     # a is at -84($fp) 
>     # - (specifically a[0])
>     jr	$ra
> # End
> ```

## Variable Arguments

**Variable Arguments**: Functions that take a variable number of arguments essentially are functions that take optional arrays.

> E.g., `System.out.println(String, args...)`{.java}

In MIPS convention, the required parameters will be a-registers while *varargs* will be on the stack.
- Because we don't know how many arguments we're getting, we need to put arguments onto the stack in the reverse order. 

> **Example**: Vararg in MIPS (printf)
> 
> ```mips
>       .data
> name: .asciiz    "John"
> age:  .word      "22"
> str:  .asciiz    " ... "
>       .text
> main:
>       la        $a0, str
> 	addiu     $sp, $sp, -8
> 	la        $t0, name
> 	sw        $t0, 0($sp)
> 	lw        $t0, age
> 	sw        $t0, 4($sp)
> 	jal       printf
> 	addiu     $sp, $sp, 8
> printf:
>       # push a0 to stack
> 	# Do t1 = $sp + 4 (addiu)
> 	# Move a0 into t0
> 	# while (*t0 != != '\0')
> 	# ^ Note: Use lb $t2, ($t0)
> 	#	if t2 == '%'
> 	#           t0++
> 	#           switch (*t0 (next char))
> 	#           case '%'
> 	#               Print '%'
> 	#           case 'd'
> 	#               Print ($t1) (remember to use lw)
> 	#               t1 += 4
> 	#               ^ we do this so that if there's another %d, we will use the next param
> 	#           case 's'
> 	#               Print ($t1)
> 	#               t1 += 4
> 	#      else
> 	#           Print $t2 (syscall 11)
> 	#	t0++
> 	# pop a0
> # End
> ```
<!--*-->

## Array Arguments

Functions that take arrays with no sentinel values must also take the length of the array as an argument.

> **Example**: Sum of array contents
> 
> ```mips
> 	.data
> array:	.word	0:20
> sum:	.word	0
> 	.text
> main:
> 	la	$a0, array
> 	li	$a1, 20
> 	jal	sumArr
> 	sw	$v0, sum
> 	  # Do exit syscall
> # sumArr(array, array_length)
> sumArr:
> 	move	$t0, $a0
> 	li	$v0, 0 # Sum
> 	li	$t1, 0 # Counter
> while:
> 	bge	$t1, $a1, endw
> 	lw	$t2, ($t0)
> 	add	$v0, $v0, $t2
> 	addiu	$t0, $t0, 4
> 	addiu	$t1, $t1, 1
> 	b	while
> endw:
> 	jr	$ra
> # End
> ```
> 

<!--
**REVIEW IDEA:**

Data Segment
- Static Array

Heap
- Dynamic Array

Stack Segment
- Local Array
-->

# Recursive Procedures

**Recursive Subprogram**: Has:
1. **Base Case(s)**: Terminating scenario that doesn't use recursion.
2. **Recursive Step:** Set of rules that reduces all other cases toward the base case.

> **Remember**: A recursive subprogram [must]{.underline} have at least one parameter that it used to detect the base case.
> - If it lacks a parameter, it's just a for loop.

> **Example**: Recursive Factorial in Java v.s. MIPS
> 
> 1. Java
> ```java
> int fact(int n) {
> 	if (n == 0) {
> 		return 1;
> 	} else {
> 	return n * fact(n-1);
> 	}
> }
> ```
> - Analysis:
> 	- This is a non-leaf procedure, meaning that $ra needs to be saved to the stack alongside the local variable (the parameter $n$, which would be stored in `$a0`).
> 
> 2. MIPS: Direct Translation
> 
> ```mips
> # a0: n 
> fact:
>     # Push a0 and ra
>     addi	$sp, $sp, -8
>     sw	$a0, 4($sp)
>     sw	$ra, 0($sp)
>     # Base Case: Return 1 if n==0
>     bnez	$a0, else
>     li	$v0, 1
>     b endif
> else:
>     # Recursive Case: Return n * fact(n-1)
>     sub	$a0, $a0, 1	# Get fact(n-1)
>     jal	fact
>     lw	$a0, 4($sp)	# Multiply by original n
>     mul	$v0, $a0, $v0
>     b endif
> endif:
>     lw	$a0, 4($sp)
>     lw	$ra, 0($sp)
>     addi	$sp, $sp, 8
>     jr	$ra
> ```

<!--
**Example**: Recursive Fibonacci in Java and MIPS

1. Java
```java
int fib(int n) {
	if (n <= 1) {
		return n;
	} else {
		return fib(n-1) + fib(n-2);
	}
}
```

1. MIPS
	- (You'll need to store the result of fib to the stack in order to call it twice)
-->

```mips
	.data
fibs:	.word	0, 1, 1, ..., 34
	.text
main:
	la	$a0, fibs
	li	$a1, 10
	li	$a2, 8
	jal	lsearch
```

# Generating a Random Number

```mips
# Simple Non-Recursive Traversal
traverse:
	# SAVE RA
	move	$t0, $a0
while:	beqz	$t0, endw
	lw	$a0, DATA($t0)
	jalr	$a1
	lw	$t0, NEXT($t0)
	b	while
endw:	
	$ POP RA
	jr	$ra

# How to use it
main:
	la	$a0, jead
	la	$a1, print
	jal	traverse
	
print:
	li	$v0, 4
	syscall
	jr	$a0
```
