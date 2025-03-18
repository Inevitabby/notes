---
title: "Set Theory"
---

# Set Theory Basics

**Set**: A collection of distinct objects (elements).
- Powerful tool in computer science to solve real world problems.
- Traditionally represented by capital letters (elements by lowercase letters).
- Unlike sequences, order doesn't matter in sets.

> **Note**: Implications of order not mattering in sets:
> - Two sets are equal if and only if they contain the same elements.
> - Listing elements twice is redundant.
> $$
> \text{Example: }
> A: \{2,4,6,8,10\} = B: \{2,4,6,10,8\} \\~\\
> \text{Can be Verified By: }
> (\forall x)[(x \in A \to x \in B) \land (x \in B \to x \in A)]
> $$

## Set Notation

**Braces ($\{\}$)**: Braces are used to indicate a set.
- e.g., $\{1,2,3\}$

**$\in$ (belongs to)**: Used to show that an element belongs to a particular set.
- e.g., $a \in A$ means that element $a$ belongs to set $A$.
- e.g., $b \not \in A$ means that element $b$ doesn't long to set $A$

> **Example**: Using $\in$
> $$
> A = \{2,4,6,8,10\} \\
> 3 \not \in A \land 2 \in A
> $$

**Empty Set** ($\emptyset$ or $\{\}$): Set with no numbers.
- Has 0 elements
- Aka: Null set

> **Common Pitfall**: Don't accidentally use $\{ \emptyset \}$ to represent an empty set, $\{ \emptyset \}$ is a set containing an empty set!

**Common Set Theory Notations:**
- $\mathbb{N}$: Set of all nonnegative integers
	* Note: $0 \in \mathbb{N}$
- $\mathbb{Z}$: Set of all integers
- $\mathbb{Q}$: Set of all rational numbers
- $\mathbb{R}$: Set of all real numbers
- $\mathbb{C\mathbb{}}$: Set of all complex numbers

**Predicate Notation**:

> **Example**: $A = \{ x | (\exists y) [(y \in \{ 0,1,2 \})] \land (x = y^2)\}$
>  - So A = { $0,1,4$ }

> **Example**: $B = \{ x | (\exists y)(\exists z) ( y \in \{ 1,2 \} \land z \in \{2,3\} \land x = z - y ) \}$
> - So B = { $0,1,2$ }

## Infinite Sets

**Infinite Sets**:
- Members of infinite sets can't be listed, but a pattern for listing elements can be indicated, like so:

$$
S = \{x | x \text{ is a positive even integer} \}
$$
- Can also be defined with predicate logic:
$$
(\forall x)[
	( x \in S \to P(x)) \land
	( P(x) \to x \in S)]
]
$$
- Where $P$ is the unary predicate

## Examples: Two Ways to Describe Sets

> Instructions: List the elements of each of the following sets.

**Q**: { $x$ | $x$ is a month with exactly thirty days }
- A: { April, June, September, November }

**Q**: { $x | x$ is an integer and $4 \lt x \lt t$}
- A: { $5, 6, 7, 8$ }

---

> Instructions: What's the predicate for each of the following sets?

**Q**: { $1, 4, 9, 16$ }
- A: { $x$ | $x$ is one of the first four perfect squares }

**Q**: { $2,3,5,7,11,31,17, ...$}
- A: { $x$ | $x$ is a prime number }
	* Note: No restriction on domain because of the "$...$"

## Open and Closed Interval

$$
\text{Open Interval Example: }\\
\{
	x \in \mathbb{R} | -2 < x < 3
\}
$$
- The example set contains all real numbers between $-2$ and $3$.
	* This is an **open interval**, $-2$ and $3$ *aren't* included
$$
\text{Closed Interval Example: }\\
\{
	x \in \mathbb{R} | -2 \le x \le 3
\}
$$
- The example set contains all real numbers between and including $-2$ and $3$.
	* This is a **closed interval**, $-2$ and $3$ *are* included>

# Relationships Between Sets

## Subset ($\subseteq$)

For sets $S$ and $M$, $M$ is a **subset** of $S$ if and only if every element in $M$ is also an element of $S$.

**Symbolic Representation**:
- $M \subseteq S$ <!--\iff (\forall x)$, if $x \in M$, then $x \in S-->

> **Examples**:
> - { $1, 2$ } $\subseteq$ { $0,1,2,3$ }
> - { $1,2$ } $\subseteq$ { $1,2$ }

## Proper Subset ($\sub$)

For sets $S$ and $M$, if $M \subseteq S$ and $M \ne S$, then there's at least one element of $S$ that's not an element of $M$. In this case, $M$ is a **proper subset** of $S$.

**Symbolic Representation**:
- $M \sub S$

> **Example**:
> - { $0$ } $\sub$ { $0,1,2,3$ }
> - { $1, 2$ } $\sub$ { $0,1,2,3$ }
> - { $1, 2$ } $\not \sub$ { $1,2$ }

<!--(CONFUSING?)
> **Note**: Every proper subset ($\sub$) is a subset ($\subseteq$), but not every subset is a proper subset!
-->

## Superset ($\supseteq$)

**Superset**: If $m$ is a subset of $S$, then $S$ is a superset of $m$.
- The opposite of subset. 

**Symbolic Representation**:
- $S \supseteq M$

## Proper Superset ($\supset$)

**Proper Superset**: If $M$ is a proper subset of $S$, then $S$ is a **proper superset** of $M$

**Symbolic Representation**:
- $S \supset M$

## Exercises: Reading Superset and Subset

> **Instructions**: What statements are true?
> 
> Let:
> - $A$ = { $x$ | $x$ $\in N \land x \ge 4$} $\to$ { $5,6,7,8,9,...$ }
> - $B$ = { $10,12,16,20$ }
> - $C$ = { $x$ | ($\exists y$)($y \in N \land x = 2y)$} $\to$ { $0,2,4,6,8,10,...$ }

Q: $B \subseteq C$
- A: True

Q: $A \subseteq C$
- A: False

Q: $\{ 11,12,13 \} \subseteq A$
- A: True

Q: $\{ 12 \} \in B$
- A: False.
	* This is saying that a set *containing* $12$ is inside $B$, which would look like this: $B = \{ 10,12,16,20,\{12\} \}$

Q: $\{ x | x \in N \land x <20 \} \not \subset B$
- A: False

Q: { $\emptyset$ } $\subset B$
- A: False
	* This is saying that a set *containing* an empty set is inside $B$, which would look like this: $B = \{ 10,12,16,20,\{\emptyset\} \}$

Q: $\emptyset \subset B$
- A: (Vacuously) True

> **Remember**: *Don't get tripped-up by the empty [set]{.underline}. You don't need to surround it in brackets like "$\{ 11 \} \subseteq A$" because it's already a [set]{.underline}!*

# Cardinality

**Cardinality**: The number of elements within a set
- The cardinality of $S$ is denoted by $|S|$

> **Example**: Simple
> $$
> | \{ 1,2,3 \} | < | \{ 1,2,3,4 \}
> $$

> **Example**: Subset
> $$
> M \subseteq S \to | M | \le | S |
> $$

> **Example**: Proper Superset
> $$
> A \supset B \to | A | > | B |
> $$


> **Note**: Remember that $\in$ and $\subset$ behave differently!

# Power Set ($\wp$)

**Power Set**: The power set of a set $S$ is a set that contains all possible subsets of set $S$.
- The ability to generate subsets from every set is foundational to counting and combinatorics.

> **Example**:
> $$
> S = \{ 1.2.3 \} \\~\\
> \wp (S) = \{ 
> 	\emptyset, \{1\}, \{2\}, \{3\}, \{1,2\}, \{1,3\}, \{2,3\}, \{1,2,3\}
> \}
> $$

**Two ways to verify you have all the subsets written**:
1. Find all possible combinations of cardinality 0 and slowly increase cardinality until you have the full power set.
2. Check cardinality of the finished power set: $|P(S)| = 2^{|S|}$

> **Common Pitfalls**:
> - Putting braces around $\emptyset$
> - Listing the same subset twice (e.g., $\{1,3\}$ and $\{3,1\}$)

# Operations on Sets

> For the following definitions, let:
> - $A$ and $B$ be sets.
> - $U$ be the universal set (contains everything, including $A$ and $B$).

## Union and Intersection

**Union ($\cup$)**: Set that contains all elements in either $A$ or $B$.
- Denoted by $A \cup B$.

> **Note**: The "or" in "$A$ or $B$" is inclusive. That is, every element in $A$, $B$, or $A$ and $B$ is part of $A \cup B$.

> **Example**:
> $$
> 	\text{Let } A = \{ 1,3,5,7,9\} \text{ and } B = \{ 3,7,9,10,15 \} \\~\\
>	\begin{aligned}
>		A \cup B &= \{ 1,3,5,7,9,10,15 \} \\
>	\end{aligned}
> $$

---

**Intersection ($\cap$)**: Set that contains all elements that are in both $A$ and $B$.
- Denoted by $A \cap B$. 

> **Example**:
> $$
> 	\text{Let } A = \{ 1,3,5,7,9\} \text{ and } B = \{ 3,7,9,10,15 \} \\~\\
>	\begin{aligned}
> 		A \cap B &= \{ 3,7,9 \}
>	\end{aligned}
> $$

## Disjoint, Complement, and Difference Sets

**Disjoint Sets**: If $A \cap B = \emptyset$, then $A$ and $B$ are **disjoint sets**.
- In other words, there or no elements in $A$ that are in $B$

> **Example**:
> $$
> A = \{1,2,3\} \text{ and } B = \{ 4,5,6 \} \text{ are disjoint sets}
> $$

---

**Complement Sets**: For a set $A \in P(U)$, the **complement** of set $A$—denoted as $A'$—is the set of all elements that aren't in $A$.
- In other words, $A'$ has *every* element not in $A$.

> **Mathematical Definition**:
> $$
> A' = \{
> 	x | x \in U \land x \not \in A
> \}
> $$

> **Example**: Let $U = \{ 1,2,3,4,5,6 \}$ and $A = \{ 1,2,3 \}$
> $$A'=\{4,5,6\}$$

---

**Difference Sets**: The **difference** of $A-B$ is the set of elements in $A$ that aren't in $B$.
- Aka: "Complement of $B$ relative to $A$."

> **Mathematical Definition**:
> $$
> A - B = \{
> 	x | x \in A \land x \not \in B
> \}
> $$

> **Example**: Let $A = \{ 1,2,3 \}$ and $B = \{2,5\}$
> $$A - B = \{1,3\}$$

## Exercises: Operations on Sets

Let—
$$
A = \{1, 2, 3, 5, 10\} \\
B = \{2, 4, 7, 8, 9\} \\
C = \{5, 8, 10\}
$$

—be subsets of $S = \{1, 2, 3, 4, 5, 6, 7, 8, 9, 10\}$.

Solve:
1. Q: $A \cup B$
	- A: { $1,2,3,4,5,7,8,9,10$ }
2. Q: $A - C$
	- A: { $1,2,3$ }
3. Q: $B' \cap ( A \cup C )$
	- A: { $1,3,5,10$ }
$$
\begin{aligned}
	B' &\cap (A \cup C) = \\
	B' &\cap \{ 1,2,3,5,8,10 \} = \\
	\{ 1,3,5,6,10 \} &\cap \{ 1,2,3,5,8,10 \} \\
	&\therefore B' \cap (A \cup C) = \{ 1,3,5,10 \}
\end{aligned}
$$
5. Q: $A \cup B \cap C$
	- A: $\emptyset$

# Cartesian Product

**Cartesian Product**: The Cartesian product of two sets is the set of all combinations of *ordered pairs* that can be produced from the elements of both sets.
- Fundamental to counting problems.

> **Mathematical Definition**:\
> If $A$ and $B$ are subsets of $S$, then:
> $$
> A \times B = \{
> 	(x,y) | x \in A \land y \in B
> \}
> $$

> **Example**:
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

> **Note**: Cardinality of cross product:
> $$
> |A| = n \\
> |B| = m \\~\\
> |A \times B | = nm
> $$

> **Note:** Notation for a special case:
> $$
> A \times A = A^2
> $$

> **Pitfall**: Cross product is not commutative:
> $$
> A \times B \ne B \times A
> $$
