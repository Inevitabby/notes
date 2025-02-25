---
title: "Latch and Switch"
---

# Latch

**Latch**: Sequential circuit that watches all inputs continuously and changes its outputs at any time independently of a clocking signal.

**SR-Latch** **(Reset-Set Latch)**: Use two inputs and two outputs.
- S: Set
- R: Reset
- Q: Output
- Q': Output
- **Behavior**: When S is asserted, $Q$ is set to 1 until a reset signal is given. 

> On Q': Exists mainly for manufacturers. Not present in dynamic memory.

## Simplest Latch Circuit

The simplest SR Latch can be made with two NOR gates wired together like so:

![](.images/doodle_21.png)

| A (R) | B (S) | Q      | Q'     |
|-------|-------|--------|--------|
| 0     | 0     | MEMORY | MEMORY |
| 0     | 1     | 1      | 0      |
| 1     | 0     | 0      | 1      |
| 1     | 1     | 0      | 0      |

When $S=R=0$, the circuit acts as a memory cell and keeps its previous state.

> **Note**: We don't like it when R=S=1, because it creates a $Q=Q'$ relationship, so some books will say this is not permitted.

> **On Tracing**: Look for inputs that tell you the result in one-shot, e.g.,
> - if a NOR gate gets `1`, it *must* output `0`
> - if a NAND gets a `0`, it *must* output `1`
> - et cetera.

## Flip-Flop

> If the circuit uses a clock, we call it a flip-flop.

**High Level Sensitive Flip Flop (Set-Reset Flip-Flop**): 

![](.images/doodle_30.png)


**Low Level Sensitive Flip Flop (Set-Reset Flip-Flop**): 


# D Latch


