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
| 1 | $0 \to 1$   | 0 |
| 1 | $1 \to 0$   | 1 |
| 0 | $1 \to 1$   | 1 |

Observation:
- T = Q
