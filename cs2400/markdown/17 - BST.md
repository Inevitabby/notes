---
title: "Binary Search Tree"
---

# Binary Search Tree

> **Related Notes**: [Trees - CS2400](16 - Trees.html#binary-search-tree)

**Binary Search Tree**: A binary tree where each node's value is:
1. Greater than all nodes in its left subtree, and
2. Less than all nodes in its right subtree. 

> **Limitation**: Unique keys only.

> **Note**: Each node in a BST is the root of another BST.

# Interface

```java
public interface SearchTreeInterface<T extends Comparable<? super T>> extends TreeInterface<T> {
	boolean contains(T anEntry);
	T getEntry(T anEntry);
	T add(T anEntry);
	T remove(T anEntry);
	Iterator<T> getInorderIterator();
}
```

> **Remember**: Inorder traversal is the only traversal that makes sense for BST.

# Duplicate Entries

If any entry $e$ has a duplicate entry $d$, we arbitrarily require that $d$ occur in the right subtree of $e$'s node.

# Search

```
Algorithm bstSearch(tree, needle) {
	if tree is empty
		return false
	else if needle == root
		return true
	else if needle < root
		return bstSearch(tree's left subtree, needle)
	else needle > root
		return bstSearch(tree's right subtree, needle)
}
```

<!--
# Addition

```
Algorithm addEntry(tree, entry) {
	result = null;
	currentNode = tree's root;
	found = false;
	while (! found) {
		if (entry matches currentNode) {
		}
	}
}
```
-->

# Removal

To ensure that the BST is still valid:
1. If the node is a leaf node, removal is trivial.

**Algorithm for Removing a Node that has Two Children:**
1. Find the rightmost node in the node's left subtree (node $R$)
	- *(Just look right until you reach null, don't go left)*
2. Replace the node we want to delete with $R$.
3. Delete the original $R$.

# Efficiency

`add`, `remove`, and `getEntry` are $O(h)$

The most **inefficient tree** will have $O(n)$
- This is a BST where height = $n$

The most **efficient tree** will have $O(\log n)$
- This is the [shortest, full tree]{.underline}


