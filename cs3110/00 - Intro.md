---
title: "Introduction"
---

# Textbook

> **Textbook**: *Introduction to the Theory of Computation*, by Michael Sipser (3rd Edition)

# Complexity, Computability, and Automata

> "What are the fundamental capabilities and limitations of computers?"

1. **Complexity Theory**: *Skipped by order of instructor*.
2. **Computability Theory**: Some basic problems cannot be solved by problems.
	- *e.g., a computer algorithm can't determine whether a mathematical statement is true of false*
3. **Automata Theory**: Deals with the definitions and properties of mathematical models of computation.
	- *e.g., finite automata are used in text processing, compilers, and hardware design; context-free grammars are used in programming languages and AI*

# Mathematical Notations and Terminology

## Set

**Set**: A collection of distinct objects (elements).

$$
\{ 1,2,3 \} \\
\tiny\textit{(represented with brackets)}
$$

> **Relevant Notes**: [CS1300 - Set Theory Basics](https://inevitabby.gitlab.io/notes/cs1300/07%20-%20Set%20Theory.html#set-theory-basics)
> 
> *[Things to know]{.underline}: Describing sets, union/intersection/complement, power set, cartesian product*

## Sequence

**Sequence**: A collection of distinct objects in some order.
- **Tuple**: A finite sequence.
- **$k$-tuple**: A sequence with $k$ elements.
- **Ordered Pair**: A 2-tuple

$$
( 1,2,3 ) \\
\tiny\textit{(represented with parenthesis)}
$$

> **Sets v.s. Sequences**:
> - Order doesn't matter in sets, but it does in sequences.
> - Repetition doesn't matter in sets, but it does in sequences.

## Functions

$$
g(x) = 2x, \forall x \in Z \\
D: Z \\
T: \{ y | y \text{ is even} \}
$$

**Function**: Objects that sets up an input-output relationship.
- *aka: Mapping*
- Can be described as sets of tuples.
- **Domain**: Set of function's possible inputs.
- **Range**: Set of function's possible outputs 
	* **Onto**: A function that uses all the elements of the range.
	* **Target**: 

$$
f: D \to R \\
\tiny\textit{Notation for saying $f$ has a domain $D$ and range $R$}
$$

> **Example**: Functions are sets of mappings
> 
> | D   | T    |
> |-----|------|
> | $A_1$ | Lily |
> | $A_2$ | Max  |
> | $A_2$ | Max  |
> 
> $$
> \{
> 	(A_1, Lily),
> 	(A_2, Max),
> 	(A_3, Max),
> \}
> $$

**Arguments**: A function's $k$-tuple input.
- **$k$-ary function**: Function with $k$ arguments.
	* **arity**: $k$
- **Binary Function**: $k=2$
	- Some binary functions are written in special infix notation rather than prefix.

**Predicate**: Function whose range is $\{\text{TRUE}, \text{FALSE}\}$.
- *aka: Property*
- *e.g., $even(4) = \text{TRUE}$, $even(5) = \text{FALSE}$, ...*

**Relation**: A predicate whose domain is a set of $k$-tuples.
- *aka: $k$-ary relation, $k$-ary relation on $A$*
- **Binary Relation**: A 2-ary relation.
	* Written in infix.
	* *e.g., "less than" is a binary relation ($2 < 5$)*
- **Equivalence Relation**: A special binary relation that captures the notion of two objects being equal in some feature.

> **Equivalence Relation Definition**: A binary relation $R$ is an equivalence relation if:
> 1. $R$ is reflexive if for every $x$, $xRx$
> 2. $R$ is symmetric if for every $x$, $xRy$ implies $yRx$
> 3. $R$ is reflexive if for every $x$, $y$, and $z$, $xRx$ and $yRx$ implies $xRz$

<!--
Take the Cartesian product of the domain and target.

$$
D \times T =
\{
	(d,t) | (d \in D ) \land (t \in T )
\}
$$

If $|D| = 2$ and $|T| = 3$, the resulting set will have $2 \times 3 = 6$ elements.
- This is the product rule. (see: counting rules from discrete

$$
| D \times T | = | D | \times | T |
$$

$$
R : D \to T \subseteq D \times T
$$
-->

## Graphs

**Graph**: Set of nodes with edges connecting some of them.
- **Degree**: The number of edges at a particular node.
- **Labeled Graph**: A graph with the nodes and/or edges labeled.
	* *e.g., city map*
- **Subgraph**: Graph $G$ is a subgraph of $H$ if all the nodes of $G$ are a subset of $H$, and G's edges are also in $H$.

**Directed Graph**: Graph where the edges have directions.
- **Indegree**: The number of arrows pointing to a particular node.
- **Outdegree**: The number of arrows pointing from a particular node.
- "**Strongly Connected**": When a directed path connected every two nodes. 

> **Formally Describing Graphs:**
> - Graphs are described as $G = (V, E)$, where $V$ is the set of nodes and $E$ is the set of edges, represented as pairs like $(i, j)$.
>	 - For $E$, order of $i$ and $j$ only matters in a directed graph.
> $$
> G = (\{1, 2, 3\}, \{ (1,2), (2,3), (3,1) \}) \\
> \tiny\textit{Example graph description}
> $$

**Path**: Sequence of nodes connected by edges.
- **Simple Path**: Path that doesn't repeat any nodes.
- **Cycle**: Path that starts and ends on the same node.
- **Simple Cycle**: Cycle that contains at least three nodes and repeats only the first and last nodes.
- **Directed Path**: Path in which all arrows of a directed graph point the same direction as its steps.

More Graph Types:
1. **Connected Graph**: Every two nodes has a path between them.
2. **Tree**: A connected graph with no simple cycles.

> **When are Directed Graphs Useful?**
> - Directed graphs are good at depicting binary relations.

## Strings and Languages

**Alphabet**: Any nonempty finite set.
- **Symbols**: The members of an alphabet.
- *Denoted by Sigma or Gamma in typewriter font.*

$$
\Sigma_1 = \{ \texttt{b,c,d,f,g,h,j,k,l,m,n,p,q,r,s,t,v,w,x,y,z} \} \\
\tiny\textit{An example alphabet}
$$

**String over an Alphabet**: A finite [sequence]{.underline} of symbols from that alphabet.
- *e.g., If $\Sigma_1 = \{ \texttt{ U, W } \}$, then $\texttt{UWU}$ is a string over $\Sigma_1$*

> **Note**: Strings are tuples.
> 
> $$
> \texttt{MARIO} = (M, A, R, I, O)
> $$

More on Strings:
- **Length** ($|w|$): The number of symbols a string over $\Sigma$ contains.
- **Empty String** ($\epsilon$): String of length zero.
- **Substring**: String $z$ is a substring of $w$ if $z$ appears consecutively within $w$.
	* *e.g., $\texttt{MAN}$ is a substring of $\texttt{MANIPULATOR}$*
- **Concatenation**: The concatenation of string $x$ and $y$ is written as $xy$, and is obtained by appending $y$ to $x$.
	* To concatenate a string with itself $k$ times, use $x^k$

Ordering Strings:
- **Lexicographic Order**: Directionally order.
- **Shortlex Order**: Identical to lexicographic order, except shorter strings precede longer strings.
	* aka: String order

> **Example of Shortlex Order**: Shortlex order of all strings over the alphabet $\{ \texttt{ U, W } \}$
> 
> $$
> (\epsilon,\texttt{ U},\texttt{ W},\texttt{ UU},\texttt{ UW},\texttt{ WU},\texttt{ WW},\texttt{ UUU},...)
> $$

**Prefix**: String $x$ is a prefix of string $y$ if a string $z$ exists where $xz = y$
- **Proper-Prefix**: If, in addition to the above, $x \ne y$.

**Language**: A set of strings.
- **Prefix-Free**: No member is a proper prefix of another member.

## Boolean Logic

**Boolean Logic**: Mathematical system built around `TRUE` and `FALSE`.

> **Relevant Notes**: [CS1300 - Formal Logic](https://inevitabby.gitlab.io/notes/cs1300/01%20-%20Formal%20Logic.html)
> 
> *[Things to know]{.underline}: Binary connectives ($\land$, $\lor$, $\leftrightarrow$), tautological equivalence between $\rightarrow$ and $\lor$, binary operations, distributive law*
> - The only uncovered operation is XOR (exclusive or) $\oplus$.

All Boolean operations can be rewritten in terms of AND and NOT operations.

> **Example**:
> $$
> \begin{align*}
> 	P \lor Q \qquad & \qquad  (P' \land Q')' \\
> 	P \to Q \qquad & \qquad P' \lor Q \\
> 	P \leftrightarrow Q \qquad & \qquad ( P \to Q ) \land (Q \to P) \\
> 	P \oplus Q \qquad & \qquad (P \leftrightarrow Q)'
> \end{align*}
> $$

> **Distributive Law**:
> - $P \land (Q \lor R) = (P \land Q) \lor (P \land R)$
> - $P \lor (Q \land R) = (P \lor Q) \land (P \lor R)$

> **In-Class Whiteboard**: Reviewing logic
> 
> 
> | $p$ | $q$ | $p \to q$ | $q \to p$ | $p' \to q'$ | $q' \to p'$ |
> |-----|-----|-----------|-----------|-------------|-------------|
> | F   | F   | T         | T         | T           | T           |
> | F   | T   | T         | F         | F           | T           |
> | T   | F   | F         | T         | T           | F           |
> | T   | T   | T         | T         | T           | T           |
> 
> - *Remember: If $p$ is false, we assume $p \to q$ to be true.*
>
> Observations:
> - These are functions, and functions are sets of tuples.
> - $p \to q = q' \to p'$: Contrapositive is logically equivalent to the original condition.
> - The converse $q \to p$ is not equivalent to the original.
> - The inverse $p' \to q'$ is equivalent to the converse.
> 
> > Sub-Question: Why are there four rows?
> > 
> > $q$ and $p$ are sets of true and false.
> > 
> > $$
> > q,p \in B = \{F, T\}
> > $$
> > 
> > The possible outputs is $| B^2 | = 2^2 = 4$

# Definitions, Theorems, and Proofs

# Types of Proofs

> In this course we'll need to know proof by contradiction.

# 1/27/25


