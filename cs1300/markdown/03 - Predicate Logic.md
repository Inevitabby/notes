# Class Exercises

> **Instructions**: Rewrite each verbal argument as a wff, then validate the wff.

"If the program is efficient, it executes quickly. Either the program is efficient, or it has a bug. However, the program does not execute quickly. Therefore it has a bug. *E, Q ,B*" 

Let the statement variables be defined as:
- $E$: The program is efficient
- $Q$: It executes quickly
- $B$: It has a bug

$( E \to Q ) \land (E \lor B) \land (\lnot Q \to B)$

By deduction method, prove $( E \to Q ) \land (E \lor B) \land \lnot Q \to B$:
1. $E \to Q$, hypothesis
2. $E \lor B$, hypothesis
3. $\lnot Q$, hypothesis
4. $\lnot E$, 1,3 modus tollens
5. $B$ 2,4 disjunctive syllogism

---

"The crop is good, but there is not enough water. If there is a lot of rain or not a lot of sun, then there is enough water. Therefore the crop is good and there is a lot of sun. *C, W, R, S*"

Let the statement variables be define as:
- $C$: Crop is good
- $W$: There is enough water
- $R$: There is a lot of rain
- $S$: There is a lot of sun

$(C \land W') \land [(R \lor S') \to W] \to (C \land S)$
1. $C \land W'$, hypothesis
2. $(R \lor S') \to W$, hypothesis
3. $W'$, 1 simplification
4. $C$, 1 simplification
5. $(R \lor S')'$ 2,3 disjunctive syllogism
6. $R' \land S$ 5 de-morgan
7. $S$ 6 simplification
8. $C \land S$ 4,7 conjunction

> "Yeah I'm getting a zero on this homework"
> 
> — A classmate who has tried nothing, given up, and blames the professor

# Predicate Logic

## Variables, Incomplete Statements, Quantifiers, Predicate, Interpretation Domain

How do you translate "For every integer x, x>0"?

Variables in Logic:
- **Variable**: Lowercase symbol that stands for an individual in a collection or set.
- e.g., The variable $x$ may stand for one of the days. We may let $x$ = Monday or $x$ = Tuesday, etc.

**Incomplete Statements**: Sentence containing a variable
- Is about the individuals in a definite domain or set.
- When we replace the variable by the name of an individual in the set we obtain a statement about that individual.
	* e.g., The truth of the incomplete statement "$x$ has 30 days" isn't known until $x$ gets plugged in (i.e., "April has 30 days")

> **Tip**: Replace the word "set/domain" with "array/list" if you have a programming background.

**Quantifiers**: Phrases that refer to given quantities, indicating how many objects have a certain property
- e.g., "for some", "for all", "for every"
- There are two kinds of quantifiers:
	1. Universal Quantifier ($\forall$):
		- "For all", "given any", "for each", "for every"
	2. Existential Quantifier ($\exists$):
		- "For some", "there exists", "there is a", "for at least one"

**Predicate:** Verbal statement that describes the property of a variable.
- Usually represented as $P$. Notation $P(x)$ is used to represent some unspecified property of predicate that $x$ may have. e.g.,
	* $P(x) = x$ has 30 days.
	* $P($April$)=$ April has 30 days

Combining the quantifier and predicate, we get a **complete statement** of the form:
- $(\forall x) P(x)$ or $(\exists x) P(x)$.

**Interpretation Domain**: Collection of objects that may be chosen.
- e.g., In homework if we are told "for an integer $x$", we know that we can only plug integers into $x$.

## Truth Value of Complete Statements

**The truth of an expression is based on its interpretation.**

Examples for various interpretations of $(\forall x) P(x)$:
- $P(x)$ is the property that $x$ is yellow, and the domain of interpretation is the collection of all flowers (`false`)
- $P(x)$ is the property that $x$ is a plant, and the domain of interpretation is the collection of all flowers (`true`)
- $P(x)$ is the property that $x$ is positive, and the domain of interpretation is the collection of integers (`false`)

> **Note on Contradiction**: If $(\forall X) P(x)$ is true, $(\exists X) P(x)$ cannot be false

## Interpretation

An interpretation for an expression involving predicates consists of the following:
- A collection of objects (domain of interpretation), which must include at least one object.
- An assignment of a property of the objects in the domain to each predicate in  the expression.
- An assignment of a particular object to each constant symbol in the expression.

## $n$-ary Predicates

**Unary Predicates**: Predicates involving properties of single variables

Binary, ternary, and $n$-ary predicates are also possible.

$(\forall x)(\exists y) Q(x,y)$ is a binary predicate. ("For every $x$ there exists a $y$ such that $Q(x,y)$")

# Recap

> **Goal**: Our goal for predicate logic today is to be able to read predicate logic, not solve proofs (yet)
> - Read left to right

- **Variable**: Lowercase symbol that stands for an individual in a collection or set.
- **Incomplete Statements**: Sentence containing a variable
- **Quantifiers**: Phrases that refer to given quantities, indicating how many objects have a certain property
- There are two kinds of quantifiers:
	1. **Universal Quantifier ($\forall$):**
		- "For all", "given any", "for each", "for every"
	2. **Existential Quantifier ($\exists$):**
		- "For some", "there exists", "there is a", "for at least one"
- **Predicate:** Verbal statement that describes the property of a variable.
	* *Note: If we aren't told $x$, $y$, and $Q$ there is no way to evaluate truth!*
- **Interpretation Domain**: Collection of objects that may be chosen.
- **Unary Predicates**: Predicates involving properties of single variables

# Predicate Wffs

**Predicate Wffs**: Can be built similar to propositional wffs using logical connectives with predicates and quantifiers.
- Brackets determine scope of variable

**Free Variable:** Variable without a quantifier
* Expressions with free variables might not have a truth value.

> **Example Predicate Wff:**
> - $(\forall x)[P(x) \to Q(x)]$
> - $(\forall x)\textcolor{blue}{((\exists y)\textcolor{red}{[P(x,y) \lor Q(x,y)]} \to R(x))}$
> - $S(x,y) \land R(x,y)$
> 
> Reading the example:
> - Scope of $(\exists y)$ is $\textcolor{red}{[P(x,y) \lor Q(x,y)]}$
> - Scope of $\forall x$ is the whole expression ($\textcolor{blue}{((\exists y)... \to R(x))}$)
> - We can't tell truth value because we don't have $x$ or $y$ (incomplete wff)

> **Example Predicate Wff:**
> - $(\forall x) S(x) \lor (\exists y) R(y)$
> 
> Reading the example:
> - Scope of $x$ is $S(x)$
> - Scope of $y$ is $R(y)$

> **Example Predicate Wff:**
> - $(\forall x)[P(x,y) \to (\exists y)Q(x,y)]$
> 
> Reading the example:
> - Scope of $x$ is the whole thing
> - Scope of $y$ is not defined for $P(x,y)$, hence $y$ is called a **free variable**.

> **Example: Determine the truth value of the wff**
> - $(\exists x)[A(x) \land (\forall y)[B(x,y) \to C(y)]]$
> - $A(x)$ is $\textcolor{red}{x > 0}$
> - $B(x,y)$ is $\textcolor{green}{x>y}$
> - $C(y)$ is $\textcolor{yellow}{y \le 0}$
> - Domain of $x$ is positive integers
> - Domain of $y$ is all integers
> 
> Solution: $(\exists x)[\textcolor{red}{x > 0} \land (\forall y)[\textcolor{green}{x>y} \to \textcolor{yellow}{y \le 0}]]$
> - The first quantifier is the most important question we want to answer
> - $\exist x$ asks us "Is there an $x$ larger than 0 where for all $y$ if x is larger than y, then y is less than or equal to 0"
> 	* This statement is true for $x=1$, so this statement is true because $\exist$ only needs us to find one case.

# Exercises: Translating Verbal Statements $\leftrightarrow$ Symbolic Form

> **Translate "Every person is nice" to symbolic form:**
> - Can be rephrased as "for any thing, if it is a person, then it is nice"
> - Let $\textcolor{red}{P(x)}$ be "$x$ is a person" and $\textcolor{green}{Q(x)}$ be "$x$ is nice":
> 	* Symbolic form: $(\forall x)[\textcolor{red}{P(x)} \to \textcolor{green}{Q(x)}]$
> 	* *Note: "All persons are nice" or "Each person is nice" will have the same symbolic form*

> **Translate "There is a nice person" to symbolic form:**
> - Can be rephrased is "there exists something that is both a person and nice"
> - Let $\textcolor{red}{P(x)}$ be "$x$ is a person" and $\textcolor{green}{Q(x)}$ be "$x$ is nice":
> 	* Symbolic form: $(\exist x)[\textcolor{red}{P(x)} \land \textcolor{green}{Q(x)}]$
> 		+ "For all things, there exists a thing which is a person and nice"

> **Write symbolic form for "All dogs chase all rabbits":**
> - Given predicate symbols:
> 	* $D(x)$: "$x$ is a dog"
> 	* $R(x)$: "$x$ is a rabbit"
> 	* $C(x,y)$: "$x$ chases $y$"
> 
> Solution: $(\forall x)[D(x) \to (\forall y) [ R(y) \to C(x,y)] ]$
> - *Reading the above: "For anything, if it is a dog, then for any other thing, if it is a rabbit, then the dog chases it"*
> 
> Another Possible Solution (Deduction Method): $(\forall x)(\forall y)[D (x) \land R(y) \to C(x,y)]$
> - *Reading the above: "For all things $x$ and $y$, if $x$ is a dog and $y$ is a rabbit, then the dog chases the rabbit"*


> **Write symbolic form for "Some dogs chase all rabbits":**
> - Given predicate symbols:
> 	* $D(x)$: "$x$ is a dog"
> 	* $R(x)$: "$x$ is a rabbit"
> 	* $C(x,y)$: "$x$ chases $y$"
> 
> Solution: $(\exists x)[D(x) \land (\forall y) [R(y) \to C(x,y)]]$
> - *Reading the above: There exists an $x$ (where $x$ is a dog) where for all $y$, if $y$ is a rabbit, then the dog will case the rabbit.*


> **Write symbolic form for "Only dogs chase rabbits":**
> - Given predicate symbols:
> 	* $D(x)$: "$x$ is a dog"
> 	* $R(x)$: "$x$ is a rabbit"
> 	* $C(x,y)$: "$x$ chases $y$"
> 
> Rephrase: "For anything that chases rabbits, it has to be a dog"
> - *Since no quantifier is given for rabbits, we assume it to be universal ($\forall$)!>
> 
> Solution: $(\forall y)(\forall x)[R(y) \land C(x,y) \to D(x)]$
> - *Reading the above: For all $y$ and all $x$, if $y$ is a rabbit and it is being chased by $x$, then $x$ is a dog*

## Class Exercise: Writing Various Verbal Arguments as Predicate Wffs

Given:
- $S(x)$: $x$ is a student
- $l(x)$: $x$ is intelligent
- $M(x)$: $x$ likes music

Write wffs to expression following statements:
1. All students are intelligent
	- $(\forall x)[ S(x) \to l(x) ]$
2. Some intelligent students like music
	- $(\exist x)[ S(x) \land l(x) \land M(x) ]$
3. Everyone who like music is a stupid student
	- $(\forall x)[ M(x) \to [l(x)' \land S(x)] ]$
4. Only intelligent students like music
	- $(\forall x)[[ S(x) \land M(x) ] \to l(x)]$

# Class Exercises: Translating Verbal Arguments $\to$ Predicate Wffs

**Given:**
- $C(x)$: $x$ is a chef
- $F(y)$: $y$ is food
- $k(x,y)$: $x$ cooks $y$

**"Only chefs can cook food"**
- $(\forall x)(\forall y)[F(y) \land k(x,y) \to C(x)]$

**"No chefs can cook food"**
1. Rephrase I: "There isn't any chef who can cook food"
	- $[(\exists x) C(x) \land (\forall y) [F(y) \to k(x,y,)]]'$
		* *Note: We're just negating "there is a chef who can cook food"*
2. Rephrase II: "For anything that cooks food, it cannot be a chef"
	- $(\forall x)(\forall y)[F(y) \land k(x,y) \to C(x)']$

---

**Given:**
- $D(x)$: $x$ is a day
- $M$: "Monday"
- $T$: "Tuesday"
- $S(x)$: $x$ is sunny
- $R(x)$: $x$ is rainy

**"Some days are sunny and rainy"**
- $(\exists x)(D(x) \land S(x) \land R(x))$

**"It is always a sunny day only if it is a rainy day"**
- $(\forall x)[D(x) \land S(x) \to R(x)]$
- *Tip: "only if" quantifier is $\to$. "only" is reversed "if" ("$\leftarrow$")*

**"It rained on Monday and Tuesday"**
- $R(M) \land R(T)$
- *Note: Because $M$ and $T$ are constants, they represent one thing, so there is no need to do $\forall M$*

# Negation of Statements (De Morgan)

**De Morgan:**
- We flip $\exists$ to $\forall$, and vice versa
	* "Something us fun" is the opposite of "Nothing is fun"

> **Given:**
> - $A(x)$: $x$ is fun
> - Everything is fun
> 
> **The negation will be "it is false that everything is fun"**
> - i.e., "something is nonfun"
> 	* $[(\forall x) A(x)]' \equiv (\exists x)[A(x)]'$


## Class Exercises: Negation

> Instructions: Negate the following statements.

**"Everybody loves somebody sometime"**
- "Somebody doesn't anybody all the time"

**"Some pictures are old and faded."**
- "No pictures are old and faded"
- "All pictures are new or vivid"

**"All people are tall and thin"**
- "Some people are short or fat"

**"Some students eat only pizza"**
- "All students don't eat pizza"
- "There isn't any students who eat only pizza"

**"Only students eat pizza"**
- "There is a non-student who eats pizza"

# Validity

**Validity**: A predicate wff is valid if it's intrinsically true (true in all possible interpretations)
- Analogous to a tautology in propositional logic
- *Note: A predicate wff's truth depends on its interpretation (what its variables actually mean)*

**Propositional Tautologies v. Predicate Validity:**

| **ADD MISSING TABLE** |
| --                    |
| :(                    |

> **Examples of Valid and Invalid Predicates:**
> - $(\forall x)P(x) \to (\exists x)P(x)$ *(valid)*
> - $(\exists x)P(x) \to (\forall x)P(x)$ *(invalid)*
>	- e.g., Suppose $P(x)$ is "$x$ is even". Then "there is an integer that is even" $\ne$ "every integer is even"

## Class Exercises

> Instructions: Determine whether the following wffs are true. Domain of $x$ is all real integers.

$(\forall x)[L(x) \to (O(x)]$
- $O(x)$: "$x$ is odd"
- $L(x)$: "$x$ < 10"
- False: Not all integers less than 10 are odd

$(\exists y)(\forall x)(x + y = 0)$
- False: No single integer ($y$) works for all real integers ($x$).

$(\forall x)(\exists y)(x + y = 0)$
- True: For every integer $x$ we can add $-x$ (as the value $y$) to get zero.

# Recall: Validation of Wffs Exercise (Previous Lecture)

> Instructions: Determine whether the following wffs are true. Domain of $x$ is all real integers.

$(\forall x)[L(x) \to (O(x)]$
- Given:
	* $O(x)$: "$x$ is odd"
	* $L(x)$: "$x$ < 10"
- Answer: False, not all integers less than 10 are odd

---

$(\exists y)(\forall x)(x + y = 0)$
- Answer: False, no single integer ($y$) works for all real integers ($x$).

---

$(\forall x)(\exists y)(x + y = 0)$
- Answer: True, for every integer $x$ we can add $-x$ (as the value $y$) to get zero.

# Class Exercise: Translate to Wff

**Problem**: "Every ambassador speaks only to diplomats, and some ambassadors speak to someone. Therefore, there is a diplomat."
- $A(x)$: $x$ is an ambassador
- $S(x,y)$: $x$ speaks to $y$
- $D(x)$: $x$ is a diplomat

**Answer**: $(\forall x)(\forall y)[A(x) \land S(x,y) \to D(y)] \land (\exists x) (\exists y)[ A(x) \land S(x,y) ] \to (\exists x)D(x)$
- $(\forall x)(\forall y)[A(x) \land S(x,y) \to D(y)]$
	* "Every ambassador speaks only to diplomats..."
- $(\exists y)[ A(x) \land S(x,y) ]$
	* "...some ambassadors speak to someone."
- $(\exists y)D(y)$
	* "...there is a diplomat"

**Notes**:
- Notice how each "sentence" has their own scope for x and y. We could've done $(\exists x)D(x)$ at the end and that would've also been correct.

# Predicate Logic

- Can represent more complicated statements than statement/propositional logic.
	* However, the meaning and structure of the quantifiers and predicates needs to be known to check validity (unlike statement logic, where we could just start drawing tables)
		+ There are very statements can tell are instrinsically true without knowing what their variables represent (e.g., $(\forall x)P(x) \to (\exists x)P(x)$)

Basic steps to proving arguments:
1. Strip quantifiers (using new inference rules)
2. Manipulate the unquantified wffs (like statement logic)
3. Reinsert the quantifiers (using new inference rules)

## Inference Rules

| From              | Can Derive                                                                              | Name                           | Restrictions                                                                                         |
| ---               | ---                                                                                     | ---                            | ---                                                                                                  |
| $(\forall x)P(x)$ | $P(t)$ where $t$ is a variable or constant symbol                                       | Universal Instantiation; ui    | If $t$ is a variable, it must not fall in the scope of a quantifier for $t$                          |
| $(\exists x)P(x)$ | $P(t)$ where $g$ is a variable or constant symbol not previous used in a proof sequence | Existential Instantiation; ei  | Must be the first rule used that introduces $t$                                                      |
| $P(x)$            | $(\forall x)P(x)$                                                                       | Universal Generalization; ug   | $P(x)$ hasn't been deduced by existential instantiation from any wff in which $x$ is a free variable |
| $P(x)$ or $P(a)$  | $(\exists x)P(x)$                                                                       | Existential Generalization; eg | To go from $P(a)$ to $(\exists x)P(x)$, $x$ mustn't appear in $P(a)$                                 |

> **Notes**:
> - Instantiation basically lets us strip away $\exists$ and $\forall$; generalization lets us add them back.

## Class Exercises on Proving Arguments

> **Instructions**: Prove the following arguments

**Problem**: "All flowers are plants. Sunflower is flower. Therefore, sunflower is a plant."
- $Q(x)$: "$x$ is a plant"
- $a$: Constant symbol (flower)
- $P(x)$: "$x$ is a flower"

**Translation**: $(\forall x)[P(x) \to Q(x)] \land P(a) \to Q(a)$
- $(\forall x)[P(x) \to Q(x)]$
	* "All flowers are plants"
- $P(a)$
	* "Sunflower is a flower"
- $\to Q(a)$
	* "... is a plant"

**Proof Sequence**:
1. $(\forall x)[P(x) \to Q(x)]$; hypothesis
2. $P(a)$; hypothesis
3. $P(a) \to Q(a)$; 1, universal instantiation
4. $Q(a)$; 2,3 modus ponens

---

**Problem**: $(\forall x)[P(x) \to Q(x)] \land [Q(y)]' \to [P(y)]'$

**Proof Sequence**:
1. $(\forall x)[P(x) \to Q(x)]$; hypothesis
2. $[Q(y)]'$; hypothesis
3. $P(y) \to Q(y)$; 1, universal instantiation
4. $[P(y)]'$; 2,3 modus tollens

---

**Problem**: $(\forall x)P(x) \to (\exists x)P(x)$

**Proof Sequence**:
1. $(\forall x)P(x)$; hyp
2. $P(x)$; 1, universal instantiation
3. $(\exists x)P(x)$; existential generalization

---

**Problem**: $(\forall x)[P(x) \land Q(x)] \to (\forall x)P(x) \land (\forall x)Q(x)$

**Proof Sequence**:
1. $(\forall x)[P(x) \land Q(x)]$; hyp
2. $P(x) \land Q(x)$; 1, universal generalization
3. $P(x)$; 2, simplification
4. $Q(x)$; 2, simplification
5. $(\forall x)P(x)$; 3, universal generalization
6. $(\forall x)Q(x)$; 4, universal generalization
7. $(\forall x)P(x) \land (\forall x)Q(x)$; 5,6 conjunction

