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

- .data: 0x400000
- .text: 0x10000000

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
- *Adding to a memory address is always performed with `addu` or `addui`*

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
> ```c
> int array[20];
> for (int = 0; i < 20; i++) {
> 	array[i] = i + 1;
> }
> ```
> 
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
