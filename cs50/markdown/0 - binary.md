# Binary, Bits, & Bytes

- Computers speak in binary
- Bits: 0s and 1s
	* etym: "binary digits"
- Example: Counting past 0 (binary $\to$ decimal)
	* `000` $\to$ 0
	* `001` $\to$ 1
	* `010` $\to$ 2
	* `011` $\to$ 3
	* `100` $\to$ 4
	* `101` $\to$ 5
	* etc.
- Most computers use 8 bits at a time.

## Why Binary?

Physically, it's easier to either store some electricity or not store some electricity in some switches or transistors, so binary bits are a natural solution

## Example: Representing `123` in Binary & Decimal

In decimal form, representing `123` can be done by splitting it into the hundreds, tens, and one's place; like this:

| 100  | 10    | 1     |
| :--: | :---: | :---: |
| 1    | 2     | 3     |

In binary, representing `123` can be done by splitting it into $2^n$ bits; like this:

| $2^6$ | $2^5$ | $2^4$ | $2^3$ | $2^2$ | $2^1$ | $2^0$ |
| :--:  | :---: | :---: | :--:  | :---: | :---: | :---: |
| 1     | 1     | 1     | 1     | 0     | 1     | 1     |

