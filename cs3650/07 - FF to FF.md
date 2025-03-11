---
title: "From Flip-Flop to Flip-Flop"
---

# From Flip-Flop to Flip-Flop

You can convert one type of flip-flop to another by modifying its input logic.

This often involves creating a conversion table and using logic simplification techniques like K-maps to determine the required input connections.

## Example: T to D Flip-Flop

| T | $Q \to Q^+$ | D |
|---|-------------|---|
| 0 | $0 \to 0$   | 0 |
| 0 | $0 \to 1$   | 1 |
| 1 | $1 \to 0$   | 1 |
| 1 | $1 \to 1$   | 0 |

Observation:
- D = Q XOR $Q^+$

## Example: D to T Flip-Flop

| D | $Q \to Q^+$ | T |
|---|-------------|---|
| 0 | $0 \to 0$   | 0 |
| 0 | $1 \to 0$   | 1 |
| 1 | $0 \to 1$   | 1 |
| 1 | $1 \to 1$   | 0 |

Observation:
- T = D XOR Q

## Example: D to JK Flip-Flop

| J | K | $Q \to Q^+$ | D |
|---|---|-------------|---|
| 0 | 0 | $0 \to 0$   | 0 |
| 0 | 0 | $1 \to 1$   | 1 |
| 0 | 1 | $0 \to 0$   | 0 |
| 0 | 1 | $1 \to 0$   | 0 |
| 1 | 0 | $0 \to 1$   | 1 |
| 1 | 0 | $1 \to 1$   | 1 |
| 1 | 1 | $0 \to 1$   | 1 |
| 1 | 1 | $1 \to 0$   | 0 |

Observed Minterms:
- J'K'Q
- JK'Q'
- JK'Q
- JKQ'

Now, let's create a k-map to find a simple answer.

|    | j'k' | j'k | jk | jk' |
|----|------|-----|----|-----|
| q' |      |     | 1  | 1   |
| q  | 1    |     |    | 1   |

![](.images/doodle_41.png)

## Example: T to JK Flip-Flop

| J | K | $Q \to Q^+$ | T |
|---|---|-------------|---|
| 0 | 0 | $0 \to 0$   | 0 |
| 0 | 0 | $1 \to 1$   | 0 |
| 0 | 1 | $0 \to 0$   | 0 |
| 0 | 1 | $1 \to 0$   | 1 |
| 1 | 0 | $0 \to 1$   | 1 |
| 1 | 0 | $1 \to 1$   | 0 |
| 1 | 1 | $0 \to 1$   | 1 |
| 1 | 1 | $1 \to 0$   | 1 |

Minterms:
- J'KQ
- JK'Q'
- JKQ'
- JKQ

|    | j'k' | j'k | jk | jk' |
|----|------|-----|----|-----|
| q' |      |     | 1  | 1   |
| q  |      | 1   | 1  |     |

The maxterms from this k-map are:
- JQ'
- KQ

![](.images/doodle_42.png)

## Example: D to JK Flip-Flop

| D | $Q \to Q^+$ | J | K |
|---|-------------|---|---|
| 0 | $0 \to 0$   | 0 | X |
| 0 | $1 \to 0$   | X | 1 |
| 1 | $0 \to 1$   | 1 | X |
| 1 | $1 \to 1$   | X | 0 |

> **Why? Recall this k-map:**
> 
> | $Q \to Q^+$ | J | K |
> |-------------|---|---|
> | $0 \to 0$   | 0 | 0 |
> |             | 0 | 1 |
> |             | 0 | X |
> | $0 \to 1$   | 1 | 0 |
> |             | 1 | 1 |
> |             | 1 | X |
> | $1 \to 0$   | 0 | 1 |
> |             | 1 | 1 |
> |             | X | 1 |
> | $1 \to 1$   | 0 | 0 |
> |             | 1 | 0 |
> |             | X | 0 |

Observations:
- J = D
- K = D'

![](.images/doodle_43.png)

## Example: JK to T Flip-Flop

| T | $Q \to Q^+$ | J | K |
|---|-------------|---|---|
| 0 | $0 \to 0$   | 0 | X |
| 0 | $1 \to 1$   | X | 0 |
| 1 | $0 \to 1$   | 1 | X |
| 1 | $1 \to 0$   | X | 1 |

- J = T
- K = T
