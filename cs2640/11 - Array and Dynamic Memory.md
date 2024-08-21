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

**Symbol Table**: Stores a table of symbols and their addresses.
- e.g., The symbol `mem` may map to `0x100000004` in the table.

# Memory Layout

(`$sp`{.mips}) 0x7fffffff:
- **Stack Segment** Starts (Grows Down)
	* *(So to head down you need to perform subtraction)*
- `$sp`{.mips} register that contains address to the top of the stack segment.

(`$gp`{.mips}) 0x00008000:
- **Dynamic Data** Ends (Grows Up)
- **Data Segment** Starts

0x10000000:
- **Data Segment** Ends (`.data`)
- **Text Segment** Starts (`.text`)

(`$pc`{.mips}) 0x00400000:
- **Text Segment** Ends
- **Reserved Segment** Starts

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

**Syscall 9:** Lets us allocate dynamic data to the heap.
— To use it, load `$a0` with the number of bytes you want and do the syscall.
	- *Remember: You can only request numbers that are multiples of 4!*
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

In MIPS32, addresses must always be multiples of 4.

To allocate a dynamic number of bytes $n$, we need to make sure we are requesting in chunks of 4 bytes (bec

To turn a number into the nearest multiple of 4, add 3 to the number and remove the lower two bits.
$$
\boxed{
	\text{Nearest Multiple of 4: } (n + 3) \& ~3
}
$$

> **Example**: Allocate t0 bytes
> ```mips
>       # Store t0 in a0, make a0 a multiple of 4
>       addiu     $a0, $t0, 3
>       srl       $a0, $a0, 2 # + 3
>       sll       $a0, $a0, 2 # Clear lower 2 bits
>       # Allocate memory
>       li        $v0, 9
>       syscall
> # End
> ```

<!--
> **Example**:
> ```mips
>       add     $t1, $t0, 3
>       andi    $a0, $t1, 0xfffc
>       li      $v0, 9
>       syscall
> # End
> ```
-->

> **Example**: Creating a dynamic array
> ```mips
>             .data
> SIZE=10
> WSIZE=SIZE*4
> darray:     .word      0:SIZE
>             .text
> 	      # Allocate memory
>             li         $a0, WSIZE
>             li         $v0, 9
> 	      syscall
> 	      # Store address into memory
> 	      sw         $v0, darray
> 	      # Use a while loop to fill array with { 2n }
> 	      lw         $t0, darray
> 	      li         $t1, 1
> 	      li         $t2, 0
> while:      bge        $t2, SIZE, endu
>             sw         $t1, ($t0)
> 	      sll        $t1, $t1, 1
> 	      addiu      $t0, $t0, 4
> 	      addi       $t2, $t2, 1
> 	      b while
> endw:       nop
> ```
<!---*-->

# 2D Arrays

$$
\text{Effective Offset: }\\ ( \text{Row} \times \text{Max Cols} + \text{Col}) \times \text{Size of Elements in Array (Bytes)}
$$

> **Example**: Doing `matrix[t0][t1] = 0`
> ```mips
>         .data
> NROWS = 5
> NCOLS = 13
> matrix: .word    0:NROWS * NCOLEs # int matrix[NROWS][NCOLS = { 0 };
>         .text
>         # matrix[t0][t1] = 0
>         # effective offset: (t0 * NCOLS + t1) * 4
>         
>         # Compute Effective Offset
>         muliw    $t2, $t0, NCOLS
>         addiw    $t2, $t2, $t1
>         slliw    $t2, $t2, 2
>         
>         # Compute Effective Address
>         la      $a0, matrix
>         add     $a1, $a0, $t2
> 
> 	# matrix[t0][t1] = 0
>         sw      $zero, ($a1)
> # End
> ```

> **Example**: Creating an identity matrix
> 1. C
> ```c
> for (int i = 0; i < n; i++) {
> 	matrix[i][i] = 1;
> }
> ```

# Stack Segment

> **Local Variable**: Variable that is automatically created and destroyed.
> - Exists in the stack segment.

> **Example**: Pushing and popping from the stack segment
> ```mips
>       # push t0 to stack segment
>       addiu   $sp, $sp, -4
>       sw      $t0, ($sp)
>       
>       # pop t0 from stack segment
>       lw      $t0, ($sp)
>       addiu   $sp, $sp, 4
> # End
> ```

> **Example**: Pushing and popping multiple values from the stack segment 
> ```mips
>       # pushing t0 and t1 to the stack
>       addiu   $sp, $sp, -8
>       sw      $t0, 4($sp)
>       sw      $t1, 0($sp)
>       
>       # popping t0 and t1 from the stack
>       lw      $t0, 0($sp)
>       lw      $t1, 4($sp)
>       addiu   $sp, $sp, 8
> # End
> ```

> **Example**: Creating an array of 100 words on the stack
> 
> 1. C
> 
> ```c
> int array[100];
> array[t0] = 99;
> ```
> 
> 2. MIPS
> 
> ```mips
>       addiu     $sp, $sp, -400
>       
>       sll       $t1, $t0, 2	# Offset
>       addu      $t2, $sp, $t1	# Effective Address
>       
>       # array[t0] = 99;
>       li        $t3, 99
>       sw        $t3, ($t2)
>       
>       addiu     $sp, $sp, 400
> # End
> ```
