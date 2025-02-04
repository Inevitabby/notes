---
title: "Approximate Computation"
---

**Why?**: We can approximate calculations to sacrifice accuracy to save time, speed, and power.
- *e.g., search results don't need to be 100% certain, you don't need to play every frame of a video.*

# Approximate Half-Adder

<detail>
<summary>Original</summary>

| A | B | C | S |
|---|---|---|---|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 0 |

</detail>

| A | B | C | S |
|---|---|---|---|
| 0 | 0 | 1 | 0 |
| 0 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 0 |

- C = A XNOR B
- S = A XOR B

# Approximate Half-Adder Minus

<detail>
<summary>Original</summary>

| A | B | C | S |
|---|---|---|---|
| 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 0 |
| 1 | 0 | 0 | 0 |
| 1 | 1 | 0 | 1 |

</detail>

| A | B | C | S |
|---|---|---|---|
| 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 0 |
| 1 | 0 | 0 | 0 |
| 1 | 1 | 1 | 1 |

- C = A XNOR B
- S = A XNOR B

# Approximate Half-Adder Plus

<detail>
<summary>Original</summary>

| A | B | C | S |
|---|---|---|---|
| 0 | 0 | 0 | 1 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 1 | 1 |

</detail>

| A | B | C | S |
|---|---|---|---|
| 0 | 0 | 0 | 1 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |

- C = A XOR B
- S = A XNOR B

# Approximate Half-Adder Minus Minus

<detail>
<summary>Original</summary>

| A | B | C | S |
|---|---|---|---|
| 0 | 0 | 1 | 0 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 0 |

</detail>

| A | B | C | S |
|---|---|---|---|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 0 |

- C = A XOR B
- S = A XOR B


