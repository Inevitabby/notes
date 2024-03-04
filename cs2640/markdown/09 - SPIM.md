---
title: "MIPS Assembly"
---

# SPIM

> **SPIM**: MIPS emulator.
> - Executes assembly source programs.
> - Doesn't execute binaries.
> - Not an IDE, write your assembly in an IDE and execute with SPIM.
> - **Link**: [https://spimsimulator.sourceforge.net/](https://spimsimulator.sourceforge.net/)

> **Tip**: Vim Configuration for Assembly
> ```vimscript
> " Show tabs
> set list
> " Never expand tabs to spaces
> set noexpandtab
> " Make tabs take up 16 spaces
> set tabstop=16
> set shiftwidth=16
> ```

<!--
**Note**: Four Columns
1. TODO
2. TODO
3. TODO
4. TODO
-->

# MIPS Instructions

> **Note**: In this class we'll be learning 32-bit MIPS, not 64-bit MIPS.

**MIPS Instructions**:
- Instructions are encoded as 32-bit words
- Small number of formats encoding operation code, register numbers, ...
- Regularity
- Three types of instructions (R, J, I) 
	* Each type is encoded differently.

> **Note**: MIPS Instruction Set
> - [Stanford MIPS](https://mips.com) commercialised by MIPS Technologies
> - Similar ISAs have a large share of embedded core market
> 	* e.g., consumer electronics, network/storage, equipment, cameras, printers, vacuums, etc.
> 	* Embedded: When the CPU is inside the system.
> - **Remember**: MIPS is a 3-register instruction machine
>	- *(When we use an instruction that doesn't use 3 operands, we're actually looking at a pseudo-instruction.)*

## Register Set

| Name        | Register    | Usage                       |
|-------------|-------------|-----------------------------|
| `$zero`     | `$0`        | Always 0                    |
| `$at`       | `$1`        | Reserved for assembler use  |
| `$v0`—`$v1` | `$2`—`$3`   | Result values of a function |
| `$a0`—`$a3` | `$4`—`$7`   | Arguments of a function     |
| `$t0`—`$t7` | `$8`—`15`   | Temporary values            |
| `$s0`—`$s7` | `$16`—`$23` | Saved registers             |
| `$t8`—`$t9` | `$24`—`$25` | More temporaries            |
| `$k0`—`$k1` | `$26`—`$27` | Reserved for OS kernel      |
| `$gp`       | `$28`       | Global pointer              |
| `$sp`       | `$29`       | Stack pointer               |
| `$fp`       | `$30`       | Frame pointer               |
| `$ra`       | `$31`       | Return address              |

> **Notes**:
> - `$zero` is a read-only register.
> - `$at` stands for "assembler temporary".
> 	* In general, we can't/won't be using `$at` 
> - Note how we can only return *two* values from a function (`$v0`—`$v1`)

> **Registers**:
> - `$t0`—`$t7`: Reg's 8—15
> - `$t8`—`$t9`: Reg's 24—25
> - `$s0`—`$s7`: Reg's 16—23

## Instructions

| Mnemonic | Operands               | Instruction                          | Register Transfer                               | Type | Op/Funct |
|----------|------------------------|--------------------------------------|-------------------------------------------------|------|----------|
| add      | rd, rs, rt             | Add                                  | rd = rs + rt                                    | R    | 0/20     |
| sub      | rd, rs, rt             | Subtract                             | rd = rs - rt                                    | R    | 0/22     |
| addi     | rt, rs, imm            | Add Imm.                             | rt = rs + imm±                                  | I    | 8        |
| addu     | rd, rs, rt             | Add Unsigned                         | rd = rs + rt                                    | R    | 0/21     |
| subu     | rd, rs, rt             | Subtract Unsigned                    | rd = rs - rt                                    | R    | 0/23     |
| addiu    | rt, rs, imm            | Add Imm. Unsigned                    | rt = rs + imm±                                  | I    | 9        |
| mult     | rs, rt                 | Multiply                             | {hi, lo} = rs * rt                              | R    | 0/18     |
| mul      | rd, rs, rt             | Multiply without overflow            | rd = rs * rt                                    | R    | c/2      |
| div      | rs, rt                 | Divide                               | lo = rs / rt; hi = rs % rt                      | R    | 0/1a     |
| multu    | rs, rt                 | Multiply Unsigned                    | {hi, lo} = rs * rt                              | R    | 0/19     |
| mulu     | rd, rs, rt             | Multiply without overflow, uns       | rd = rs * rt                                    | R    | 0/19     |
| divu     | rs, rt                 | Divide Unsigned                      | lo = rs / rt; hi = rs % rt                      | R    | 0/1b     |
| mfhi     | rd                     | Move From HJ                         | rd = hi                                         | R    | 0/10     |
| mflo     | rd                     | Move From LO                         | rd = lo                                         | R    | 0/12     |
| mthi     | rs                     | Move to HI                           | hi = rs                                         | R    | 0/11     |
| mtlo     | rs                     | Move to LO                           | lo = rs                                         | R    | 0/13     |
| and      | rd, rs, rt             | And                                  | rd = rs & rt                                    | R    | 0/24     |
| or       | rd, rs, rt             | Or                                   | rd = rs \| rt                                   | R    | 0/25     |
| nor      | rd, rs, rt             | Nor                                  | rd =  ̃(rs \| rt)                                | R    | 0/27     |
| xor      | rd, rs, rt             | eXclusive Or                         | rd = rs ˆ rt                                    | R    | 0/26     |
| andi     | rt, rs, imm            | And Imm.                             | rt = rs & imm0                                  | I    | c        |
| ori      | rt, rs, imm            | Or Imm.                              | rt = rs \| imm0                                 | I    | d        |
| xori     | rt, rs, imm            | eXclusive Or Imm.                    | rt = rs ^ imm0                                  | I    | e        |
| sll      | rd, rt, sh             | Shift Left Logical                   | rd = rt << sh                                   | R    | 0/0      |
| srl      | rd, rt, sh             | Shift Right Logical                  | rd = rt >>> sh                                  | R    | 0/2      |
| sra      | rd, rt, sh             | Shift Right Arithmetic               | rd = rt >> sh                                   | R    | 0/3      |
| sllv     | rd, rt, rs             | Shift Left Logical Variable          | rd = rt << rs                                   | R    | 0/4      |
| srlv     | rd, rt, rs             | Shift Right Logical Variable         | rd = rt >>> rs                                  | R    | 0/6      |
| srav     | rd, rt, rs             | Shift Right Arithmetic Variable      | rd = rt >> rs                                   | R    | 0/7      |
| slt      | rd, rs, rt             | Set if Less Than                     | rd = rs < rt ? 1 : 0                            | R    | 0/2a     |
| sltu     | rd, rs, rt             | Set if Less Than Unsigned            | rd = rs < rt ? 1 : 0                            | R    | 0/2b     |
| slti     | rt, rs, imm            | Set if Less Than Imm.                | rt = rs < imm± ? 1 : 0                          | I    | a        |
| sltiu    | rt, rs, imm            | Set if Less Than Imm. Unsigned       | rt = rs < imm± ? 1 : 0                          | I    | b        |
| j        | addr                   | Jump                                 | PC = PC &0xF0000000 \| (addr0<< 2)              | J    | 2        |
| jal      | addr                   | Jump And Link                        | $ra = PC + 8; PC = PC&0xF0000000 \| (addr0<< 2) | J    | 3        |
| jr       | rs                     | Jump Register                        | PC = rs                                         | R    | 0/8      |
| jalr     | rs                     | Jump And Link Register               | $ra = PC + 8; PC = rs                           | R    | 0/9      |
| beq      | rt, rs, offset         | Branch if Equal                      | if (rs == rt) PC += 4 + (imm±<< 2)              | I    | 4        |
| bne      | rt, rs, offset         | Branch if Not Equal                  | if (rs != rt) PC += 4 + (imm±<< 2)              | I    | 5        |
| syscall  |                        | System Call                          | c0_cause = 8 << 2; c0_epc = PC; PC = 0x80000080 | R    | 0/c      |
| lui      | rt,imm                 | Load Upper Imm.                      | rt = imm << 16                                  | I    | f        |
| lb       | rt,imm(rs)             | Load Byte                            | rt = SignExt(M1[rs + imm±])                     | I    | 20       |
| lbu      | rt,imm(rs)             | Load Byte Unsigned                   | rt = M1[rs + imm±] & 0xFF                       | I    | 24       |
| lh       | rt,imm(rs)             | Load Half                            | rt = SignExt(M2[rs + imm±])                     | I    | 21       |
| lhu      | rt,imm(rs)             | Load Half Unsigned                   | rt = M2[rs + imm±] & 0xFFFF                     | I    | 25       |
| lw       | rt,imm(rs)             | Load Word                            | rt = M4[rs + imm±]                              | I    | 23       |
| sb       | rt,imm(rs)             | Store Byte                           | M1[rs + imm±] = rt                              | I    | 28       |
| sh       | rt,imm(rs)             | Store Half                           | M2[rs + imm±] = rt                              | I    | 29       |
| sw       | rt,imm(rs)             | Store Word                           | M4[rs + imm±] = rt                              | I    | 2b       |

> **Note**: Using `mult`
> - Multiplying two number requires two instructions, one to multiply (`mult`), another to read the multiplication result from the `HI` or `LO` register (`mfhi` *or* `mflo`).
>	- If the resulting number doesn't overflow (is less than 32-bits), you can use `mflo` to get it from the `LO` register.
> 
> **What `hi` and `lo` contain**:
> - `lo`: Contains `rs / rt`
> - `hi`: Contains `rs % rt`
> 
> ```mips
> 	li 	$t1, 2
> 	# A: Multiplies t0 and t1
> 	mult	$t0, $t1
> 	mflo	$t0
> 	# B: Same thing, using mul
> 	mul	$t0, $t0, $t1
> ```

<!--
TODO
| Pseudo | Operands | Instruction | Register Transfer |
|--------|----------|-------------|-------------------|
|        |          |             |                   |

## Pseudo-Instructions

<!--
TODO
-->

> **Note**: `move` v.s. `li`
> - `move` moves the value of one register into another, `li` puts an immediate value directly into a register.
-->

## Instruction Formats

### R-Format

| Name | `op` | `rs` | `rt` | `rd` | `shamt` | `funct` |
|------|------|------|------|------|---------|---------|
| Bits | 6    | 5    | 5    | 5    | 5       | 6       |

- `op`: Opcode
- `rs`: First source register number
- `rt`: Second source register number
- `rd`: Destination register number
- `shamt`: Shift amount 
	* `00000` for now
- `funct`: Function code
	* extends opcode

### J-Format

| Name | `op` | `rs` | `rt` | `imm` |
|------|------|------|------|-------|
| Bits | 6    | 5    | 5    | 16    |

- `op`: Opcode
- `rs`: First source register number
- `rt`: Second source register number
- `imm`: Immediate value

### I-Format

| Name | `op` | `addr` |
|------|------|--------|
| Bits | 6    | 26     |

- `op`: Opcode
- `addr`: Address (of a label).
	- The 26 bits are achieved by dropping the high-order 4 bits of the address and the low-order 2 bits (which would always be 00, since addresses are always divisible by 4). 

# Encoding & Decoding Instructions

> **Related Notes**: [Hexadecimal, Number Systems (CS2640)](https://inevitabby.gitlab.io/notes/cs2640/02%20-%20Number%20Systems%20and%20Conversions.html#hexadecimal)

> **Example**: Encoding an assembly instruction into hexadecimal
> ```mips
> add	$t0, $t1, $t2
> ```
> 
> **Converting Registers to Binary**:
> `$t0`: 01000 (rd)
> - (Register 8)
> `$t1`: 01001 (rs)
> - (Register 9)
> `$t2`: 01010 (rt)
> - (Register 10)
> 
> **According to the reference table, opcode and func is `0/32`, therefore:**
> - The opcode is `000000`
> - The func is `1000000`
> 
> **As this isn't a shift instruction, `shamt` is 000000.**
> 
> Putting it all together:
> $$
> \begin{aligned}
> 	\text{R-Format: }& \text{op $+$ rs $+$ rt $+$ rd $+$ shamt $+$ funct} \\
> 	\text{Binary: }& 0000 0001 0010 1010 0100 0000 0010 0000 \\
> 	\text{Hexadecimal: }& 012A4020
> \end{aligned}
> $$

> **Example**: Decoding hexadecimal into an assembly instruction
> $$
> \begin{aligned}
> 	\text{Hexadecimal: }& 012A4020 \\
> 	\text{First Six Binary Digits: }& 0000 00 \\
> 	\text{Last Six Binary Digits: }& 10 0000 \\
> \end{aligned}
> $$
> - So we know `op` is 0
> - So we know `funct` is 32
> 
> Now that we know the `op/fn`, we know the type and command, and can convert the rest of the hexadecimal into binary and convert the rest.

# MIPS Assembly

**Assembly Line Format:**
`[ label: ] opcode [ operand(s) ]`{.mips}
- Every instruction must be in a single line.
- You can comment with `#`

## Arithmetic Operations

> **Design Principle 1**: Simplicity favors regularity.
> 1. Regularity makes implementation simpler
> 2. Simplicity enables higher performance at lower cost.

**Arithmetic Operations**: Have three operands.
- Two sources and one destination
- [All arithmetic operations have this form.]{.underline}

> **Example**: Arithmetic Operations
> ```mips
> # a <- b + c
> add a,b,c 
> ```

> **Example**: Arithmetic in C and MIPS
> ```c
> f = (g + h) - (i + j)
> ```
> 
> ```mips
> # t0 <- g + h
> add $t0,$s1,$s2
> # t1 <- i + j
> add $t1,$s3,$s4
> # f <- t0 - t1
> sub f,$t0,$t1
> ```
> - Note how we have to handle the order of operations ourselves *and* split equations into smaller terms.

## Register Operands

> **Design Principle 2**: Smaller is faster

> **Anchor Link**: [Register Set Reference](#register-set)

Arithmetic instructions use register operands.

MIPS has a 32 $\times$ 32-bit register file.
- Used for frequently-accessed data.
- Numbered 0—31
- **Word**: Group of 32 bits (4 bytes)
	* Beginning of the word must be a multiple of four.

**Assembler Names**:
- $\$t0$—$\$t9$: Temporary Values
- $\$s0$—$\$s7$: Saved variables


## Labels and Main

**Label**: Symbolic name for a memory address. Can be instruction or data.
- Program executions begins at the location label `main`.

```mips
      .text
main:	add	$t2,$t0,$t1
```

## SPIM Segments and Linker Directives

**Segment**: Logical part of code that translates to a specific memory location.

| Name      | Parameters | Description                       |
|-----------|------------|-----------------------------------|
| `.data`   | *addr*     | Data segment.                     |
| `.text`   | *addr*     | Text segment.                     |
| `.kdata`  | *addr*     | Kernel data segment.              |
| `.ktext`  | *addr*     | Kernel text segment.              |
| `.extern` | *sym size* | Declare as global label *sym*     |
| `.globl`  | *sym*      | Declare as global the label *sym* |

### Using `.word`

Use the `lw` (load word) command to load a value from a word into a register.

Use the `sw` (store word) command to load a value from a register back into a word.

**Example**: Loading a word into a register
```mips
	.data
sumIs:	.asciiz	"The sum is "
value1:	.word	15
value2:	.word	25
sum:	.word	0
	.text
main:
	lw	$t0, value1
	lw	$t1, value2
	# Print string
	la	$a0, sumIs
	li	$v0, 4
	syscall
	# Add integers and store in sum
	add	$t2, $t0, $t1
	sw	$t2, sum
	# Print result
	lw	$v0, sum
	li	$v0, 1
	syscall
	# Exit
	li	$v0, 10
	syscall
```

## SPIM Data Directives

**Directives**: Tell the assembler how to organize data.

```mips
      .data
      .word	n	# 32-bit
      .byte	nn	# 8 bit
      .ascii	'?'	# ASCII string
      .asciiz	"$$$"	# zero-terminated ASCII string
      .half	n	# 16-bit
      .space	n	# n bytes
```

**Example**: Using a label.
```mips
count:	.word	0
	.word	.word	1,2,3
```
- To get to the second line, we can just jump to `count+4`.

**Example**: .text
```mips
	.text
main:	li	$t0,10
	li	$t1,20
	add	$a0,$t0,$t1
```
- `li`: Load immediate. Is a pseudo-instruction.
	- The assembler will turn `li	$t0,10` into `addi $t0,$zero,$t0`

## SPIM Syscalls

**Syscall**: Special instruction that interfaces with the I/O subsystem.
- SPIM provides a small set of operating-system-like services throug hthe MIPS system call instruction.

| Services       | System Call Code | Arguments                                     | Result                     |
|----------------|------------------|-----------------------------------------------|----------------------------|
| `print_int`    | 1                | $a0=integer                                   |                            |
| `print_float`  | 2                | $f12=float                                    |                            |
| `print_double` | 3                | $f12=double                                   |                            |
| `print_string` | 4                | $a0=string                                    |                            |
| `read_int`     | 5                |                                               | integer (in $v0)           |
| `read_float`   | 6                |                                               | float (in $f0)             |
| `read_double`  | 7                |                                               | double (in $f0)            |
| `read_string`  | 8                | $a0=buffer,\$a1=length                        |                            |
| `sbrk`         | 9                | $a0=amount                                    | address (in $v0)           |
| `exit`         | 10               |                                               |                            |
| `print_char`   | 11               | $a0=char                                      |                            |
| `read_char`    | 12               |                                               | char (in $a0)              |
| `open`         | 13               | $a0=filename (string), \$a1=flags, \$a2=mode  | file descriptor (in $a0)   |
| `read`         | 14               | $a0=file descriptor, \$a1=buffer, \$a2=length | num chars read (in $a0)    |
| `write`        | 15               | $a0=file descriptor, \$a1=buffer, \$a2=length | num chars written (in $a0) |
| `close?`       | 16               | $a0=file descriptor                           |                            |
| `exit2`        | 17               | $a0=result                                    |                            |

> **Note**: More on some syscalls
> - **print_int**: Passes an integer and prints it on the console.
> - **print_float**: Prints a single floating point number.
> - **print_double**: Prints a double precision number.
> - **print_string**: Passes a pointer to a null-terminated string. 
> - **read_int**, **read_float**, **read_double**: Read an entire line of input up to and including a newline.
> - **read_string**: Same semantics as the UNIX library routine `fgets`.
> 	- Reads up to `n-1` characters into a buffer and terminates the string with a null byte.
> 		If there are fewer characters on the current line, it reads through the newline and again null-terminates the string.
> - **sbrk**: returns a pointer to a block of memory containing $n$ additional bytes
> - **exit**:  stops program execution

> **Example**: Using some syscalls
> ```mips
>       .data
> str:  .asciiz	"Enter an integer to double: "
> 
>       .text
> main:
>       # Print a string (syscall 4)
>       la	$a0, str # Put address to the string in $a0
>       li	$v0, 4
>       syscall
>       # Read an integer (syscall 5)
>       li 	$v0, 5
>       syscall
>       move	$t0, $v0 # Now move the number from $v0 to $t0 
>       # Double user's integer
>       li 	$t1, 2
>       mult	$t0, $t1
>       mflo	$t0
>       # Print the resulting integer (syscall 5)
>       move	$a0, $t0
>       li	$v0, 1
>       syscall
>       # Exit Program
>       li	$v0, 10
>       syscall
> # End of program
> ```

# Template 

```mips
# This program does nothing and exits gracefully.
	.text
main:
	li	$v0, 10
	syscall
# The end
```

> **Example**: Adding two numbers
> ```mips
> 	.data
> sumIs:	.asciiz	"The sum is "
> 	.text
> main:
> 	li	$t0, 15
> 	li	$t1, 25
> 	# Print string
> 	la	$a0, sumIs
> 	li	$v0, 4
> 	syscall
> 	# Add integers and print to console
> 	add	$a0, $t0, $t1
> 	li	$v0, 1
> 	syscall
>	# Print newline
> 	li	$a0, '\n'
> 	li	$v0, 11
> 	syscall
> 	# Exit
> 	li	$v0, 10
> 	syscall
> ```

> **Important**: Don't forget to print a newline character before exiting the program!

# Branched Statements

```mips
beq	rt, r, label
bne	rd, rs, label
```

- Branching to a non-existent label will result in a runtime error.
- To turn an if statement into a branched statement, we need to flip the condition.
	- Besides reducing the number of jumps necessary for a simple `if` statement, it also maintains the order of `if` and `else` in the code.

> **Important**: We will **not** be using the jump instruction.

> **Example**: Basic if in C v.s. MIPS
> 1. C
> ```c
> if (a != o) {
> 	// Do output
> }
> ```
> 
> 2. MIPS
> ```mips
>       # If zero, jump to the endif label
>       beqz      $t0, endif
>       # Do output
> endif:
> ```

> **Example**: Basic if in C v.s. MIPS
> 1. C
> ```c
> if (t0 < 10) {
> 	// Do output
> }
> ```
> 
> 2. MIPS
> ```mips
> 	# If zero, jump to the endif label
> 	bge	$t0, 10, endif
> 	# Do output
> endif:
> ```

> **Guideline**: To work with multiple `endif` labels, will just add a number to the end (e.g., `endif0:`, `endif1:`, etc.)

> **Example**: Branched if in C v.s. MIPS
> 1. C
> ```c
> if (t0 < 10) {
> 	// output 1
> } else {
> 	// output 2
> }
> ```
> 
> 2. MIPS
> ```mips
>       bge      $t0, 10, else
>       # output 1
>       b endif
> else:
>       # output 2
> endif:
> ```

## While Loop

To loop, we'll use a register to control the loop

> **Example**: A while statement
> ```mips
>        .data
> hello: .asciiz "hello\n"
>        .text
> main:
>        li      $t0, 1 # Initialize loop control register
> while: bgt     $t0, 10, endw # While loop
>        la      $a0, hello
>        li      $v0, 4
>        syscall
>        addi    $t0, 1 # increment loop control register
>        b       while
> endw:  li      $v0, 10 # End of while loop
>        syscall
> # end of program
> ```

> **Example**: Nesting an if statement inside a while statement
> ```mips
>        .data
> hello: .asciiz "hello\n"
>        .text
> main:
>        li      $t0, 1 # Initialize loop control register
> while: bgt     $t0, 10, endw # While loop
>        
>        # Print loop counter variable if it is less than 5
>        bge     $t0, 5, endif
>        move    $a0, $t0
>        li      $v0, 1
>        syscall
> endif:
>        
>        la      $a0, hello
>        li      $v0, 4
>        syscall
>        addi    $t0, 1 # increment loop control register
>        b       while
> endw:  li      $v0, 10 # End of while loop
>        syscall
> # end of program
> ```

