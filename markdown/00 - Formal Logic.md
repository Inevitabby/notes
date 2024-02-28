
# Formal Logic

**Formal Logic**: Foundation for organized and careful method of thinking that characterizes reasoned activity. 
- The study of reasoning, specifically whether something is true or false.

Applications:
- **Prolog**: Programming languages based on logic.
- Proving a program will perform the way as it is designed.

# Statement

**Statement / Proposition**: A sentence that is either true or false.
- We often use **statement letters** to represent statements, using letters near the beginning of the alphabet

Examples of Valid Statements (crossed-out aren't valid):
- "All mathematician wear sandals"
- "5 is greater than -2"
- ~~"Where do you live?"~~
- ~~"Are you a cool person?"~~
- "Anyone who wears sandals is an algebraist"

# Logic

Logical methods are used to prove that programs do what they are designed to do.

Example of a Logically-Sound Proof/Derivation:
1. All mathematicians wear sandals
2. Anyone wears sandals is an algebraist
3. Therefore, all mathematicians are algebraists

## Binary Connectives

- **Logical Connective ($\land$)**: "And" statement
	* e.g., $A \land B$ is the **conjunction** of $A$ and $B$. $A$ and $B$ are the **conjuncts**
- **Logical Disjunction ($\lor$)**: "Or" statement
	* e.g., $A \lor B$ is the **disjunction** of $A$ and $B$. $A$ and $B$ are the **disjuncts**
- **Logical Negation ($\neg$, $`$)**: "Negation" statement; "Not" statement
	* note: When negating statements use De Morgan's law

> Example of Logical Connective and Disjunction:
> 
> | $A$   | $B$   | $A \land B$ | $A \lor B$ |
> | :---: | :---: | :---:       | :---:      |
> | T     | T     | T           | T          |
> | T     | F     | F           | T          |
> | F     | T     | F           | T          |
> | F     | F     | F           | F          |

- **Logical Implication ($\rightarrow$)**: "If Then" statement; "$A$ implies $B$" statement
	* e.g., $A \rightarrow B$ is the **implication** of $A$ and $B$. $A$ is the **antecedent/hypothesis** statement and $B$ is the **consequent/conclusion** statement
		+ By convention, if $A$ is false, we say $A \rightarrow B$ is true because we can't claim it was false
- **Equivalence Connective ($\leftrightarrow$)**: "Equals" statement; "If and only if" statement
	* Unlike $\land$, $\lor$, or $\rightarrow$, this connective isn't actually a fundamental connective. We can represent equivalence with $(A \rightarrow B) \land (B \rightarrow A)$

> Example of Logical Implication and Equivalence Connective:
> 
> | $A$   | $B$   | $A \rightarrow B$ | $B \rightarrow A$ | $(A \rightarrow B) \land (B \rightarrow A)$ |
> | :---: | :---: | :---:             | :---:             | :---:                                       |
> | T     | T     | T                 | T                 | T                                           |
> | T     | F     | F                 | T                 | F                                           |
> | F     | T     | T                 | F                 | F                                           |
> | F     | F     | T                 | T                 | T                                           |

# Truth Table

Table that displays the truth values of a statement which correspond to the different combinations of truth values for the variables.

General Structure:
- First columns list all possible values of the statement letters
	* For $n$ statement letters, there will be $2^n$ rows
- Last columns list all possible values of the statement(s)
- Intermediate columns may list intermediate steps

# Example: Tautological Equivalence with $\rightarrow$ and $\lor$

"If you do your homework, then you will fail"
- $A` \rightarrow B$

"Either you do your homework or you will fail"
- $A` \lor B$

$A` \rightarrow B$ and $A` \lor B$ are tautologically equivalent.
- *(do the truth table to see, I'm too lazy to type it out)*

# Well-Formed Formula (WFF)

**Well-Formed Formula**: A combination of letters, connectives, and parenthesis in a meaningful expression.

# Priority of Connectives

1. Innermost Parenthesis (progress outwards)
2. Negation ($\lnot$)
3. Conjunction ($\land$)
4. Disjunction ($\lor$)
5. Implication ($\rightarrow$)
6. Equivalence ($\leftrightarrow$)

# De Morgan's Laws

**De Morgan's Law**: A pair of transformation rules that allows us to negate statements

Examples:
- $( A \lor B ) \leftrightarrow  A' \land B'$
- $( A \land B )' \leftrightarrow  A' \lor B'$

Notes:
- $A$ to $A'$
- $\land$ to $\lor$, and vice versa.

> **Note**: This can be verified through truth tables, not that I care enough to type it out.

# Recap: Making a Truth Table

1. Create columns:
	1. Start with statement variables ($A, B$, etc.)
	2. Intermediate values (parts of the well-formed formula)
		- Use personal taste for how much you want to split-up the problem
	3. End with the target well-formed formula.
2. List all truth value combinations for statement variables
	- For $n$ statement variables, there should be $2^n$ rows
3. Solve for each row.

> **Note**: Truth tables get graded in the test/homework by whether the target truth values are correct
> - Points won't get taken off for a lack of intermediate values.
>	- If the target truth value is wrong, the intermediate values will be used to give partial credit, though.
> - Proper structure is 50% of the grade (e.g., having all statement variables)

# Tautology and Contradiction

> **Note**: To simplify statements, we use letters near the end of the alphabet, by convention usually $P$ and $Q$.
> - e.g., $( A \land B )' \rightarrow  A' \lor B'$ getting rewritten as $P \rightarrow Q$

**Tautology**: A well-formed formula that is always true.

**Contradiction**: A well-formed formula that is always false.

> **Note**: Mathematicians call tautologies and contradictions "intrinsically true" and "intrinsically false", respectively.

# Tautological Equivalence

**Logical Equivalence**: Two statements are *logically equivalent* if, and only if, they have identical truth for every possible combination of statement variables.

We can write logical equivalence with $\Leftrightarrow$ and $\equiv$, like so:
- $P \Leftrightarrow Q$
- $P \equiv Q$

# Common Equivalences

| Communicative    | $A \lor B \equiv B \lor A$                   | $A \land B \equiv B \land A$                     |
| :---:            | :---:                                        | :---:                                            |
| **Distributive** | $(A \lor B) \lor C \equiv A \lor (B \lor C)$ | $(A \land B) \land C \equiv A \land (B \land C)$ |
| **Identity**     | $A \lor 0 \equiv A$                          | $A \land 1 \equiv A$                             |
| **Component**    | $A \lor A' \equiv 1$                         | $A \land A' \equiv 0$                            |

Further Explanation:
- Component: If you combine two statements that are the inverse of each other, you may cover all cases or none of them.
- Identity: `True || False === True`, `True && True === True`

# Statements in Programs

Conditional statements in programming use logical connectives with statements.
- e.g., This pseudocode:
```c
if (outflow > inflow) and not (pressure 1000)
	do something;
else
	do something else
```

# In-Class Exercise

## Negation

Problem: Negate the following statements:
1. If the processor is fast, then the printer is slow
2. Either the processor is fast or the printer is slow

Thinking:
1. If the processor is not fast, then the printer is slow...
	- $(A \rightarrow B)' \equiv A' \rightarrow B$
	- $(A \rightarrow B)' \equiv A \rightarrow B'$
	- $(A \rightarrow B)' \equiv A' \rightarrow B'$
	- $B' \rightarrow A$
	- ... which one is right? We need De Morgan's law!
2. $(A \lor B)$

Solution:
1. Change "if then" to "or", then apply De Morgan's law
	- $(A \rightarrow B) \equiv (A' \lor B)' \equiv A \land B'$
2. Apply De Morgan's: $(A \lor B)' \equiv A' \land B'$

Valid Answers:
1. The processor is fast and the printer is not slow.
2. The processor is not fast and the printer is fast

## Rewriting

Problem: Translate the following using $A$, $T$, and $E$.
- "Tax rates will be reduced only if Anita wins the election and the economy remains strong"

Solution:
1. $A$: "Anita wins the election"
2. $T$: "Tax rates will be reduced"
3. $E$: "Economy remains strong"
4. $T$ only if ( $A$ and $E$ )
5. $T \rightarrow (A \land E)$

Notes:
- "only if" points is unidirectional ($\rightarrow$)
- "if and only if" is bidirectional ($\leftrightarrow$)
