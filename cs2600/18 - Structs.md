# `Struct`ures in C

`struct`: An abstract data type.
- Declared in the global namespace.

Abstraction is defined by two very important properties:
1. **Encapsulation**: Related data is grouped together
2. **Information Hiding**: Some data is private and public.
	- C's abstraction is low, so we don't have information hiding.

**Namespace**: Defines scope (where something is visible).

**Global Namespace:** Scope where something is accessible to the entire program.
- We put preprocessor directives (e.g., `#include`{.c}), function prototypes, etc) here.

**Example**: Creating a `struct`
```c
#include <stdio.h>
struct Student
{
	char* name;
	int areaCode;
};
int main()
{
	struct Student x = { "Antonio Belpaese", 666 };
	printf("Student: %s (%d)\n", x.name, x.areaCode);
}
```

# Pointer to a `struct` (`->`)

`->`: Operator to select a member of a `struct` through a pointer.
- Can be thought of as the `.` operator for pointers to `struct`s.

**Example**:
```c
#include <stdio.h>
struct Student
{
	char* name;
	int areaCode;
};
int main()
{
	struct Student x = { "Antonio Belpaese", 666 };
	struct Student *ptr = &x;
	// I. Using dot operator and dereference operator
	printf("Student: %s (%d)\n", (*ptr).name, (*ptr).areaCode);
	// II. Doing the same thing as above but with ->
	printf("Student: %s (%d)\n", ptr->name, ptr->areaCode);
}
```

# Function Returning a Pointer

You can have functions return pointers.
- This can be very useful when working with `struct`s.

> **Example**: Trivial example of returning a pointer
> ```c
> int *createIntArray(int n)
> {
> 	int *p = malloc(n*sizeof(n));
>	if (p == NULL) {
>		puts("Out of memory");
>		return 0;
>	}
> 	return(p) ;
> }
> int main() {
> 	int *a;
> 	a = createIntArray(5) ;
>	free(a);
> 	return 0;
> }
> ```
<!--*-->

# Linked List Using Pointers and a Structure

## Linked List

**Linked List**: Linear data structure in which each element is *dynamically allocated* and elements *point to each other*.
- Data doesn't have to be stored in a contiguous block of memory, instead they are nodes connected by pointers.

Each **node** typically has two components:
1. **Data**: The actual value or data associated with the node.
2. **Next Pointer**: Pointer to the next node in the sequence.

**Head and Tail:**
- **Head Node**: Node that points to the first node in the list.
- **Tail Node**: Node that points to NULL.

**Types:**
1. Single-linked
	- Each node contains a reference to the next node in the sequence.
	- Traversed in a forward direction.
2. Double-linked
	- Each node references the next and previous nodes.
	- Can be traversed forwards and backwards.
	- Requires additional memory for the backward reference.
3. Circular linked
	- Tail node points back to the head node.
	- Can be single or double linked.

**Operations on Linked List**:
1. **Insertion**
2. **Deletion**
3. **Searching**

**Pros and Cons**:

| Pros                             | Cons             |
|----------------------------------|------------------|
| Dynamic size                     | No direct access |
| Efficient insertion and deletion | Memory cost      |
| Flexible                         |                  |

## In C

To define a node for a linked list create a recursive `struct`:

```c
struct node {
	int data;
	struct node* next;
}
```

Now we can create the head node like so:
```c
struct node* head = malloc(sizeof(node));
if (head == NULL)
	return 1;
// Remember, head is a pointer to a pointer!
head->data = 1;
head->next = NULL;
```

To add another node to the end of our linked list we can just create a new node and make head point to it:
```c
head->next = malloc(sizeof(node));
head->next->data = 2;
head->next->next = NULL;
```
- It'd of course be better to do this programmatically with a function that traverses the list and creates and inserts the node for us.

### Traversal

To work with linked lists programmatically, we should first know how to traverse (iterate over) them.
```c
void print_list(node* head) {
	node* current = head;
	while (current != NULL) {
		printf("%d\n", current->data);
		current = current->next;
	}
}
```

### Append to List

Returning to our first example where we did—
```c
head->next = malloc(sizeof(node));
head->next->data = 2;
head->next->next = NULL;
```

—Another way to append an item to the list would be to traverse until reaching the tail (where `node->next = NULL`):
```c
void append(node* head, int data) {
	node* current = head;
	while (current->next != NULL) {
		current = current->next;
	}
	current->next = malloc(sizeof(node));
	current->next->data = data;
	current->next->next = NULL;
}
```

### Insert at Beginning of List

**Steps**:
1. Create a new node.
2. Make the new node point to the head of the list.
3. Update the pointer we use to access the head and make it point the new node.

```c
void push(node** head, int data) {
	// 1
	node* new_node;
	new_node = malloc(sizeof(node));
	new_node->data = data;
	// 2
	new_node->next = *head;
	// 3
	*head = new_node;
}
```
- Note how we need to pass a pointer to a pointer (`**head`) in order to modify the pointer itself.

### And more...

> **Note**: Look, there were only 6 slides in the lecture on linked list which just showed some C code with almost zero commentary, and the professor went over none of them during lecture; so this entire section on linked lists is actually based entirely on these two articles:
> 1. [Linked lists, learn-c.org](https://www.learn-c.org/en/Linked_lists)
> 2. [Understanding the basics of Linked List, GeeksForGeeks.org}(https://www.geeksforgeeks.org/what-is-linked-list/)
> 
> Because my time is very limited and because the slides only mentioned these two ways to append to a linked list, I'm not going to expand my notes to include other stuff.
> - E.g., how to insert anywhere in the middle of a linked list, pop items from a linked list, etc.
