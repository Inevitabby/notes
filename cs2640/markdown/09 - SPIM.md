# MIPS Assembly with SPIM

> **SPIM**: MIPS emulator.
> - Executes assembly source programs.
> - Doesn't execute binaries.
> - Not an IDE, write your assembly in an IDE and execute with SPIM.
> - **Link**: [https://spimsimulator.sourceforge.net/](https://spimsimulator.sourceforge.net/)

> **Tip**: View Whitespace
> - `:set list`{.vimscript} to show whitespace in Vim.

# MIPS Instructions

> **Note**: In this class we'll be learning 32-bit MIPS, not 64-bit MIPS.

**MIPS Instructions**:
- Instructions are encoded as 32-bit words
- Small number of formats encoding operation code, register numbers, ...
- Regularity
- Three types of instructions (R, J, I) 
	* Each type is encoded differently.

## Register Set

| Name      | Register  | Usage                       |
|-----------|-----------|-----------------------------|
| `$zero`   | `$0`      | Always 0                    |
| `$at`     | `$1`      | Reserved for assembler use  |
| `$v0`—`$v1` | `$2`—`$3`   | Result values of a function |
| `$a0`—`$a3` | `$4`—`$7`   | Arguments of a function     |
| `$t0`—`$t7` | `$8`—`15`   | Temporary values            |
| `$s0`—`$s7` | `$16`—`$23` | Saved registers             |
| `$t8`—`$t9` | `$24`—`$25` | More temporaries            |
| `$k0`—`$k1` | `$26`—`$27` | Reserved for OS kernel      |
| `$gp`     | `$28`     | Global pointer              |
| `$sp`     | `$29`     | Stack pointer               |
| `$fp`     | `$30`     | Frame pointer               |
| `$ra`     | `$31`     | Return address              |

> **Notes**:
> - `$zero` is a read-only register.
> - `$at` stands for "assembler temporary".
> 	* In general, we can't/won't be using `$at` 
> - Note how we can only return *two* values from a function (`$v0`—`$v1`)

> **Registers**:
> - `$t0`—`$t7`: Reg's 8—15
> - `$t8`—`$t9`: Reg's 24—25
> - `$s0`—`$s7`: Reg's 16—23

## Reference Card

TODO

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

# Encoding & Decoding Instructions

> **Related Notes**: [Hexadecimal, Number Systems (CS2640)](https://inevitabby.codeberg.page/notes/cs2640/02%20-%20Number%20Systems%20and%20Conversions.html#hexadecimal)

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
> **According to the reference table, opcode and func is `0/20`, therefore:**
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
> - So we know `funct` is 20
> 
> Now that we know the `op/fn`, we know the type and command, and can convert the rest of the hexadecimal into binary and convert the rest.
