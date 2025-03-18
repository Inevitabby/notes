---
title: "Search and Sort"
---

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

### When To Sort?

If you had to sort the data first, you have to look at all the data first ($O(n)$) before you can run efficient binary searches ($O(\log n)$).
- Therefore, sorting is good when multiple searches are going to be done on the data
- It really depends on resources and goals.

# Sorting

**Sorting**: Process of arranging a list of items in a particular order.

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

# Comparing Sorts

Selection and Insertion sort algorithms are similar in efficiency.
- They both have loops that scan all elements and inner loops that compare the value of the outer loop with almost all values in the list.
- Approximately $n^2$ comparisons are made to sort a list of size $n$.
	* Therefore, these sorts of order $n^2$

