# Problems with Array Implementation

1. Fixed Size
	1. May become full
	2. May have wasted space
2. Resizing is possible, but requires overhead.

# Linked Data

> Related Notes: <a href="https://inevitabby.codeberg.page/notes/cs2600/18%20-%20Structs.html#linked-list-using-pointers-and-a-structure">Linked List (CS2600)</a>
> - *(These notes explain it better than the analogy)*
>	- tl;dr: We're making a singly-linked list, which doesn't have a tail (you can't go backwards).

> **A Very Lame Analogy**: Empty classroom
> - Numbered desks stored in hallway
> - Number on back of desk is the address
> - Each number references another in chain of desks
>	- So finding a student requires traversal through the links.

```java
// Private inner-class for our code
private class Node {
	private T data; // The data stored in this node.
	private Node next; // Reference to next node in chain.
	private Node (T data) {
		this(data, null);
	}
	private Node (T data, Node next) {
		this.data = data;
		this.next = next;
	}
}
```
