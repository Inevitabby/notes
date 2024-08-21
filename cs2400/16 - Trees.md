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

# Binary Tree Applications

## Expression Tree

**Expression Tree**: Binary tree representation of an expression.
- Traversing the tree can give us prefix and postfix expressions
- The last operation done is the root of the expression tree.
- **Term**: A tree containing an operator and two operands.
	* To evaluate an expression tree

> **Important**: Things to Know when Recreating Expression Trees from their Traversals
> - First node in preorder traversal is the root node.
> - Last node in postorder traversal is the root node.
> - Inorder traversal only tells us which operands are left and right of operations.

> **Example**: Evaluating an expression tree
> ```
> Algorithm evaluate(expressionTree) {
> 	if expressionTree is a leaf node {
>		# (l and r children == null)
>		return the value of the leaf node;
>	} else {
> 		firstOperand = evaluate(left subtree)
> 		secondOperand = evaluate(right subtree)
> 		operator = root of expression tree
>		return firstOperand operator secondOperator
> 	}
> }
> ```

## Decision Tree

> **Real-World Example**: Expert systems with decision trees
> - Tech support troubleshooting decision trees.
> - Guessing games.

> **Example**: Interface for a decision tree.
> ```java
> public interface DecisionTreeInterfacemT< extends BinaryTreeInterface<T> {
> 	T getCurrentData();
> 	void setCurrentData(T newData);
> 	void setResponses(T responseForNo, T responseForYes);
> 	boolean isAnswer();
> 	void advanceToNo();
> 	void advanceToYes();
> 	void resetCurrentNode();
> }
> ```
> 
> Note the hierarchy of inheritance:
> 1. Tree
> 2. Binary Tree
> 3. Decision Tree

## Binary Search Tree

**Binary Search Tree**: A binary tree where each node's value is:
1. Greater than all nodes in its left subtree, and
2. Less than all nodes in its right subtree. 

> **Cool Characteristic**: In-Order Traversal of BST
> - [In-order traversal]{.underline} of a binary search tree [gives us the contents of the tree in sorted order]{.underline} (low to high)
> - *(Pre and post-order traversal doesn't give us anything intersting)*

**On Performance**:
$$
\boxed{
	\text{(Balanced) BST Search Performance: }
	O ( \log n )
} \\
\small\textit{(where $n$ is the height of the tree)}
$$
- You build the tree as data comes in, so you need to balance the tree afterward to ensure balance
	* We won't cover balancing techniques in this class.
	* If input data is random, tree will be somewhat balanced.
	* If you build the tree with a sorted list, performance will be garbage ($O(n)$)
- The time to build the tree is $O \log n$
- The shorter the tree, the more efficient the search.

> **Example**: How-To Search a BST
> ```
> Algorithm bstSearch(tree, needle) {
> 	if tree is empty
> 		return false
> 	else if needle == root
> 		return true
> 	else if needle < root
> 		return bstSearch(tree's left subtree, needle)
> 	else needle > root
> 		return bstSearch(tree's right subtree, needle)
> }
> ```
> - Be cognizant of stack overflow when using recursion. 

## Heap ADT

**Heap**: A complete binary tree where each node is (1) smaller or (2) larger than [all]{.underline} objects in its descendants.

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

<!--
> **Important**: Don't confuse the heap ADT with dynamic memory.
> - We often call dynamic memory a "heap", don't confuse this with the heap ADT!
-->

> **Implementation Note**: We usually implement heaps with arrays.

> **Cool Characteristic**: Behaves like a priority queue
> - Because the that order things go in relates to how things come out.
> - Like a mix of array, priority queue, and tree.

# General Tree Applications

**Parse Tree**: 
- Lets you check the syntax of a string for valid algebraic expressions.
- More detailed than syntax trees, and detects malformed expressions.
	- Valid expressions can be expressed as a parse trees.
	- For invalid expressions, will tell you what's missing.
- Parse tree must be a general tree to accommodate any expression.

> **Real-World Examples of Parse Trees**:
> - Used by compilers, syntax checkers, etc.
> - Creating a parse tree for a game of tic-tac-toe

> **Relationship between Binary Tree and General Tree**:
> - You can implement a general tree with a binary tree. 
>	- e.g., Let all right-nodes be siblings, let all left node be children.

# Tree Implementations

## Binary Tree

### Binary Tree Nodes

Each node has three fields:
1. Value
2. Left node
3. Right node

```java
class BinaryNode<T> {
	private T data;
	private BinaryNode<T> leftChild;
	private BinaryNode<T> rightChild;
	public BinaryNode() {
		this(null);
	}
	public BinaryNode(T dataPortion) {
		this(dataPortion, null, null);
	}
	public BinaryNode(T dataPortion, BinaryNode<T> leftChild, BinaryNode<T> rightChild) {
		this.data = dataPortion;
		this.leftChild = leftChild;
		this.rightChild = rightChild;
	}

}
```

### initializeTree

```java
private void initializeTree(T rootData, BinaryTree<T> leftTree, BinaryTree<T> rightTree)
```

### Additional Challenges

1. Make sure you copy nodes by value when applicable.
	- Don't have your nodes point to nodes in other trees!
2. If you want to use recursion for a public method; you'll need a `private` and `public` version of a method.

### Example: In-order Traversal

**Recursive**:
```java
private void inorderTraverse(BinaryNode<T> node) {
	if (node != null) {
		inorderTaverse(node.getLeftChild());
		System.out.println(node.getData());
		inorderTaverse(node.getRightChild());
	}
}
```

**Stack**:
1. Push node to stack.
2. Push left node onto stack
	- Keep doing this until we've pushed the leaf node.
3. Pop off leaf node and parent of the leaf node.
4. Push right node onto stack
	- Keep doing this until we've pushed the leaf node.

### Example: Level-Order Traversal

Use a queue.
1. Add everything on the current level to the queue.
2. Dequeue everything once you reach end of level.
3. Go to next level.

## Expression Tree

### Expression Tree Implementation

```java
public interface ExpressionTreeInterface extends BinaryTreeInterface<String> {
	double evaluate();
}
```
- Notice how there is no generic!

### Postfix $\to$ Expression Tree (BTS)

**Steps**: For each token:
1. If token is an operand:
	- Push it to the BTS (binary tree stack) as a leaf node.
2. If token is an operator:
	- Pop off rhs and lhs
	- Make new tree from rhs, lhs, and operator (operator is root)
	- Push tree back into BTS

> **Example**: Manually converting postfix to expression tree
> 
> **Prefix**: `ab+`
> 
> We will use a binary tree stack, a stack of binary trees.
> 
> 1. We will read the first character onto the stack as a leaf node (a)
> 2. We will add the second character onto the stack as a leaf node (b)
> 3. Once we read an operator, we will pop off the two leaf nodes and make them children of the operator (+)

### Evaluation

```java
private double evaluate(BinaryNode<String> rootNode) {
	double result;
	if (rootNode == null) {
		return 0;
	}
	if (rootNode.isLeaf()) {
		String variable = rootNOdegetData();
		result = getValueOf(Variable);
	} else {
		double firstOperand = evaluate(rootNode.getLeftChild());
		double secondOperand = evaluate(rootNode.getRightChild());
		/* Perform computation */
	}
}
```

## General Trees

You can implement a general tree with (1) lists, or (2) a binary tree!

**Representing General Tree with a Binary Tree**:
- Right-Children indicate siblings.
- Left-Children indicate children.

> **Tip**: Draw the binary with horizontal right-lines to make the sibling relationship clearer.

<!--
> **Note**: To iterate through it, we must iterate through all the right nodes.
-->
