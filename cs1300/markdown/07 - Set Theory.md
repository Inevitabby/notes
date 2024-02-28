# Set Theory Examples

> Instructions: List the elements of each of the following sets.

Problem: { $x$ | $x$ is a month with exactly thirty days }
- { April, June, September, November }

Problem: { $x | x$ is an integer and $4 \lt x \lt t$}
- { $5, 6, 7, 8$ }

> Note: This demonstrates that there are two ways to describe a set:
> 1. Describe it with set notation
> 2. List out the elements

---

> Instructions: What's the predicate for each of the following sets?

Problem: { $1, 4, 9, 16$ }
- { $x$ | $x$ is one of the first four perfect squares }

Problem: { $2,3,5,7,11,31,17...$}
- { $x$ | $x$ is a prime number }
	* Note: No restriction on domain because of the "$\ldots$"

# Set Theory Basics

**Empty Set** ($\emptyset$ or $\{\}$): Set with no numbers. (0 elements)
- Aka: Null set
- Note: { $\emptyset$ } is a set containing an empty set (1 element!)

**Common Set Theory Notations:**
- $N$: Set of all nonnegative integers
	* Note: $0 \in N$
- $Z$: Set of all integers
- $Q$: Set of all rational numbers
- $R$: Set of all real numbers
- $C$: Set of all complex numbers

> **Example**: $A = \{ x | (\exists y) [(y \in \{ 0,1,2 \})] \land (x = y^2)\}$
>  - So A = { $0,1,4$ }

> **Example**: $B = \{ x | (\exists y)(\exists z) ( y \in \{ 1,2 \} \land z \in \{2,3\} \land x = z - y ) \}$
> - So B = { $0,1,2$ }

# Open and Closed Interval

$$
\text{Open Interval Example: }\\
\{
	x \in R | -2 < x < 3
\}
$$
- The example set contains all real numbers between $-2$ and $3$.
	* Note that this is an **open interval**, $-2$ and $3$ aren't included>
$$
- 
\text{Closed Interval Example: }\\
\{
	x \in R | -2 \le x \le 3
\}
$$
- The example set contains all real numbers between and including $-2$ and $3$.
	* Note that this is an **closed interval**, $-2$ and $3$ *are* included>

# Relationships Between Sets

For sets $S$ and $M$, $m$ is a **subset** of $S$ if and only if every element in $M$ is also an element of $S$.

**Symbolic Example**:
- $M \subseteq S \equiv (\forall x)$. If $x \in M$, then $x \in S$

**Non-Symbolic Example:**
- { $1, 2$ } $\subseteq$ { $0,1,2,3$ }; { $1,2$ } $\subseteq$ { $1,2$ }

---

If $M \subseteq S$ and $M \ne S$, then there's at least one element of $S$ that's not an element of $M$. In this case, $M$ is a **proper subset** of $S$.

**Symbolic Example**:
- $M \sub S$

**Non-Symbolic Example:**
- { $0$ } $\sub$ { $0,1,2,3$ }

---

**Superset**:  Opposite of subset. If $m$ is a subset of $S$, then $S$ is a superset of $m$.
- Symbolic Representation: $S \supseteq M$

If $M$ is a proper subset of $S$, then $S$ is a **proper superset** of $M$
- Symbolic Representation: $S \supset M$

**Cardinality**: Number of elements within the set
- Cardinality of $S$ is denoted by $|S|$

Examples:
$$
M \subseteq S \\
| M | \le | S | \\~\\

A \supset B \\
| A | > | B |
$$

# Exercise

> Instructions: What statements are true?

Given:
- A = { $x$ | $x$ $\in N \land x \ge 4$} $\to$ { $5,6,7,8,9,...$ }
- B = { $10,12,16,20$ }
- C = { $x$ | ($\exists y$)($y \in N \land x = 2y)$} $\to$ { $0,2,4,6,8,10,...$ }

1. $B \subseteq C$
	- True
2. $A \subseteq C$
	- False
3. ${ 11,12,13 } \subseteq A$
	- True
4. ${ 12 } \in B$
	- False, because this is saying that a set containing $12$ is inside of $B$!
		* ($B = { 10,12,16,20,\{12\} }$ )
5. $\{ x | x \in N \land x <20 \} \not \subset B$
	- False
6. { $\emptyset$ } $\subset B$
	- False
7. $\emptyset \subset B$
	- True

> **Note**: Remember that $\in$ and $\subset$ behave differently!

# Set of Sets

**Power Set**: Set whose elements are all subsets of set $A$.
- We can generate many subsets from every set, for example:

$$
S = \{ 1.2.3 \} \\~\\
P (s) = \{ 
	\emptyset, \{1\}, \{2\}, \{3\}, \{1,2\}, \{1,3\}, \{2,3\}, \{1,2,3\}
\}
$$

> **Tip**: Two ways to make sure you have all the subsets written:
> 1. Find all possible combinations of cardinality 0 and slowly increase until you have the full set.
> 2. Check cardinality: $|P(s)| = 2^{|S|}$

> **Common Pitfalls**:
> - Putting braces around $\emptyset$

# Operations on Sets (cont.)

**Union ($\cup$)**: Set that contains all elements in either set $A$ or set $B$ (or both).
- Denoted by $A \cup B$.

**Intersection ($\cap$)**: Set that contains all elements that are in set $A$ and $B$.
- Denoted by $A \cap B$. 

Example:
$$
	A = \{ 1,3,5,7,9\} \text{ and } B = \{ 3,7,9,10,15 \} \\~\\
	A \cup B = \{ 1,3,5,7,9,10,15 \} \\
	A \cap B = \{ 3,7,9 \}
$$


# Operations on Sets (cont.)

**Union ($\cup$)**: Set that contains all elements in either set $A$ or set $B$ (or both).
- Denoted by $A \cup B$.

**Intersection ($\cap$)**: Set that contains all elements that are in set $A$ and $B$.
- Denoted by $A \cap B$. 

Example:
$$
	A = \{ 1,3,5,7,9\} \text{ and } B = \{ 3,7,9,10,15 \} \\~\\
	A \cup B = \{ 1,3,5,7,9,10,15 \} \\
	A \cap B = \{ 3,7,9 \}
$$

# Disjoint, Complement, and Difference Sets

If $A \cap B = \emptyset$, then $A$ and $B$ are **disjoint sets**.
- In other words, there or no elements in $A$ that are in $B$

For a set $A \in P(U)$, the **complement** of set $A$—denoted as $A'$—is the set of all elements that aren't in $A$.
- In other words, $A'$ has *every* element not in $A$.
$$
A' = \{
	x | x \in U \land x \not \in A
\}
$$

**Difference** of $A-B$ is the set of element in $A$ that aren't in $B$.
- aka: Complement of $B$ relative to $A$.

$$
A - B = \{
	x | x \in A \land x \not \in B
\}
$$

# Class Exercise
Let—
$$
A = \{1, 2, 3, 5, 10\} \\
B = \{2, 4, 7, 8, 9\} \\
C = \{5, 8, 10\}
$$

—be subsets of $S = \{1, 2, 3, 4, 5, 6, 7, 8, 9, 10\}$.

Solve:
1. $A \cup B$
	- { $1,2,3,4,5,7,8,9,10$ }
2. $A - C$
	- { $1,2,3$ }
3. $B' \cap ( A \cup C )$
	1. { $B' \cap \{ 1,2,3,5,8,10 \}$ }
	2. { $\{ 1,3,5,6,10 \} \cap \{ 1,2,3,5,8,10 \}$ }
	3. { $1,3,5,10$ }
4. $A \cup B \cap C$
	- $\emptyset$

# Cartesian Product

If $A$ and $B$ are subsets of $S$, then the **Cartesian product (cross product)** of $A$ and $B$ is defined by:
$$
A \times B = \{
	(x,y) | x \in A \land y \in B
\}
$$
- Cartesian product of 2 sets is the set of all combinations of ordered pairs that can be produced from the elements of both sets.

> Example:
> $$
> A = \{
> 	1,2,3
> \} \\
> B = \{
> 	2,3
> \} \\~\\
> A \times B = \{
> 	(1,2),(1,3),(2,2),(2,3),(3,2),(3,3)
> \}
> $$

> Note: Cartesian Product is fundamental to counting problems.

> Note on Cardinality of Cross Product:
> $$
> |A| = n \\
> |B| = m \\~\\
> |A \times B | = nm
> $$

> Note on Notation:
> $$
> A \times A = A^2
> $$

> Note on Important Pitfall:
> $$
> A \times B \ne B \times A
> $$
> - The resulting sets will have their inner-numbers flipped! 

# Counting

> **Goal**: Find out ow many members are present in a finite set.

Solving counting problems usually involves converting to set cardinality problems.

## Multiplication Principle

**Multiplication Principle**: If there are $n$ possible outcomes for a first event and $m$ possible outcomes for a second event, then there are $nm$ possible outcomes for the sequence of two events.

Hence:
$$
| A \times B | = | A | * | B |
$$

> **Example**:
> - A child is allowed to choose 1 jelly bean **out of two** jellybeans—one red and one black—and one gummy bear **out of three** gummy bears—yellow, green, and white. How many different sets of candy can the child have?
> 
> Solution:
> - There are $2(3) = 6$ possible outcomes.

> **Example**:
> - How many four digit numbers can there be if repetition of numbers are allowed?
> 
> Solution:
> - There are $10 \times 10 \times 10 \times 10 = 10,000$ possible combinations.
>
> Sub-Problem: What if none of the digits can repeat?
> - Solution: $10 \times 9 \times 8 \times 7$ possible combinations.

## Addition Principle

**Addition Principle**: If $A$ and $B$ are disjoint events with $n$ and $m$ outcomes, respectively, then the total number of possible outcomes for event "$A$ or $B$" is $n+m$

If $A$ and $B$ are disjoint sets, then:
$$
|A \cup B| = ???
$$

> **Example**:
> - A customer wants to purchase a vehicle from a dealer. The dealer has 23 cars and 14 trucks in stock. How many selections does the customer have?
> 
> Solution:
> - They have $23+14=37$ possible selections.

## Example: Using Addition and Multiplication Principle

> **Problem**: How many four-digit numbers begin with a 4 or 5?
> 
> $$
> (1*10*10*10) + (1*10*10*10) = 2,000
> $$
> - 4XXX and 5XXX are disjoined, so we can add their possibilities together.
> 
> Alternative solution (only multiplication):
> $$
> 2*10*10*10 = 2,000
> $$

**Problem**: How many three-digit integers (numbers between 100 and 999 inclusive) are even?

$$
\text{Possibilities: } 1—9 \times 0—9 \times — 0,2,4,6,8\\
9 \times 10 \times 5
$$

# Midterm

- Work through proof example worksheet.

# Decision Trees

**Decision Trees**: Trees that provide the number of outcomes of an event based on a series of possible choices.

# Principle of Inclusion and Exclusion

Is $A$ and $B$ are of universal set $S$, then $(A-B),(B-A),\land(A \cap B)$ are disjoint sets.
- This is important to prevent double-counting

E.g.,
$$
	| A \cup B | = | A | + | B | - | A \cap B |
$$

> **Example**: How many integers from 1 to 1000 are either multiples of 3 or multiples of 5?
> 
> $$
> A = \{ \text{Multiples of 3 from 1 to 1000} \} \\
> B = \{ \text{Multiples of 5 from 1 to 1000} \} \\~\\
> \text{Goal: Find $|A \cup B|$} \\~\\
> \begin{aligned}
> 	| A \cup B | &= | A | + | B | - | A \cup B | \\
> 	&= \lfloor \frac{1000}{3} \rfloor + \lfloor \frac{1000}{1} \rfloor - \lfloor \frac{1000}{15} \rfloor \\
> 	&= 457
> \end{aligned}
> $$

## Principle of Inclusion and Exclusion on 3 Sets

$$
| A \cup B \cup C | = | A | + | B | + | C | - | A \cap B | - | A \cap C | - | B \cap C | + | A \cap B \cap C |
$$

**Example**: In a class of students undergoing a computer course the following were observed.
- Out of a total of 50 students: 30 know Pascal, 18 know Fortran, 26 know COBOL, 9 know both Pascal and Fortran, 16 know both Pascal and COBOL, 8 know both Fortran and COBOL, 47 know at least one of the three languages.

1. How many students know none of the languages?
	- $50 - 47 = 3$ students.
2. How many students know all three languages?

$$
| A \cup B \cup C | = 47 \\~\\
\text{Recall: }
| A \cup B \cup C | = | A | + | B | + | C | - | A \cap B | - | A \cap C | - | B \cap C | + | A \cap B \cap C | \\~\\
47 = 30 + 18 + 26 - 9 - 16 - 8 + |A \cap B \cap C| \\
\downarrow \\
|A \cap B \cap C| = 6
$$

