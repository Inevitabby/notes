# Hexadecimal

Uses: `0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F`
- Binary: `0-1`
- Decimal: `0-9`

In hexadecimal, every location is $2^n$ in decimal. `0-F` allows us to represent `0` through `15` in decimal with a single "digit".

`9` in hexadecimal would be:

| $16^n$ | $16^2$ | $16^1$ | $16^0=1$ |
| :---:  | :---:  | :---:  | :---:    |
|        |        |        | 9        |

`10` in hexadecimal would be:

| $16^n$ | $16^2$ | $16^1$ | $16^0=1$ |
| :---:  | :---:  | :---:  | :---:    |
|        |        |        | A        |

`15` in hexadecimal would be:

| $16^n$ | $16^2$ | $16^1$ | $16^0=1$ |
| :---:  | :---:  | :---:  | :---:    |
|        |        |        | F        |

`16` in hexadecimal would be:

| $16^n$ | $16^2$ | $16^1$ | $16^0=1$ |
| :---:  | :---:  | :---:  | :---:    |
|        |        | 1      | 0        |

Since `F` is the highest you can count, the highest you could count with two digits would be `FF`, or $16*F + 1*F = 250 + 15 = 255$.
- This is 50% savings in symbols than using binary.
	* At the end of the day, everything is still stored with bits.
- Useful when you want to treat data in units of `4`

