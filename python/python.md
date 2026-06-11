---
title: "Python"
---

# Variables

Python uses **dynamic type binding**[^dyntype]. The type of a symbol is determined at runtime. Multiple parallel assignment is supported, and `None` serves as the null value.

```python
x = 42
x = "hello"   # valid: type changes at runtime
a, b, c = 1, 2, 3
a, b = b, a   # swap in one line
x = None
```

[^dyntype]: Contrast with static type binding (e.g., Java, C), where types are resolved before execution. Dynamic binding adds runtime overhead, which is one reason Python is slower than compiled languages, but it increases expressivity and flexibility.

# Conditionals

Python uses indentation to delimit blocks; there are no braces or `end` keywords. The `elif` keyword handles multi-way selection. Boolean operators use English keywords (`and`, `or`, `not`) rather than symbols. Multi-line conditions require parentheses.

```python
if n > 2:
    n -= 1
elif n == 2:
    n *= 2
else:
    n += 2

if (n > 2
        or n == m):
    n = 67
```

> **Aside**: Short-Circuit Evaluation
>
> Python's `and` and `or` use **short-circuit (lazy) evaluation**: if the first operand determines the result, the second isn't evaluated. Useful for guarding expressions like `if lst and lst[0] == target`.

# Loops

Python provides two iterative statement forms. The `while` loop is a logically-controlled loop; the `for` loop is a counter-controlled loop that iterates over any iterable object.[^forloop] `range(n)` generates integers from 0 to n-1; `range(start, stop, step)` provides full control including reverse iteration. `break` and `continue` work as expected.

```python
n = 0
while n < 5:
    print(n)
    n += 1

for i in range(5):        # 0, 1, 2, 3, 4
    print(i)

for i in range(2, 5):     # 2, 3, 4
    print(i)

for i in range(5, 1, -1): # 5, 4, 3, 2
    print(i)
```

[^forloop]: Python's `for` loop is more precisely a *for-each*. It iterates over an iterable object rather than a numeric counter. `range()` is just a commonly used iterable. You can iterate over lists, strings, dictionaries, and any object implementing the iterator protocol.

# Math

The `/` operator always returns a `float` (regardless of operand types).[^divcoerce] The `//` operator performs floor division, rounding toward negative infinity rather than toward zero.[^floordiv] The `%` operator follows the same floor-division convention, so its result always has the same sign as the divisor; use `math.fmod` if you want C-style truncation-toward-zero behavior.

```python
print(5 / 2)    # 2.5  (true division)
print(5 // 2)   # 2    (floor division)
print(-3 // 2)  # -2   (rounds toward -inf, not 0)
print(-3 % 2)   # 1    (same sign as divisor)

import math
print(math.fmod(-3, 2))  # -1.0  (C-style behavior)
print(math.floor(2.9))   # 2
print(math.ceil(2.1))    # 3
print(math.sqrt(9))      # 3.0
```

[^divcoerce]: This is an example of coercion in a mixed-mode expression. To get integer division, use `//` explicitly.

[^floordiv]: Most languages (C, Java, JavaScript) truncate toward zero, giving `-3 // 2 == -1`. Python's choice of floor division is mathematically consistent with the definition of `%` as the modulo operation, where `a == (a // b) * b + (a % b)` holds even for negative numbers.

Python integers have **arbitrary precision**[^bigint] and can't overflow. For sentinel values representing infinity in algorithms, use `float("inf")` and `float("-inf")`, which participate correctly in all comparisons.

```python
INF = float("inf")
print(INF > 10**18)   # True
print(-INF < -10**18) # True
```

[^bigint]: Implemented as arbitrary-precision "bignums" that grow as needed. The concept of a maximum integer doesn't exist in Python.

# Lists

Python's `list` is a **dynamically-sized array** implemented as a buffered array[^dynarray] and is heterogeneous.[^heterogeneous] It's zero-indexed.

**Complexity**: `append` and `pop` from the tail are amortized O(1). `insert` at an arbitrary position and `pop` from the front are O(n). Traditional indexing by position is O(1).

```python
arr = [1, 2, 3]
arr.append(4)     # [1, 2, 3, 4]
arr.pop()         # removes 4 → [1, 2, 3]
arr.insert(1, 7)  # inserts 7 at index 1 → [1, 7, 2, 3]

print(arr[0])     # 1  (first element)
print(arr[-1])    # 3  (last element; negative indices wrap around)
print(arr[-2])    # 2  (second to last)
print(arr[1:3])   # [7, 2]  (slice: start inclusive, stop exclusive)
```

[^dynarray]: Under the hood, Python lists over-allocate capacity (typically doubling) when the buffer is full. This makes `append` amortized O(1) at the cost of some wasted memory. The implementation is similar to `ArrayList` in Java or `std::vector` in C++.

[^heterogeneous]: Unlike arrays in statically-typed languages, Python lists can hold elements of different types in the same list. This is a consequence of dynamic type binding.

> **Aside**: Slicing
>
> Slice syntax is `arr[start:stop:step]`. Omitting `start` defaults to 0; omitting `stop` defaults to the end. `arr[::-1]` produces a reversed copy. Slices always return a new list and do not mutate the original.

**Unpacking**: A list (or any iterable) can be unpacked into variables via parallel assignment, provided the number of targets matches the number of elements.[^unpack]

```python
a, b, c = [1, 2, 3]
first, *rest = [1, 2, 3, 4]  # first=1, rest=[2,3,4]
```

[^unpack]: This is Python's parallel assignment syntax, which is a form of pattern matching on the structure of the right-hand side.

**Iteration**: Three idiomatic patterns:

```python
# By index
for i in range(len(nums)):
    print(nums[i])

# By value (enhanced for)
for elem in nums:
    print(elem)

# By index and value simultaneously
for i, n in enumerate(nums):
    print(i, n)
```

**Parallel Iteration**: `zip` lazily pairs elements from multiple iterables, stopping at the shortest.[^zip]

```python
l1 = [1, 3, 5]
l2 = [2, 4, 6]
for x1, x2 in zip(l1, l2):
    print(x1 + x2)  # 3, 7, 11
```

[^zip]: `zip` is lazy; it produces a `zip` object (an iterator), not a list. Wrap with `list()` if you need a concrete list.

**Sorting**: `arr.sort()` sorts in-place (ascending, lexicographic for strings); `sorted(arr)` returns a new sorted list. Both accept `key` and `reverse` keyword arguments. The `key` parameter takes a lambda[^lambda] that maps each element to its sort key.

```python
arr = [3, 1, 2]
arr.sort()                         # [1, 2, 3] (in-place)
arr.sort(reverse=True)             # [3, 2, 1]
arr.reverse()                      # [1, 2, 3] (in-place reversal)

words = ["banana", "fig", "apple"]
words.sort(key=lambda x: len(x))   # ['fig', 'apple', 'banana']
```

[^lambda]: Lambdas are **anonymous functions** that allow a function to be defined inline without binding it to a name, avoiding namespace pollution. In Python, a lambda body is restricted to a single expression. See the Functions section for more.

**List Comprehension**: Concise syntax for constructing a list by applying an expression to each element of an iterable, optionally filtered by a predicate. This is syntactic sugar for a `for` loop that appends to a list.

```python
arr = [i for i in range(3)]            # [0, 1, 2]
arr = [i * 2 for i in range(3)]        # [0, 2, 4]
evens = [i for i in range(10) if i % 2 == 0]  # [0,2,4,6,8]
```

**2D Lists**: To initialize a 2D array, use a nested comprehension. Do *not* use `[[0] * cols] * rows`; that creates `rows` references to the *same* inner list object[^aliasing], so mutating one row mutates all of them.

```python
# Correct: each row is an independent object
grid = [[0] * 4 for _ in range(4)]
grid[0][0] = 1   # only affects first row

# Wrong: all rows are aliases of the same list
bad = [[0] * 4] * 4
bad[0][0] = 1    # modifies every row
```

[^aliasing]: The `*` operator on a list performs a shallow copy of references, not deep copies of objects. All rows would share the same L-value, a classic aliasing bug.

# Strings

Strings in Python are **immutable** sequences of characters, implemented as fixed-size objects.[^strimmut] They support the same indexing and slicing syntax as lists. Because strings are immutable, concatenation with `+=` allocates a new string each time; this is O(n) per operation, making it O(n²) in a loop. Use `"".join(list_of_strings)` for efficient bulk concatenation.

```python
s = "hello"
print(s[0])      # 'h'
print(s[1:4])    # 'ell'
print(s[-1])     # 'o'

# Efficient concatenation
parts = ["a", "b", "c"]
result = "".join(parts)   # "abc"
result = ", ".join(parts) # "a, b, c"

# Type conversion
n = int("42")     # string → int
s = str(42)       # int → string

# Character ↔ ASCII
print(ord('a'))   # 97
print(chr(97))    # 'a'
```

[^strimmut]: Python strings are fixed-size immutable objects. Every mutation (concatenation, replacement) allocates a brand-new string. This is the same design as Java's `String`. For write-heavy scenarios, accumulate characters in a list and join at the end.

> **Aside**: String Arithmetic
>
> Since arithmetic on characters is common in interview problems (e.g., treating letters as offsets), `ord(c) - ord('a')` gives a zero-indexed position for any lowercase letter. For example, `ord('c') - ord('a') == 2`.

# Queue / Deque

Python's built-in `list` supports O(1) append/pop from the *tail* only. Popping from the front (`list.pop(0)`) is O(n) because all elements must shift. For queue operations (FIFO), use `collections.deque`, which is implemented as a **doubly-ended queue** (deque)[^deque] and provides O(1) append and pop from *both* ends.

```python
from collections import deque

q = deque()
q.append(1)      # enqueue right:  deque([1])
q.append(2)      # enqueue right:  deque([1, 2])
q.append(3)      # enqueue right:  deque([1, 2, 3])
print(q[0])      # peek front: 1
q.popleft()      # dequeue left: deque([2, 3])
q.appendleft(0)  # enqueue left:  deque([0, 2, 3])
q.pop()          # dequeue right: deque([0, 2])
```

[^deque]: A deque (double-ended queue) is an ADT that supports O(1) insertion and removal at both ends. Python's `collections.deque` is implemented as a doubly-linked list of fixed-size blocks, not a single array. This is why it's efficient at both ends but *slower* than a list for arbitrary index access.

# Hash Set

A `set` is a hash set: an unordered collection of unique elements with O(1) average-case insertion, deletion, and membership testing.[^hashset]

```python
my_set = set()
my_set.add(1)
my_set.add(2)
my_set.add(2)      # no-op: duplicates are silently ignored

print(len(my_set)) # 2
print(1 in my_set) # True
print(5 in my_set) # False

my_set.remove(1)   # O(1) removal; raises KeyError if absent
my_set.discard(99) # O(1) removal; no error if absent

# Initialize from a list (deduplicates)
s = set([1, 2, 2, 3])  # {1, 2, 3}

# Set comprehension
s = {i for i in range(5)}  # {0, 1, 2, 3, 4}
```

[^hashset]: A hash set uses a hash function to map keys to buckets, giving O(1) average-case operations. In the worst case (many hash collisions), operations degrade to O(n). Python's `set` is implemented as an open-addressing hash table.

> **Aside**: List vs. Set
>
> The key differences: sets do not preserve insertion order and do not allow duplicate values. Lists preserve order, allow duplicates, and support O(1) indexing. Use a set when you only care about membership, not position.

# Hash Map (Dictionary)

A `dict` (dictionary) is an **associative array** mapping keys to values, implemented as a hash table.[^hashmap] Keys must be hashable (see Tuples). Insertion order is preserved.

```python
my_map = {}
my_map["alice"] = 67
my_map["bob"] = 42
my_map["alice"] = 70   # overwrite existing key

print(len(my_map))     # 2 (number of key-value pairs)
print("alice" in my_map)  # True  (O(1) key lookup)
print("carol" in my_map)  # False

val = my_map.pop("bob")  # removes "bob", returns 42 (O(1))

# Safe access with default
score = my_map.get("carol", 0)  # returns 0 if key absent

# Dict comprehension
squares = {i: i**2 for i in range(5)}
# {0: 0, 1: 1, 2: 4, 3: 9, 4: 16}
```

[^hashmap]: Python dicts are hash tables with open addressing and a compact representation. Average-case O(1) for lookup, insertion, and deletion. `dict.keys()`, `dict.values()`, and `dict.items()` return *view objects* that reflect the current state of the dictionary and do not copy data.

**Iteration**: Three idiomatic patterns, each returning a different view object:[^views]

```python
# Keys only
for key in my_map:
    print(key, my_map[key])

# Values only
for val in my_map.values():
    print(val)

# Key-value pairs (most common in interview code)
for key, val in my_map.items():
    print(key, val)
```

[^views]: `.values()` and `.items()` return dynamic view objects, not static lists. Iterating them gives you keys, values, or `(key, value)` tuples respectively. Wrapping with `list()` materializes a snapshot if you need one.

# Tuples

A **tuple** is an ordered, immutable aggregate of values of potentially different types.[^tuple] Tuples support indexing but not mutation.

```python
tup = (1, 2, 3)
print(tup[0])  # 1
# tup[0] = 99  → TypeError: immutable

# Tuples as return values (multiple return)
def min_max(lst):
    return min(lst), max(lst)

lo, hi = min_max([3, 1, 4, 1, 5])
```

[^tuple]: In PL theory, a tuple is an anonymous record; it aggregates values of potentially different types, accessed positionally rather than by name. Python tuples correspond closely to the theoretical definition. Records (named fields) are provided by `dataclasses` or `namedtuple`.

The primary use in interview code: **tuples as dictionary keys or set elements**. Lists are unhashable because they're mutable; their hash value could change if their contents change, which would corrupt the hash table. Tuples, being immutable, have a well-defined hash value and can be used as keys.

```python
# Common pattern: memoizing 2D coordinates
visited = set()
visited.add((0, 0))   # tuple key in a hash set
visited.add((1, 2))
print((0, 0) in visited)  # True
```

# Heaps

Python provides a **min-heap** via the `heapq` module, implemented as a heap-ordered array.[^heap] The heap invariant guarantees that `heap[0]` is always the minimum element. `heappush` and `heappop` are O(log n).

```python
import heapq

min_heap = []
heapq.heappush(min_heap, 3)
heapq.heappush(min_heap, 2)
heapq.heappush(min_heap, 4)

print(min_heap[0])  # 2 (peek minimum; does not remove)

# Destructive iteration in sorted order
while min_heap:
    print(heapq.heappop(min_heap))  # 2, 3, 4
```

[^heap]: A binary heap is a complete binary tree satisfying the heap property (each node ≤ its children for a min-heap). It's stored as an array where the children of the element at index `i` are at `2i+1` and `2i+2`. This gives O(1) peek, O(log n) push/pop, and O(n) heapify.

**Max-Heap**: Python has no built-in max-heap. The standard workaround is to negate values on push and un-negate on pop, inverting the heap ordering.

```python
max_heap = []
heapq.heappush(max_heap, -3)
heapq.heappush(max_heap, -2)
heapq.heappush(max_heap, -4)

print(-max_heap[0])  # 4 (peek maximum)

while max_heap:
    print(-heapq.heappop(max_heap))  # 4, 3, 2
```

**Heapify**: An existing list can be transformed into a valid heap in O(n) time using `heapify`, which is faster than pushing each element individually (O(n log n)).

```python
arr = [2, 1, 8, 4, 5]
heapq.heapify(arr)   # O(n) in-place
while arr:
    print(heapq.heappop(arr))  # 1, 2, 4, 5, 8
```

# Functions

Functions are defined with `def`. Python supports **nested functions** (functions defined inside other functions), **lambdas** (anonymous single-expression functions), and **closures** (functions that capture bindings from an enclosing scope).

```python
def multiply(n, m):
    return n * m

# Lambda: anonymous function, single expression
square = lambda x: x ** 2
print(square(5))  # 25
```

> **Example**: Nested Functions and Lexical Scope
>
> Nested functions use **lexical (static) scoping**: a nested function resolves names by looking outward through the textually enclosing scopes at the time of definition. This makes nested helpers useful for graph traversal (the helper can read the graph and visited set without them being passed as parameters).
>
> ```python
> def outer(graph, start):
>     visited = set()
>
>     def dfs(node):
>         if node in visited:
>             return
>         visited.add(node)          # captures `visited` from outer scope
>         for neighbor in graph[node]:
>             dfs(neighbor)
>
>     dfs(start)
>     return visited
> ```

**Closures and `nonlocal`**: A nested function can *read* variables from its enclosing scope freely. However, if it tries to *rebind* (reassign) a name, Python treats that name as a local variable, causing a `NameError` on read. The `nonlocal` keyword declares that a name refers to the binding in the nearest enclosing scope, allowing reassignment.[^nonlocal]

```python
def make_counter():
    count = 0

    def increment():
        nonlocal count   # without this, `count += 1` raises UnboundLocalError
        count += 1
        return count

    return increment

counter = make_counter()
print(counter())  # 1
print(counter())  # 2
```

[^nonlocal]: This distinction arises from Python's scoping rules. When the interpreter compiles a function body, any name that appears on the left-hand side of an assignment is classified as a local variable for the entire function. `nonlocal` overrides this classification, telling the compiler to look in the enclosing scope's binding instead.

> **Aside**: Mutation vs. Rebinding
>
> There's an important distinction between *mutating* an object and *rebinding* a name. A nested function can mutate a mutable object (like a list) captured from an outer scope without `nonlocal`, because mutation doesn't change what name the variable points to. Rebinding, assigning a new value to the name itself, requires `nonlocal`.
>
> ```python
> def f():
>     lst = [1, 2, 3]
>     count = 0
>
>     def helper():
>         lst.append(4)   # OK: mutates the object; no rebinding
>         # count += 1    # ERROR: tries to rebind `count`
>         nonlocal count
>         count += 1      # OK with nonlocal
>
>     helper()
> ```

# Classes

Python classes use `__init__` as the constructor. All instance methods must accept `self` as their first parameter; `self` is the reference to the instance, analogous to `this` in Java.[^self] Python doesn't enforce access control (there are no `private` or `protected` keywords), though the convention is to prefix private attributes with an underscore.

```python
class MyClass:
    def __init__(self, nums):
        self.nums = nums
        self.size = len(nums)

    def get_length(self):
        return self.size

    def get_double_length(self):
        return 2 * self.get_length()

obj = MyClass([1, 2, 3])
print(obj.get_length())         # 3
print(obj.get_double_length())  # 6
```

[^self]: Unlike Java's implicit `this`, Python requires `self` to be explicitly declared as the first parameter of every instance method. It's passed automatically by the runtime at call time; you never pass it manually.

> **Aside**: Lightweight Alternatives
>
> For simple data containers in interview code, a full class is often overkill. Two lighter alternatives are available:
>
> - A `dict` or `tuple` works for ad hoc grouping.
> - A `dataclass` (from `dataclasses`) auto-generates `__init__`, `__repr__`, and comparison methods from field annotations, with much less boilerplate.

# Idiomatic Python & Anti-Patterns

**Truthiness Evaluation**: Empty collections (lists, strings, dicts, sets) implicitly evaluate to `False`. Do not compare against empty literals or check length for emptiness.

```python
# Anti-pattern
if stack == []:
    pass
if len(string) == 0:
    pass

# Idiomatic
if not stack:
    pass
if not string:
    pass

```

**Membership Testing**: Use the `in` operator to check for elements within collections (strings, lists, sets, dictionary keys) instead of chained equality checks. When checking dictionary membership, omit `.keys()`.

```python
# Anti-pattern
if c == '(' or c == '[' or c == '{':
    pass
if key in my_map.keys():
    pass

# Idiomatic
if c in "([{":
    pass
if key in my_map:  # Default dictionary membership checks keys
    pass

```

<!--
> **Aside**: `if char in string` is idiomatic?
> 
> String membership testing is implemented in C (just runs a sequential scan to check the characters) and the string is a constant created a compile time; so it's actually fine.
-->

**Simplifying Boolean Returns**: Return the evaluated boolean expression directly rather than using explicit `if/else` blocks to return `True` or `False`.

```python
# Anti-pattern
if not stack:
    return True
else:
    return False

# Idiomatic
return not stack

```

<!-- YES, POINT AND LAUGH -->

**Hash Maps for Relational Logic**: Replace sequential `if/elif` logic with a dictionary lookup. This is heavily utilized for pairing logic (e.g., matching brackets, tracking complement values in Two Sum, state transitions). It flattens control flow and maintains O(1) lookup.

```python
# Anti-pattern
if open_char == '(' and close_char != ')': 
    return False
elif open_char == '[' and close_char != ']': 
    return False

# Idiomatic
mapping = {
    '(': ')',
    '[': ']'
}
if mapping.get(open_char) != close_char: 
    return False

```

**Default Dictionary Values**: Use `dict.get(key, default)` to safely retrieve values without raising a `KeyError` if the key does not exist.

```python
# Anti-pattern
if char in frequency_map:
    frequency_map[char] += 1
else:
    frequency_map[char] = 1

# Idiomatic
frequency_map[char] = frequency_map.get(char, 0) + 1

```

