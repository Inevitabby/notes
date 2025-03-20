---
title: "Synchronous Counter"
---

> Q: What is the problem with async design?
> A: Noise

**Synchronous Counter**: Counter in which the CK input with all the flip-flops uses the same source and produces the output at the same time.

> **Sync v.s. Async Counter**:
> - Async.: Flip-flops are triggered by the output of the preceding flip-flop.
> 	* aka: ripple counter
> - Sync: All flip-flops are triggered simultaneously by a common clock signal.
> 	* This ensures all state changes occur.

> **Example**: 2-bit Synchronous Counter
> ![](.images/doodle_53.png)
> 
> This behaves like a counter (e.g., 00 -> 01 -> 10 -> 11)

