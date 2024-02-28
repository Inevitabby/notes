# von Neumann

## Design

**Design**:
- John von Neumann (1945)
- Stored-program computer concept
	* **Instruction and data stored in the same memory**

**Components**:
- Processing Unit
	* Arithmetic Logic Unit (ALU) and Registers
- Control Unit
	* Instruction Register (IR) and Program Counter (PC)
- Memory Unit
	* Data and Instructions
- External Mass Storage
- Input and Output Mechanisms

**Registers**:
- **PC**: Program Counter
	* Address of next instruction to be executed
- **IR**: Instruction Register
	* Current instruction during processing
- **AC**: Accumulator
	* Stores intermediate arithmetic and logic results
- **MAR**: Memory Address Register
	* Stores address of memory to read into the MDR.
		+ (To send data to the MDR you need to send a read signal)
- **MDR**: Memory Data Register
	* Where read data is stored.

> **Note**: MAR and MDR can be referred to as the BIU (Bus Interface Unit)

**System on a Chip (SOC)**: When the CPU and memory unit are on the same silicon. 

**Memory**: - Address and content
- Large array of locations where binary information is stored and fetched

**Buses**: Means by which data is transmitted from one part to another


> **Example**: $C = A + B$
> 
> Suppose we have three locations in memory: $A$, $B$, and $C$.
> 
> Q: How can we do $C = A + B$?
> 
> A: Place $A$ in the MAR, then send the read signal through the address bus.
> - The data will be placed on the data bus, where the data will show up on the MDR.
> 
> In individual steps:
> ```pseudocode
> MAR <- @A
> MR # memory read signal
> MDR <- A
> AC <- MDR
> MAR <- @B
> MR
> MDR <- B
> AC <- MDR
> MAR <- C
> MDR <- AC
> MW
> ```
> 
> In assembly:
> ```assembly
> LD A // The first four lines of the above
> ADD B
> ST C // Store contents of AC in C
> ```

> **Example**: $A = A + B$
> ```assembly
> LD A # Put A in the AC
> ADD B # Add B to the contents of the AC
> ST A # Store contents of AC in A
> ```

# Harvard Architecture

**Biggest Difference**: Instruction and data memory are separate.
- Used for digital signal processing where the bandwidth and speed are needed.
