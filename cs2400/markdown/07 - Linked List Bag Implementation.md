# Problems with Array Implementation

1. Fixed Size
	1. May become full
	2. May have wasted space
2. Resizing is possible, but requires overhead.

One solution: Linked list.

# Linked Data

> **Related Notes**: <a href="https://inevitabby.codeberg.page/notes/cs2600/18%20-%20Structs.html#linked-list-using-pointers-and-a-structure">Linked List (CS2600)</a>
> - *(These notes explain it better than the analogy)*
>	- tl;dr: We're making a singly-linked list, which doesn't have a tail (you can't traverse backwards).

**Linked List**: Linear data structure in which each element is:
1. *Dynamically allocated*, and
2. *Elements point to each other*.

Data is stored as a chain of nodes rather than a contiguous block of memory.
- Each **node** typically has two parts:
	1. **Data**: Value/data associated with the node.
	2. **Next Pointer**: Pointer to the next node in the sequence.

**A Very Lame Analogy**: Empty classroom
- Numbered desks stored in hallway
- Number on back of desk is the address
- Each number references another in chain of desks
      - So finding a student requires traversal through the links.

> **Example**: Node as a private inner class for a singly-linked list
> ```java
> public final class LinkedBag<T> implements BagInterface<T> {
> 	private Node head;
> 	private int entries;
> 	public LinkedBag() {
> 		head = null;
> 		entries = 0;
> 	}
> 	/** (Implementation of BagInterface here) */
> 	/**
> 	* Private node inner-class
> 	*/
> 	private class Node<T> {
> 		private T data; // The data stored in this node.
> 		private Node next; // Reference to next node in chain.
> 		private Node (T data) {
> 			this(data, null);
> 		}
> 		private Node (T data, Node next) {
> 			this.data = data;
> 			this.next = next;
> 		}
> 	}
> }
> ```
> - Conventionally we put our inner-classes at the bottom of a class, after fields and methods, respectively.
> - This `Node`{.java} data structure is only available to `LinkedBag`{.java}. 
<!--*-->

## Example: Traversal

> **Example**: Traversing a linked list
> ```java
> public int getCurrentSize() {
> 	Node currentNode = head;
> 	int size = 0
> 	while (currentNode != null) {
> 		size++;
> 		currentNode = currentNode.next;
> 	}
> 	return size;
> }
> ```
> - **Common Mistakes:**
> 	1. Doing `currentNode.next != null`
> 	2. Using the head node instead of a reference to it
> 		- (You'll destroy your data)

## Pros and Cons 

**Pros**:
- Bag can grow and shrink in size as necessary.
- Unneeded nodes can be garbage collected.
- Adding/removing to end or beginning is relatively simple. 

**Cons**:
- Requires more memory than array of same length.
- Removing specific entries requires costly traversal.

