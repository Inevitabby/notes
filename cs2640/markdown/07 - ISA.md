# Instruction Set Architecture (ISA)

**Instruction Set Architecture**: The machine language the CPU implements.
- Abstract model of a computer
- Implementations vary in performance, price, size, etc.
- *"Everything you need to know to program a computer"*
	* For us, assembly programmers, this is the registers and operations.

> **Note**: Everything you need to know to program a computer
> - Built-in data types (integers, floating points)
> - Fixed set of instructions
> 	* e.g., MIPS instructions are 4-bytes.
> - Fixed set of registers
> 	* e.g., MIPS has 32 registers.
> - Interface for accessing memory
> - I/O Model

# Machine Instructions

**Machine Instruction**: An instruction that is executed directly by the CPU.
- Made of the following parts (aka: fields):
	* **Opcode Field**: Specifies operation to be performed
		+ *Etymology: Operation Code*
	* **Address Fields**: Memory *or* register address.
		+ Each machine instruction can have one or more address fields.
		+ *Metaphor: Operands*
	* **Mode Field**: Specifies the way the address field is to be interpreted.

<!--
$$
\text{Machine Instruction} = 
\text{Opcode} +
\text{Address Fields} +
\text{Mode Field}
$$
-->

> **Special Instruction Fields**: Other special fields may be used under certain circumstances.
> - e.g., immediate operands (where the data in the instruction itself).

> **Note**: How instructions fit on 32-bit MIPS.
> - There are 32 registers, therefore we need 5 bits to reference each register.
>	- So is our instruction references 3 registers, that's only 15 bits.
> - However, memory addresses are 32-bits, how do we fit those?
> 	* We simply place them on the next word, and indicate to MIPS that we're giving it a memory address!

# General Purpose Registers (GPR)

**Register File**: Consists of all registers in the CPU that are accessible to the programmer.
- MIPS has 32 REGs, labelled `$0` — `$31`
	* *(Anything prefixed with a `$` in MIPS is a memory address.)*
- We use these registers to carry out operations.

# One, Two Three-Address Machines (Instruction Formats)

**Instruction Formats**: Refer to the way instructions are encoded and represented in machine language.
- Remember, different architectures have different machine languages, and thus different instruction formats!
- The address fields of an instruction may consist of 1, 2, or 3 memory *or* register addresses.

> **Examples**: Instruction formats in the real world
> - The JVM is a 0-address machine, it uses a stack and has no registers.
> - MIPS is a 3-address machine.

**One, Two Three-Address Machines**:
- If all address fields in instructions refer to registers, the CPU is referred to as a 1-, 2-, or 3-register address machine.
- If all address fields in instructions refer to memory addresses, the CPU is referred to as a 1-, 2-, or 3-memory address machine.
- For 1- and 3-address machines, the address fields can include both register and memory addresses.
	- In this case, the machine is called a 2 or 3-register-memory address machine.

> **Note**: Because we are working with registers, we need to break complex expressions down and handle the order of operations ourselves!

# Computing the Number of Memory Accesses

The more memory accesses you do, the slower your code is.

**How-To Count Memory Accesses for One Instruction**:
1. The instruction itself +1 to instruction count.
2. Rewrite in register transfer notation.
	- Each memory read `+1` to instruction count.
	- Each memory read or write `+1` to data count.

> **Note**: Assumptions\
> We (usually) make the following assumptions when computing the number of memory accesses:
> 1. Each memory address requires one memory word
> 2. Opcode, mode, immediate value, number of shifts, and any number of register addresses require only one memory word

> **Example**: Three register-memory address machine with two registers
> 
> | Instruction | RTN          | Data | Instruction |
> |-------------|--------------|------|-------------|
> | ADD R1,A,B  | R1 <- A + B  | 2    | 3           |
> | ADD R2,C,D  | R2 <- C + D  | 2    | 3           |
> | MUL X,R1,R2 | X <- R1 * R2 | 1    | 2           |
> 
> - Total: $5 + 8 = 13$

> **Example**: Three-register address machine with three registers
> 
> | Instruction    | RTN           | Data | Instruction |
> |----------------|---------------|------|-------------|
> | LD R1, A       | R1 <- A       | 1    | 2           |
> | LD R2, B       | R2 <- B       | 1    | 2           |
> | ADD R3, R1, R2 | R3 <- R1 + R2 | 0    | 1           |
> | LD R1, C       | R1 <- C       | 1    | 2           |
> | LD R2, D       | R2 <- D       | 1    | 2           |
> | ADD R1, R1, R2 | R1 <- R1 + R2 | 0    | 1           |
> | MUL R1, R1, R3 | R1 <- R1 * R3 | 0    | 1           |
> | ST X, R1       | X <- R1       | 1    | 2           |
> 
> - Total: $5 + 13 = 18$

> **Example**: Zero-register address machine
> 
> | Instruction | RTN                | Data | Instruction |
> |-------------|--------------------|------|-------------|
> | PUSH A      | TOS <- A           | 1    | 2           |
> | PUSH B      | TOS <- B           | 1    | 2           |
> | ADD         | TOS <- TOS + TOS-1 | 0    | 1           |
> | PUSH C      | TOS <- C           | 1    | 2           |
> | PUSH D      | TOS <- D           | 1    | 2           |
> | ADD         | TOS <- TOS + TOS-1 | 0    | 1           |
> | MUL         | TOS <- TOS * TOS-1 | 0    | 1           |
> | POP X       | X <- TOS           | 1    | 2           |
> 
> - Total: $5 + 13 = 18$
