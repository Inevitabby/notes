# Introduction to Recursion

**Recursion**: Using the same computation repeatedly until a problem is solved.
- Often the most natural way of thinking about a problem
	* Essentially breaking it into smaller and smaller parts.
	- e.g., Calculating factorial with a recursive loop.

# Recursive Methods (Recurrence Relations)

**Recursive Method**: A method that calls itself
- Must have some way to control number of times it repeats
	* **Depth of Recursion**: Number of times that a method calls itself.

```java
// Sum of first n integers
public static long sum(int n)
{
	if(n==1)
		return 1;
	else
		return n + sum(n-1);
}
```

## The Stack of Activation Records (Tracing Recursive Methods)


Java implements methods using an **internal stack of activation records**, where each record provides a snapshot of a method's state during its execution.
- Each clone has different parameters, local variables, and location in the loop.
	* Only one copy is active at a time (the rest are pending)

> Example: Although it seems `sum()` is just calling itself, it's actually calling clones of itself.

# The Fibonacci Series

Some mathematical problems are designed to be solved recursively.
- Example: Calculating the Fibonacci numbers.

```java
public static int fib(int n)
{
	if (n==0) { return 0;}
	if (n==1) { return 1;}
	return fib(n-1) + fib(n-2);
}
```
- Note how there are two base cases, `S(0)=0` and `S(1)=1`

Iterative solution:
``` java
public static int fib(int n)
{
	int cur = 1, prev = 0;
	int temp;
	for (int i = 2; i <= n; i++){
		temp = cur;
		cur = prev + cur;
		prev = temp;
	}
	return cur;
}
```

# Solving Problems with Recursion

A problem can be solved with recursion if it can be broken into successive smaller problems that are identical to the overall problem.
- Any problem that can be solved recursively can also be solved iteratively (with a loop)
	* Oftentimes less efficient than iterative algorithms, but faster to design.

**Overhead** is when recursive solutions repetitively:
- Allocate memory for parameters and local variables, and
- Store the address of where control returns after the method terminates

> Note: Overhead does not occur with a loop.

Way Recursion Works:
1. Base Case Established
	- If matched, method solves it and returns.
2. If base case cannot be solved now, method reduces it to a smaller problem (recursive case) and calls itself to solve the smaller problem.
	- Eventually the base case will be reached and the recursion will stop.

# Infinite Recursion

**Infinite Recursion**: When a recursive method doesn't check/misses the base case or doesn't get simpler, executing "forever"
- Program will report a stack overflow

# Recursive Binary Search

```java
public static int binarySearch(int[] nums, int target){
	return binarySearchHelper(nums, 0, nums.length-1, target);
}
public static int binarySearchHelper(int[] nums, int start, int end, int target){
	if (end < start)
		return -1;
	int m = (start+end)/2;
	if (nums[m] == target)
		return m;
	else if (nums[m] < target)
		return binarySearchHelper(nums, mid+1, end, target);
	else
		return binarySearchHelper(nums,start,mid-1,target);
}
```
