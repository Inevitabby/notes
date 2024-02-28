# Search Algorithms

## Linear Search

```pseudocode
for each door from left to right
	if number is behind door
		return true
return false
```

This algorithm does $n+2$ steps at most, or $n+$ some constant.

Therefore, for linear search:
- $O(n)$ (finding the number at the last door; worst case; upper bound)
- $\Omega(1)$ (finding the number behind the first door; best case; lower bound)
- $\Theta$ does not exist for this algorithm ($\Omega \ne O$)

## Binary Search

```pseudocode
if no doors
	return false
if number behind middle door
	return true
else if number > middle door
	search left half
else if number < middle door
	search right half
```

- $O(\log n)$
- $\Omega(1)$

## When To Sort?

If you had to sort the data first, you have to look at all the data first ($O(n)$) before you can run efficient binary searches ($O(\log n)$).
- Therefore, sorting is good when multiple searches are going to be done on the data
- It really depends on resources and goals.
