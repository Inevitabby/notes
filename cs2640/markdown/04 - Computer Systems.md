# Computers

**Computer**: Fast electronic calculating machine.
- Accepts digitized input and produces output.

1. **Personal Computer**
	- aka: Microcomputers
	- e.g., Desktop, notebooks, tablets, cellphones
2. **Workstations**
	- More computational power and reliability
	- Intended for individual use
	- Faster and more capable than a personal computer
	- May have error-correcting memory.
		* Much more expensive than normal RAM.
3. **Enterprise Systems (Mainframes) and Servers**
	- Accessible via internet.
	- Much more computing power and storage capacity.
		* Usually, storage is in the petabytes.
4. **Supercomputers**
	- For large-scale numerical calculations.

# Functional Units

**Basic Functional Units of a Computer**:
1. **CPU**
2. **Main Memory**
	- Non-volatile
3. **Input Devices**
4. **Output Devices**
5. **Secondary Storage**
	- Non-volatile
	- e.g., tapes
6. **Buses**
	1. **Address**: Determines how much memory your system can access. 
		- a $n$-bit CPU can generate/hold $2^n$ bytes of memory.
		- Motherboard manufacturers limit this.
			* Nobody is actually going to use 64-bits of memory for the next 10 years.
			* So even if the CPU supports 64-bits, the motherboard may not.
			* Limiting the address bus reduces the complexity of manufacturing.
	2. **Data**
	3. **Control**

$$
	\text{Program Execution: } \\
	\text{Secondary Storage $\to$ Main Memory $\to$ CPU Registers $\to$ Execution}
$$

> Q: Why "Random" in RAM?
> + A: Because it takes the same amount of time to access *any* block of memory.

## More on Main Memory

- **RAM**: Random-Access Memory
	* **DRAM**: Dynamic RAM
		+ Contents degrade over time.
			+ Bits need to be refreshed (read and re-written)
		+ Super fast.
	* **SRAM**: Static RAM
		+ Predecessor to DRAM.
		+ Slower than DRAM.
- **ROM**: Read-Only Memory
- **BIOS ROM**: ROM that stores the BIOS
- **PROM**: Programmable ROM
- **EPROM**: Erasable PROM
	* Resets bits to 0 or 1 when exposed to UV light. 
- **EEPROM**: Erasable PROM that uses electricity.
	* You can't erase parts of the device, only the whole device
	* Most BIOS are stored in EEPROM.
	* aka: Flash memory

## More on Address Bus

| $n$-bit CPU | Can Hold (B) | Aka | Notes                  |
|-------------|--------------|-----|------------------------|
| 16          | $2^{16}$     | 64K | Early microcomputers   |
| 20          | $2^{20}$     | 1MB | Using segmented memory |
| 32          | $2^{32}$     | 4GB |                        |
| 5           | $2^{5}$      | 32B |                        |
| 64          | $2^{64}$     |     |                        |

# Information Handled by a Computer

**Machine Instructions**:
- Govern transfer of information within/between a computer and its I/O devices.
- Specify arithmetic and logic operations to be performed
- **Program**: A collection of machine instructions

**Data**:
- Used as operands by the instructions
- Source program
- Encoded in binary
	* Unicode, ASCII, and other standards assign textual values to binary.
		+ ASCII is a 1-byte character set, it can store $2^8$ (256)
			+ Stores Latin characters.
		+ Unicode is a multi byte character set, it can store $2^{16}$
			+ Stores every character.

> **Example**:
> - When adding two numbers, the two numbers are *data*, the addition is a *machine instruction*.

# Instruction Set Architecture (ISA)

**ISA**: The machine language the CPU implements.
- Built-in data types (integers, floating points)
- Fixed set of instructions
	* MIPS instructions are 4-bytes.
- Fixed set of registers
	* MIPS has 32 registers.
- Interface for accessing memory
- I/O

**Microarchitecture**: The physical architecture of a CPU.
- e.g., MIPS, 8086, ARM, etc.

# Program Execution

$$
\text{Fetch} \to \text{Decode} \to \text{Execute}
$$
1. Fetch the next instruction from memory
	1. Address from program counter $\to$ address bus
	2. Emit read signal $\to$ control bus
	3. Capture the address in address bus and go to the location in memory
	4. Fetch $n$-bytes from the address.
		* In MIPS, this would be 4 bytes, or 32 bits
			+ In MIPS, the address will always be a multiple of four.
			+ In MIPS, the program counter will be incremented by 4 bytes.
				+ Unless you get a jump instruction (e.g., methods, if statements).
	5. Bytes are loaded into the data bus.
2. Decode the instruction
3. Execute the instruction.

> **Note**: The speed of the CPU is usually determined by the bus.
> - The speed of the bus is measured in gigahertz.
>	- Manufacturer determines speed by testing at various speeds (changing clock speed) and finding the one the CPU is most-stable at.
> - The CPU spends most of its time waiting for the bus to transmit data.

**Instruction Cache**: Memory in the CPU that stores $n$ kilobytes of instructions.
- e.g., a 4 kb instruction cache in MIPS can store 1024 instructions.
	- This means you can run 1024 instructions at the speed of the CPU, because you don't need to continuously fetch instructions.

**Data Cache**: Memory in the CPU that stores $n$ kilobytes of data.

> **Note**: More on the Instruction and Data Cache
> - These used to be external, but are now built-into the CPU.
> - Instruction cache used to be modifiable, but modern security practices have cracked-down on this.

# CPU

**CPU**: Electronic circuitry within a computer that carries out the instructions of a computer program by performing the basic arithmetic, logic, controlling, and I/O operations specified by the instructions.

> **Example**: Comparing binary values at the low level
> 
> 1. Add $a$ to the two's complement of $b$.
> - If all bits are zero, then $a=b$
> 	* Set respective status bit
> - If value is positive (MSBit = 0), $a>b$
> 	* Set respective status bit
> - If value is negative (MSBit = 1), $a<b$
> 	* Set respective status bit
> 		+ (Actually achieved just by copying the MSBit to the status bit.)

## Functional Components within the CPU

- **Control Unit (CU)**: Controls all activities in the CPU.
	* Can be controlled by hardware or microcode.
		+ MIPS is controlled by hardware
		+ x86 is controlled by microcode.
- **Arithmetic and Logic Unit (ALU):** Does binary operations.
- **Registers (REGS):** Memory inside the CPU.
	- Two Special Registers in MIPS:
		1. Program Counter
		2. Instruction Register: Stores current instruction being executed.
- 

