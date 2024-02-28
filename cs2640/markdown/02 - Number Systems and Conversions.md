# Intro

1. **Decimal Number System**: 10 digits (0—9)
2. **Binary Number System**: 2 digits (0—1)
	- Physical voltage-based switches
3. **Octal**
4. **Hexadecimal**

> **Note**: These number systems can represent any value, their hardware can't.
	* 32-bit, 64-bit

# Number Systems

## Decimal

- **Base**: 10
	* aka: radix
- **Digits**: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
- **Positional Notation**: $1234 = 1\times10^3 + 2\times10^2 + 3\times10^1 + 4\times10^0$
	* The position of digits relative to each other determines value.
		- e.g., the "2" in "1234" represents "$2\times10^2$" (200) because of its position relative to the decimal point

> **More on Positional Notation**:
> - Positional notation is important for converting ASCII input into a numeric value, among other things.
> 
> > **Example**: Converting "123" into a decimal number, digit-by-digit
> > $$
> > ((1 \times 10) + 2) \times 10 + 3
> > $$

<!--
> **Note:** Each character in ASCII is 8 bits.
-->

> **Example**: Positional notation with decimal points
> $$
1234.567 = 1 \times 10^3 + 2 \times 10^2 + 3 \times 10^1 + 4 \times 10^0 + 5 \times 10^{-1} + 6 \times 10^{-2} + 7 \times 10^{-3}
> $$

## Binary

- **Base**: 2
- **Digits**: 0, 1
- **Bit (Binary Digit)**: Smallest unit of information.
	* **Nibble**: 4 bits.
- **Byte**: Group of 8 [consecutive]{.underline} bits.
	* [Smallest addressable unit of information]{.underline} in most computers
	* Every byte has an address
	* **Groupings**:
		+ **Word**: 4 consecutive bytes
		+ **Half-Word:** 2 consecutive bytes
		+ **Double-Word**: 8 consecutive bytes

> **More on Bytes**:
> * Anatomy: $b_7 , b_6 , b_5 , b_4 , b_3 , b_2 , b_1 , b_0$
> 	+ **MSBit**: Most significant byte.
> 		+ $b_7$
> 	+ **LSBit**: Least significant byte.
> 		+ $b_0$

> **Range**:
> $$
> \text{Range: } 2^n - 1
> $$
> - e.g., Range of values a byte can store is 0—255 ($2^8 - 1 = 255$)

## Octal

- **Base**: 8
- **Digits**: 0, 1, 2, 3, 4, 5, 6, 7
- **Octal Digit**: Group of 3 consecutive bits.

## Hexadecimal

- **Base**: 16
- **Digits**: 0, 1, 2, ..., 9, A, B, C, D, E, F
- **Hexadecimal Digit**: Group of 4 consecutive bits.
	* Thus, two hexadecimal digits can represent one byte.
- **Notation**: Prefixed with `0x`

# Conversion

## A. Decimal to Binary

**Repeated Division by 2:**
1. Divide the decimal by two. The remainder will be a bit (0 or 1)
2. Do step one again, until we we can no longer divide the decimal.
3. The last remainder is the *most significant bit*, add up the bits in reverse order we derived them.
	- One way to program this is recursion.

## B. Binary to Decimal

**Power Table:**
- $2^n + ... + 2^2 + 2^1 + 2^0$

| Binary | Decimal |
|--------|---------|
| $2^0$    | $1$       |
| $2^1$    | $2$       |
| $2^2$    | $4$       |
| $2^3$    | $8$       |
| $2^4$    | $16$      |
| $2^5$    | $32$      |
| $2^6$    | $64$      |
| $2^7$    | $128$     |
| $2^8$    | $256$     |

## C. Binary to Octal

1. Begin grouping triplets of bits from right-to-left
	+ Pad any trailing starting triplet with 0's
2. Convert each triplet of bits into octal

> **Example**:
> * $10$ $101$ $010_2$ $\to 252_8$

| Binary | Octal |
|--------|-------|
| $000$  | $0$   |
| $001$    | $1$     |
| $010$    | $2$     |
| $011$    | $3$     |
| $100$    | $4$     |
| $101$    | $5$     |
| $110$    | $6$     |
| $111$    | $7$     |

## D. Binary to Hexadecimal

1. Begin groups 4 groups of bits from right-to-left.
	- Pad any trailing starting group with 0s.

**Example**:
- $1010$ $0010_2$ $\to A2_{16}$

# Exercise

| Decimal | Binary    | Octal | Hexadecimal |
|---------|-----------|-------|-------------|
| $33$    |           |       |             |
|         | $1110101$ |       |             |
|         |           | $703$ |             |
|         |           |       | $1AF$       |
