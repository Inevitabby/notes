---
title: "Logic Gates"
---

# Buffer

**Buffer**: Anything you put in, you get out.
- Normally used to amplify something.

| In | Out |
|----|-----|
| 0  | 0   |
| 1  | 1   |


# NOT (Inverter)

| In | Out |
|----|-----|
| 0  | 1   |
| 1  | 0   |

**NOT**: Flip the signal.

# AND & OR

**AND**: If both are 1, return 1; otherwise return 0.
- The minimum of inputs.

| A | B | Out |
|---|---|-----|
| 0 | 0 | 0   |
| 0 | 1 | 0   |
| 1 | 0 | 0   |
| 1 | 1 | 1   |

**OR**: Inclusive OR
- The maximum of inputs.

| A | B | Out |
|---|---|-----|
| 0 | 0 | 0   |
| 0 | 1 | 1   |
| 1 | 0 | 1   |
| 1 | 1 | 1   |

# NAND & NOR

**NAND**: NOT AND
- You can create all basic gates out of NAND.

| A | B | Out |
|---|---|-----|
| 0 | 0 | 1   |
| 0 | 1 | 1   |
| 1 | 0 | 1   |
| 1 | 1 | 0   |

**NOR**: NOT OR
- You can create all basic gates out of NOR.

| A | B | Out |
|---|---|-----|
| 0 | 0 | 1   |
| 0 | 1 | 0   |
| 1 | 0 | 0   |
| 1 | 1 | 0   |

# XOR & XNOR

XOR: Exclusive OR

| A | B | Out |
|---|---|-----|
| 0 | 0 | 0   |
| 0 | 1 | 1   |
| 1 | 0 | 1   |
| 1 | 1 | 0   |

XNOR: Exclusive NOR

| A | B | Out |
|---|---|-----|
| 0 | 0 | 1   |
| 0 | 1 | 0   |
| 1 | 0 | 0   |
| 1 | 1 | 1   |

# Universal/Complete Gates

## NAND

1. NOT: Connect both inputs together to create a NOT gate.
2. OR: Create two NOT gates out of NAND gates, run A, and B into their own NOT, and run that into a NAND.
