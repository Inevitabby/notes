# Predicate Logic

# Variables in Logic

> Problem Statement: How do you translate "For every integer $x$, $x>0$"?

**Variable**: Lowercase symbol that stands for an individual in a collection or set.
* e.g., The variable $x$ may stand for one of the days of the week. We may let $x$ = Monday or $x$ = Tuesday, etc.

# Incomplete Statements

**Incomplete Statements**: Statement containing one or more variables.
- Is about the individuals in a definite domain or set.
- When we replace the variable with an individual in the set, we obtain a statement about that specific individual.
	* e.g., The truth of the incomplete statement "$x$ has 30 days" isn't known until an $x$ gets plugged in (e.g., "April has 30 days")

> **Tip**: Replace the word "set/domain" with "array/list" if you have a programming background.

# Quantifiers, Predicates, Complete Statements

**Quantifiers**: Phrases that refer to given quantities, indicating how many objects have a certain property.
- e.g., "for some", "for all", "for every"
- There are two kinds of quantifiers:
	1. **Universal Quantifier** ($\forall$):
		- "For all", "given any", "for each", "for every"
	2. **Existential Quantifier** ($\exists$):
		- "For some", "there exists", "there is a", "for at least one"

**Predicate:** Verbal statement that describes the property of a variable.
- Usually represented as $P$. Notation $P(x)$ is used to represent some unspecified property of predicate that $x$ may have. e.g.,
	* $P(x) = x$ has 30 days.
	* $P($April$)=$ April has 30 days
- *Note: If we aren't told $x$, $y$, and $Q$ there is no way to evaluate truth!*

---

Combining the *quantifier* and *predicate*, we get a **complete statement** of the form:
- $(\forall x) P(x)$ or $(\exists x) P(x)$.

## Interpretation Domain

**Interpretation Domain**: Collection of objects that may be chosen in a given predicate WFF.
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

# $n$-ary Predicates

**Unary Predicates**: Predicates involving properties of single variables

Binary, ternary, and $n$-ary predicates are also possible.

> Example: $(\forall x)(\exists y) Q(x,y)$ is a binary predicate. *("For every $x$ there exists a $y$ such that $Q(x,y)$")*

# Predicate Wffs

**Predicate Wffs**: A well-formed formula in predicate logic.
- Can be built similarly to propositional wffs using logical connectives with predicates and quantifiers.
- Brackets determine scope of variables

**Free Variable:** Variable without a quantifier
* Expressions with free variables might not have a truth value.

## Examples: Reading Predicate Wffs

> **Example Predicate Wff:**
> - $(\forall x)[P(x) \to Q(x)]$
> - $(\forall x)\textcolor{blue}{((\exists y)\textcolor{red}{[P(x,y) \lor Q(x,y)]} \to R(x))}$
> - $S(x,y) \land R(x,y)$
> 
> Reading the example:
> - Scope of $y$ is $\textcolor{red}{[P(x,y) \lor Q(x,y)]}$
> - Scope of $x$ is $\textcolor{blue}{((\exists y)\textcolor{red}{[P(x,y) \lor Q(x,y)]} \to R(x))}$
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

# Exercises: Translating Verbal Statements $\to$ Symbolic Form

> **Translate "Every person is nice" to symbolic form:**
> - Can be rephrased as "for any thing, if it is a person, then it is nice"
> - Let $\textcolor{red}{P(x)}$ be "$x$ is a person" and $\textcolor{green}{Q(x)}$ be "$x$ is nice":
> 	* Symbolic form: $(\forall x)[\textcolor{red}{P(x)} \to \textcolor{green}{Q(x)}]$
> 	* *Note: "All persons are nice" or "Each person is nice" will have the same symbolic form*

> **Translate "There is a nice person" to symbolic form:**
> - Can be rephrased as "there exists something that is both a person and nice"
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
> - *Reading the above: There exists an $x$ (where $x$ is a dog) where for all $y$, if $y$ is a rabbit, then the dog will chase the rabbit.*


> **Write symbolic form for "Only dogs chase rabbits":**
> - Given predicate symbols:
> 	* $D(x)$: "$x$ is a dog"
> 	* $R(x)$: "$x$ is a rabbit"
> 	* $C(x,y)$: "$x$ chases $y$"
> 
> Rephrase: "For anything that chases rabbits, it has to be a dog"
> - Since no quantifier is given for rabbits, we assume it is universal ($\forall$)
> 
> Solution: $(\forall y)(\forall x)[R(y) \land C(x,y) \to D(x)]$
> - *Reading the above: For all $y$ and all $x$, if $y$ is a rabbit and it is being chased by $x$, then $x$ is a dog*

# Exercises: Translating Verbal Arguments $\to$ Predicate Wffs

> Instructions: Rewrite the following statements as predicate wffs using given variables. 

**Given**:
- $S(x)$: $x$ is a student
- $l(x)$: $x$ is intelligent
- $M(x)$: $x$ likes music

**Rewrite**:
1. Q: All students are intelligent
	- A: $(\forall x)[ S(x) \to l(x) ]$
2. Q: Some intelligent students like music
	- A: $(\exist x)[ S(x) \land l(x) \land M(x) ]$
3. Q: Everyone who like music is a stupid student
	- A: $(\forall x)[ M(x) \to [l(x)' \land S(x)] ]$
4. Q: Only intelligent students like music
	- A: $(\forall x)[[ S(x) \land M(x) ] \to l(x)]$

---

**Given:**
- $C(x)$: $x$ is a chef
- $F(y)$: $y$ is food
- $k(x,y)$: $x$ cooks $y$

**Rewrite**:
1. Q: "Only chefs can cook food"
	- A: $(\forall x)(\forall y)[F(y) \land k(x,y) \to C(x)]$
2. Q: "No chefs can cook food"
	- A1: $[(\exists x) C(x) \land (\forall y) [F(y) \to k(x,y,)]]'$ 
		* "There isn't any chef who can cook food"
			+ *Note: We're just negating "there is a chef who can cook food"*
	- A2: $(\forall x)(\forall y)[F(y) \land k(x,y) \to C(x)']$
		* "For anything that cooks food, it cannot be a chef"

---

**Given:**
- $D(x)$: $x$ is a day
- $M$: "Monday"
- $T$: "Tuesday"
- $S(x)$: $x$ is sunny
- $R(x)$: $x$ is rainy

**Rewrite**:
1. Q: "Some days are sunny and rainy"
	* A: $(\exists x)(D(x) \land S(x) \land R(x))$
2. Q: "It is always a sunny day only if it is a rainy day"
	* A: $(\forall x)[D(x) \land S(x) \to R(x)]$
		- *Tip: "only if" quantifier translates to $\to$. "only" is a reversed "if" ("$\leftarrow$")*
3. Q: "It rained on Monday and Tuesday"
	- A: $R(M) \land R(T)$
		* *Note: Because $M$ and $T$ are constants, they represent one thing, so there is no need to do $\forall M$*

# Negating Predicate Wffs

**How-to Apply De Morgan to Predicate Wffs:**
- We flip $\exists$ to $\forall$, and vice versa

> **Example**: "Something is fun" ($\exists x$) is the opposite of "Nothing is fun" ($\forall x$)
>
> **Given:**
> - $A(x)$: $x$ is fun
> - $(\forall x) A(x)$: Everything is fun 
> 
> **Negation**:
> - $[(\forall x) A(x)]' \equiv (\exists x)[A(x)']$
>	- "It is false that everything is fun" $\equiv$ "Something is nonfun"

## Exercises: Negating Statements

> Instructions: Negate the following statements.

Q: **"Everybody loves somebody sometime"**
- A: "Somebody doesn't love anybody all the time"

Q: **"Some pictures are old and faded."**
- A: "No pictures are old and faded"
- A: "All pictures are new or vivid"

Q: **"All people are tall and thin"**
- A: "Some people are short or fat"

Q: **"Some students eat only pizza"**
- A: "All students don't eat pizza"
- A: "There isn't any student who eats only pizza"

Q: **"Only students eat pizza"**
- A: "There is a non-student who eats pizza"

# Validity

**Validity**: A predicate wff is valid if it's intrinsically true.
- Analogous to a tautology in propositional logic
- *Note: A predicate wff's truth depends on its interpretation (what its variables actually mean)*

**Propositional Tautologies versus Predicate Validity:**

|                 | Propositional Wffs                                              | Predicate Wffs                                          |
|-----------------|-----------------------------------------------------------------|---------------------------------------------------------|
| Truth values    | True or false – depends on the truth value of statement letters | True, false or neither (if the wff has a free variable) |
| Intrinsic truth | Tautology – true for all truth values of its statements         | Valid wff – true for all interpretations                |
| Methodology     | Truth table to determine if it is a tautology                   | No algorithm to determine                               |

> **Examples of Valid and Invalid Predicates:**
> - $(\forall x)P(x) \to (\exists x)P(x)$ *(valid)*
> - $(\exists x)P(x) \to (\forall x)P(x)$ *(invalid)*
>	- e.g., Suppose $P(x)$ is "$x$ is even". Then "there is an integer that is even" $\not \to$ "every integer is even"

## Exercises: Determining Validity

> Instructions: Determine whether the following wffs are true. Domain of $x$ is all real integers.

Q: $(\forall x)[L(x) \to (O(x)]$ where $O(x)$: "$x$ is odd" and $L(x)$: "$x$ < 10"
- A: False, not all integers less than 10 are odd.

Q: $(\exists y)(\forall x)(x + y = 0)$
- A: False, no single integer ($y$) works for all real integers ($x$).

Q: $(\forall x)(\exists y)(x + y = 0)$
- A: True, for every integer $x$ we can add $-x$ (as the value $y$) to get zero.

# Exercise: Translating Verbal Statement to Predicate Wff (Complex)

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

**Predicate Logic**: Can represent more complicated statements than statement/propositional logic.
* However, the meaning and structure of the quantifiers and predicates needs to be known to check validity (unlike statement logic, where we could just start drawing tables without knowing what they represent)
	+ There are very few predicate statements you can tell are intrinsically true without knowing what their variables represent (e.g., $(\forall x)P(x) \to (\exists x)P(x)$)

**Basic approach to proving predicate logic arguments**:
1. Strip quantifiers (using new inference rules)
2. Manipulate the unquantified wffs (like statement logic)
3. Reinsert the quantifiers (using new inference rules)

## Predicate Logic Inference Rules

| From              | Can Derive                                                                              | Name                           | Restrictions                                                                                         |
| ---               | ---                                                                                     | ---                            | ---                                                                                                  |
| $(\forall x)P(x)$ | $P(t)$ where $t$ is a variable or constant symbol                                       | Universal Instantiation; ui    | If $t$ is a variable, it must not fall in the scope of a quantifier for $t$                          |
| $(\exists x)P(x)$ | $P(t)$ where $g$ is a variable or constant symbol not previous used in a proof sequence | Existential Instantiation; ei  | Must be the first rule used that introduces $t$                                                      |
| $P(x)$            | $(\forall x)P(x)$                                                                       | Universal Generalization; ug   | $P(x)$ hasn't been deduced by existential instantiation from any wff in which $x$ is a free variable |
| $P(x)$ or $P(a)$  | $(\exists x)P(x)$                                                                       | Existential Generalization; eg | To go from $P(a)$ to $(\exists x)P(x)$, $x$ mustn't appear in $P(a)$                                 |

> **Notes**:
> - Instantiation basically lets us strip away $\exists$ and $\forall$; generalization lets us add them back.

## Exercises: Proving Predicate Logic Arguments

> **Instructions**: Prove the following arguments

**Problem**: "All flowers are plants. Sunflower is flower. Therefore, sunflower is a plant."
- $Q(x)$: "$x$ is a plant"
- $a$: Constant symbol (flower)
- $P(x)$: "$x$ is a flower"

**Translation**: $(\forall x)[P(x) \to Q(x)] \land [P(a) \to Q(a)]$
- $(\forall x)[P(x) \to Q(x)]$
	* "All flowers are plants"
- $P(a)$
	* "Sunflower is a flower"...
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

