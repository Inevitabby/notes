# Informal Proof Techniques

In the real world, we mix English and mathematical statements to do proofs.
* You must be *rigorous* and check *boundary cases*.

> **Professor's Note**: Remember to tie your discrete structure knowledge to your programming knowledge!
> - The systematic analysis skills help in interviews. e.g., "I think there are 3 cases" v.s. "Oh, maybe this; oh, maybe that"
> - Also, needed in future classes.

## A: Counterexample

**Counterexample**: Look for a counterexample that disproves the conjecture.
- i.e., a case when $P$ is true but $Q$ is false.

> **Example**: Prove of disprove that "For every integer $n$, $n! \le n^2$
> - This is true for $n=1,2,3$; but not when $n=5$ ($120 \le 25$). 
> 	- This single case disproves the statement.

> **Example**: All animals living in the ocean are fish.
> - Dolphin.

> **Example**: Every integer less than 10 is bigger than 5
> - 4

Counterexample is not trivial for all cases.
- i.e., We can't use it to prove something is true

## B: Exhaustive Proof

**Exhaustive Proof**: Go over all possible cases for each member of the finite domain.
- Only can be used on proofs with a finite domain.

> **Example**: For any natural number less than or equal to 5, the square of the integer is less than or equal to the sum of 10 plus 5 times the integer
> - Finite Domain: $0 \le n \le 5$
> - Statement: $n^2 \le 10 + 5n$
> - Exhaustive proof:
> 
> | $n$ | $n^2$ | $10+5n$ | $n^2 \le 10 + 5n$ |
> | --- | ---   | ---     | ---               |
> | 0   | 0     | 10      | true              |
> | 1   | 1     | 15      | true              |
> | 2   | 4     | 20      | true              |
> | 3   | 9     | 25      | true              |
> | 4   | 16    | 30      | true              |
> | 5   | 25    | 35      | true              |
>
> - Conclusion: True by the exhaustive proof

## C: Direct Proof

**Direct Proof**: Any way to prove $P \to Q$ (using rules of propositional and predicate logic).
- General and vague.
- Used when exhaustive proof doesn't work.
- Assume the hypothesis $\textcolor{green}{P}$ and prove $\textcolor{blue}{Q}$.
	- *(A formal proof would consist of a proof sequence to go from $P$ to $Q$.)*

> **Example**: Give a direct proof of the theorem "if $\textcolor{green}{n}$ is an odd integer, then $\textcolor{blue}{n^2}$ is odd."
> - Proof: Assume that $\textcolor{green}{n}$ is odd
> 	* Then, $\textcolor{green}{n=2k+1}$ for an integer $k$
> 	* Squaring both sides of the equation, we get:
> $$
> 	\begin{align*}
> 	\textcolor{blue}{n^2} &= \textcolor{green}{(2k+1)^2} \\
> 	&=  4k^2 + 4k + 1 \\
> 	&= 2(2k^2 + 2k) + 1 \\
> 	&= 2r+1
> 	\end{align*}
> $$
> - Where $r=2k^2+2k$ is an integer.
> 	* "2 times an integer squared plus 2 times an integer" is still an integer

## D: Proof by Cases

**Proof by Cases**: Breaking the statement into several cases and proving each case separately

> **Example**: Prove that if  $x$ is even or $y$ is even, then the product $xy$ is even.
> - Cases:
> 	1. If $x$ is even and $y$ is odd, then $xy$ is even
> 	2. If $x$ is odd and $y$ is even, then $xy$ is even
> 	3. If $x$ is even and $y$ is even, then $xy$ is even.
> - Therefore, this statement is true

> **Example**: Prove that the product of any 2 consecutive integers is even.
> - Mathematical Representation: $k(k+1)$ is even
> - Cases (let $n$ and $k$ be integers):
> 	* 1. If $k$ is odd ($k=2n+1$),
> 		- then $(2n+1)(2n+2)=2(2n+1)(n+1)$ is even.
>			- (because any number times $2$ is even)
> 	* 2. If $k$ is even (k=2n),
> 		- then $(2n)(2n+1)$ is even.
>			- (because any number times $2$ is even)
> - Therefore, for any integer $k$, $k(k+1)$ is even.

## E: Indirect Proof: Proof by Contradiction

> Problem Statement: Given $P \to Q$, sometimes $P$ is really hard to work with.

**Proof by Contradiction**: If we can prove $Q'$ cannot be true, then we've proven that $Q$ is true.
- Assume $P$ and $Q'$ and derive a contradiction.

> **Example**: Prove by contradiction "If a number added to itself gives itself, then the number is 0"
> - Hypothesis ($P$): $x+x=x$
> - Conclusion ($Q$): $x=0$
> - Proof:
> 	1. Assuming $P$ ($x+x=x$) and $Q'$ ($x \ne 0$):
> 	2. Then $2x=x$ and $x \ne 0$.
>		- Dividing $2x=x$ by $x$ (which we can do because we know it isn't 0), we get $2=1$, which is a contradiction.
>			- $\therefore$ Because the conclusion cannot be false, it must be true.

## F: Proof by Contraposition

**Proof by Contraposition**: Proving $Q' \to P'$ to prove that $P \to Q$.
- "Proving the contrapositive to prove the conjecture."

> Explanation: Recall the contraposition inference rules from propositional logic:
> 
> | From        | Can Derive  | Abbreviation         |
> | ---         | ---         | ---                  |
> | $P \to Q$   | $Q' \to P'$ | Contraposition; cont |
> | $Q' \to P'$ | $P \to Q$   | Contraposition; cont |

> **Example**: Prove that if the square of an integer is odd, then the integer must be odd.
> 
> Proof by contraposition:
> - $P$: "square of an integer is odd" 
> 	* $x^2=(2k+1)$ *(k is an integer)*
> - $Q$: "integer must be odd" 
> 	* $x=2n+1$ *(n is an integer)*
> - $Q'$: "integer is even" 
> 	* $x=2n$ *(n is an integer)*
> - $P'$: "square of an integer is even" 
> 	* $x^2=(2k)$ *(k is an integer)*
> - $Q' \to P'$:
> $$
> \begin{align*}
> 	x^2 &= (2n)^2 \\
> 	&= 4n^2 = 2(2n^2) \\
> 	&\therefore k = 2n^2
> \end{align*}
> $$
> 
> - Therefore, $x^2$ is even.

# Summarizing Proof Techniques

| Technique      | Approach to prove $P \to Q$               | Remarks                                        |
| ---            | ---                                       | ---                                            |
| Exhaustive     | Show $P \to Q$ for all cases              | Only for finite # of cases                     |
| Direct         | Assume $P$, deduce $Q$                    | Standard approach.                             |
| Contraposition | Assume $Q'$, derive $P'$                  | Use when $Q'$ is easier to manipulate than $P$ |
| Contradiction  | Assume $P \land Q'$, deduce contradiction | Use when $Q$ is false                          |

> **General Strategy for Proving $P \to Q$**:
> 1. Direct proof is the most commonly used, so try it first.
> 2. If the problem domain is finite and small, try exhaustive proof. 
> 3. If the problem domain is infinite and it is difficult to prove the statement without breaking it down, try proof by cases. 
> 4. If $Q'$ is easier to manipulate than $P$, then try proof by contraposition or contradiction.

# Exercises: Proving Statements

> **Example**: Prove the following statement
> - "The sum of two positive numbers is always positive"
> 
> Proof: Let $x$ and $y$ be any positive integers.
> 
> Let $x>0 \land y>0$
> 
> Assume: $x+y\le0$
> - Then $x \le -y \le 0$
> 	* However, $x \gt 0$ (contradiction)
>	 	* By contradiction *(you can't add two positive numbers and get anything less than zero)*, the statement is true


> **Problem**: Prove or disprove the sum of 3 consecutive integers is even.
> 
> Mathematical Representation:
> - $x + (x+1) + (x+2) = 2k$
> 
> Therefore:
> $$
> \begin{align*}
> 	x + (x+1) + (x+2) &= 2k \\
> 	3x + 3 &= 2k \\
> 	3(x + 1) &= 2k \\
> \end{align*}
> $$
> 
> Counterexample:
> - Let $x=2$; result is $9$, which is not even. Therefore, this statement is false.

> **Problem**: Prove or disprove the square of an odd integer equals $8k+1$ for some integer $k$
> 
> Mathematical Representation:
> - $(2n+1)^2 = (8k+1)$ for some integer $k$
> 
> Therefore:
> $$
> \begin{align*}
> 	4n^2 + 4n + 1 &= 8k + 1 \\
> 	4n^2 + 4n &= 8k \\
> 	n^2 + n &= 2k \\
> \end{align*}
> $$
> 
> > **Note**: Our goal is now to prove $n^2 + n = 2k$
> 
> Proof by cases:
> 1. $n$ is even ($n = 2r$):
> $$
> \begin{align*}
> 	4r^2 + 2r &= 2k \\
> 	\textcolor{blue}{2}(2r^2 + r) &= 2k \\
> \end{align*}
> $$
> 	- True, $\textcolor{blue}{2}$ times any integer is even.
> 2. $n$ is odd ($2r+1$):
> $$
> \begin{align*}
> 	(2r+1)^2 + (2r+1) &= 2k \\
> 	4r^2 + 4r + 1 + 2r + 1 &= 2k \\
> 	4r^2 + 6r + 2 &= 2k \\
> 	\textcolor{blue}{2}(2r^2 + 3r + 1) &= 2k 
> \end{align*}
> $$
> 	- True, $\textcolor{blue}{2}$ times any integer is even.
