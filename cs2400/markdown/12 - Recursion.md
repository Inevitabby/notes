---
title: Recursion
---

# On Repetition

**Repetition**: Major task of many algorithms
- Two Problem-solving Processes:
	1. **Iterations**: Loops, while, do-while, for
	2. **Recursion**: Method calls itself.


> **Example:** Printing a String $n$ times with recursion
> ```java
> print (int n) {
> 	if (n != 1) {
> 		print(n - 1);
> 	}
> 	System.out.println("hello");
> }
> ```

> **Note**: LISP
> - Initially didn't have normal loops, everything had to be thought of recursively.

# Recursion

**Recursion**: Problem-solving process of breaking a problem into identical but smaller problems.
- **Recursive Method:** Method that calls itself
	* Each call generates an activation record.
- Uses more memory than an iterative method.

**Tail Recursion**: When the last action performed by a method is a recursive call.
- Converting tail-recursive methods to an iterative one is usually straightforward.
	- Some compilers will even convert it to a for loop.

**Indirect Recursion**: When $a(x)$ calls $b(x)$ and $b(x)$ calls $a(x)$
- Difficult to understand and trace, but can occur.

> **Example**: Count down from a positive integer
> ```java
> public static void countown(int integer) {
> 	System.out.println(integer);
> 	if (integer > 1) {
> 		countDown(integer - 1)
> 	}
> }
> ```
> - This uses tail recursion, as the last thing it does is call itself.

**Design Guidelines**:
- Method must be given an input value
- Method must contain logic that involves this input, leads to different cases.
- **Base Case:** Any case that provides a solution that does not require recursion.
	* A recursive method needs at least one base case.
	* *aka: Terminal case*
- **Recursive Case**: Any case that requires recursion to be solved.

> **Note**: If you recurse forever, you'll encounter a program stack overflow
> - In Java, you can only be approx. 60 calls deep before you reach this.

> **Example**: Factorial
> ```java
> int fact(int n) {
> 	if (n == 0) { // Terminal case
> 		return 1;
> 	} else { // Recursive case
> 		return n*fact(n-1);
> 	}
> }
> ```

<!--
Suppose we do: `int n = fact(3)`{.java}

Our activation record will look like this:
1. Record 1: n[3]

Then it'll do the call for n(2)
1. Record 1: n[3]
2. Record 2: n[2]

Then it'll do the call for n(1)
1. Record 1: n[3]
2. Record 2: n[2]
3. Record 3: n[1]

Then it'll do the call for n(0)
1. Record 1: n[3]
2. Record 2: n[2]
3. Record 3: n[1]
4. Record 4: 1

Now the answer begins traveling up the chain:
1. Record 1: n[3]
2. Record 2: n[2]
3. Record 3: n[1]
-->
<!--*-->

> **Example**: Printing a singly-linked list in reverse order with recursion and exposing it to a client
> ```java
> // What we provide to the client
> public void print () {
> 	print(head)
> }
> // Private method we use that lets us access out Node inner-class
> private void print (Node node) {
> 	if (node != null) {
> 		print(node.next);
> 		System.out.println(node.data);
> 	}
> }
> ```

> **Common Mistake:** Using iteration instead of an if statement in a recursive function.

# On Problem-Solving

Some problems like the **Tower of Hanoi** or **finding the shortest path** or **8-Queen problem** are made easier through recursion because it makes backtracking easier.

Some algorithms like Fibonacci are very inefficient when solved recursively.
