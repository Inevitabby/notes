---
title: "Heap"
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

# Representing Complete Binary Tree with an Array

We can use a (partially-filled) array to represent a complete binary tree
- No need to mess around with nodes!

**How-To:**
1. Number nodes in the order in which level-order traversal would visit them.
	- *(Start indexing/counting the nodes at 1.)*
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
> 
> **Steps**:
> 1. Insert the new value in a way to keeps the tree complete
> 2. Check the parent's value. Swap the parent and new node if they don't follow max/min rules.
> 3. Repeat step 2 on the parent node, until you reach the root. (**Reheap**)
> 
> - To insert, you need to be able to find the parent of any node.

> **Note**: Removal
> 

> **Note**: Reheaping the Whole Tree
> 1. Look at the root node and swap it with the smallest/biggest appropriate child to maintain min/max heap.
> 2. Traverse down the tree

> **Note**: Removal
> 
> **Steps**
> 1. Move last node to the position of the node to remove.
> 2. Reheap the whole tree.

> **Growing the Array:** 
> - You can safely expand the array (copy-by-value to a bigger array). You don't need to perform any special operations.

# Priority Queue


