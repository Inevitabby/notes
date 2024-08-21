# Intro to Arrays

**Array**: List of data elements
- Allows us to create a collection of like values that are indexed.
- Can store any type of data
- Can only store one type of data at a time.
- Arrays in Java are zero-indexed.

# Creating Arrays

1. Arrays are objects, so it needs an object reference.

```java
// Declare reference to an array to hold ints
int[] numbers;
```

2. Create array and assign to object reference.

```java
// Create new array to hold 6 ints
numbers = new int[6];
```

In one step (declaring reference and creating array object in one statement):
```java
float[] temperatures = new float[100];
```

**Array Size**:
- Must be non-negative number.
- Can be a literal value, constant, or variable.
- Once an array object is created, the array size cannot be changed.

# Accessing Elements of an Array

Array is accessed by:
- Reference name (e.g., `numbers`)
- Subscript that identifies which element in the array to access (e.g., `3`)

```java
// Array elements can be treated like any other variable
numbers[0] = 20;
```

# Off-by-One Errors

It's very easy to by off-by-one when accessing arrays and get `ArrayIndexOutOfBoundsException` runtime error.

# Array Initialization

We can use an initialization list if only a few items need to be initialized, like so:
```java
// Using an initialization list
int[] days = {
	31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
};
// Using a bunch of statements
days[0] = 31;
days[1] = 28;
days[2] = 31;
days[3] = 30;
days[4] = 31;
days[5] = 30;
```

# Alternate Array Declaration

All the following is valid:
```java
int[] numbers;
int numbers[];
int[] numbers, codes, scores;
int numbers[], codes[], scores[];
```

# Array Length

Arrays are objects that have a public constant field named length that can be accessed like so:
```java
int l = temperatures.length;
```

> Note: For other objects, `length` is usually a method, such as `String`'s `length()` method.

# Enhanced `for` Loop

```java
for (datatype elementVariable : array)
	statement;
```
- Read-only array processing
- Goes through all elements incrementally
	* No other step is allowed (`--`, `+=2`, etc.)
- No access to array index
- An element gets copied to `elementVariable` every iteration.

Example:
```java
int[] numbers = {3, 6, 9};
// Enhanced (read-only)
for (int x : numbers) {
	System.out.println(x);
}
// Traditional (read/write)
for (int i = 0; i < numbers.length; i++)
{
	System.out.println(numbers[i]);
}
```

# Copying Arrays

How NOT to copy an array (copying by reference):
```java
int[] x = { 1, 2, 3 };
int[] y = x;
```
- This merely copes a reference.

How to copy an array (copying by value):
```java
int[] x = { 1, 2, 3 };
int[] y = new int[x.length];
for (int i = 0; i < x.length; i++)
	y[i] = x[i];
```

# Passing Arrays as Arguments

Like any other object reference variable, they are passed by reference

# Comparing Arrays

`==` will only check whether two references point to the same array object.
- To compare by *value* rather than *reference* you need a loop.

# Pattern: Partially Filled Arrays

One way to hold an unknown amount of data is to just make one big array and keep track of the end of the data with a counter variable.

# Returning an Array Reference

A method can return a reference to an array.
- Be sure that the return type matches! 

# Arrays of Objects

Arrays aren't limited to primitive data, they can also hold objects.

E.g.,
```java
Rectangle[] x = new Rectangle[7];
for (int i = 0; i < x.length; i++)
	x[i] = new Rectangle();
```

## `String` Arrays

E.g.,
```java
String[] names = { "Plutonia", "Doom2", "MyHouse" }
```

> **Remember!**: An array's `length` is a field. A `String`'s `length()` is a method.

# Two-Dimensional Arrays

**Two-Dimensional Array**: An array of arrays.
- Can be thought as having rows and columns.
- Declared with two sets of brackets and two size declarations.
- Can be read with a nested for loop.
- Each sub-array can have a different lengths.
	* When the rows of a 2d array are different lengths, this is a ragged array.

Example:
```java
int[][] x = new int[3][4];
```

|      | col 0        | col 1        | col 2        | col 3        |
| ---  | ---          | ---          | ---          |              |
| row0 | scores[0][0] | scores[0][1] | scores[0][2] | scores[0][3] |
| row1 | scores[1][0] | scores[1][1] | scores[1][2] | scores[1][3] |
| row2 | scores[2][0] | scores[2][1] | scores[2][2] | scores[2][3] |


```java
x[2][1] = 95;
```

|      | col 0        | col 1        | col 2        | col 3        |
| ---  | ---          | ---          | ---          |              |
| row0 | 0            | 0            | 0            | 0            |
| row1 | 0            | 0            | 0            | 0            |
| row2 | 0            | 95           | 0            | 0            |

# The `ArrayList` Class

Unlike an array, an `ArrayList` object automatically expands and shrinks when items are added and removed.
- Capacity: Number of items it can hold without increasing its size
	* Default is 10.

Imported with:
```java
import java.util.ArrayList;
```

Created with:
```java
ArrayList<String> nameList = new ArrayList<String>();
// Alternative: Declare with different capacity than 10
ArrayList<String> nameList = new ArrayList<String>(100);
```
- The two `<String>`s tell ArrayList to store only `String` datatypes.

Common methods:
- `.add()`
- `.size()`
- `.get()`
- `.toString()`
- `.remove()`
- `.set()`
