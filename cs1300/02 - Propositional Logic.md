---
title: "Propositional Logic"
---

# Propositional Logic

**Propositional Logic**: Deriving a logical conclusion by combining many propositions and using formal logic: Hence, determining the truth of arguments.

**Argument**: A sequence of statements in which the conjunction of the initial statements (the premises, hypothesis) is said to imply the final statement (conclusion)

> Symbolic representation of an argument: $(P_1 \land P_2 \land P_{...} \land P_n) \rightarrow Q$
> - Where $P_n$ are the hypothesis, and $Q$ is the conclusion
> 
> Example of a logically correct argument:
> - $P_1$: $A \rightarrow B$
> - $P_2$: $B \rightarrow C$
> - $Q$: $A \rightarrow C$

**Valid Argument**: Whenever the truth of hypothesis ($P_n$) leads to the conclusion ($Q$).
- Alt: A well-formed formula that is intrinsically true whenever $P_n$ is true.

> Example of an invalid argument
> - $P_1$: Neil Armstrong was the first human to land on the moon
> - $P_2$: Mars is red
> - $Q$: No humans have ever landed on Mars

# Proof Sequence (How to Arrive at a Valid Argument)

**Proof Sequence**; A sequence of well-formed formula in which each well-formed formula is either a hypothesis or the result of applying on the formal system's derivation rules to earlier well-formed formulas in the sequence.

> Example of Proof in Propositional Logic: Prove $(A \to B) \land A \to B$:
> - $A \to B$: hyp
> - $A$: hyp
> - $B$: 1,2 mp

# Rules for Propositional Logic

Derivation rules for propositional logic:

| Equivalence Rules                                      | Inference Rules                               |
| ---                                                    | ---                                           |
| Allows individual well-formed formulas to be rewritten | Allows new well-formed formulas to be derived |
| Truth-preserving rules                                 | Work only in one direction                    |

> **Professor's Note**: Knowledge of all of these rules is vital and will become natural through experience.

## &#9733; Equivalence Rules

*(Let $R$ and $S$ be statement variables)*

| Expression                                 | Equivalent to                              | Abbreviate for Rule         |
| ---                                        | ---                                        | ---                         |
| $R \lor S$                                 | $S \lor R$                                 | Commutative, comm.          |
| $(R \lor S) \lor Q$; $(R \land S) \land Q$ | $R \lor (S \lor Q$); $R \land (S \land Q)$ | Associative, ass.           |
| $(R \lor S)'$; $(R \land S)'$              | $R' \land S$; $R' \lor S'$                 | De-Morgan's Laws, dm        |
| $R \to S$                                  | $R' \lor S$                                | Implication, Imp            |
| $R$                                        | $(R')'$                                    | Double Negation, dn         |
| $P \leftrightarrow Q$                      | $(P \to Q) \land (Q \to P)$                | Equivalence, equ            |

> Example of using equivalence rule in part of a proof sequence:
> 
> Problem: Simplify $(A ' \lor B') \lor C$
> 1. $(A ' \lor B') \lor C$
> 2. $(A \land B)' \lor C$; 1, De Morgan
> 2. $(A \land B) \to C$;	2, De Morgan

> **Professor's Note**: When working on proofs there are no hard-and-fast rules. Trial and error, reason backward and forward, rearrange things to look at them differently, etc.

## &#9733; Inference Rules

*(Let $R$ and $S$ be statement variables)*

| From                              | Can Derive  | Abbreviation for Rule |
| ---                               | ---         | ---                   |
| $R$, $R \to S$                    | $S$ is true | Modus Ponens; mp      |
| $R \to S$, $S'$                   | $R'$        | Modus tollens, mt     |
| $R$, $S$                          | $R \land S$ | Conjunction; con      |
| $R \land S$                       | $R, S$      | Simplification; sim   |
| $R$                               | $R \lor S$  | Addition; add         |

> **Note**: Reading the "From" column, each statement is assumed to be true.

> **Example**: "If it is bright and sunny today, then I will wear my sunglasses"
> 1. Modus Ponens: It is bright and sunny today. Therefore, I will wear my sunglasses.
> 2. Modus Tollens: I will not wear my sunglasses. Therefore, it is not bright and sunny today.

> **Example**: Prove $(A \to B) \land (B \to C) \land A \to C$
> 1. $A \to B$; hyp
> 2. $B \to C$; hyp
> 3. $A$; hyp
> 4. $B$; 1,3, mp
> 5. $C$; 2,4, mp
> 
> ***Professor's Note**: Every line you write down is assumed or derived to be true*
> - *We only look at the first level of conjunction for getting our hypothesis*
> 
> *Note: Everything to the left of the main implication are the hypothesis ($P_n$)*

> **Example**: Prove $((A \land B) \to C) \land C' \to A' \lor B'$
> 1. $C'$; hyp
> 2. $(A \land B \to C)$; hyp
> 3. $(A \land B)'$; 1, 2, mt
> 4. $A ' \lor B'$; 3, dm

## Deduction Method

To prove an argument of the form:
- $P_1 \land P_2 \land ... \land P_3 \to (R \to Q)$
	* This form is called a **hypothetical syllogism**

Deduction method allows for the use of $R$ as an additional hypothesis and thus prove:
- $P_1 \land P_2 \land ... \land P_n \land R \to Q$

> **Example**: Prove $(A \to B) \land (B \to C) \to (A \to C)$
> 
> By deduction method, prove:
> 
> $(A \to B) \land (B \to C) \land A \to C$
> 1. $A \to B$; hyp
> 2. $B \to C$; hyp
> 3. $A$; hyp
> 4. $B$; 1, 3 mp
> 5. $C$; 2, 4 mp

## &#9733; More Inference Rules

(These rules can be derived using the previous rules. Memorizing these allow us to solve proofs with fewer steps.)

| From                 | Can Derive                     | Abbreviation               |
| ---                  | ---                            | ---                        |
| $P \to Q$, $Q \to R$ | $P \to R$                      | Hypothetical syllogism; hs |
| $P \lor Q$, $P'$     | Q                              | Disjunctive syllogism; ds  |
| $P \to Q$            | $Q' \to P'$                    | Contraposition; cont       |
| $Q' \to P'$          | $P \to Q$                      | Contraposition; cont       |
| $P$                  | $P \land P$                    | Self-reference; self       |
| $P \lor P$           | $P$                            | Self-reference; self       |
| $(P \land Q) \to R$  | $P \to (Q \to R)$              | Exportation; exp           |
| $P$, $P'$            | $Q$                            | Inconsistency; inc         |
| $P \land (Q \lor R)$ | $(P \land Q) \lor (P \land R)$ | Distributive; dist         |
| $P \lor (Q \land R)$ | $(P \lor Q) \land (P \lor R)$  | Distributive; dist         |

# More on Inference Rules

> **Some Notes**:
> - Exportation is essentially deduction method
> - Inconsistency basically says, "if there is a logical contradiction, anything can be true"

> **Reminder**:
> Only a couple inference rules are bidirectional, most are one-directional
> * Why aren't these bidirectional inference rules equivalence rules? Idk.

## Examples: Solving Proofs

<!--(This was a cop-out, I decided to be a smart-ass instead of typing out all the steps on the board)
> **Example: Proving Contraposition**
> - Prove that $(P \to Q) \to (Q' \to P')$ is a valid argument.
> 	- Hence, prove $(P \to Q) \land Q' \to P'$ (deduction method)
> 1. $(P \to Q)$, hyp
> 2. $Q'$, hyp
> 3. $P'$, 1,2, mt
-->

> **Example: Proving Inconsistency**
> - Prove $P \land P' \to Q$ (inconsistency rule)
> 1. $P$, hyp
> 2. $P'$, hyp
> 3. $P \lor Q$, 1, add
> 4. $Q$, 3, 2, ds
> 
> - Alternative solution, if we didn't use disjunctive syllogism
> 1. $P$, hyp
> 2. $P'$, hyp
> 3. $P \lor Q$, 1, add
> 4. $Q \lor P$, 3, comm
> 5. $(Q')' \lor P$, 4, dn
> 6. $Q' \to P$, 5, imp
> 7. $(Q')'$, 2, 6, mt
> 8. $Q$, 7, dn

> **Example**:
> - Prove $A \land (B \to C) \land [ (A \land B) \to (D \lor C') ] \land B \to D$
> 1. $A$, hyp
> 2. $B \to C$, hyp
> 3. $(A \land B) \to (D \lor C')$, hyp
> 4. $B$, hyp
> 5. $C$, 2,4, mp
> 6. $A \land B$, 1, 4, con
> 7. $D \lor C'$, 3,6, mp
> 8. $D$, 5,7, ds
>	- $\uparrow$ Explaining Disjunctive Syllogism (*ds*): "We know that $D$ or $C'$ MUST be true, and since we already know that $C$ is true, we know that $D$ must be true." 

> **Professor's Note**: Stay focused on the result. A longer path is fine so long as it is a correct path.

> **Example**:
> - Prove $(B \to A') \land (B' \to A') \to A'$
> 1. $B \to A'$, hyp
> 2. $B' \to A'$, hyp
> 3. $A \to B$, 3, cont
> 4. $A \to A'$, 1, 3, hs
> 5. $A' \lor A'$, 4, imp
> 6. $A'$, 5, self

> **Professor's Tip**: Turning implications ($\to$) to disjunctions ($\lor$) (implication rule) gives us more blocks to play with.

# Exercises: Writing & Proving Verbal Arguments

> **Instructions**: Rewrite each verbal argument as a wff, then validate the wff.

**Problem I**: *"Russia was a superior power, and either France was not strong or Napoleon made an error. Napoleon did not make an error, but if the army did not fail, then France was strong. Hence the army failed and Russia was a superior power."*

Let the statement variables be defined as:
- $A$: *"Russia was a superior power"*
- $B$: *"France was strong"*
- $B'$: *"France was not strong"*
- $C$: *"Napoleon made an error"*
- $C'$: *"Napolean did not make an error"*
- $D$: *"The army failed"*
- $D'$: *"The army did not fail"*

Translation:
$[ A \land (B' \lor C)] \land [C' \land (D' \to B)] \to (D \land A)$

Proof:
1. $A \land (B' \lor C)$, hyp
2. $C' \land (D' \to B)$, hyp
3. $A$, 1, sim
4. $D' \to B$, 2, sim
5. $B' \lor C$, 1, sim
6. $C'$, 2, sim
7. $B'$, 5, 6, ds
8. $D$, 4, 7, mt
9. $(D \land A)$, 3, 8, con

---

**Problem II**: *"If the program is efficient, it executes quickly. Either the program is efficient, or it has a bug. However, the program does not execute quickly. Therefore it has a bug. *E, Q ,B*"* 

Let the statement variables be defined as:
- $E$: *"The program is efficient"*
- $Q$: *"It executes quickly"*
- $B$: *"It has a bug"*

Translation:
$( E \to Q ) \land (E \lor B) \land (\lnot Q \to B)$

By deduction method, prove $( E \to Q ) \land (E \lor B) \land \lnot Q \to B$:
1. $E \to Q$, hypothesis
2. $E \lor B$, hypothesis
3. $\lnot Q$, hypothesis
4. $\lnot E$, 1,3 modus tollens
5. $B$ 2,4 disjunctive syllogism

---

**Problem III**: *"The crop is good, but there is not enough water. If there is a lot of rain or not a lot of sun, then there is enough water. Therefore the crop is good and there is a lot of sun. *C, W, R, S*"*

Let the statement variables be defined as:
- $C$: *"Crop is good"*
- $W$: *"There is enough water"*
- $R$: *"There is a lot of rain"*
- $S$: *"There is a lot of sun"*

Translation:
$(C \land W') \land [(R \lor S') \to W] \to (C \land S)$

Proof:
1. $C \land W'$, hypothesis
2. $(R \lor S') \to W$, hypothesis
3. $W'$, 1 simplification
4. $C$, 1 simplification
5. $(R \lor S')'$ 2,3 disjunctive syllogism
6. $R' \land S$ 5 de-morgan
7. $S$ 6 simplification
8. $C \land S$ 4,7 conjunction

