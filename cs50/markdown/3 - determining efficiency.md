# Determining Efficiency

- Running Time:
	- Measured in $n$ steps
	- "How many steps an algorithm might take"

## Big O Notation

The upper bound on an algorithm's running time.

Instead of saying "this algorithm takes $n$ steps", we can measure things in the order of $n$s ("this algorithm takes $O(n)$ steps").
- This is because $n$ and $n/2$ end up being nearly the same when we observe $n$ getting orders of magnitudes larger.

## Big $\Omega$ Notation

The lower bound on an algorithm's running time.
- We generally only talk about Big O notation

## Big $\Theta$ Notation

Used when the upper and lower bound of an algorithm's running time is the same.
- So that we can describe $\Omega$ and $O$ succinctly.

## Common Real-World $O$, $\Omega$, and $\Theta$ Values

Most algorithms will boil down to these (replace $O$ with $\Omega$ or $\Theta$):
- $O(n^2)$, $\Omega(n^2)$, $\Theta(n^2)$
- $O(n\log n)$, $\Omega(n\log n)$, $\Theta(n\log n)$
- $O(n)$, $\Omega(n)$, $\Theta(n)$
- $O(\log n)$, $\Omega(\log n)$, $\Theta(\log n)$
- $O(1)$, $\Omega(1)$, $\Theta(1)$

