# Arrays

> **Relevant Notes**: [CS1400 - Arrays](https://inevitabby.gitlab.io/notes/cs1400/07%20-%20Arrays.html)

```java
// Reference variable
int[] numbers; // (undefined, NOT null)
// Create array
numbers = new int[6]; // Remember, arrays are objects!
```

**Array**: Indexed list of data elements.
- Stores any data type, but only one type at a time.
	* Can be primitives or objects.
- Elements can be randomly accessed.
- Zero-indexed
- Fields are automatically initialized
	* Reference fields become `null`, numeric fields become `0`.
- Size can be a non-negative literal, constant, or variable.
	* Cannot be changed after initialization.
- Passing and returning references to arrays is trivial.
	* Though, passing an uninitialized array will result in syntax error.
		+ *(Passing in `NULL` or a length of 0 won't result in syntax error, you'll have o check that yourself)*

> **Note**: `length`
> - Arrays have an immutable (`final`) field called `length`.
>	- Everywhere else, length is usually a method (e.g., `string.length()`)
> ```java
> System.out.println("Array Length: " + numbers.length);
> ```

> **Examples**: Initialization
> ```java
> // Using an initialization list
> int[] days = {
> 	31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
> };
> // Using a bunch of individual statements
> days[0] = 31;
> days[1] = 28;
> days[2] = 31;
> days[3] = 30;
> days[4] = 31;
> days[5] = 30;
> ```

> **Examples**: Declaration
> ```java
> int[] numbers;
> int numbers[];
> int[] numbers, codes, scores;
> int numbers[], codes[], scores[];
> ```

> **Note**: Partially-Filled Arrays
> - Typically, if the amount of data is variable, but the largest expected number is known, we can allocate a large array and use a counter variable to keep track of how much valid data is in the array.
> 	* We might also use an `ArrayList`.

## Value and References

**Copying by Value**
- Arrays are objects, don't copy by reference when you actually intend to copy by value!
```java
int[] x = { 1, 2, 3 };
int[] y = new int[x.length];
for (int i = 0; i < x.length; i++)
	y[i] = x[i];
```

**Compare by Value**
- Doing `array1 == array2` will just compare two addresses. To compare each element by value you'll want to iterate.
```java
int[] x = { 1, 2, 3 };
int[] y = { 1, 2, 3 };
if (x.length != y.length)
	return false;
int i = 0;
while (i < x.length)
	if (x[i] != y[i])
		return false;
	i++;
return true;
```

## Out of Bounds (`ArrayIndexOutOfBoundsException`)

Accessing an invalid index will result in an unchecked (runtime) exception.

## Enhanced For Loop (Read-Only Loop)

```java
for (datatype elementVariable : array)
	statement;
```

- Read-only array processing
- Goes through all elements incrementally
	* No other step is allowed (--, +=2, etc.)
- No access to array index
- An element gets copied to elementVariable every iteration.

> **Example**: Enhanced for loop
> ```java
> int[] numbers = {3, 6, 9};
> // Enhanced (read-only)
> for (int x : numbers) {
>     System.out.println(x);
> }
> // Traditional (read/write)
> for (int i = 0; i < numbers.length; i++)
> {
>     System.out.println(numbers[i]);
> }
> ```

## Two-Dimensional Arrays

**Two-Dimensional Arrays**: Array of arrays.
- Can be thought as having rows and columns.
- Declared with two sets of brackets and two size declarations.
- Can be read with a nested for loop.
	* Each sub-array can have different lengths.
		+ An array with different child array lengths is called a **ragged array**.
- When the rows of a 2d array are different lengths, this is a ragged array.

> **Example**: 2d ragged array
> ```java
> // Make a ragged array
> int[][] matrix;
> matrix = new int[5][];
> for (int i = 0; i < matrix.length - 1; i++) {
> 	matrix[i] = new int[i];
> }
> ```

> **Note**: ragged arrays are easier to do in Java because memory allocation is handled for us and everything is objects.
> - In other languages we might have to fiddle with memory and pointers.
>	- In Java, we don't have to worry about whether data is being stored row or column-wise in memory.

> **Example**: 2d ragged array
> ```java
> // Make a ragged array
> int[][] matrix;
> matrix = new int[5][];
> for (int i = 0; i < matrix.length - 1; i++) {
> 	matrix[i] = new int[i];
> }
> ```

# Sorting

**Sorting**: Process of arranging a list of items in a particular order.

> **Important**: `str1.compareTo(str2)`
> - Returns `0` if str1 equal to str2
> - Returns `<0` if the str1 is lexicographically less than str2
> - Returns `>0` if the str1 is lexicographically greater than str2

## Selection Sort

Process:
1. Find smallest value in array
2. Switch smallest value with the value in the first position.
3. Find next smallest value in array.
4. Switch it with the value in the second position.
5. Repeat until everything is sorted.

Efficiency:
- Best Case and Worst Case: $n^2$

**Note on Swapping**: Swapping requires 3 assignment statements and a temporary storage location.

## Insertion Sort

Process:
1. Consider the first item to be a sorted sublist (of one item)
2. Insert the second item into the sorted sublist, shifting the first item as needed to make room to insert the new addition.
3. Insert the third item into the sorted sublist (of two items), shifting items as necessary.
4. Repeat until all values are inserted into their proper positions.

Efficiency:
- Worst Case: $n^2$
- Best Case: $n$

# Search Algorithms

**Searching**: Processor of finding a target element within a group of items called the search pool.
- Target may or may not be in the search pool.
- We want to search efficiently, minimizing the number of comparisons.

## Sequential Search Algorithm

- Simplest of all search algorithms.
- Searches a collection of unsorted data

Process:
- Sequentially loops through an array and compares each element with the search value
	* Stops when value is found or end of array is encountered
		+ Returns first index of the match of -1 if value not found.

Performance:
- Worst-Case: Algorithm looks through all ($O(n)$) elements
- Cannot be sped up

Example:
```java
public static int sequentialSearch(int[] array, int value) {
	int index = 0;
	int element = -1;
	boolean found = false;
	while (!found && index < array.length) {
		if (array[index] == value) {
			found = true;
			element = index;
		}
		index++;
	}
	return element;
}
```

## Binary Search

- Assumes list of items is sorted
- Searches by splitting search pool in half with every comparison.

Process:
1. Examine middle element of the list.
	2. If it matches the target, search is over. 
	2. If not, remove either the top or bottom half (depending on which one the search target could be in)
		3. Go back to step 1 with the new, smaller list.

Performance:
- Worst-Case: Algorithm looks through $O(log(n))$ elements.

Example:
```java
public static int binarySearch(int[] array, int value)
{
	int first; last, middle, position;
	boolean found = false;
	first = 0;
	last = array.length - 1;
	position = -1;
	while (!found && first <= last) {
		middle = (first + last) / 2;
		if (array[middle] == value) {
			found = true;
			position = middle;
		}
		else if (array[middle] > value)
			last = middle - 1;
		else
			first = middle + 1;
	}
	return position;
}
```

# Command-Line Arguments

**Header**:
```java
public static void main(String[] args)
```

> **Important**: Remember to parse strings into numeric values if you want to use numeric values!

> **Example**: Command-line arguments
> ```java
> public class args {
> 	public static void main(String[] args) {
> 		int i = 0;
> 		for (String x : args) {
> 			System.out.println(i + ": " + x);
> 			i++;
> 		}
> 	}
> }
> ```
> 
> ```bash
> $ javac args.java && java args Hello there!
> 0: Hello
> 1: there!
> ```
> - Note how the arguments are tokenized and delimited by the whitespaces.

# Variable-Length Argument Lists

**vararg**: Special type parameter.
- Actually an array.
- Must be the **last argument** in the header
	* `Printf` actually uses `Object...` vararg.

```java
public static int sum (int... numbers) {
	int sum = 0;
	for (int x : numbers)
		sum += x;
	return sum;
}
```

# DOS Newlines (using `%n`)

UNIX newlines are `\n`, DOS newlines are `\n\r`.

In `printf` you can use `%n` to print newlines compatible with the current operating system.

# The ArrayList Class

Unlike an array, `ArrayList` automatically expands and shrinks when items are added and removed.
- Can only store non-primitives (so you'll have to use `Integer` instead of `int`).
	* When you assign a wrapper class to a primitive, auto-unboxing will occur.

**Capacity**: Number of items the ArrayList can store without increasing its size.

**Import**:
```java
import java.util.ArrayList;
```

**Create**:
```java
// Create string ArrayList with default capacity 10
ArrayList<String> nameList = new ArrayList<>();
// Create string ArrayList with capacity 100
ArrayList<String> nameList = new ArrayList<>(100);
```
- In this class we won't be declaring the type when we declare the ArrayList (e.g., `new ArrayList<>();`) 
	- This is because we'll let the compiler figure out the type based on the reference (e.g., `ArrayList<String> nameList`)

**Common Methods**:
- `.add()`
- `.size()`
- `.get()`
- `.toString()`
- `.remove()`
- `.set()`

> **Note**: Since `.toString()` is implicitly called, you can do `System.out.println(nameList);` for easy debugging.

**Example**
```java
import java.util.ArrayList;
public class list {
	public static void main(String[] args) {
		ArrayList<String> nameList = new ArrayList<>();
		nameList.add("Bob");
		nameList.add("Alice");
		nameList.add(0, "Bingus");
		nameList.remove(2);
		nameList.set(1, "Dingus");
		System.out.println("nameList: " + nameList);
	}
}
```

```bash
$ javac list.java && java list
nameList: [Bingus, Dingus]
```
