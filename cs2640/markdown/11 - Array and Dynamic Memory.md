---
title: "Array and Dynamic Memory"
---

# Memory

MIPS is a load-and-store architecture, only two instructions can access memory.
- *e.g., `lw`, `sw` for words, `lb`, `sb` for bytes, etc.*
	* *(These memory instructions are I-type instructions)*

> **Recall**: Word
> - Occupies 4 addresses (because each byte has its own address)
> - Is word aligned (is a multiple of four)
>	* Thus, the last two bits of a word will always be zero.

**Memory Layout**:
- Text Segment (`.text`): 0x400000 — 0x10000000
- Static Data (`.data`): ??? — 0x10000000
- Dynamic Data: Stored above static data.

**Symbol Table**: Stores a table of symbols and their addresses.
- e.g., The symbol `mem` may map to `0x100000004` in the table.

# Offset

> **Format**: `lw` and `sw`
> ```mips
> lw    rd, offset(rt)
> sw    rd, offset(rt)
> ```
> - The offset is 16-bit two's complement.

$$
\text{Effective Address} = 
\text{Base} + 
\text{Offset}
$$

> **Remember**: Addresses are always unsigned (you can't have negative addresses!)
> - Adding to a memory address is [always performed with `addu` or `addui`]{.underline}

> **Remember**: The offset is in bytes.
> - *e.g., to get to the next word you'll need to add 4, to get to the next half-world you need to add 2, to get to the next byte you need to add 1*

> **Example**: Accessing memory location with offset
> ```mips
>         .data
> mem:    .word   0
>         .word   1
>         .text
> main:
>         la      $t0, mem
>         lw      $t1, ($t0)      # Access first elem
>         lw      $t2, 4($t0)     # Access second elem
> # End of program
> ```
> - **Note**: `($t0)` is the same as `0($t0)`

> **Example**: Translating C program that uses an array into MIPS
> 1. C
> ```c
> int array[20];
> for (int = 0; i < 20; i++) {
> 	array[i] = i + 1;
> }
> ```
> 
> 2. MIPS
> ```mips
>          .data
> array:   .word    0:20
>          .text
>          la       $t0, array
>          li       $t1, 1
> while:   bgt      $t1, 20, endw
>          sw       $t1, (t0)
>          addiu    $t0, $t0, 4      # Move address to next element
>          addi     $t1, $t0, 1      # Increment loop counter variable
>          b while
> endw:
> ```

> **Example**: Accessing random element in array
> ```mips
>         la	$1, array
>         sll	$t2, $t5, 2
>         addu	$t3, $t1, $t2
>         lw	$t0, ($t3)
> # End
> ```

> **Example**: Traversing through array linearly
> ```mips
>         la	$t2, array
>         li	$t0, 1
>         li	$t1, 1
> for:
>         bge	$t1, 4, endf
>         # Get ith item
>         lw	$t3, ($t2)
>         add	$t0, $t0, $t3
>         # Increment counter variables
>         addiu	$t2, $t2, 4
>         addi	$t1, $t1, 1
>         b for
> endf:
> ```

> **Note**: To translate a switch statement to assembly, just remember that all switch statements can be rewritten as *if-else-if* statements.

> **Example**: Random access of array of addresses (Strings)
> ```mips
>         .data
> a1:     .asciiz	"Hello"
> a2:     .asciiz	"World"
> a3:     .asciiz	"Goodbye"
> strArr: .word	a1, a2, a3
>         .text
> main:
>         # The ith elem we want
>         li	$t0, 0
>         la	$t1, strArr
>         sll	$t2, $t0, 2
>         addu	$t3, $t1, $t2
>         lw	$a0, ($t3)
>         li	$v0, 4
>         syscall
>         li	$v0, 10
>         syscall
> # End
> ```

<!--
**Example**: Linear search
1. C

```c
boolean found = false;
int index = 0;
while (!found && index < LEN) {
	if (array[index] == t0) {
		found = true;
	} else {
		index++;
	}
}
```

```mips
# We'll use t1 to store the boolean and t3 to store base
	.data
a1:	.asciiz	"Hello"
a2:	.asciiz	"World"
a3:	.asciiz	"Goodbye"
strArr:	.word	a1, a2, a3
LEN:	.word	3
	.text
main:
	# boolean found
	li	$t1, 0
	# index
	li	$t2, 0
while:
	bnez	$t1, endw
	bge	$t2, LEN, endw
	lw	$t4, ($t3)
	bne	$t3, $t0, else
	li	$t1, 1
	b	endif
else:
	addi	$t2, $t2, 1
	addu	$t2, $t3, 4
endif:
	b	while
endw:
	li	$v0, 10
	syscall

```
-->

# Dynamic Memory Allocation (Syscall 9)

**Syscall 9:** Lets us allocate dynamic data.
— To use it, load `$a0` with the number of bytes you want and do the syscall.
- `$v0` will contain the base address of the array.

> **Example**: Dynamic Memory Allocation in C v.s. MIPS
> 1. C
> ```c
> // Create an array that can store 100 integers
> int *int_arr = malloc(100*sizeof(int));
> int_arr[5] = 20;
> ```
> <!--*-->
> 
> > 2. MIPS
> ```mips
>       li	$a0, 20*4
>       li	$v0, 9
>       syscall
>       # Save the base into t9
>       move	$t9, $v0
> # End
> ```
<!--*-->

## Dynamically Allocating $n$ Bytes (Alignment)

To allocate a dynamic number of bytes $n$, we need to make sure we are requesting in chunks of 4 bytes.

To turn a number into the nearest multiple of 4, add 3 to the number and remove the lower two bits.
$$
\boxed{
	\text{Nearest Multiple of 4: } (n + 3) \& ~3
}
$$

> **Example**:
> ```mips
>       add     $t1, $t0, 3
>       andi    $a0, $t1, 0xfffc
>       li      $v0, 9
>       syscall
> # End
> ```

