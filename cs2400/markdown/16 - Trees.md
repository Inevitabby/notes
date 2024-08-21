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
	- Each node can have any number of children.

## Terminology

- **Root**: Top node, has no parents. At level 1.
- **Edge**: Connection between two nodes.
- **Subtree**: Descendants of a node.
- **Leaves**: Nodes with no descendants.
- **Height**: Number of levels in the tree.
	* A tree can be empty.
- **Degree**: The number of children a node has.
	* "Degree of a tree" refers to the maximum degree that can be found in the tree.

# Traversal of a Tree

**Traversal**: Process of processing each node exactly once.
- Traversal can pass through a node without processing it at that moment.
	- We say we are visiting (processing) a node when we do something with the data.
	- We can pass through the same node multiple times, but we won't process it more than once.
- The order we visit items is not unique.

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

> **Importance**: Many things can be represented with binary trees, which can make operations $O \log (n)$

## Traversing a Binary Tree

- Done using recursion
	* Because every node is another binary tree, which makes recursion perfect

**Steps**:
1. Visit the root.
2. Visit all nodes in the root's left subtree.
3. Visit all nodes in the root's right subtree.

**Ways to Traverse a Binary Tree**:
1. **Preorder**: Visit root before we visited root's subtrees.
	- NLR
2. **Inorder**: Visit root between visiting nodes in root's subtrees.
	- LNR
3. **Postorder**: Visit root after visiting nodes in root's subtrees.
	- LRN
4. **Level-Order**: Begin at root and visit nodes one level at a time.

<!--
**Example**: Different Traversals of One Tree

TODO: IMAGE OF RST 24-6

1. **Preorder**: RSUXTVWY
2. **Inorder**: UXSRVTYW
3. **Postorder**: XUSVYWTR
4. **Level-Order**: RSTUVWXY
-->

> **Note**: Given *preorder* and *inorder* traversal, or *postorder* and *inorder* traversal, you can reconstruct the tree.

## Traversing a General Tree

> Note: There is no inorder traversl because there's no concept of left and right.

**Ways to Traverse a General Tree**:
1. **Level-Order**: Begin at root and visit nodes one level at a time.
2. **Preorder**: Visit all parents before children.
3. **Postorder**: Visit all children before parents.

> **Note**: Data Structure for Traversal
> - Preorder: Stack
> - Level-Order: Queue

<!--
> **Example**: Traversal with recursion
```java
void preOrder(root) {
	if (root !== null) {
		// Cannot read professor's handwriting
	}
}
```
-->

# Interface for All Trees

This interface contains basic methods for both tree types:

```java
public interface TreeInterface<T> {
	T getRootData()
	int getHeight();
	int getNumberOfNode();
	boolean isEmpty();
	void clear();
}
```

This interface contains all four iterators:

```java
import java.util.Iterator;
public interface TreeIteratorInterface<T> {
	Iterator<T> getPreorder();
	Iterator<T> getPostorder();
	Iterator<T> getInorder();
	Iterator<T> getLevelOrder();
}
```

## Interface for Binary Tree

```java
public interface BinaryTreeInteface<T> extends TreeInterface<T>, TreeIteratorInterface<T> {
	void setRootData(T rootData);
	void setTree(T rootData, BinaryTreeInterface<T> leftTree, BinaryTreeInterface<T> rightTree);
}
```

> **Example**: Manually building a tree
> ```java
> // Build leaves
> BinaryTreeInterface<String> bTree = new BinaryTree<>();
> bTree.setTree("B", null, null);
> 
> BinaryTreeInterface<String> cTree = new BinaryTree<>();
> cTree.setTree("C", null, null);
> 
> BinaryTreeInterface<String> emptyTree = new BinaryTree<>();
> 
> // Form larger subtree (root B and C to A)
> BinaryTreeInterface<String> aTree = new BinaryTree<>();
> aTree.setTree("A", bTree, cTree);
> ```
> - Of course, this is just an example.
> - **Note**: If we have a non-leave node that's missing a tree, make sure the side is set to an empty tree. Only the leave nodes should have null children.
>	- Empty trees are like sentinel values.

# Expression Tree

**Expression Tree**: Binary tree representation of an expression.
- Traversing the tree can give us prefix and postfix expressions
- The last operation done is the root of the expression tree.

> **Important**: Things to Know when Recreating Expression Trees from their Traversals
> - First node in preorder traversal is the root node.
> - Last node in postorder traversal is the root node.
> - Inorder traversal only tells us which operands are left and right of operations.

> **Example**: Evaluating an expression tree
> ```
> Algorithm evaluate(expressionTree) {
> 	if expressionTree is empty {
> 		return 0;
> 	} else {
> 		firstOperand = evaluate(left subtree)
> 		secondOperand = evaluate(right subtree)
> 		operator = root
>		return firstOperand operator secondOperator
> 	}
> }
> ```


