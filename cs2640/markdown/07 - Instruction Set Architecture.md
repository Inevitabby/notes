# Instruction Set Architecture

**Instruction Set Architecture**: The machine language the CPU implements.
- Abstract model of a computer
- Implementations vary in performance, price, size, etc.
	* e.g., i9 costs more than Celeron.
- *"Everything you need to know to program a computer"*
	* For us, assembly language programmers, we care about the registers and operations.

> **Note**: What you need to know to program a computer
> - Built-in data types (integers, floating points)
> - Fixed set of instructions
> 	* MIPS instructions are 4-bytes.
> - Fixed set of registers
> 	* MIPS has 32 registers.
> - Interface for accessing memory
> - I/O Model

# Machine Instructions

**Machine Instruction**: A program instruction.
- Made of the following parts (fields):
	* **Opcode Field**: Specifies operation to be performed
	* **Address Fields**: Memory *or* register address.
		+ Each machine instruction can have one or more.
		+ Register Address: Register's number.
	* **Mode Field**: Specifies the way the address field is to be interpreted.

$$
\text{Machine Instruction} = 
\text{Opcode} +
\text{Address Fields}
$$

**Special Instruction Fields**:
- Other special fields are sometimes employed under certain circumstances.

# General Purpose Registers (GPR)

**Register File**: Consists of all registers in the CPU that are accessible to the programmer.
- MIPS has 32 REGs, labelled `$0` — `$31`
	* Anything prefixed with a `$` in MIPS is a memory address.
- We use these registers to carry out operations.

# One, Two Three-Address Machines

- The address fields of an instruction may consist of 1—3 memory *or* register addresses.
	* If all address fields are register addresses, we call the machine 1-, 2-, or 3-register address machine.
	* If all address fields are memory addresses, we call the machine 1-, 2-, or 3-memory address machine.
- For 1- and 3- address machines, the address fields may include both register and memory addresses.
	* We call the machine 2 or 3-register-memory address machine

> **Example**:
> - The JVM is a 0-address machine because it uses a stack.
> - MIPS is a 3-address machine.

> **Example**: Three-memory address machine
```assembly
# Goal: X = (A+B)(C+D)
ADD T1,A,B # M[T1} <- M[A] + M[B]
ADD T2,C,D # M[T2} <- M[C] + M[D]
MUL X,T1,T2 # M[X] <- M[T1] * M[T2]
```
- We need to break complex expressions down, handling the order of operations ourselves.

> **Example**: Two-memory address machine
> ```assembly
> # Goal: X = (A+B)(C+D)
> MOVE T1,A # M[T1] <- M[A]
> ADD T1,B # M[T1] <- M[T1] + M[B]
> MOVE X,C # M[X] <- M[C]
> ADD X,D # M[X] <- M[X] + M[D]
> MUL X,T1 # M[X] <- M[X] * M[T1]
> ```
> - Basically, we have to finagle with the 

> **Example**: One-memory address machine
> ```assembly
> # Goal: X = (A+B)(C+D)
> LD A # ACC <- M[A]
> ADD B # ACC <- ACC + M[B]
> ST X # M[X] <- ACC
> LD C # ACC <- M[C]
> ADD D # ACC <- ACC + M[D]
> MUL X # ACCC <- ACC + M[X]
> ST X # M[X] <- ACC
> ```

> **Example**: Zero-memory address machine
> ```assembly
> # Goal: X = (A+B)(C+D)
> PUSH A # TOS <- M[A]
> PUSH B # TOS <- M[B]
> ADD # TOS <- TOS + TOS-1
> PUSH C # TOS <- M[C]
> PUSH D # TOS <- M[D]
> ADD # TOS <- TOS + TOS-1
> MUL # TOS <- TOS * TOS-1
> POP X # M[X] <- TOS
> ```

> **Example**: 3-Memory-Register Address Machine with Two Registers
> ```assembly
> # Goal: X = (A+B)(C+D)
> ADD R1,A,B # R1 <- M[A] + M[B]
> ADD R2,C,D # R2 <- M[C] + M[D]
> MUL X,R1,R2 # M[X] = R1 * R2
> ```

> **Example**: 3-Memory-Register Address Machine with Three Registers
> ```assembly
> LD	R1,A # R1 <- M[A]
> LD	R2,B # R2 <- M[B]
> ADD	R3,R1,R2 # R3 <- R1 + R2
> LD	R1,C # R1 <- M[C]
> LD	R2,D # R2 <- M[D] 
> ADD	R1,R1,R2 # R1 <- R1 + R2
> MUL	R1,R1,R3 # R1 <- R1 * R3
> ST	X,R1 # M[X] <- R1
> ```

# Computing the Number of Memory Accesses

The more memory accesses you do, the slower your code is.

Usually, computing the number of memory accesses is based on the following assumption:
1. Each memory address requires one memory word
2. Opcode, mode, immediate value, number of shifts, and any number of register addresses require only one memory word

**How-To Count Memory Accesses**:
1. Each instruction increments instruction count.
2. Each memory field in the instruction increments instruction count.
	- (Registers don't count)
3. Each read or write increments data count.

| Assembly | Register Transfer Notation | Data | Instruction | Memory Accesses |
|----------|----------------------------|------|-------------|-----------------|

> **Example**: Computing number of memory accesses for a 3-register address machine
> ```assembly
> #			Data	Instruction
> LD R1, A		# 1	2
> LD R2, B		# 1 	2
> ADD R3, R1, R2	# 0 	1
> LD R1, C		# 1 	2
> LD R2, D		# 1 	2
> ADD R1, R1, R2	# 0 	1
> MUL R1, R1, R3	# 0 	1
> ST X, R1		# 1 	2
> ```
> - Total: 5 data + 13 instruction = 18 accesses

> **Example**: Computing number of memory accesses for a 3-register-memory address machine
> ```assembly
> #			Data	Instruction
> ADD R1,A,B		2	3
> ADD R2,C,D		2	3
> MUL X,R1,R2		1	2
> ```
> - Total: 5 data + 8 instruction = 13 accesses


> **Note**: How instructions fit on 32-bit MIPS.
> - There are 32 registers, therefore we need 5 bits to reference each register.
> - However, memory addresses are 32-bits.
> 	* So it simply reads/places the memory address on the next word.
