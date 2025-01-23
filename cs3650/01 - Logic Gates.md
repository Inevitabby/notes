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
- If number of 1's is odd, return 1.

| A | B | Out |
|---|---|-----|
| 0 | 0 | 0   |
| 0 | 1 | 1   |
| 1 | 0 | 1   |
| 1 | 1 | 0   |

XNOR: Exclusive NOR
- If number of 1's is odd, return 0.

| A | B | Out |
|---|---|-----|
| 0 | 0 | 1   |
| 0 | 1 | 0   |
| 1 | 0 | 0   |
| 1 | 1 | 1   |

# Universal/Complete Gates

NAND and NOR can create all the basic logic gates.

<!--
## NAND

NOT

OR

AND

NOR

## NOR

NOT

AND

OR

NAND
-->

# Multiplexer (MUX)

This MUX takes three inputs, a, b, and c. 
- If c is 0, a will be outputted.
- If c is 1, b will be outputted.

```
   ___
a-|   |
  |   |-
b-|___|
    |
    c
```

$$
c'a+cb
$$

We can make any basic logic gate with a MUX.
