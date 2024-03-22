---
title: Tree ADT
---

# Tree

**Tree**: Set of nodes connected by edges that indicate the relationships among the nodes.
- Classify data into groups and subgroups.
- Non-linear (hierarchical)
	* *(Bag, stack, queue, and dictionary are linear.)*
- *Metaphor: Family tree, filesystem*

**Two Forms**:
1. Binary
	- Each node can have at most 2 children.
2. General.
	- Each group can have any number of children.

**Terminology**
- **Root**: Top node, has no parents. At level 1.
- **Edge**: Connection between two nodes.
- **Subtree**: Descendants of a node.
- **Leaves**: Nodes with no descendants.
- **Height**: Number of levels in the tree.
	* A tree can be empty.

# Traversal of a Tree

**Traversal**: Process of processing each data item exactly once.
- Traversal can pass through a node without processing it at that moment.
- Order we visited items is not unique.
- Traversing a binary tree is somewhat easy to understand.

In general, to iterate through a tree, we need to use a stack or recursion.

# Binary Trees

**Binary Tree**: Each node can have between 0—2 nodes.
- Children are divided into *left* and *right*.

**Types of Binary Trees**:
- **Full**: All leaf nodes are filled at the *last* level.
	* *e.g., Expression binary tree*
- **Complete**: All leaf nodes at any level are filled from left to right.
- **Not Full and Not Complete**: A tree that is neither full nor complete.

**Height**:
$$
\boxed{
	\text{Height of a Full Binary Tree} = 2^\text{Number of Nodes} - 1
}
$$

## Traversing a Binary Tree
