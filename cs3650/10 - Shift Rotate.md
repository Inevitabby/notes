---
title: "Shift Rotate"
---

# Shift Right

![](.images/doodle_55.png)

| D3 | D2 | D1 | D0 |
|----|----|----|----|

Every clock pulse, the data will shifted one bit.

1. 1-bit shift right

| 0 | D2 | D1 | D0 |
|---|----|----|----|

2. 2-bit shift right

| 0 | 0 | D1 | D0 |
|---|---|----|----|

3. 3-bit shift right

| 0 | 0 | 0 | D0 |
|---|---|---|----|

4. 4-bit shift right

| 0 | 0 | 0 | 0 |
|---|---|---|---|

Behavior:
- Shifting `1000` right divides it by 2.

# Shift Left

Read the D lines from the above in reverse

Behavior:
- Shifting `0001` right multiplies it by 2.

# Rotate Right

![](.images/doodle_57.png)

1. 1-bit rotate right

| D0 | D3 | D2 | D1 |
|----|----|----|----|

2. 2-bit rotate right

| D0 | D1 | D3 | D2 |
|----|----|----|----|

3. 3-bit rotate right

| D2 | D0 | D1 | D3 |
|----|----|----|----|

4. 4-bit rotate right

| D3 | D2 | D1 | D0 |
|----|----|----|----|

Behavior: 
- LIFO behavior of a stack.

# Rotate Left

You get the drill, just use the same circuit but read different D inputs right-to-left.

# Example: How-to Copy A to B?

| A3 | A2 | A1 | A0 |
|----|----|----|----|

| B3 | B2 | B1 | B0 |
|----|----|----|----|

![](.images/doodle_58.png)
- Use a shift right and rotate to slowly copy the contents of A into B. After 4 clock pulses the copy will be completed.

# Examples: Commands

Suppose this 5-address instruction command does R1 <- R2 + R3:

| Operation | Operand 1 | Operand 2 | Operand 3 | Next Instruction Address |
|-----------|-----------|-----------|-----------|--------------------------|
| ADD       | R1        | R2        | R3        | 0x1234                   |

One optimization is to have the next instruction address stored in its own register.

This is a 4-address instruction command that does R1 <- R2 + R3:

| Operation | Operand 1 | Operand 2 | Operand 3 |
|-----------|-----------|-----------|-----------|
| ADD       | R1        | R2        | R3        |

How about another reduction? This one will do R1 <- R1 + R2

| Operation | Operand 1 | Operand 2 |
|-----------|-----------|-----------|
| ADD       | R1        | R2        |

If we use a default register like ACC (Accumulator), we can do two-address: ACC <- R1 + ACC

| Operation | Operand 1 |
|-----------|-----------|
| ADD       | R1        |

JVM does the extreme, using a stack to make a zero-address language.

| Operation |
|-----------|
| ADD       |

