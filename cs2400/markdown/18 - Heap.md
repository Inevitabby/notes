---
title: "Heap ADT"
---

# Heap

> **Related Notes**: [Heap - CS2400](16 - Trees.html#heap-adt)

**Heap**: [Complete binary tree]{.underline} whose nodes contain [comparable]{.underline} objects.

> **Caveat**: Do not confuse this with dynamic memory; we are talking about the heap ADT.

**Two Types of Heaps**:
1. **Maxheap**: Object in node greater than or equal to its descendent objects.
2. **Minheap**: Object in node less than or equal to its descendent objects.
- *(Implementations are exactly the same, only difference is whether you compare with $\le \lor \ge$)*

> **Example**: Maxheap Interface
> ```java
> public interface MaxHeapInterface<T extends Comparable<? super T>> {
> 	void add (T newEntry);
> 	T removeMax();
> 	T getMax();
> 	boolean isEmpty();
> 	int getSize();
> 	void clear();
> }
> ```
> - `T getMax()`{.java} is really just `T getRootData()`{.java} from the `TreeInterface`

> **Priority Queue / FIFO Behavior**: 
> - Suppose you put in the same node ($a$) twice: $a_1$ followed by $a_2$. When you "dequeue", $a_1$ will come out first.

# Representing Complete Binary Tree with Array

We can use an array to represent a complete binary tree
- No need to mess around with nodes!

**How-To:**
1. Number nodes in the order in which level-order traversal would visit them.
2. We locate the children or the parent of any node with a simple computation:

> Node n(index)
> - Parent: $n/2$
> - Left: $2n$
> - Right: $2n+1$

3. Swap values to maintain maxheap/minheap.

<!--
"Given a node, the next two nodes are the left and the right."
-->

> **Note**: Inserting
> - To insert, you need to find the parent.
