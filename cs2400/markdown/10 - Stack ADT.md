---
title: Stack ADT
---

# Stack

**Stacks**:
- Add items to the top of stack.
- Remove items from the top of the stack.
- **LIFO**: Last In, First Out.
	- *Metaphor: The last dish you add to a stack of dishes is the first one you can take out.*
- **Contents** (Data): Collection of objects in reverse chronological order and having the same data type.

## Specification

```plantuml
@startuml
class stack {
	+push(newEntry : T) : void
	+pop(): T                
	+peek() : T              
	+isEmpty() : boolean     
	+clear() : void          
}
@enduml
```

| Name    | Description                                                |
|---------|------------------------------------------------------------|
| push    | Adds a new entry to the top of the stack                   |
| pop     | Removes and returns the stack's top entry                  |
| peek    | Retrieves the stack's top entry without changing the stack |
| isEmpty | Returns whether the stack is empty                         |
| clear   | Removes all entries from the stack                         |

> **Remember**: You can only interact with the item at the top of the stack!
> - Don't implement extra features that go against the specification!
>	- This means no `toArray`!

> **Example**: Stack interface
> ```java
> public interface StackInterface<T> {
> 	void push(T newEntry);
> 	T pop();
> 	T peek();
> 	boolean isEmpty();
> 	void clear();
> }
> ```

## Design Decisions

**Case**: Stack is empty, what to do with `pop` and `peak`?
1. Assume it isn't empty
2. Return `null`
3. Throw an exception.

**Security Note**:
- Don't trust the client to use public methods correctly
- Avoid ambiguous return values
- Prefer throwing exceptions rather than returning values to indicate problems.

# Using Stack on Algebraic Expressions

> **Relevancy**: *"The most important ADT in computer science"*
> - We wouldn't have methods or recursion without stacks!
> - [In this introduction we'll be using the stack to manipulate algebra.]{.underline}
>	- The techniques are universal, and used everywhere.

## Infix, Prefix, Postfix

**Algebraic Notation**:
1. **Infix**: Each binary operator appears between its operations
2. **Prefix**: Each binary operator appears before its operands
	* *(We won't really touch prefix, we're more interested in infix and postfix)*
3. **Postfix**: Each binary operator appears after is operands
	* *aka: Reverse Polish Notation*

> **Note**: Why Prefix and Postfix Matter
> - In infix, precedence can be ambiguous, which is why parenthesis and the precedence (order of operations) exists.
>	- So for a computer to evaluate an infix expression, it needs two stacks (variable and operator stack) *and* it needs to evaluate order of operations.
> - In prefix and postfix, precedence is not ambiguous, no parenthesis are needed.
>	- So prefix and postfix is easier and faster to execute on a computer (you only need to use one stack to evaluate, and you don't need to worry about order of operations).

> **Example**: The same expression in infix, prefix, and postfix
> ```
> # Infix
> a + b
> # Prefix
> + a b
> # Postfix
> a b +
> ```

> **Example**: The same expression in infix, prefix, and postfix
> ```
> # Infix
> a + b / c 
> # Prefix
> + a / b c
> # Postfix
> a b c / +
> ```

> **Warning**: Keep terms on their original sides when converting expressions
> - Using the associative rule to switch sides will lose points.

## Testing Balanced Expressions

> **Balanced Expression**: An expression with matching brackets and parenthesis.

**Q**: How do you tell if an infix expression is balanced?

**A**: Read the expression character-by-character, and:
1. Push each opening symbol (e.g., `[`, `{`) to the stack as you read it
2. Pop each closing symbol (e.g., `]`, `}`) from the stack as you read it
	- If the return value of the pop doesn't match the closing symbol you're reading, the expression is unbalanced.
3. When/if you reach the end of the expression:
	- If the stack isn't empty, the expression is unbalanced
	- If the stack is empty, the expression is balanced.

## Converting Infix $\to$ Postfix

**Q**: How do you programmatically convert an infix expression $\to$ postfix?

**A**: Read the expression character-by-character and use a stack to store operators:
1. Variables (e.g., `a`, `b`) get appended to the postfix expression as we read them.
2. Operators (e.g., `-`, `+`) get pushed into the operator stack as we read them.
	- [Move operator(s) from the stack to the postfix expression]{.underline} when:
		* At the **end of the expression**, or
		* When an **operator** being added to the stack **has lower-or-equal precedence** to the one currently on the top of the stack.
	- *Special Case: A closing parenthesis will pop everything off the stack until you reach the next opening parenthesis in the stack*

> **Remember**: The parenthesis themselves don't get added into postfix notation.

> **Example**: Converting infix $\to$ postfix with a stack
> 
> 1. Infix Expression: $a+b*c$
> 
> | Current Character | Postfix Form | Operator Stack |
> |-------------------|--------------|----------------|
> | $a$               | $a$          |                |
> | $+$               | $a$          | $+$            |
> | $b$               | $ab$         | $+$            |
> | $*$               | $ab$         | $+*$           |
> | $c$               | $abc$        | $+*$           |
> |                   | $abc*$       | $+$            |
> |                   | $abc*+$      |                |
> - Thus, the postfix form of $a+b*c$ is $abc*+$
> 
> 2. Infix Expression: $a - b + c$
> 
> | Current Character | Postfix Form | Operator Stack |
> |-------------------|--------------|----------------|
> | $a$               | $a$          |                |
> | $-$               | $a$          | $-$            |
> | $b$               | $ab$         | $-$            |
> | $+$               | $ab-$        | $+$            |
> | $c$               | $ab-c$       | $+$            |
> |                   | $ab-c+$      |                |
> - Thus, the postfix form of $a-b+c$ is $ab-c+$
> 
> 3. Infix Expression: $a$ ^ $b$ ^ $c$
> 
> | Current Character | Postfix Form | Operator Stack |
> |-------------------|--------------|----------------|
> | $a$                 | $a$            |                |
> | ^                 | $a$            | ^              |
> | $b$                 | $ab$           | ^               |
> | ^                 | $ab$           | ^^              |
> | $c$                 | $abc$         | ^^              |
> |                   | $abc$ ^        | ^               |
> |                   | $abc$ ^^        |                |
> - Thus, the postfix form of $a$ ^ $b$ ^ $c$ is $abc$ ^^
>	- **Important**: The second `^` may *appear* to have the same precedence as the first `^`—because they're both the same symbol (so you may want to do `ab^c^`)—but the [second `^` has a higher precedence because it's nested in the first one]{.underline}!
> 
> 4. Infix Expression: $a / b * ( c + (d-e))$
> 
> | Current Character | Postfix Form | Operator Stack |
> |-------------------|--------------|----------------|
> | $a$               | $a$          |                |
> | $/$               | $a$          | $/$            |
> | $b$               | $ab$         | $/$            |
> | $*$               | $ab/$        | $*$            |
> | $($               | $ab/$        | $*($           |
> | $c$               | $ab/c$       | $*($           |
> | $+$               | $ab/c$       | $*(+$          |
> | $($               | $ab/c$       | $*(+($         |
> | $d$               | $ab/cd$      | $*(+($         |
> | $-$               | $ab/cd$      | $*(+(-$        |
> | $e$               | $ab/cde$     | $*(+(-$        |
> | $)$               | $ab/cde-$    | $*(+($         |
> | $)$               | $ab/cde-+$   | $*($           |
> | $)$               | $ab/cde-+*$  |                |
> - Thus, the postfix form of $a / b * ( c + (d-e))$ is $ab/cde-+*$
>
> > **Note**: When implementing this in code, make sure that the expression is balanced, or throw an exception when something illegal happens.

## Evaluating Postfix Expressions

**Q**: How do you programmatically evaluate a postfix expression?

**A**: We'll use a stack to evaluate it.
1. Create a stack ($s$)
2. For every token ($t$),
	1. If $t$ is a variable:
		* Push $t$ to stack. (`s.push(t)`)
	2. Else:
		* $t$ is an operator (`op = t`)
		* Pop the right-hand-side variable (`rhs = s.pop()`)
		* Pop the left-hand-side variables (`lhs = s.pop()`)
		* Push the result back to the stack (`s.push(lhs op rhs)`)
		* *(If any of the pops returned incorrect values, the expression was malformed)*
3. Return `s.pop()`
	- If the stack isn't empty after this pop, the expression was malformed.

<!--
> **Example**: Evaluating postfix expressions
> ```java
> Algorithm evaluatePostfix(postfix) {
> 	valueStack = /* a new empty stack */;
> 	while (/* postfix has chars to parse */) {
> 		nextCharacter = /* next non-blank char */
> 		switch (nextCharacter) {
> 			case variable: // e.g., a, b, c
> 				valueStack.push(nextCharacter)
> 				break;
> 			case operation: // e.g., +, -, ^
> 				varOne = valueStack.pop()
> 				varTwo - valueStack.pop()
> 				valueStack.push(varOne operation varTwo)
> 				break;
> 		}
> 	}
> }
> ```
*
-->

# The Application Program Stack

Stacks make method calling and recursion possible.
- **Program Activation Record**: Stack maintaining a list of method calls. 
	- Each record contains of:
		1. Parameters,
		2. Local variables, and
		3. Return address

> **Example**: Program activation records
> ```java
> public static void main(string[] args) {
> 	int x = 5;
> 	int y = methodA(x);
> }
> public static int methodA(int a) {
> 	a = methodB(a);
> 	return a;
> }
> public static int methodB(int b) {
> 	return b;
> }
> ```
> 
> So, by the time `methodB()` begins execution, the program activation record looks like this:
> 1. `methodB`
> 2. `methodA`
> 3. `main`
> 
> - *(This demonstrates LIFO, the last method in is the first one executed.)*

# Java Class Library

Found in `java.util`

**Methods**:
```java
T push(T item);
T pop();
T peek();
boolean empty();
```

# Implementing a Stack

## Linked Implementation

Implementing a stack with a singly linked list is trivial.
- We just use the `head` node as the top of the stack.

> **Example**: Implementing basic stack methods with SLI
> ```
> public final class LinkedStack<T> implements StackInterface {
>	private Node head;
?	/* constructor goes here */
> 	public T peek() {
> 		if (isEmpty()) {
> 			throw new EmptyStackException();
> 		}
> 		return head.data;
> 	}
> 	public T pop() {
> 		T top = peek();
> 		head = head.next;
> 		return top;
> 	}
> 	public T push(T entry) {
> 		Node newEntry = Node(entry);
> 		if (head != null) {
> 			newEntry.next = head;
> 		}
> 		head = newEntry;
> 	}
> 	/* private Node inner-class here */
> }
> ```
<!--*-->

## Array-Based Implementation

Implementing a stack with an array is best done by using the end of the array as the top of the stack, as it's the easiest to access.

<!--
**Example**: Implementing basic stack method with an array
```java
public final class ArrayStack implements StackInterface {
	private int[] stack;
	private int index;
	/* constructor goes here */
	public T peek() {
		if (isEmpty()) {
			throw new EmptyStackException();
		}
		return head.data;
	}
	public T pop() {
		T top = peek();
		head = head.next;
		return top;
	}
	public T push(T entry) {
		Node newEntry = Node(entry);
		if (head != null) {
			newEntry.next = head;
		}
		head = newEntry;
	}
}
```
-->

## Vector-Based Stack Implementation

**Vector**: Object that behaves like a high-level array.
- Falling out of fashion.
