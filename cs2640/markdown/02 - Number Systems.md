# Intro

**Decimal Number System**: 10 digits (0—9)

**Binary Number System**: 2 digits (0—1)
- Physical switches
- There is a physical limitation to size of number stored.
	* 32-bit, 64-bit

# Number Systems

## Decimal

- **Base**: 10
	* aka: radix
- **Digits**: 0, 1, 2, 3, 4, 5, ..., 9
- **Positional Notation**: $1234 = 1\times10^3 + 2\times10^2 + 3\times10^1 + 4\times10^0$

> **Note on Positional Notation**:
> - Positional notation is important for converting ASCII input into a numeric value.
> > **Example**: Converting "123" into a decimal number, digit-by-digit
> > $$
> > ((1\times10) + 2)\times10+3
> > $$

> **Note on ASCII:**
> - ASCII is 8 bits.

## Binary

- **Base**: 2
- **Digits**: 0, 1
- **Bit (Binary Digit)**: Smallest unit of information/
- **Byte**: Group of 8 [consecutive]{.underline} bits.
	* Smallest addressable unit of information in most computers
	* Every byte has an address
	* $b_7 , b_6 , b_5 , b_4 , b_3 , b_2 , b_1 , b_0$
		+ **MSBit**: Most significant byte.
			+ $b_7$
		+ **LSBit**: Least significant byte.
			+ $b_0$
	* **Groupings**:
		+ **Word**: 4 consecutive bytes
		+ **Half-Word:** 2 consecutive bytes
		+ **Double-Word**: 8 consecutive bytes

## Octal

- **Base**: 8
- **Digits**: 0, 1, 2, ..., 7
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
- $1010$ $0010_2$ $\to A2_16$

# Exercise

| Decimal | Binary | Octal | Hexadecimal |
|---------|--------|-------|-------------|
|         |        |       |             |
