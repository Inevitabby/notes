# MIPS Self-Study

> **Learning Resource:** [Programmed Introduction to MIPS Assembly Language](https://chortle.ccsu.edu/assemblytutorial/)

# MIPS Programming Model

## Memory Model

**MIPS Memory:** $2^{32}$ bytes
- Each byte has a 32-bit address.
- User programs and data are restricted to the first $2^{31}$ bytes.
	* *(Which means 0x80000000 — 0xFFFFFFFF is off-limits)*

**Memory Operations**: 
- **Load**: Copies a bit pattern from an address in memory into a register.
- **Store**: Copies a bit pattern from a register to an address in memory.

> **More on Memory Operations**:
> - Bits can only be copied in contiguous groups of one, two, four, or eight bytes.
> - Only the address of the first byte of the group is specified in the operation.
> - Bit pattern in the source remains unchanged.

## Memory Layout

