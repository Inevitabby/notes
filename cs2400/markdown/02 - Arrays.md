# Arrays

> **Relevant Notes**: [CS1400 - Arrays](https://inevitabby.codeberg.page/notes/cs1400/07%20-%20Arrays.html)

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
- Zero-indexed in Java.
- Fields are automatically initialized
	* Reference fields become `null`, numeric fields become `0`.
- Size can be a non-negative literal, constant, or variable.
	* Cannot be changed after initialization.
- Passing and returning references to arrays is trivial.

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
		+ An array with different child array lengths is called a **racket array**.
- When the rows of a 2d array are different lengths, this is a ragged array.
