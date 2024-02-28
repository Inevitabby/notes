# Bit Shifts (Multiplication and Division by $2^n$)

## A. Left Shift

**Left Shift**: Shifting left $n$-bits multiplies the number by $2^n$
* (Usually denoted by $<<$)

> **Example**: Left shift one bit
> $$
> 0001 << 1 = 0010
> $$

## B. Logical Shift

**Logical Shift**: Shifting right $n$-bits divides the *unsigned* number by $2^n$
- Puts zero on the left
	* For unsigned values
- e.g., $1000 \to \text{Logical Shift Right} \to 0100$
- (Usually denoted by $>>>$)

> **Example**: Logical shift one bit
> $$
> 1000 >>> 1 = 0100
> $$

## C. Arithmetic Shift

**Arithmetic Shift**: Shifting right $n$-bits divides the *signed* number by $2^n$
- Replicates the MSBit on the left
	* For signed values
- e.g., $1000 \to \text{Arithmetic Shift Right} \to 1100$
- (Usually denoted by $>>$)

> **Example**: Arithmetic shift one bit
> $$
> 1000 >> 1 = 1100
> $$

# Sign Extension

## Introduction

**Q**: In the decimal system, we can denote sign by using the `+` and `-` symbol (e.g., `+5`, `-5`). How can we do the same for binary?
	* A: Let the MSBit (aka: signed bit) denote whether the number is positive or negative.
		+ `0`: Positive number
		+ `1`: Negative number

There are two ways to denote sign extension in binary:

## A. One's Complement

**One's Complement**:
- Older standard.

**How-to Make a Value Negative in One's Complement:**
- Apply `NOT` to every bit.

> **Example**: Creating a negative number in one's complement
> $$
> 0101_2 = +5_{10} \\
> \text{(Flip every bit)} \\
> 1010_2 = -5_{10}
> $$

> **Issues with Ones's Complement**:
> 1. Two Representations of 0
>	- Does $1000_2$ represent $-0_{10}$ or $8_{10}$?
>	- This is a problem for hardware engineers.
> 2. Carry Bit
>	- When adding one's complement integers you need to handle the carry bit.

> **Example**: Carry Bit (adding one's complement integers)
> 
> - Suppose we can to do $7_{10} - 3_{10}$ in binary with one's complement.
> 	* $7_{10} = 0111_{2}$, and
> 	* $3_{10} = 0011_{2}$, therefore $-3_{10} = 1100_{2}$
> 
> - Our workspace now looks like this:
> 
> $$
> \begin{aligned}
> 	&0111 \\
> 	+&1100
> \end{aligned}
> $$
> 
> - Performing binary addition, we get this:
> 
> $$
> \begin{aligned}
> 	&0111 \\
> 	+&1100 \\
> 	=&0011 \\
> \end{aligned}
> $$
> - However, we have one bit overflowing after the addition (carry bit), which we need to add back into our result like so to get the final answer:
> 
> $$
> \begin{aligned}
> 	&0011 +1 \\
> 	&=0100
> \end{aligned}
> $$

## B. Two's Complement

**Two's Complement**:
- Modern standard.
- Must specify number of bits
- Sign and magnitude aren't clearly separate bits.

**How-to Make a Value Negative in Two's Complement:**
- Apply `NOT` on every bit, then `+1`

> **Example**: Creating a negative number in two's complement
> $$
> 0101_2 = +5_{10} \\
> \text{(Flip every bit, +1)} \\
> 1011_2 = -5_{10}
> $$

> **Issues with Two's Complement**: We have one more negative value than positive values.
> - E.g., In nibble (4 bits), the range of possible numbers is $[-8_{10}. 7_{10}]$, you can't represent $8_{10}$ with a nibble in two's complement.

> **Shortcut for Finding 2's Complement**:
> $$
> \text{Given: } 11100110
> $$
> 1. We can tell from the MSBit that this is a negative number.
> 2. The shortcut: Flip all bits left of the rightmost `1` bit.
> $$
> (\textcolor{green}{111001})'10 \\
> \textcolor{green}{000110}10
> $$
> 3. Now, to find the magnitude we just convert $11010_2$ to decimal.
> $$
> 11010_2 = 26_{10}
> $$
> 4. Therefore, the signed 8-bit 2's complement binary string of $11100110$ is equal to $-26$ in decimal.
>
> > **Note**: Do this in reverse to convert a binary number to 2's complement.
> >	- Basically write it unsigned, then flip everything left of the rightmost `1` .

> **Sign Extension**:
> - Suppose you want to turn expand an 8-bit 2's complement binary number into 16-bits.
>	- You'll need to copy the MSBit like so (arithmetic shift):
> $$
> 11100110 = 11111111 11100110
> $$

# Bit Masking (Odd/Even)

**Odd or Even**: Mask LSBit
- 1 = Odd
- 0 = Even

> **How-to Mask the LSBit**
> - Q: How do we turn `1011` into the LSBit (`0001`)?
>	- A: Use boolean logic ($\land$) to mask the LSBit!
>	$$1011 \land 0001 = 1$$

# Binary Addition (2's Complement)

> **Note**: The binary numbers are signed 2's complement

$$
\text{Problem: } 5 - 10
$$

Binary Solution:
$$
\begin{aligned}
&0000 0101 \text{ (5)} \\
+ &1111 0110 \text{ (-10)} \\
= &1111 1011 \text{ (-5)}
\end{aligned}
$$

# Binary Subtraction

- **Signed Add**: Performs addition and catches overflow.
- **Unsigned Add**: Performs addition and ignores any overflow.

# Tangent: Keeping Track of Time

In UNIX, time is tracked as the number of milliseconds since 00:00:00 Jan 1, 1970 GMT (Greenwich Mean Time) / UTC (Universal Time Code).
- The counter increments by one every millisecond.
- After $2^32$ milliseconds, integer overflow will occur if the time is being stored on 32 bits.
	* This is approximately 2038.

## UNIX File Dates

1. Creation Date
2. Access Date
3. Modify Date
	- This is important for taking incremental backups.
	- DOS has the ADate (Archive Date) bit.
	- Used by `make` and other developer utilities.

## DOS File Dates

**Total: 16 Bits**
- Last 5 Bits: Day of Month
- Middle 4 Bits: Month
- First 7 Bits: Year
	* Measured in distance from 1970.

> **Note**: NTFS file system now stores dates as a 32-bit/64-bit timestamp.

> **Example**: Masking for various parts of DOS date format
$$
\begin{aligned}
	\text{DOS File Date} &\land 1F = \text{Day of Month} \\
	\text{DOS File Date Shifted Right 5 Bits} &\land 1EO = \text{Day of Month}
\end{aligned}
$$


