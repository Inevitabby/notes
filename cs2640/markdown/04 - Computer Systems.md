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
		+ Unicode is a multibyte character set, it can store $2^{16}$
			+ Stores every character.

> **Example**:
> - When adding two numbers, the two numbers are *data*, the addition is a *machine instruction*.
