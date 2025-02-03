---
title: "Logic Gates"
---

# Buffer

![](.images/doodle_00.png)

**Buffer**: Anything you put in, you get out.
- Normally used to amplify something.

| In | Out |
|----|-----|
| 0  | 0   |
| 1  | 1   |


# NOT (Inverter)

![](.images/doodle_01.png)

**NOT**: Flip the signal.

| In | Out |
|----|-----|
| 0  | 1   |
| 1  | 0   |

# AND & OR

![](.images/doodle_02.png)

**AND**: If both are 1, return 1; otherwise return 0.
- Returns the [minimum]{.underline} of inputs.

| A | B | Out |
|---|---|-----|
| 0 | 0 | 0   |
| 0 | 1 | 0   |
| 1 | 0 | 0   |
| 1 | 1 | 1   |

![](.images/doodle_03.png)

**OR**: Inclusive OR
- Returns the [maximum]{.underline} of inputs.

| A | B | Out |
|---|---|-----|
| 0 | 0 | 0   |
| 0 | 1 | 1   |
| 1 | 0 | 1   |
| 1 | 1 | 1   |

# NAND & NOR

![](.images/doodle_04.png)

**NAND**: NOT AND

| A | B | Out |
|---|---|-----|
| 0 | 0 | 1   |
| 0 | 1 | 1   |
| 1 | 0 | 1   |
| 1 | 1 | 0   |

![](.images/doodle_05.png)

**NOR**: NOT OR

| A | B | Out |
|---|---|-----|
| 0 | 0 | 1   |
| 0 | 1 | 0   |
| 1 | 0 | 0   |
| 1 | 1 | 0   |

# XOR & XNOR

![](.images/doodle_06.png)

**XOR**: Exclusive OR
- If number of 1's is odd, return 1.

| A | B | Out |
|---|---|-----|
| 0 | 0 | 0   |
| 0 | 1 | 1   |
| 1 | 0 | 1   |
| 1 | 1 | 0   |

![](.images/doodle_07.png)

**XNOR**: Exclusive NOR
- If number of 1's is odd, return 0.

| A | B | Out |
|---|---|-----|
| 0 | 0 | 1   |
| 0 | 1 | 0   |
| 1 | 0 | 0   |
| 1 | 1 | 1   |

# Universal/Complete Gates

NAND and NOR can create all the basic logic gates.

## NAND

**NOT**:

![](.images/doodle_08.png)

![](.images/doodle_09.png)

**OR**:

![](.images/doodle_10.png)

**AND**:

![](.images/doodle_11.png)

## NOR

**NOT**:

**AND**:

**OR**:

**NAND**:

# Multiplexer (MUX)

**MUX**: Functions like a switchboard.

## 2:1

![](.images/doodle_13.png)

This MUX takes three inputs, a, b, and c. 
- If c is 0, a will be outputted.
- If c is 1, b will be outputted.

| c | out |
|---|-----|
| 0 | a   |
| 1 | b   |

$$
c'a+cb
$$

We can make any basic logic gate with a MUX.

## Example: Creating Logic Gate with a 2:1 MUX

Suppose we want to configure a MUX to give this truth table:

| a | b | out |
|---|---|-----|
| 0 | 0 | 1   |
| 0 | 1 | 1   |
| 1 | 0 | 0   |
| 1 | 1 | 1   |

We want to split the table into two states first. 
- For this example, $a=0$ and $a=1$ is a good split.

| a | b | out |
|---|---|-----|
| 0 | 0 | 1   |
| 0 | 1 | 1   |

| a | b | out |
|---|---|-----|
| 1 | 0 | 0   |
| 1 | 1 | 1   |

Observation: We can immediately see that when $a=0$, **out** is always 1, so we can draw a partial MUX like this:

![](.images/doodle_14.png)

Observation: Looking at the other truth table, we can see that **out** is always $b$ when $a=1$, so we can draw a partial MUX like this:

![](.images/doodle_15.png)

Putting it all together, the final MUX is this:

![](.images/doodle_16.png)

## 4:1

TODO draw a 4:1 MUX

This MUX takes six inputs, a, b, c, d, x, and y

| x | y | out |
|---|---|-----|
| 0 | 0 | a   |
| 0 | 1 | b   |
| 1 | 0 | c   |
| 1 | 1 | d   |

### When and How to Use

## 8:1

TODO draw a 8:1 MUX

| x | y | z | out |
|---|---|---|-----|
| 0 | 0 | 0 | a   |
| 0 | 0 | 1 | b   |
| 0 | 1 | 0 | c   |
| 0 | 1 | 1 | d   |
| 1 | 0 | 0 | e   |
| 1 | 0 | 1 | f   |
| 1 | 1 | 0 | g   |
| 1 | 1 | 1 | h   |
