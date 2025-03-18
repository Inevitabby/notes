---
title: "Relations"
---

# The Job Market

People laid off post-Covid are now competing with fresh graduates.

Even 2008 was different, because every sector got affected. Right now, it's mainly the tech sector.

Internship Advice: Keep trying
- Optimal time window is **before** October
	* Tech recruitment cycle is important to keep in mind

# Binary Relations

Given a set $S$, a **binary relation** on $S$ is a subset of $S \times S$
- Certain ordered pairs of objects have relationships.
- A binary relation has the property that:

$$
x \rho y \leftrightarrow (x,y) \in \rho
$$

The notation $x \rho y$ implies that the ordered pair $(x,y)$ satisfies the relationship $\rho$.
- e.g., $x \rho y \leftrightarrow x = \frac{1}{2y}$

Suppose $S = \{ 1,2,4 \}$, the Cartesian product of $S$ with itself is:
- $S \times S = \{(1,1),(1,2),(1,4),(2,1),(2,2),(2,4),(4,1),(4,2),(4,4)\}$
- The subset of $S \times S$ satisfying the relation $x \rho y \leftrightarrow x = \frac{1}{2y}$, is: $\{(1,2),(2,4)\}$

> **Problem**: What is the set where $\rho$ on $S$ is defined by $x \rho y \leftrightarrow x + y$ is odd where $S = \{1,2\}$?
> - Answer: The set for $\rho$ is $\{(1,2),(2,1)\}$

# Relations on Multiple Sets

Given two sets $S$ and $T$, a **binary relation from S to T** is a subset of $S \times T$.
- Given $n$ sets $S_1, S_2, ..., S_n$ for $n > 2$, an $n$-ary rellation on $S_1 \times S_2 \times ... \times S_n$ is a subset of $S_1 \times S_2 \times ... \times S_n$

---

For example, suppose—
$$
S_1 = \{ 1,2,3 \} \qquad
S_2 = \{ 2,3,4 \} \qquad
S_3 = \{ 3,4,5 \}
\\~\\
\rho: (x,y,z) \leftrightarrow x < y < z
$$

—then the set representation of $\rho$ is:
$$
\rho: \{\\
	(1,2,3), (2,3,4) , (3,4,5),\\
	(1,2,4), (1,2,5), (1,3,4), (1,3,5), (1,4,5),\\
	(2,3,5), (2,4,5)
\\\}
$$

# Types of Relationships

**One-to-one**: If each first component and each second component only appear once in the relation.
- e.g., $\{(2,4),(6,8)\}$

**One-to-many**:If a first component is paired with more than one second component.
- e.g., $\{(2,4),(2,8)\}$

**Many-to-one**: If a second component is paired with more than one first component.
- e.g., $\{(2,4),(6,4)\}$

**Many-to-many**: If at least one first component is paired with more than one second component and at least one second component is paired with more than one first component.
- e.g., $\{(3,4)(2,4),(2,3)\}$

## Examples

Identify the relationships:
1. $\{ (5,2),(7,5),(9,2) \}$
	- Many-to-one
2. $\{ (2,5),(5,7),(7,2) \}$
	- One-to-one
3. $\{ (7,9),(2,5),(9,9),(2,7) \}$
	- Many-to-many

# Properties of Relations

> Note: For the examples, suppose $S = \{ 1,2,3 \}$

**Reflexive**: $(\forall x)[x \in S \to (x,x) \in \rho]$
* Ex: $\rho = \{ (1,1),(2,2),(3,3) \}$
* *Note: You need to use every item in $S$ to be reflexive*

**Symmetric**: $(\forall x)(\forall y)[ x \in S \land y \in S \land (x,y) \in \rho \to (y,x) \in \rho ]$
* Ex: $\rho = \{ (1,1),(1,3),(3,1),(2,2),(3,3) \}$

**Transitive**: $(\forall x)(\forall y)(\forall x)[ x \in S \land y \in S \land X \in S \land (x,y) \in P \land (y,z) \in \rho \to (x,z) \in \rho ]$
- Ex: $\rho = \{ (1,2), (2,3), (1,3) \}$
- Ex: $\rho = \{ (1,3), (3,1), (1,1) \}$
- Note: When determining if a set if transitive, we just need to find one pair of $(x,y),(y,z)$ without an $(x,z)$ (counterexample)

**Antisymmetric**: $(\forall x)(\forall y)[x \in S \land y \in S \land (x,y) \in \rho \land (y,x) \in \rho \to x = y]$
- Ex: $\rho = \{ (1,1) \}$
- Ex: $\rho = \{ (1,1),(1,2) \}$
- Ex: $\rho = \{ (1,2) \}$

> **Note**: Symmetric and antisymmetric aren't complements. A set can be neither, or both.
> - Ex (Both): $\{ (1,1),(2,2) \}$

# Example

Example: Consider the relation $\le$ on the set of natural numbers: $\{(0,1),(0,0),(1,1),(0,2),(2,2)\}$
- Reflexive: True ($x \le x$)
- Symmetric: False ($x \le y \not \to y \le x$)
- Transitive: True ($x \le y \land y \le z \to x \le z$)
- Antisymmetric: True ($x \le y \land y \le x \to x = y$)

# Closure of Relations

**Closure of a Relation**: A binary relation $\rho *$ on set $S$.
- $\rho$ on $S$ with respect to property $P$ if:
	* $\rho *$ has the property $P$
	* $\rho \subseteq \rho *$
	* $\rho *$ is the subset of any other relation on$S$ that includes $\rho$ and has the property $P$
	
**Example**: Let $S = \{1,2,3\}$ and $\rho = \{(1,1),(1,2),(1,3),(3,1),(2,3)\}$
- This is not reflexive, transitive, or symmetric. Find the closures for each.

Closures:
- $\rho *$ with respect to reflexivity:
	- $\{(1,1),(1,2),(1,3),(3,1),(2,3),(2,3),(3,3)\}$
		* Alternative, simpler notation: $\rho  \cup \{(2,3),(3,3)\}$
- $\rho *$ with respect to symmetry:
	* $\rho \cup \{(2,1),(3,2)\}$
- $\rho *$ with respect to transitiveness:
	* We ignore $(1,1)$ because it contributes nothing to being transitive.
	* For every new pair you find, you have to check if they need their own new pairs.
	* $\rho \cup \{(3,2),(2,1),(3,3),(2,2)\}$
