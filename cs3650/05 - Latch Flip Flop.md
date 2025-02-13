---
title: "Latch and Switch"
---

# Latch

**Latch**: Sequential circuit that watches all inputs continuously and changes its outputs at any time independently of a clocking signal.

**SR-Latch**: Use two inputs and two outputs.
- S: Set
- R: Reset
- Q: Output
	- By convention, used to label output signal from a memory device.
- Q': Output
- **Behavior**: When S is asserted, the output is set to 1 until a reset signal is given.

# Simplest Latch Circuit

The simplest SR Latch can be made with two NOR gates wired together like so:

![](.images/doodle_21.png)

| A (R) | B (S) | Q      | Q'     |
|-------|-------|--------|--------|
| 0     | 0     | MEMORY | MEMORY |
| 0     | 1     | 1      | 0      |
| 1     | 0     | 0      | 1      |
| 1     | 1     | 0      | 0      |

When $S=R=0$, the circuit acts as a memory cell and keeps its previous state.

> **Note**: We don't like it when R=S=1, because it creates a $Q=Q'$ relationship.

# D Latch


