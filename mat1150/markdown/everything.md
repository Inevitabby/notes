---
title: "Calculus II in One Page"
---

# Integration by Parts

$$
\boxed{
	\text{Integration by Parts: } \int u dv = uv - \int v du
}
$$
- **Usage**: Find $u$ and $dv$ in the problem, then solve for $du$ and $v$. Assemble other side of equation, then solve this simpler equation.

<details><summary>Tip: Choosing $u$ (L.I.AT.E.)</summary>
* What to choose for $u$: L.I.A.T.E. (pick the one higher on the list)
	1. **L**ogarithms (e.g., $\ln x$)
	2. **I**nverse trig (e.g., $arctan(x)$)
	3. **A**lgebraic (e.g., $x^2$)
	4. **T**rig (e.g., $\sin(x)$)
	5. **E**xponential (e.g., $e^x$)
</details>

<details><summary>Why?</summary>
**Deriving the Integration by Parts Formula**:

$$
\text{Product Rule: } \frac{d}{dx} [ f(x)g(x) ] = f(x)g'(x) + f'(x)g(x)
$$

Now, let $u = f(x)$ and $v = g(x)$.

Therefore:
$$
\frac{d}{dx} (uv) = uv' + u'v \\~\\
\text{(Integrate both sides)} \\~\\
\begin{aligned}
	\int \frac{d}{dx} (uv) dx &= \int ( uv' + u'v ) dx \\
	uv &= \int ( uv' + u'v ) dx \\
	uv &= \int u dv + \int v du \\
	uv - \int v du &= \int u dv \\
	\int u dv &= uv - \int v du 
\end{aligned}
$$
</details>

<details><summary>Example</summary>
$$
\text{Solve: }
\int x \sin x dx
$$

Let $u = x$ and $dv = \sin x dx$.
- *(Now we want to find $v$ and $du$ to use Integration by Parts.)*

1. To find $v$ we can take the integral of both sides of the $dv$ equation:

$$
dv = \sin x dx \\
\int dv = \int \sin x dx \\
v = -\cos x
$$

2. To find $du$ we can take the derivative of both sides of the $u$ equation:

$$
u = x \\
u' = x' \\
du = 1
$$

3. Now we can plug into Integration by Parts:

$$
\begin{aligned}
\int u dv &= uv - \int v du \\
\int x \sin x dx &= x ( - \cos x ) - \int - \cos x dx
\end{aligned}
$$

4. Now, solve the last integral on the right to get the final answer:

$$
\int x \sin x dx = - x \cos x  + \sin x + c
$$

> **Tip**: You can verify the answer seeing if $(- x \cos x  + \sin x)' = x \sin x$
</details>

> **Important**: $\int v du$ might end up being the term you started with. In that case, you can move it across the $=$ to break the loop.
> - This strategy isn't unique to integration by parts!

# Trigonometric Integrals

<details><summary>Introduction Problem</summary>
$$
\text{Solve: } \int (\cos x)^3 dx
$$

> **Notes**:
> - U-sub doesn't simplify this because there isn't a $\sin x$ to cancel out the $\frac{du}{dx}$
> - Integration by parts make the problem more difficult in every step.
> - Because of this, we must resort to trigonometric substitution.

Recall the following identity:
$$
\begin{aligned}
\boxed{
	\text{Pythagorean Identity: }
	\cos^2 x + \sin^2 x = 1
}
\end{aligned}
$$

It logically follows that:
$$
\begin{aligned}
	\cos^2 x &= 1 - \sin^2 x \\
	\sin^2 x &= 1 - \cos^2  x
\end{aligned}
$$

> **Note**: For this problem, we only need to use the $\cos^2 x$ identity, but I'm listing both for demonstration.


$$
\begin{aligned}
\int (\cos x)^3 dx &= \int 1 - (\sin x)^2 \cos x dx \\~\\
u &= \sin x \to du = \cos x dx \to dx = \frac{du}{\cos x} \\~\\
&= \int (1 - u^2) du \\
&= \int du - \int u^2 du \\
&= u - \frac{u^3}{3} \\~\\
&\text{Therefore, } \\~\\
\int (\cos x)^3 dx &= \sin x - \frac{(\sin x)^3}{3} \\
\end{aligned}
$$
</details>

$$
\large\text{I. Strategy for Powers of $\sin$ and $\cos$}
$$

$$
\boxed{
	\text{Given: } \int cos^j x \sin^k x dx
}
$$

**Case 1: $k$ is odd**

Rewrite $\sin^k x = \sin^{k-1}x \sin x$
- $k-1$ is even, so use $\sin^2 x = 1 - \cos^2 x$
- Then solve with u-sub, where $u = \cos x$

**Case 2: $k$ is even**

Rewrite $\cos^j x = \cos^{j-1}x \cos x$
- $j-1$ is even, so use $\cos^2 x = 1 - \sin^2 x$
- Then solve with u-sub, where $u = \sin x$

**Case 3: $k$ and $j$ are even**

Use half-angle identities.
- ($0$ counts as an even)

<details><summary>Example: The importance of half-angle identities</summary>
$$
\begin{aligned}
\int \sin^2 x dx &= \int ( \frac{1}{2} - \frac{1}{2} \cos 2x ) dx \\
&= \frac{1}{2} - \frac{1}{2} \cos 2x dx \\
&= \frac{1}{2} x - \frac{1}{4} \sin 2x + C
\end{aligned}
$$

> **Note**: Half-angle identities are also-known-as power-reduction formulas.
> - If you don't know them, you might end up stuck!
</details>

---

$$
\large\text{II. Strategy for Powers of $\tan$ and $\sec$}
$$

$$
\boxed{
	\text{Given: } \int \tan^k x \sec^j x dx
}
$$

**Case 1: $j$ is even and $j \ge 2$**

Rewrite $\sec^2 x = \sec^{j-2} x \sec^2 x$.
- Use $\sec^2 x = \tan^2 x + 1$ to rewrite $\sec^{j-2} x$ in terms of $\tan x$
- Then solve with u-sub, where $u = \tan x$

> **tl;dr**: Pull off $\sec^2 x$ and convert to $\tan$ using Pythagorean identity.
> - Leave behind a $\sec^2 x$ to be cancelled out by u-substitution when we let $u = \tan x$

**Case 2: $k$ is odd and $j \ge 1$**

Rewrite $\tan^k x \sec^j x = \tan^{k-1} x \sec^{j - 1} x \sec x \tan x$
- Use $\tan^2 x = \sec^2 x - 1$ to rewrite $\tan^{k-1} x$ in terms of $\sec x$
- Then solve with u-sub, where $u = \sec x$

> **tl;dr**: Pull off $\tan^2 x$ and convert to $\sec$ using Pythagorean identity.
> - Leave behind a $\sec x \tan x$ to be cancelled out by u-substitution when we let $u = \sec x$

**Case 3: $k$ is odd, $k \ge 3$, and $j = 0$**

Rewrite $\tan^k x = \tan^{k-2} x \tan^2 x = \tan^{k-2} \sec^2 x - \tan^{k-2} x$
- **Term 1** ($\tan^{k-2} \sec^2 x$): Apply Case 1
- **Term 2** ($\tan^{k-2} x$): Apply Case 3
	* May need to be applied repeatedly

> **tl;dr**: Pull off $\tan^2 x$ and split into two separate integrals, the first to be solved with Case 1 and the latter to be solved with Case 3.

**Case 4: $k$ is even and $j$ is odd**

Use $\tan^2 x = \sec^2 x - 1$ to express $\tan^k x$ in terms of $\sec x$
- Then solve with **integration by parts** to integrate odd powers of $\sec x$
	* You'll *usually* want $dv = \sec x dx$

---

> ### Memorize This
> 
> $$
> \begin{aligned}
>	\text{Half-Angle Identities : }&
> 	\begin{aligned}
> 		\sin^2 x &= \frac{1}{2} (1 - \cos 2x) \\
> 		\cos^2 x &= \frac{1}{2} (1 + \cos 2x)
> 	\end{aligned} \\~\\
>	\text{Double-Angle Identities : }&
> 	\begin{aligned}
>		\sin 2x &= 2 \sin x \cos x \\
>		\cos 2x &= \cos^2 x - \sin^2 x
> 	\end{aligned} \\~\\
> 	\text{$\sec$ \& $\tan$ Integrals: }&
> 	\begin{aligned}
> 		\int sec^2 x dx &= \tan x + C \\
> 		\int \sec x \tan x dx &= \sec x + C \\
> 		\int \tan x dx &= \ln ( \sec x ) + C \\
> 		\int \sec x dx &= \ln ( \sec x + \tan x ) + C
> 	\end{aligned} \\~\\
> 	\text{Pythagorean Identities: }&
> 	\begin{align}
> 		\cos^2 x + \sin^2 x &= 1 \\
> 		1 + \tan^ 2 x &= \sec^2 x \\
> 		\cot^2 x + 1 &= \csc^2 x
> 	\end{align}
> \end{aligned} \\~\\
> \small\textit{(2) is (1) $\div$ cos$^2$ x} \qquad \textit{(3) is (1) $\div$ sin$^2$ x}
> $$

# Trigonometric Substitution

<details><summary>Reference: Trig Sub in One Table</summary>
| Form      | $x$           | $dx$                      | Pythagorean Identity |
|-----------|---------------|---------------------------|----------------------|
| $a^2-x^2$ | $a\sin\theta$ | $a \cos \theta$             | $\cos$ and $\sin$    |
| $x^2+a^2$ | $a\tan\theta$ | $a \sec^2 \theta$           | $\tan$ and $\sec$    |
| $x^2-a^2$ | $a\sec\theta$ | $a \sec \theta \tan \theta$ | $\sec$ and $\tan$    |
</details>

**How-To**:
1. Substitute $x$ for trigonometry: <!--($x \to \text{ trig }$$(\theta)$)-->

> ### Substituting $x$ for Trig
> $$
> \begin{aligned}
> 	\text{Case A: }
> 	a^2 -x^2 &\to 
> 	\begin{aligned}
> 		x &= a \sin \theta \\
> 		dx &= a \cos \theta d \theta
> 	\end{aligned} \\~\\
> 	\text{Case B: }
> 	a^2 + x^2 &\to 
> 	\begin{aligned}
> 		x &= a \tan \theta \\
> 		dx &= a \sec^2 \theta d \theta
> 	\end{aligned} \\~\\
> 	\text{Case C: }
> 	x^2 - a^2 &\to 
> 	\begin{aligned}
> 		x &= a \sec \theta \\
> 		dx &= a \sec \theta \tan \theta d \theta
> 	\end{aligned} \\~\\
> \end{aligned}
> $$

2. Use Pythagorean identities to get rid of the square root
3. Simplify and integrate
4. Use a right triangle to convert $\theta$ back to $x$
	- Done by taking the formula for $x$ you found in Step 1, isolating $\text{trig}(\theta)$, and using *SohCahToa*.

> **Note**: Some problems require you to complete the square.

<details><summary>How-To Complete the Square</summary>
$$
\text{Completing the Square: }
\begin{aligned}
	&\text{1. Rearrange such that lead coefficient is 1} \\
	&\text{2. Add and subtract $(b / 2)^2$} \\
	&\text{3. Factor and solve}
\end{aligned}
$$
</details>

<details><summary>Example</summary>
$$
\text{Solve: } \int \sqrt{9-x^2} dx
$$

**Solving**:

$$
\text{Identity: } a^2 \cos^2 \theta = a^2 - a^2 \sin^2 \theta \\
$$

$$
\text{Let } x = 3 \sin \theta \\
\text{Then } dx = 3 \cos \theta d \theta
$$

Now we can substitute our $x$ and $dx$:
$$
\int \sqrt{9 - x^2} dx = \int \sqrt{ 9 - (3 \sin \theta )^2 } 3 \cos \theta d \theta \\
= \int \sqrt{9 - 9 \sin^2 \theta} 3 \cos \theta d \theta \\~\\
\text{Apply Pythagorean identity: } \\~\\
= \int \sqrt{9 \cos^2 \theta} 3 \cos \theta d \theta \\
= \int 3 \cos \theta \times 3 \cos \theta d \theta \\
= 9 \int \cos^2 \theta d \theta \\~\\
\text{Half-angle identity: } \\~\\
= 9 \int \frac{1 + \cos (2 \theta) }{2} d \theta \\
= 9 ( \frac{1}{2} \theta + \frac{\sin (2 \theta) }{4} \theta ) + C\\
= \frac{9}{2} \theta + \frac{9}{4} \sin (2 \theta) +C \\~\\
\text{Map $\theta$ to $x$ with inverse trig: } \\~\\
x = 3 \sin\theta \to \frac{x}{3} = \sin \theta \to \text{Inverse sine} \to \arcsin \frac{x}{3} = \theta \\~\\
\text{We need to manipulate $\sin 2 \theta$ to use the mapping: } \\~\\
\boxed{
\text{Double-Angle Identitities: }
\begin{aligned}
	\sin 2 \theta &= 2 \sin \theta \cos \theta \\
	\cos 2 \theta &= \cos^2 \theta - \sin^2 \theta
\end{aligned}
} \\~\\
\text{Applying the double-angle identity: } \\~\\
\frac{9}{2} \theta + \frac{9}{4} \sin (2 \theta) +C 
= \frac{9}{2} \theta + \frac{9}{4} ( 2 \sin \theta \cos \theta ) \\~\\
\text{Now we need just to find $\cos \theta$: } \\~\\
\text{Since $\sin \theta = \frac{x}{3}$}:
$$

![](./.images/triangle.png)

> **Tip**: The square root you get from solving the missing side of the triangle should match the square root in the original problem.
> - If it doesn't match, you did something wrong.

$$
\cos \theta = \frac{ \text{Adjacent} }{ \text{Hypotenus} } = \frac{\sqrt{9-x^2}}{3} \\~\\
\frac{9}{2} \theta + \frac{9}{4} ( 2 \sin \theta \cos \theta )
= \frac{9}{2} \arcsin ( \frac{x}{3} ) + \frac{9}{2} ( \frac{x}{3} ) ( \frac{\sqrt{9-x^2}}{3} ) \\~\\
= \frac{9}{2} \arcsin ( \frac{x}{3} ) + \frac{x \sqrt{9 - x^2}}{2} + C
$$
</details>

# Partial Fractions

$$
\boxed{
\begin{aligned}
\text{Partial Fraction Decomposition: } 
\\~\\
\frac{1}{
	\textcolor{red}{
		x^2
	}
	\textcolor{green}{
		(x-1)
	}
	\textcolor{blue}{
		(x+1)^3}
	}
=
	\textcolor{red}{
		\frac{A}{x} + \frac{B}{x^2}
	}
+ 
	\textcolor{green}{
		\frac{C}{x-1}
	}
+
	\textcolor{blue}{
		\frac{D}{x+1} + \frac{E}{(x+1)^2} + \frac{F}{(x+1)^3 }
	}
\end{aligned}
}
$$

**How-To:**

1. If numerator degree $\ge$ denominator degree, do long division
2. Factor the denominator into linear and irreducible quadratic factors.

> ### Linear Factors
> $$
> \text{Case I: Denominator factors into $n$ distinct linear factors: } \\~\\
> \frac{A_1}{a_1 x + b_1}
> +
> \frac{A_2}{a_2 x + b_2}
> +
> ...
> +
> \frac{A_n}{a_n x + b_n}
> $$
> 
> $$
> \text{Case II: Denominator contains a repeated linear factor $(ax + b)^n$} \\~\\
> \frac{A_1}{a x + b}
> +
> \frac{A_2}{(a x + b)^2}
> +
> ...
> +
> \frac{A_n}{(a x + b)^n}
> $$

> ### Irreducible Quadratic Factors
> $$
> \text{Case I: $\forall$ irreducible quadratics ($ax^1 + bx + c$) in the denominator} \\~\\
> \frac{Ax + B}{ax^2 + bx + c}
> $$
> 
> $$
> \text{Case II: $\forall$ repeated irreducible quadratic $(ax^2 + bx + c)^n$ in the denominator} \\~\\
> 	\frac{A_1 x + B_1}{a x^2 + bx + c}
> 	+
> 	\frac{A_2 x + B_2}{(a x^2 + bx + c)^2}
> 	+
> 	\frac{A_n x + B_n}{(a x^n + bx + c)^n}
> $$

3. Solve for unknown constants (algrebra).
	- Use roots of $x$, systems of equations, etc.

<details><summary>Example: A straightforward example</summary>
$$
\text{Solve: } \int \frac{3x+2}{x^3 - x^2 - 2x} dx
$$

1. Factor the denominator into distinct linear factors.

$$
=
\int \frac{3x+2}{ x ( x^2 - x^1 - 2 )} dx
=
\int \frac{3x+2}{ x ( x-2) ( x+1 )} dx
$$

2. Split the fraction into multiple tiny fractions.
	- *(Keep numerators as variables for now)*

$$
=
\int \frac{3x+2}{ x ( x-2) ( x+1 )} dx
=
\int \frac{A}{x} + \frac{B}{x-2} + \frac{C}{x+1} dx
$$

3. Multiply both sides of the equation by the denominator.

$$
\int 3x+2 dx
=
\int A(x-2)(x+1) + B(x)(x+1) + C(x)(x-2) dx
$$

4. Get coefficients with **strategic substitution**
	- *(We do this by using various values of $x$ (roots of denominators) to get equations for each coefficient.)*

$$
\begin{aligned}
	x = 0: &
	\begin{aligned}
		3(0) + 2 &= A(-2)(1) + 0 + 0 \\
		2 &= -2A \\
		A &= -1 \\
	\end{aligned} \\~\\

	x = 2: &
	\begin{aligned}
		3(2) + 2 &= 0 + B(2)(3) + 0 \\
		8 &= 6B \\
		B &= \frac{4}{3}
	\end{aligned} \\~\\

	x = -1:&
	\begin{aligned}
		3(-1) + 2 &= 0 + 0 + C(-1)(-3) \\
		-1 & = 3C \\
		C &= - \frac{1}{3}
	\end{aligned} \\~\\
\end{aligned}
$$

5. Plug coefficients back in.
	- *(Use the form from step 2)*

$$
=
\int \frac{A}{x} + \frac{B}{x-2} + \frac{C}{x+1} dx
= 
\int \frac{-1}{x} + \frac{\frac{4}{3}}{x-2} - \frac{\frac{1}{3}}{x+1} dx
$$

6. Solve.
	- *(See "Integrals for Partial Fractions" below)*

$$
=
- \ln |x| + \frac{4}{3} \ln | x - 2 | - \frac{1}{3} \ln |x + 1| + C
$$
</details>

<details><summary>Example: Decomposing with long division</summary>
$$
\text{Solve: } \frac{x^2 + 3x + 5}{x + 1} dx
$$

We can simplify this by using **long division**.

$$
x^2 + 3x + 5 \div x + 1 = x + 2 \text{r} 3 \\~\\
\text{Therefore: } \frac{x^2 + 3x + 5}{x + 1} dx
= 
\int x + 2 + \frac{3}{x+1} dx
$$

Thus, the answer is:
$$
\int x + 2 + \frac{3}{x+1} dx
=
\frac{x^2}{2} + 2x + 3 \ln |x + 1| + C
$$

> **Tip**: Remember, when performing long division the result is simply the quotient + remainder / divisor.
</details>

<details><summary>Example: Repeated linear terms</summary>
$$
\text{Solve: } \int \frac{x-2}{(2x-1)^2 (x-1)} dx
$$

You need to split this in a special way to handle the exponent:
$$
\int \frac{x-2}{(2x-1)^2 (x-1)} dx
=
\int \frac{A}{2x-1} + \frac{B}{(2x-1)^2} + \frac{C}{x-1} dx
$$

Now we multiply both sides by the denominator to get the following:
$$
\int x-2 dx
=
\int A(2x-1)(x-1) + B(x-1) + C(2x-1)^2 dx
$$

Strategic substitution to find the coefficients:
$$
\begin{aligned}
	x = 1: &
	\begin{aligned}
		1-2 &= 0 + 0 + C(2-1)^2 \\
		-1 &= C
	\end{aligned} \\~\\

	x = \frac{1}{2}: &
	\begin{aligned}
		\frac{1}{2} - 2 &= 0 + B(\frac{1}{2} - 1) + 0 \\
		- \frac{3}{4} &= -\frac{1}{2} B \\
		B &= 3
	\end{aligned} \\~\\

	x = 0: &
	\begin{aligned}
		-2 &= A(-1)(-1) + 3(-1) - 1 (-1)^2 \\
		-2 &= A - 3 - 1 \\
		A &= 2
	\end{aligned} \\~\\
\end{aligned}
$$

Plug back in coefficients:
$$
\int \frac{2}{2x-1} + \frac{3}{(2x-1)^2} - \frac{1}{x-1} dx
$$

Solve the first two terms with u-sub ($u = 2x - 1$):
$$
\begin{aligned}
&=
\int \frac{2}{u} \times \frac{1}{2} du
+
\int \frac{3}{u^2} \times \frac{1}{2} du
-
\ln | x - 1 | 
+ C
\\
&=
\ln | u | +  \frac{3}{2} \times \frac{u^{-3}}{-3} - \ln | x - 1 | + C
\\
&=
\ln | 2x - 1 | - \frac{3}{2(2x-1)} - \ln | x - 1 | + C
\end{aligned}
$$
</details>

> ### Memorize This
> $$
> \text{Integrals for Partial Fractions: }
> \begin{aligned}
> \int \frac{1}{x} dx &= \ln | x | + C \\~\\
> \int \frac{1}{x+a} dx &= \ln | x + a | + C \\~\\
> \int \frac{1}{x^2+a^2} dx &= \frac{1}{a} \arctan( \frac{x}{a}) + C \\~\\
> \int \frac{1}{x^2+1} dx &= \arctan x + C
> \end{aligned}
> $$
> 
> $$
> \text{Irreducible Quadratics: } 
> \begin{aligned}
> x^3 - a^3 &= (x - a) (x^2 + ax + a^2) \\
> x^3 + a^3 &= (x + a) (x^2 - ax + a^2)
> \end{aligned}
> $$

# Improper Integrals

> ### Convergence and Divergence:
> - If the limit exists, we say that the integral converges.
> - If the limit does not exist, we say it diverges.
> 	* Remember: Infinity does not exist!

> ### L'Hopital's Rule
> 
> Remember to use L'Hopital's to solve limits of indeterminate form. 
> $$
> \boxed{
> 	\text{L'Hopital's Rule: }
> 	\lim_{x \to c} \frac{f(x)}{g(x)} = \lim_{x \to c} \frac{f'(x)}{g'(x)}
> } \\
> \small\textit{Provided that $\lim$ of $f(x)$ and $g(x)$ from $x \to c$ are both $\infin$ or both $0$}
> $$


## Type I

$$
{ \large\text{Case A: } } \\
\text{Let $f$ be continuous over $[a,\infin)$, then:} \\
\boxed{
	\int_a^\infin f(x) = \lim_{t \to \infin} \int_a^t f(x) dx
}
$$

$$
{ \large\text{Case B: } } \\
\text{Let $f$ be continuous over $(-\infin,b]$, then:} \\
\boxed{
	\int_{-\infin}^b f(x) = \lim_{t \to -\infin} \int_t^b f(x) dx 
}
$$

$$
{ \large\text{Case C: } } \\
\text{Let $f$ be continuous over $(-\infin,\infin)$, then:} \\
\boxed{
	\int_{-\infin}^\infin f(x) dx = \int_{-\infin}^0 f(x) dx + \int_0^\infin f(x) dx
}
\\~\\
\small\textit{Provided that the limit exists (A) (B), or both integrals converge (C)}
$$

## Type II

$$
{ \large\text{Case A: } } \\
\text{Let $f$ be continuous over $[a,b)$, then:} \\
\boxed{
	\int_a^b f(x) dx = \lim_{t \to b^+} \int_a^t f(x) dx
} \\
$$

$$
{ \large\text{Case B: } } \\
\text{Let $f$ be continuous over $(a,b]$, then:} \\
\boxed{
	\int_a^b f(x) dx = \lim_{t \to a^+} \int_t^b f(x) dx
} \\
$$

$$
{ \large\text{Case C: } } \\
\text{Let $f$ be continuous over $[a,b]$ except at $c$ where $a < c < b$, then:} \\
\boxed{
	\int_a^b f(x) dx = \lim_{t \to c^-} \int_a^t f(x) dx + \lim_{t \to c^+} \int_t^b f(x) dx
} \\~\\
\small\textit{Provided that the limit exists (A) (B), or both integrals converge (C)}
$$

# Comparison Test

$$
\boxed{
\text{Comparison Test: }
\begin{aligned}
	\text{If $\int_a^\infin f(x) dx = \infin$} 
		&\text{, then $\int_a^\infin g(x) dx = \infin$} \\
	\text{If $\int_a^\infin g(x) dx = L$}
		&\text{, then $\int_a^\infin f(x) dx \le L$}
\end{aligned}
} \\
\small\textit{Provided that $f$ and $g$ are continuous over $[a,\infin)$,} \\
\textit{with $0 \le f(x) \le g(x), \forall x \ge q$} \\~\\
$$

# Arc Length

$$
\boxed{
	\text{Arc Length: }
	\int_a^b \sqrt{1 + f'(x)^2} dx
} \\
\small\textit{Provided that $f'$ exists and is continuous over $[a,b]$} \\
$$

# Surface Area of Solid of Revolution

$$
\boxed{
	\text{Surface Area of Solid of Revolution: }
	\int_a^b 2 \pi f(x) \sqrt{1 + f'(x)^2} dx
} \\
\small\textit{Provided that $f'$ exists and is continuous over $[a,b]$} \\
$$

<details><summary>Rotating About the Y-Axis</summary>
- If given a problem to solve a $y$-function from $y=a$ to $y=b$, simply solve for $x$ and $x'$, and plug it into the above formula, replacing $f(x)$ with $x$, $f'(x)$ with $x'$, and $dx$ with $dy$.
</details>

# Moments and Center of Mass

$$
\boxed{
	\text{Center of Mass: } x = \frac{M}{m}
} \\~\\
M = \sum_{i-1}^n m_i x_i \qquad
m = \sum_{i-1}^n m_i
$$

<details><summary>Why?</summary>
$$
\text{Because } x = \frac{m_1 x_1 + m_2 x_2}{m_1 + m_2}
$$
- $M$: Moment of system
- $m$: Total mass
</details>

<details><summary>Example: 4 Masses on a Line</summary>
$$
\begin{aligned}
m_1 &= 30 \text{kg}, x_1 = -2 \text{m} \\
m_2 &= 5 \text{kg}, x_1 = 3 \text{m} \\
m_3 &= 10 \text{kg}, x_1 = 6 \text{m} \\
m_4 &= 15 \text{kg}, x_1 = -3 \text{m} \\
\end{aligned} \\~\\
\begin{aligned}
x &= \frac{
	30(-2) + 5(3) + 10(6) + 15(-3)
}{
	30  5 + 10 + 15
} \\
&= -\frac{1}{2} \text{m}
\end{aligned}
$$
</details>

$$
\boxed{
	\text{Center of Mass (2D Plane): } 
	x = \frac{ My }{ m }
	\qquad
	y = \frac{M_x}{m}
} \\~\\
M_y = \sum_{i=1}^n m_i x_i \qquad
M_x = \sum_{i=1}^n m_i Y_i \qquad
m = \sum_{i-1}^n m_i
$$

<details><summary>Why?</summary>
If objects are on a 2D plane, we get the center of mass by calculating the center mass in the $x$ and $y$-directions separately.
- $M_y$: Moment ith respect to y-axis
- $M_x$: Moment with respect to x-axis
- $m$: Total mass
</details>

<details><summary>Example: 3 Masses on a Plane</summary>
$$
\begin{aligned}
m_1 &= 2 \text{kg}, (-1,3) \\
m_2 &= 6 \text{kg}, (1,1) \\
m_3 &= 4 \text{kg}, (2,-2) \\
\end{aligned}
\\~\\
\begin{aligned}
x &= \frac{
	2(-1) + 6(1) + 4(2)
}{
	2 + 6 + 4
} \\
&= \frac{-2 + 6 + 8}{12} \\
&= 1
\end{aligned} 
\\~\\
\begin{aligned}
y &= \frac{
	2(3) + 6(1) + 2(-2)
}{
	2+6+4
} \\
&= \frac{6+6-8}{12} \\
&= \frac{1}{3}
\end{aligned}
$$
- Therefore, the center of mass is $(1, \frac{1}{3})$
</details>

$$
\boxed{
	\text{Center of Mass (Lamina): }
	x = \frac{M_y}{m} \qquad y = \frac{M_x}{m}
} \\~\\
M_y = \int_a^b x f(x) dx
\qquad
M_x = \int_a^b \frac{[f(x)]^2}{2} dx
\\
m = \int_a^b f(x) dx
$$

<details><summary>Why?</summary>
Now, what if mass is evenly spread continuously throughout a 2D sheet of metal, called a [lamina]{.underline}?
- *(We'll assume the density is constant throughout, but the sheet can be a nonstandard shape)*

Consider the lamina whose shape is a region bounded by $y=f(x)$ above, x-axis below, and lines $x=a$ and $x=b$.

> **Example**: Deriving center of mass formula for a rectangle
> - The center of mass is right the middle.
> - **Symmetry Principle**: If region $R$ is symmetric about a straight line, its geometric center lies on $l$.
> 
> 1. First, let's get the center of mass ($x_i^*$ is the center of the rectangle)
> $$
> \text{Center of Mass of Rectangle: $(x_i^*, \frac{f(x_i^*}{2})$} \\~\\
> \text{x-value: } x_i^* = \frac{x_i + x_i + 1}{2} \qquad
> \text{y-value: } \frac{f(x_i^*}{2}
> $$
>
> 2. Now, let's find the density ($\rho$).
>	- *(Recall that mass is density $\times$ area.)*
> $$
> \text{Mass of Rectangle: }
> m = \int_a^b \rho f(x) dx
> $$
> 
> 3. Now we need moment with respect to the x-axis and y-axis.
> $$
> \text{Moments for One Rectangle: } \\~\\
> \text{I. W.r.t. y-axis: }
> \rho f(x_i^*) \Delta x \times x_i^*
> \\~\\
> \text{II. W.r.t. x-axis: }
> \rho \frac{[f(x_i^*)]^2}{2} \Delta x
> $$
> 
> 4. So,
> $$
> M_y = \sum \rho f(x_i^*) \Delta x \times x_i^* \\
> \\~\\
> M_x = \sum \rho \frac{[f(x_i^*)]^2}{2} \Delta x
> $$
>
> 5. Which can be rewritten as:
> $$
> M_y = \int_a^b \rho x f(x) dx
> \\~\\
> M_x = \int_a^b \rho \frac{[f(x_i^*)]^2}{2} dx
> $$
</details>

<!--*-->
<details><summary>Example: Center of a lamina</summary>
**Q**: Find center of mass of a lamina bounded by $f(x)=\sqrt{x}$, x-axis, over $[0,4]$

**A**: 
1. Let's start by finding the total mass ($m$)
$$
\begin{aligned}
	m &= \int_0^4 \rho \sqrt{x} dx \\
	&= \rho \int_0^4 \sqrt{x} dx \\
	&= \rho \frac{2}{3} ( 4^{3/2} - 0 ) \\
	&= \frac{2 \rho}{3} (2)^3 \\
	m &= \frac{16 \rho}{3}
\end{aligned}
$$

2. Next let's find the moment with respect to the y-axis

$$
\begin{aligned}
	M_y &= \int_0^4 \rho x \sqrt{x} dx \\
	&= \rho \int_0^4 x^{3/2} dx \\
	&= \rho \times \frac{2}{5} \times (\sqrt{x})^5 \\
	M_y &= \frac{64 \rho}{5}
\end{aligned}
$$

3. And now, $M_x$:

$$
\begin{aligned}
	M_x &= \int_0^4 \rho \frac{ \sqrt{x}^2 }{ 2 } dx \\
	&= \frac{\rho}{2} \int_0^4 x^2 dx \\
	&= \frac{\rho}{4} (4^0 - 0^2) \\
	M_x &= 4 \rho
\end{aligned}
$$

4. Finally:

$$
\begin{aligned}
x &= \frac{\frac{64 \rho}{5}}{\frac{16 \rho}{3}} \\
&= \frac{12}{5}
\end{aligned}
\\~\\
\begin{aligned}
y &= \frac{4 \rho}{\frac{16 \rho}{3}} \\
&= \frac{3}{4}
\end{aligned}
$$

5. Therefore, the center of mass is $(2.4, 0.75)$
</details>

$$
	\boxed{
		\text{Center of Mass (Bounded Region): }
			x = \frac{M_y}{m} \qquad y = \frac{M_x}{m}
	} \\~\\
	M_y = \int_a^b x [ f(x) - g(x) ] dx
	\qquad
	M_x = \int_a^b \frac{ f(x)^2 - g(x)^2 }{ 2 } dx
	\\
	m = \int_a^b [f(x) -g(x)] dx
$$

<details><summary>Example: Bounded region</summary>
- **Q**: Find the center of mass of the region bounded between $f(x)=1-x^2$ and $g(x)=x-1$

- **A**:

1. We must find $a$ and $b$, so we'll set the equations equal to each other and solve the roots:
$$
\begin{aligned}
	f(x) &= g(x) \\
	1 - x^2 &= x-1 \\
	0 &= x^2 + x -2 \\
	0 &= (x-1)(x+2) \\
\end{aligned}
$$
	- Thus, the $a$ and $b$ is $[-2, 1]$

2. Now we can solve for $M_y$, $M_x$, and $m$.

$$
\begin{aligned}
	m &= \int_{-2}^1 1-x^2 - (x-1) dx \\
	&= \int_{-2}^1 1-x^2 - x + 1 dx \\
	&= \int_{-2}^1 -x^2 -x + 2 dx \\
	&= -\frac{x^3}{3} - \frac{x^2}{2} + 2x |_{-2}^1  \\
	&= \frac{-9}{3} + \frac{3}{2} + 6 \\
	&= 3 + \frac{3}{2} \\
	&= \frac{9}{2}
\end{aligned}
$$

$$
\begin{aligned}
	M_y &= \int_{-2}^1 x ( -x^2 -x + 2 ) dx \\
	&= \int_{-2}^1 -x^3 -x^2 + 2x dx \\
	&= - \frac{x^4}{4} - \frac{x^3}{3} + x^2 |_{-2}^1 \\
	&= \frac{15}{4} - \frac{9}{3} - 3 \\
	&= \frac{15}{4} - 6 \\
	&= \frac{-9}{4}
\end{aligned}
$$

$$
\begin{aligned}
	M_x &= \int_{-2}^1 \frac{ (1-x^2)^2 - (x-1)^2 }{2} dx \\
	&= \frac{1}{2} \int_{-2}^1 1 - 2x^2 + x^4 - ( x^2 - 2x + 1 ) dx \\
	&= \frac{1}{2} \int_{-2}^1 -3x^2 +2x + x^4 dx \\
	&= \frac{1}{2} ( -x^3 + x^2 + \frac{1}{5} x^5 |_{-2}^1) \\
	&= \frac{1}{2} ( \frac{1}{5} - 12 + \frac{32}{5} ) \\
	&= \frac{1}{2} ( \frac{33}{5} - \frac{60}{5} ) \\
	&= \frac{-27}{10}
\end{aligned}
$$

3. Now we solve for $x$ and $y$

$$
\begin{aligned}
x &= \frac{-9}{4} \times \frac{2}{9} = - \frac{1}{2} \\
y &= \frac{-27}{10} \times \frac{2}{9} = - \frac{3}{5}
\end{aligned}
$$
</details>

<details><summary>Example: Physical application (mass of rod)</summary>
We can use these equations to solve for physical problems *(not to be confused with real-world applications)*, like when your project manager gives you this question:

**Q**: From $x = \frac{\pi}{2}$ to $x = \pi$, the density of a rod is given by $\rho (x) = \sin x$. Find the total mass of the rod.

**A**: 

$$
\begin{aligned}
	m &= \int_{\frac{\pi}{2}}^\pi \sin x dx \\
	&= - \cos \pi - + \cos \frac{\pi}{2} \\
	&= 1
\end{aligned}
$$
</details>


## Physical Applications

$$
\boxed{
	\text{Mass of Annulus: } 
	m \approx 
	\int 2 \pi x \rho (x) dx
}
$$

<details><summary>Example: Annulus</summary>
**Q**: If $\rho (x) = \sqrt{x}$ is radial density of a disk of radius 4, find its mass.

**A:**
$$
\begin{aligned}
m &= \int_0^4 2 \pi x \sqrt{x} dx \\
&= \int_0^4 2 \pi x^{3/2} dx \\
&= 2 \pi \times \frac{2}{5} [ 4^{5/2} ] \\
&= \frac{128 \pi}{5}
\end{aligned}
$$
</details>

$$
\boxed{
	\text{Work: } W = \int_a^b F(x) dx
} \\~\\
\boxed{
	\text{Hooke's Law: } F = kx
}
$$

<details><summary>Why?</summary>
$$
\text{Work $=$ Force $\times$ Distance} \\~\\
f = ma
$$

> **Note**: Hooke's law says that the force required to stretch a spring from equilibrium is proportional to distance from equilibrium $x$.
</details>

<details><summary>Example: Work on a spring</summary>
**Q:** It takes 10N of force in negative direction to compress a spring 0.2m from equilibrium.
- How much work is done to stretch spring 0.5 m from equilibrium?

**A**: 
$$
\begin{aligned}
	F &= 10 \\
	x &= -0.2
\end{aligned} \\~\\
F = kx \\
-10 = k (-0.2) \\
k = \frac{10}{0.2} = 50
$$
- Thus, $F = 50x$

$$
\begin{aligned}
W &= \int_0^{.5} 50 x dx \\
&= 25 x^2 |_0^{.5} \\
&= \frac{25}{4}
\end{aligned}
$$
- Or, 6.25 Joules of work
</details>

<details><summary>Example: Work to pump water out of a tank</summary>
**Q**: Suppose a cylindrical tank of radius 4m and height 10m is filled with water to a height of 8m,
- How much work is done to pump water out of tank?
	* Assume was raise all water to top.
- Note: Water has weight density of 9800 $N/m^3$

**A**: 
$$
\begin{aligned}
V &= \pi r^2 h \\
&= \pi (4)^2 \Delta h
\end{aligned} \\~\\
F = 9800 \times 16 \pi \Delta h  \\~\\
\begin{aligned}
W &= \int_0^8 9800 \times 16 \pi (10 - h) dh \\
\end{aligned}
$$
</details>

# Hyperbolic Functions

$$
\boxed{
	\text{Hyperbolic Cosine: } \cosh x = \frac{e^x + e^{-x}}{2}
} \\~\\
\boxed{
	\text{Hyperbolic Sine: } \sinh x = \frac{e^x - e^{-x}}{2}
}
$$

<details><summary>Properties, Deriving Other Hyperbolic Functions</summary>
You can derive other hyperbolic functions trivially, e.g.,
$$
\sech x = \frac{1}{\cosh x} \\
\cosh^2 x + \sinh^2 x = 1
$$

Properties are same, e.g.,
$$
(\cosh)' = \sinh x
$$
</details>

# Sequences

<details><summary>What is a Sequence</summary>
$$
\text{\textbf{Sequence}: An ordered infinite list of numbers.} \\
\small\text{(often of the form $a_1, a_2, a_3, a_4, ..., a_n, ...$)}
$$

**Arithmetic Sequence**: Distance between every pair of successive terms is same.
- This difference is called the common difference ($d$)

**Geometric Sequence**: Ratio of successive to previous term is same.
- This ratio is called the common ratio ($r$)

$$
\text{Shorthand for Sequence:} \\
\{ a_n \}_{n=1}^\infin \quad \text{or} \quad \{ a_n \}
$$

> **Example**: Shorthand representation of a sequence
> - Listing: { 2, 4, 8, 16, 32, 64, ... }
> - Formula: $\{ 2^n \}$

**Terminology**:
- For a sequence $a_1, a_2, a_3, a_4, ..., a_n, ...$:
	- $n$ is the [index variable]{.underline}.
	- $a_n$ is the [term]{.underline}.
	- $a_n = 2^n$ is an example of an [explicit function]{.underline} for a sequence
- Sometimes sequences are defined by [recurrence relations]{.underline}, where one or more terms are defined explicitly while the rest are defined in terms of previous terms.
	* E.g., $a_n = 2^n$ could also be defined with a recurrence relation where:
		+ $a_1 = 2$
		+ $a_n = 2a_{n-1}$ for $n \gt 1$
</details>

<details><summary>Example: Unsystematically finding explicit formulas</summary>
$$
\text{A) }
- \frac{1}{2} , \frac{2}{3}, -\frac{3}{4}, \frac{4}{5}, - \frac{5}{6}
$$

For the moment ignoring the negatives, we can see that the number is always the index variable, while the denominator is the index variable + 1. Thus, the current formula is: 

$$
a_n = \frac{n}{n+1} \times ???
$$

To get the alternating signs we can use { $(-1)^n$ }, which has a pattern of { -1, 1, -1, 1, ...}

> **Note**: To alternate on every other term, do { $(-1)^{n+1}$ }

Thus, the explicit formula is:

$$
a_n = \frac{(-1)^n \times n}{n+1}
$$

---

$$
\text{B) }
\frac{3}{4}, \frac{9}{7}, \frac{27}{10}, \frac{81}{13}, \frac{243}{16}, ...
$$

We can see that the numerator is $3^n$
- (This is a geometric sequence)

The denominator is $1+3n$
- (This is an arithmetic sequence)

Thus, $a_n = \frac{3^n}{1+3n}$
</details>

$$
\boxed{
	\text{Arithmetic Sequence: } a_n = a_1 + d (n - 1)
} \\
\small\textit{(where $d$ is the common difference)} \\
\textit{recurrence relation: } a_1 = k \qquad a_n = a_{n-1} + d \textit{ for } n \ge 2
$$

<details><summary>Example: Systematically finding formula for arithmetic sequence</summary>
**Q**: Find the explicit formula for 25, 21, 17, 13, 4, 5, 1, -3, ...

A: The common difference is $d = -4$, thus the formula is:
$$
a_n = 25 + (-4)(n-1)
$$
</details>

$$
\boxed{
	\text{Geometric Sequence: } a_n = a_1 r^{n-1}
} \\
\small\textit{(where $r$ is the common ratio)} \\
\textit{recurrence relation: } a_1 = k \qquad a_n = r a_{n-1} \textit{ for } n \ge 2
$$

<details><summary>Example: Systematically finding formula for geometric sequence</summary>
**Q**: Find the explicit formula for 12, 18, 27, 40.5, ...

A: The common ratio is $r = \frac{3}{2}$, thus the formula is:
$$
\begin{aligned}
a_n &= 12 \times \frac{3}{2}^{n-1} \\
&= 12 \times \frac{3}{2}^{n} ( \frac{3}{2} )^{-1} \\
&= 12 \times \frac{3}{2}^{n} \frac{2}{3} \\
&= 8 (\frac{3}{2})^n
\end{aligned}
$$
</details>

<details><summary>Example: Find explicit formula for recurrence relations</summary>
**Q**: Find the explicit formula for:
$$
a_1 = 2 \qquad a_n = -3 a_{n-1} \text{ for } n \ge 2
$$

A: By listing out the terms we can see that the sequence is geometric, where $r = -3$:
$$
\{ 2, -6, 18, -54 \}
$$

Therefore, $a_n = 2(-3)^{n-1}$

**Q**: 
$$
a_1 = \frac{1}{2} \qquad a_n = a_{n-1} + ( \frac{1}{2} )^n \text{ for } n \ge 2
$$

**A**: Listing out the terms we see:
$$
\{
	\frac{1}{2}, \frac{3}{4}, \frac{7}{8}, \frac{15}{16}
\}
$$
- The denominator is a geometric sequence: $2^n$
- And the numerator is the denominator - 1, so:

$$
a_n = \frac{2^n - 1}{2^n}
$$
</details>

<details><summary>How-To Graph a Sequence</summary>
To graph a sequence { $a_n$ }, we plot points ($n$, $a_n$)

> **Example**: { $2^n$ }
> - Points would be (1,2), (2,4), (3,8), ...
</details>

$$
\boxed{
	\text{Alternating Signs: } \{ (-1)^n \} = \{ -1, 1, -1, 1, ... \}
} \\
\small\textit{(do n+1 to change alternation)}
$$

$$
\boxed{
	\text{Even Numbers: } \{ 2n \}
} \\~\\
\boxed{
	\text{Odd Numbers: } \{ 2n - 1 \}
}
$$

$$
\boxed{
	\text{Factorial: } a_0 = 1, a_n = n ( a_{n-1} ) \text{ for } n \ge 1
}
$$

## Algebraic Laws for Sequences

$$
\text{Suppose:}\\
\begin{aligned}
	\lim_{n \to \infin} a_n &= A \\
	\lim_{n \to \infin} b_n &= B \\
\end{aligned} \\~\\
\begin{aligned}
	\text{1) }& \lim_{n \to \infin} c = c \\
	\text{2) }& \lim_{n \to \infin} c a_n = c \times \lim_{n \to \infin} a_n = c \times A \\
	\text{3) }& \lim_{n \to \infin} a_n \pm b_n = \lim_{n \to \infin} a_n \pm \lim_{n \to \infin} b_n = A + B \\
	\text{4) }& \lim_{n \to \infin} a_n b_n = (\lim_{n \to \infin} a_n) (\lim_{n \to \infin} b_n) = AB \\
	\text{5) }& \lim_{n \to \infin} \frac{a_b}{b_n} = \frac{\lim_{n \to \infin} a_n}{\lim_{n \to \infin} b_n} = \frac{A}{B}
\end{aligned} \\~\\
\small\textit{((5) provided that $B \ne 0$)}
$$

## Convergence

$$
\boxed{
	\text{Convergent Sequence: }
	\lim_{n \to \infin} a_n = L
}
$$

<details><summary>More on Convergence and Divergence</summary>
Given a sequence { $a_n$ }, if the terms $a_n$ get arbitrarily close to some finite number $L$ as $n$ becomes sufficiently large, then we say { $a_n$ } is a convergent sequence is a [convergent sequence]{.underline} and that $L$ is the limit of the sequence:
$$
\lim_{n \to \infin} a_n = L
$$

Otherwise, we say it is divergent.

> **Example** *(as $n \to \infin$)*
> - Convergent: $2^n \to \infin$
> - Convergent: $1 - \frac{1}{2^n} \to 1$
> - Divergent: $(-1)^n \to$ oscillates between -1 and 1 forever
> - Convergent: $\frac{(-1)^n}{n} \to 0$
</details>

> ### Theorem I
> 
> Let { $a_n$ } be a sequence and $f(x)$ a function so that $a_n = f(n)$ for every positive integer $n$.
> 
> If there exists some real number $L$ so that $\lim_{x \to \infin} f(x) = L$ , then { $a_n$ } converges and $\lim_{x \to \infin} a_n = L$

<details><summary>Example: Does it converge?</summary>
**Q**:
$$
\lim_{n \to \infin} \frac{3n^4 = 7 n^2 + 5}{6-4 n^4}
$$

A: We'll multiply numerator and denominator by $\frac{1}{n^4}$ (so that we can cancel things out with the fact that $\frac{1}{x} = 0$ if $x \to \infin$)
$$
\begin{aligned}
=& \lim_{n \to \infin} \frac{
	3- \frac{7}{n^2} + \frac{5}{n^4}
}{
	\frac{6}{n^4} - 4
} \\
=& \frac{3 - 0 + 0}{0 - 4} \\
=& - \frac{3}{4}
\end{aligned}
$$

**Q**:
$$
\{
(1 + \frac{4}{n})^n
\}
$$

> **Note**: $1^\infin$ is indeterminate
> - *(We don't know if we are approaching 1 fast enough to cancel out the infinity)*

A: We'll take the $\ln$ of both sides to get a real value, and then plug that value back in and put both sides as a power of $e$:

$$
\ln y = \ln (1 + \frac{4}{x})^x \\
= \lim_{x \to \infin} \frac{1 + \frac{4}{x}}{\frac{1}{x}}
$$

This form is indeterminate, so we can use L'Hopitals:

$$
\lim{x \to \infin} \frac{
	\frac{-4x^2}{1 + \frac{4}{x}}
}{
	-x^{-2}
} = 
\lim_{x \to \infin} \frac{4}{1 + \frac{4}{x}} = 4
$$

Thus,
$$
\lim_{n \to \infin} \ln (1 + \frac{4}{n})^n = 4 \\
\lim_{n \to \infin} (1 + \frac{4}{n})^n = e^4
$$
</details>

> ### Squeeze Theorem
> 
> Suppose { $a_n$ }, { $b_n$ }, { $c_n$ } are sequences where $a_n \le b_n \le c_n$
> 
> If $\lim_{n \to \infin} a_n = L = \lim_{n \to \infin} c_n$,
> 
> Then $\lim_{n \to \infin} b_n = L$

<details><summary>Example: Does it converge?</summary>
**Q**: { $\frac{(-1)^n \cos n}{n^2}$ }

**A**:

$$
-1 \le \cos n \le 1 \\
\frac{-1}{n^2} \le \frac{\cos n}{n^2} \le \frac{1}{n^2} \\
$$

$$
\frac{-1}{n^2} \land \frac{1}{n^2} \text{ for go to $\infin$ as $n \to \infin$}
$$
- So $\frac{\cos n}{n^2}$ will also go to zero.

Thus, { $\frac{(-1)^n \cos n}{n^2}$ } also converges on zero.

**Q**: Show $r^n$ converges for $-1, r \le 1$ and diverges otherwise.

A:

$$
- | r |^n \le r^n \le |r|^n \\
\lim_{n \to \infin} \pm |r|^n = 0
$$
- By squeeze theorem, $\lim_{n \to \infin} r^n = 0$ when $r=1$.

But/and $r>1$: $\lim_{n \to \infin} r^n = \infin$ and $r<-1$ grows arbitrarily large and oscillates between negative and positive infinity ($(-2)^n$)
</details>

## Bounded Sequences

> ### Bounded Sequences
> 
> A sequence is **bounded above** if there is some real number $m$ so that $a_n \le M$ for every $n$.
> 
> A sequence is **bounded below** if there is some real number $m$ so that $a_n \ge M$ for every $n$.
> 
> A sequence bounded above and below is **bounded**.
> - Otherwise, it is **unbounded**.
>
> > **Note**: For shorthand, "for every $n$" is referring to every positive real number.

<details><summary>Example: Bounded and unbounded sequences</summary>
- { $\frac{1}{n}$ } is bounded above since $\frac{1}{n} \le 1$ for all $n$; and it is also bounded below since $\frac{1}{n} \ge 0$ for every $n$.
- { $n$ } is bounded below since $n \ge 0$ for every $n$, but it isn't bounded above (it just goes to infinity). Thus, it is unbounded.
</details>

> ### Theorem: All Unbounded Sequences Diverge; or,
> ### Theorem: All Convergent Sequences Are Bounded
> 
> If a sequence { $a_n$ } converges, then it is bounded.
> - Contrapositive: If { $a_n$ } is unbounded, { $a_n$ } diverges.
> 
> > **Important**: This does NOT mean that all bounded sequences are convergent (they aren't)!
> > - e.g., { $(-1)^n$ } is bounded, but does not converge.

## Monotonic Sequences

$$
\boxed{
      \text{Increasing Monotonic Sequence: }
	a_{n+1} \ge a_n 
} \\
\small\textit{For all } n \ge n_0
$$

$$
\boxed{
      \text{Decreasing Monotonic Sequence: }
	a_{n+1} \le a_n
} \\
\small\textit{For all } n \ge n_0
$$

<details><summary>Longer Definition: Monotonic Sequences</summary>
> ### Monotonic Sequences
> 
> A sequence { $a_n$ } is monotonic for all $n>n_0$ if it is either increasing or decreasing for all $n>n_0$.
> 
</details>

$$
\boxed{
	\begin{aligned}
	&\qquad \text{Difference Test: } \\
	& \text{Increasing: } a_{n+1} - a_n \ge  0 \\
	& \text{Decreasing: } a_{n+1} - a_n \le  0 
	\end{aligned}
}
$$

$$
\boxed{
	\begin{aligned}
	&\qquad \text{Ratio Test: } \\
	& \text{Increasing: } a_{n+1} \div a_n \ge  0 \\
	& \text{Decreasing: } a_{n+1} \div a_n \le  0 
	\end{aligned}
}
$$

<details><summary>Why? (Deriving Difference and Ratio Test for Monotonicity)</summary>
Take the definitions of increasing/decreasing monotonic sequences:
1. Subtract $a_n$ from both sides to get the difference test for increasing/decreasing monotonicity.
2. Divide $a_n$ from both sides to get the ratio test for increasing/decreasing monotonicity.
	- Remember that the ratio test should only be used for positive sequences.
</details>

<details><summary>Example: Show the sequence is monotonic</summary>
**Q:** Show that { $\frac{n+1}{n}$ } is monotonic.

**A:** **Method 1: Difference Method**

We can take the definition of increasing and decreasing monotonic sequences and move the terms to one side to get these formulas:

$$
\text{Increasing Monotonic: }
a_{n+1} - a_n \ge 0
$$

$$
\text{Decreasing Monotonic: }
a_{n+1} - a_n \le 0
$$

---

Now we can find $a_n$ and $a_{n+1}$:
$$
a_n = \frac{n+1}{n} \\
a_{n + 1} = \frac{n+2}{n + 1} \\
$$

Now we just need to perform $a_{n+1} - a_n$ and check whether it is negative
- ($\le \lor \ge 0$)

$$
a_{n+1} - a_n =
\frac{(n+2)n}{(n+1)n} - \frac{(n+1)(n+1)}{(n+1)n} \\
= \frac{
	n^2 + 2n - ( n^2 -n + n + 1 )
}{
	(n+ 1) n
} \\
= \frac{
	-1
}{
	(n+1)n
}
$$

Because the difference is (always) less than or equal to zero, that means { $\frac{n+1}{n}$ } is decreasing and therefore monotonic.
</details>

> ### Theorem: Bounded Monotonic Sequences Always Converge
> 
> If { $a_n$ } is bounded and monotonic for $n \ge n_0$, then { $a_n$ } converges.


<details><summary>Example: Show the sequence is convergent</summary>
**Q:** Show that { $\frac{n+1}{n}$ } converges.

**A:** **1. Using Monotone Convergence**

In the previous example—which used the difference method—we know that the sequence is decreasing monotonic.

Since $n$ is positive, $\frac{n+1}{n}$ is always positive; or $\frac{n+1}{n} > 0$, which means that the sequence is bounded from below.

We can calculate that $a_1 = 2$, and since the sequence is decreasing monotonic, the sequence is also bounded from above.

Therefore, the sequence is convergent by the Monotone Convergence Theorem.

**A: 2. L'Hopital's Rule**

We could also take L'Hopital's and find $L=1$, as this example was easy to computer.
- But not examples will be like this!

**Q:** Show that { $\frac{4^n}{n!}$ } converges.

**A:**

We can see that $\lim_{n \to \infin} n! = \infin$, which means that $\lim_{n \to \infin} \frac{4^n}{n!} = \frac{\infin}{\infin}$.
- As this isn't a function, we can't use L'Hopital's, though.

1. Show { $\frac{4^n}{n!}$ } is monotonic

**Method 2: Ratio Method**

Instead of moving terms in the definition of monotonic sequences with subtraction to create a test, we could also use division to create a test for monotonicity.
- **Note**: This only works if $a_n > 0$

$$
\text{Increasing Monotonic: }
\frac{a_{n+1}}{a_n} \ge 1
$$

$$
\text{Decreasing Monotonic: }
\frac{a_{n+1}}{a_n} \le 1
$$

$$
a_n = \frac{4^n}{n!} \\
a_{n+1} = \frac{4^{n+1}}{(n + 1)!} \\
$$

Doing the test:
$$
\begin{aligned}
\frac{a_{n+1}}{a_n} &=
\frac{4^{n+1}}{(n + 1)!} \times \frac{n!}{4} \\
&= \frac{4n!}{(n+1)!} \\
&= \frac{4n!}{(n+1)n!} \\
&= \frac{4}{n+1}
\end{aligned}
$$

> Why?
> - The $4^{n+1}$ and $\frac{1}{4^n}$ cancel out into a $4$
> - In regard to the division of the terms with factorial:
> $$
> \begin{aligned}
> 3! &= 3 \times 2 \times 1 \\
> (3 + 1)! &= 4! = 4 \times 3 \times 2 \times 1 \\
> \frac{3!}{(3+1)!} &= \frac{1}{4} \\
> \frac{n!}{(n+1)!} &= \frac{1}{n + 1} \\
> \end{aligned}
> $$

$\frac{4}{n+1}$ will become $\le 1$ if and only if $4 \le n + 1$
- So, for $n \ge 3$, { $\frac{4^n}{n!}$ } is decreasing.

2. Show { $\frac{4^n}{n!}$ } is bounded

Also, the sequence is $> 0$  for all $n$, so the sequence is bounded.

Thus, the sequence is convergent.
</details>

# Infinite Series

<!--
<details><summary>Example: Intro problem</summary>
**Q**: 
Oil is leaking into a lake.

- Week 1: 1/2 a ton leaks in
- Week 2: 1/4 a ton leaks.
- Week 3: 1/8 a ton.
- Week 4: 1/16 a ton.

How much oil is in the lake as time goes on?

> Note: We can see that the amount of oil leaking into the leak is the sequence { $\frac{1}{2^n}$ }.

**A**:
- Week 1: $s_1 = 1/2$
- Week 2: $s_2 = 1/2 + 1/4 = 3/4$
- Week 3: $s_3 = 3/4 + 1/8 = 7/8$
- Week 4: $s_4 = 7/8 + 1/16$ = 15/16
- Week $k$: $s_k = \frac{2^k - 1}{2^k} \lor 1 - \frac{1}{2^k}$

As time goes on, oil in the lake approaches:
$$
\lim_{k \to \infin} s_k = \lim_{k \to \infin} 1 - \frac{1}{2^k} = 1 \text{ ton}
$$
</details>
-->

### Infinite Series

If { $a_n$ } is a sequence, we call $s_k$ the sum of the first $k$ terms:

$$
\boxed{
\text{$k$th Partial Sum of the Sequence: } s_k = \sum_{n = 1}^k a_n
}
$$

The limit of $k$th partial sums ($\lim_{k \to \infin} s_k$) is denoted:

$$
\boxed{
\text{Infinite Series: } \sum_{n=1}^\infin a_n
}
$$
$$
\boxed{
	\text{Infinite Series Sum: }
      \frac{r}{1-r}
}\\
\small\textit{( only converges for $-1 < r < 1$ )}
$$

<details><summary>Example: Find the sum</summary>
**Q**:
$$
\sum_{n=1}^\infin (\frac{1}{2})^n
$$

**A**:
$$
\begin{aligned}
\sum_{n=1}^\infin (\frac{1}{2})^n
&=
\frac{\frac{1}{2}}{1 - \frac{1}{2}} \\
&= \frac{\frac{1}{2}}{\frac{1}{2}} \\
&= 1
\end{aligned}
$$
</details>


> ### Convergence
> If $s_k$ converges to $S$, we write $\sum_{n=1}^\infin a_n = S$ and we say the infinite series converges.
> 
> Otherwise, we say the infinite series diverges.

### Geometric Series

$$
\boxed{
\text{Geometric Series: } \sum_{n=1}^\infin r^n
}
$$
$$
\boxed{
	\text{$k$th Partial Sum of Geometric Series: }
      s_k = 1 - \frac{1}{2^k}
}
$$
<details><summary>Why?</summary>
Partial Sum of Geometric Series:

$$
s_k = r+ r^2 + r^3 + ... + r^k \\
s_k(1-r) = r + r^2 + r^3 + ... + r^k(1-r) \\
s_k(1-r) = r-r^{k+1} \\
s_k(1-r) = r(1-r^{k}) \\
\text{($1-r$ must $\ne$ 0)} \\
s_k = \frac{r(1-r^{k})}{1-r} \\
s_k = 1 - \frac{1}{2^k}
$$
</details>

### Geometric Series Test

$$
 \text{A geometric series ($\sum_{n=1}^\infin r^n$) is convergent if: }\\
\boxed{
	\text{Geometric Series Test: } \sum_{n=1}^\infin = \frac{r}{1-r}
}
\\
\small\textit{( if and only if $-1 < r < 1$ )}
$$

<details><summary>1-Indice Form</summary>
$$
\sum_{n=0}^\infin = \frac{1}{1-r}
$$
</details>

<details><summary>Does the geometric series converge?</summary>
**Q:**
$$
\sum_{n=0}^\infin (\frac{-1}{2})^n
$$

**A**: It converges because $-1 < \frac{-1}{2} < 1$

If we use $\frac{1}{1 - r}$ we can see that it converges to $\frac{2}{3}$

**Q**: 
$$
\sum_{n=1}^\infin (-1)^n
$$

**A**: Diverges because $-1$ is not between $-1$ and $1$.
</details>

### Non-Geometric Series

$$
\boxed{
	\text{$k$th Partial Sum: }
	s_k = \frac{n}{n+1}
}
$$

**An infinite series is a limit of partial sums.**

<details><summary>Why?</summary>
**Q**: 
$$
\sum_{n=1}^\infin \frac{1}{n(n+1)}
$$

**A**:
$$
\begin{aligned}
s_1 &= a_1 = \frac{1}{1 \times 2} = \frac{1}{2} \\
s_2 &= a_1 + a_2 = \frac{1}{1 \times 2} + \frac{1}{2 \times 3} = \frac{2}{3} \\
s_3 &= a_1 + a_2 + a_3 = \frac{1}{1 \times 2} + \frac{1}{2 \times 3} + \frac{1}{3 \times 4} = \frac{3}{4}
\end{aligned}
$$
- etc...
</details>

### Harmonic Series

$$
\boxed{
\text{Harmonic Series: } \sum_{n=1}^\infin \frac{1}{n}
}\\
\small\textit{(diverges)}
$$

<details><summary>Why?</summary>
$$
1 + \frac{1}{2} + \frac{1}{3} + \frac{1}{4} > 
1 + \frac{1}{2} + \frac{1}{4} + \frac{1}{4}
$$
- Because $\frac{1}{3} > \frac{1}{4}$


$$
1 + \frac{1}{2} + \frac{1}{3} + \frac{1}{4} + ... \frac{1}{8} > 
1 + \frac{1}{2} + \frac{1}{4} + \frac{1}{4} + \frac{1}{8} + \frac{1}{8} + \frac{1}{8} + \frac{1}{8}
$$

So on and so forth...

Partial sum is bigger than $1+\frac{n}{2}$, so infinite sum of harmonic series will also go to $\infin$
</details>

## Telescoping Series

> ### Telescoping Series
> 
> A series where the next term in the sum cancels the previous term.


<details><summary>Example: Find the sum</summary>
**Q**: Find the sum of:
$$
\sum_{n=1}^\infin \ln (\frac{n}{n+1})
$$

**A**:

1. Let's find the pattern to find $s_k$
$$
\begin{aligned}
s_1 &= \ln(\frac{1}{2}) = \ln 1 - \ln 2 \\
s_2 &= \ln(\frac{1}{2}) + \ln(\frac{2}{3}) = \ln 1 - \ln 2 + \ln 2 - \ln 3 = \ln1 - \ln 3 \\
s_3 &= \ln(\frac{1}{2}) + \ln(\frac{2}{3}) + \ln(\frac{3}{4}) = \ln 1 - \ln 2 + \ln 2 - \ln 3 + \ln 3 - 
\ln 4 = \ln 1 - \ln 4
\end{aligned}
$$

Thus,
$$
s_k = - \ln (k + 1)
$$

2. Thus, the sum is:

$$
\begin{aligned}
\sum_{n=1}^\infin \ln (\frac{n}{n+1}) &= \lim_{k \to \infin} s_k \\
&= \lim_{k \to \infin} - \ln (k + 1) \\
&= - \infin
\end{aligned}
$$

**Q**:
$$
\sum_{n=1}^\infin \fra{1}{n} - \frac{1}{n+1}
$$

**A**:
- Writing out the first couple $s_k$ values, we can derive that $s_k = \frac{k}{k+1}$, which goes to 1 as $k$ goes to infinity.
</details>

## Algebraic Laws for Series

$$
\text{Suppose:}\\
\begin{aligned}
	\sum_{n=1}^\infin a_n &= L \\
	\sum_{n=1}^\infin b_n &= K \\
\end{aligned} \\~\\
\begin{aligned}
	\text{1) }& \sum_{n=1}^\infin c a_n = c L \\
	\text{2) }& \sum_{n=1}^\infin (a_n + b_n) = L + K \\
	\text{3) }& \sum_{n=1}^\infin (a_n - b)n) = L - K
\end{aligned} \\~\\
\small\textit{($L$ and $K$ diverging doesn't necessarily mean $L \pm K$ also diverges)}
$$

<details><summary>Example: Find the sum</summary>
**Q**:
$$
\sum_{n=1}^\infin \frac{4}{(-3)^n}
$$

**A:**
$$
\begin{aligned}
\sum_{n=1}^\infin \frac{4}{(-3)^n} - \frac{3}{3^n}
&= \sum_{n=1}^\infin \frac{4}{(-3)^n} - \sum_{n=1}^\infin \frac{3}{3^n} \\
&= 4 \sum_{n=1}^\infin \frac{1}{(-3)^n} - 3 \sum_{n=1}^\infin \frac{1}{3^n} \\
&= 4 \sum_{n=1}^\infin (\frac{-1}{3})^n - 3 \sum_{n=1}^\infin (\frac{1}{3})^n \\
&= 4 \times \frac{ - \frac{1}{3} }{ 1 - ( -\frac{1}{3} ) } - 3 \times \frac{ \frac{1}{3} }{ 1 - \frac{1}{3} } \\
&= -1 - \frac{3}{2} \\
&= - \frac{5}{2}
\end{aligned}
$$
</details>

## Divergence and Integral Tests

> ### Theorem I
> 
> If $\sum_{n=1}^\infin$ converges, then $\lim_{n \to \infin} a_n = 0$

<details><summary>Why?</summary>
Suppose $\sum_{n=1}^\infin$ converges.
- Then the sequence of partial sums ($s_k$) converges to some number $L$, where $\lim_{k \to \infin} s_k = L$

Let's define a new sequence:
$$
b_1 = 0, b_2 = s_1, b_3 = s_2, b_4 = s_3, ..., b_k =s_{k=1}, ...
$$
- Then $\sum_{k=1}^\infin b_k = \lim_{k \to \infin} s_{k-1} = L$

Then:
$$\
\begin{aligned}
lim_{k \to \infin} s_k - b_k &= \lim_{k \to \infin} s_k - s_{k - 1} \\
&= L - L \\
&= 0
\end{aligned}
$$

$$
\begin{aligned}
	s_1 - b_1 &= s_1 - 0 = s_1 = a_1 \\
	s_2 - b_2 &= s_2 - s_1 = a_1 + a_2 -a_1 = a_2 \\
	s_3 - b_2 &= s_3 - s_2 = ... = a_3 \\
	s_k - b_k &= a_k
\end{aligned}
$$

Thus, $\lim_{k \to \infin} a_k = 0$
</details>
<!--
> ### I
> For a series $\sum_{n=1}^\infin$ to even have a chance of converging, it must go to $0$ as $n \to \infin$
-->

## $n$th Term Test for Divergence

$$
\boxed{
	\text{If }
		\lim_{n \to \infin} \ne 0
	\text{, then }
		\sum_{n=1}^\infin a_n \text{ diverges}
}
$$

<details><summary>Why: Contrapositive</summary>
$$
P \to Q = Q' \to P
$$
- If $P$, then $Q$
- If not $Q$, then not  $P$.

> If honey's what you covet, [then] you'll find that they [heffulumps and woosels] love it.
> - **Contrapositive**: If heffulumps and woosels don't love honey, then you don't covet honey.

Convergence: If $\sum_{n=1}^\infin a_n$ converges, then $\lim_{n \to \infin = 0}$
- Contrapositive: If $\lim_{n \to \infin} \ne 0$, then $\sum_{n=1}^\infin a_n$ diverges.
	* *Remember, this doesn't say anything about when $\lim_{n \to \infin} = 0$!*
</details>

<details><summary>Example: Does it diverge?</summary>
**Q**: $\sum_{n=1}^\infin \frac{n}{3n+1}$

**A**:
$$
\lim_{n \to \infin} \frac{n}{3n+1} = \frac{1}{3}
$$
- Thus, diverges. ($\frac{1}{3} \ne 0$)

**Q**: $\sum_{n=1}^\infin e^{\frac{1}{n^2}}$

**A**:
$$
\lim_{n \to \infin} e^{\frac{1}{n^2}} = 1
$$
- Thus, diverges. ($1 \ne 0$)
</details>

## Integral Test

$$
\boxed{
	\text{Integral Test: } \sum_{n \to N}^\infin a_n \text{ and } \int_N^\infin f(x) dx \text{ both conv./div.}
} \\
\small\textit{Let { $a_n$ } be a sequence of positive terms} \\
\textit{Let $f(n) = a_n$ for all $n$}
$$

<details><summary>Why?</summary>
Let { $a_n$ } be a sequence of positive terms.

Suppose a continuous and decreasing function $f$ where $f(n) = a_n$ for all $n$.

Then $\sum_{n \to N}^\infin a_n$ IIF $\inf_N^\infin f(x) dx$

$$
0 < \sum_{n=2}^\infin a_n \le \int_1^\infin f(x) dx \le \sum_{n=1}^\infin a_n
$$
- If $\sum_{n=1}^\infin a_n$ converges, then $\int_1^\infin f(x) dx$ converges.
</details>

<details><summary>Example: Does it converge?</summary>
**Q**: $\sum_{n=1}^\infin = \frac{1}{e^n}$

**A**:

Let's test if this integral converges:
$$
\begin{aligned}
\int_1^\infin \frac{1}{e^x} dx &= \lim_{t \to \infin} \int_1^t e^{-x} dx \\
&= \lim_{t \to \infin} e^{-x} |_1^t \\
&= \lim_{t \to \infin} e^{-t} - e^{-1} \\
&= 0 - \frac{1}{e} \\
&= \frac{1}{e} \\
\end{aligned}
$$
- So, by the integral test, the series converges.
</details>

<details><summary>Example: Proving the harmonic series diverges</summary>
$$
\sum_{n=1}^\infin \frac{1}{n}
$$

$$
\begin{aligned}
\int_1^\int \frac{1}{x} dx &=
\lim_{t \to \infin} \ln x |_1^t \\
&= \lim_{t \to \infin} \ln t \\
&= \infin
\end{aligned}
$$
- By the integral test, the harmonic series diverges.
</details>

## p-Series

$$
\boxed{
	\text{p-series form:} \sum_{n=1}^\infin \frac{1}{n^P}
}\\
\small\textit{Where $p$ is a constant} \\
\textit{Convergent if $p > 1$} \\
\textit{Divergent if $p \le 1$}
$$

<details><summary>Why?</summary>
We can use the integral test to determine if a p-series converges or diverges:

$$
\begin{aligned}
\int_1^\infin \frac{1}{x^P} dx &= \lim_{t \to \infin} \int_1^t x^{-P} dx \\
&= \lim_{t \to \infin} \frac{x^{-P-1}}{-p + 1} |_1^t \\
&= \lim_{t \to \infin} \frac{1}{(1-p)x^{p - 1}} |_1^t \\
&= \lim_{t \to \infin} \frac{1}{(1-p)t^{p - 1}} - \frac{1}{1-p} \\~\\
&= 0 - \frac{1}{1-p} \text{ if $p-1 > 0$} \\
&= \infin \text{ if $p-1 < 0$} \\
\end{aligned}
$$

Thus,:
- If $p > 1$, the series converges.
- If $p \le 1$, the series diverges.
</details>

<details><summary>Example: Which of the following converge?</summary>
**Q**: $\frac{1}{n^4}$
- A: Converges

**Q**: $\frac{1}{n^{2/3}}$
- A: Diverges

**Q**: $\frac{1}{n^\pi}$
- A: Converges
</details>

## Remainder Test

$$
\boxed{
	\text{Remainder: }
	R_N = \sum_{n=1}^\infin a_n - S_N
}
$$

<details><summary>Why?</summary>
Derived from integral test.

$$
S_N + \sum_{n=N+1}^\infin a_N \le S_N + \int_N^\infin f(x) dx
$$

$$
\sum_{n=1}^\infin a_n \le S_N + \int_N^\infin f(x) dx
$$

$$
\int_{N+1}^\infin f(x) dx \le \sum_{n=1}^\infin a_n - S_N \le \int_N^\infin f(x) dx
$$
- $R_N = \sum_{n=1}^\infin a_n - S_N$
</details>

> ### Remainder Estimate for Integral Test
> $$
> \boxed{
> \text{Remainder Estimate: } \int_{N+1}^\infin f(x) dx < R_n < \int_N^\infin f(x) dx
> }
> $$
> Suppose { $a_n$ } is a sequence with positive terms. $f$ is a continuous, decreasing function with $f(n_=a_n$ for all $n \ge 1$.
> 
> Let $S_N$ be the $N$th partial sum of $\sum_{n=1}^\infin$ and suppose this series converges.
> 
> Then, for all $n$, the remainder ($R_N$) satisfies the estimate.

<details><summary>Example: Remainder estimate for integral</summary>
**Q**: Consider $\sum_{n=1}^\infin \frac{1}{n^2}$, which is a convergent p-series (because $2 > 1$). Calculate $S_{10}$ along with the error.

**A**: Using a calculator, we get $S_{10} \approx 1.549767731$

Now, estimating error:

$$
\begin{aligned}
\int_{N+1}^\infin \frac{1}{x^2} dx &=
\lim_{t \to \infin} \int_N^t x^{-2} dx \\
&= \lim_{t \to \infin} \frac{x^{-1}}{-1} |_N^t \\
&= \lim_{t \to \infin} - \frac{1}{x} |_N^t \\
&= \frac{1}{N}
\end{aligned}
$$

$$
\frac{1}{11} < R_{10} < \frac{1}{10} = 0.1
$$
- Thus, the answer $S_{10}$ is at most 0.1 off from the actual answer.

**Follow-Up Question**: How far would we need to go to get an error at most $0.001$?

We now know:
$$
R_N < \int_N^\infin \frac{1}{x^2} dx = \frac{1}{N}
$$

Thus we just need to solve:
$$
\frac{1}{N} < 0.001
$$
- This gives us $N=1000$, which is the answer.
</details>

## The Comparison Test

> ### Direct Comparison Test
> 
> Let { $a_n$ } and { $b_n$ } be positive sequences such that $a_n \le b_n$ for all $n \ge N$ for some positive integer $N$.
> - If $\sum_{n=1}^\infin b_n$ converges, so does $\sum_{n=1}^\infin a_n$
> - If $\sum_{n=1}^\infin a_n$ diverges, so does $\sum_{n=1}^\infin b_n$

<details><summary>Why?</summary>
$$
\text{Does it converge?: }
\sum_{n = 1}^\infin \frac{1}{n^2 + 1}
$$
- Looks kinda like the p-series { $\frac{1}{n^2}$ }
	* And we know that the p-series converges because $p=2$

We can see that:
$$
\sum_{n = 1}^\infin \frac{1}{n^2 + 1}
<
\sum_{n = 1}^\infin \frac{1}{n^2}
$$
- Because the series is bounded above and is monotonic, we can see that it converges.
</details>

<details><summary>Example</summary>
**Q**: Does $\sum_{n=1}^\infin \frac{1}{\ln n}$ converge?

> Hint: $n > \ln n$

**A**: We'll do comparison test against $\frac{1}{n}$

$$
\sum_{n=1}^\infin \frac{1}{n} < \sum_{n=1}^\infin \frac{1}{\ln n}
$$

We know the harmonic series diverges, so the series also diverges.
</details>

> ### Limit Comparison Test
> 
> Let { $a_n$ } and { $b_n$ } be positive sequences such that $a_n \le b_n$ for all $n \ge N$ for some positive integer $N$.
> 1. If $\lim_{n \to \infin} \frac{a_n}{b_n} = L$, then $\sum_{n=1}^\infin a_n$ and $\sum_{n=1}^\infin b_n$ both converge or both diverge.
> 2. If $\lim_{n \to \infin} \frac{a_n}{b_n} = 0$ and $\sum_{n=1}^\infin b_n$ converges, then $\sum_{n=1}^\infin a_n$ converges.
> 3. If $\lim_{n \to \infin} \frac{a_n}{b_n} = \infin$ and $\sum_{n=1}^\infin b_n$ diverges, then $\sum_{n=1}^\infin a_n$ diverges.

<details><summary>Example</summary>
**Q**: Does $\sum_{n=1}^\infin \frac{1}{\sqrt{n^2 + 3}}$ converge?

**A**: We'll try to directly compare this against $\frac{1}{\sqrt{n^2}}$, which is the harmonic series:

We know—
$$
\sqrt{n^2 + 3} > \sqrt{n^2}
$$
—so:

$$
\sum_{n=1}^\infin \frac{1}{\sqrt{n^2 + 3}}
<
\sum_{n=1}^\infin \frac{1}{n}
$$
- This doesn't tell us anything, so we'll use the limit comparison test.
	* (We could also manipulate the inequality to get what we want)

**A**: Let's try again with the [limit comparison test]{.underline}

$$
\{ a_n \}: \sum_{n=1}^\infin \frac{1}{\sqrt{n^2 + 3}} \qquad
\{ b_n \}: \sum_{n=1}^\infin \frac{1}{n}
$$

$$
\begin{aligned}
\lim_{n \to \infin} \frac{1}{\sqrt{n^2 + 3}} \times \frac{n}{1}
&= \lim_{n \to \infin} \frac{n}{\sqrt{n^2 + 3}} \\
&= \lim_{n \to \infin} \frac{\sqrt{n^2}}{\sqrt{n^2 + 3}} \\
&= \lim_{n \to \infin} \sqrt{ \frac{n^2}{n^2 + 3} } \\
&= \lim_{n \to \infin} \sqrt{ \frac{2n}{2n} } \\
&= \lim_{n \to \infin} \sqrt{ 1 } \\
&= \lim_{n \to \infin} 1 \\
\end{aligned}
$$
- By limit comparison test, we know these both converge or both diverge.
	* Because harmonic series diverges, so does our series.

**Q**: Does $\sum_{n=1}^\infin \frac{1}{3^n - n^2}$ converge?

**A**: Limit comparison test

We could compare to { $\frac{1}{3^n}$ } or { $\frac{1}{n^2}$ }.
1. If we try { $\frac{1}{n^2}$ }, we get:

$$
\begin{aligned}
\lim_{n \to \infin} \frac{1}{3^n - n^2} \times \frac{n^2}{1} 
&= \lim_{n \to \infin} \frac{n^2}{3^n - n^2} \\
&= 0
\end{aligned}
$$
- Because the limit goes to zero **and** { $\frac{1}{n^p}$ } converges, the series converges.
</details>

<details><summary>Note: Picking the right { $b_n$ }</summary>
Sometimes, finding the right { $b_n$ } can be difficult.

For example: For $\sum_{n=1}^\infin \frac{\ln n}{n^2}$, trying to compare against $\sum_{n=1}^\infin \frac{1}{n^2}$ or $\sum_{n=1}^\infin \frac{1}{n^2}$ is inconclusive, we go too small and too big.
- This, however clues us in on trying $\sum_{n=1}^\infin \frac{1}{n^{1.5}}$, which *does* work.

For things in trig functions, comparing against the function parameter is usually helpful.
- ex: Compare $\sin \theta$ against $\theta$, $\sin \frac{1}{n}$ against $\frac{1}{n}$, etc.
</details>

## Alternating Series

<details><summary>Note: Difference</summary>
In the previous sections, all tests (except for divergence test) assumed that { $a_n$ } consisted only of positive terms.

This section inspects series with alternating positive and negative terms.
</details>

$$
\boxed{
\text{Alternating Series: } 
	\sum_{n=1}^\infin (-1)^{n} b_n
	\lor
	\sum_{n=1}^\infin (-1)^{n+1} b_n
} \\
\small\textit{where \{ $b_n$ \} is a positive sequence}
$$

> ### Alternating Series Test
> 
> Let { $b_n$ } be a positive, decreasing sequence with $\lim_{n \to \infin} b_n = 0$
> 
> Then, the alternating series—$\sum_{n=1}^\infin (-1)^{n} b_n \lor \sum_{n=1}^\infin (-1)^{n+1} b_n$—both converge.

<details><summary>Example: Proving alternating harmonic series converges</summary>
$$
\sum_{n=1}^\infin (-1)^{n+1} \frac{1}{n}
$$

This series converges by the alternating series test because $\lim_{n \to \infin} \frac{1}{n} = 0$
</details>

> ### Alternating Series Approximation Theorem
> 
> Let { $b_n$ } be a positive, decreasing sequence so that $\lim_{n \to \infin} b_n = 0$.
> 
> Let $S_N$ be the $N$th partial sum of the alternating series, either:
> $$
> \sum_{n=1}^\infin (-1)^n b_n
> \lor
> \sum_{n=1}^\infin (-1)^{n+1} b_n
> $$
> 
> And let $S$ be the sum of the alternating series, then:
> 
> $$
> \boxed{
> 	\text{Alternating Series Approximation Theorem: } R_N = S - S_N
> } \\
> \small\textit{}
> $$

> Satisfies:
> 1. $|R_N| \le b_{n+1}$
> 2. $S$ lies between $S_N$ and $S_{N+!}$

<details><summary>Why?</summary>
The sum of a convergent alternating series lies in-between successive partial sums:
$$
S_N < S < S_{N+1}
$$
- Or similar.

Then $|R_N| \le b_{n+1}$
</details>

<details><summary>Example: Approximate the series</summary>
**Q**: Estimate $\sum_{n=1}^\infin (-1)^{n+1} \frac{1}{n}$ within 0.001

**A**:
$$
R_N \le b_{N+1} \le 0.01 \\
R_N \le \frac{1}{N+1} \le 0.01 \\
$$

$$
\begin{aligned}
	\frac{1}{N+1} &\le 0.01 \\
	1 &\le 0.01(N+1) \\
	100 &\le N+1 \\
	99 &\le N \\
\end{aligned}
$$

Putting $\sum_{n=1}^{99} (-1)^{n+1} \frac{1}{n}$ into a calculator we get ~$0.69$
</details>

## Absolute Convergence

### Absolute Convergence Theorem

$$
\boxed{
	\begin{aligned}
	&\qquad \text{Absolute Convergence Theorem: }\\
	&\text{If $\sum_{n=1}^\infin |a_n|$ converges, so does $\sum_{n=1}^\infin a_n$}
\end{aligned}
}
$$

> **Definition**: Absolute Convergence
> - If $\sum_{n=1}^\infin |a_n|$ converges, we say $\sum_{n=1}^\infin a_n$ **converges absolutely**.
> - If $\sum_{n=1}^\infin |a_n|$ diverges, we say $\sum_{n=1}^\infin a_n$ **converges conditionally**.

<details><summary>Why?</summary>
A sequence being alternating or having a mix of positive and negative terms makes it corresponding series more likely to converge.

Ex: $\sum_{n=1}^\infin (-1)^{n+1} \frac{1}{n}$ converges, but $\sum_{n=1}^\infin \frac{1}{n}$ diverges.

Also, note that if a series of positive terms converges, then changing the signs of some terms will change what it converges to, [but it won't change the convergence]{.underline}.

**Absolute Convergence Theorem Proof**:

$$
0 \le a_n + |a_n| \le 2 | a_n |
$$

By assumption and algebraic laws for series,
$$
\sum_{n=1}^\infin 2 | a_n | = 2 \sum_{n=1}^\infin | a_n |
$$

By the direct comparison test, $\sum_{n=1}^\infin a_n + |a_n|$ also converges

Let's do subtraction:
$$
\sum_{n=1}^\infin a_n + |a_n| - \sum_{n=1}^\infin |a_n| \\
= \sum_{n=1}^\infin a_n \\
$$
- Which is convergent by algebraic laws for series.
	* (Because we subtracted two convergent series to get another convergent series)
</details>

<details><summary>Example: Does it converge absolutely, conditionally, or diverge?</summary>
**Q**: $\sum_{n=1}^\infin (-1)^{n+1} \frac{1}{n^2}$

**A**:

Let's take the absolute value to get:

$$
\sum_{n=1}^\infin \frac{1}{n^2}
$$

We can see that this new series is a convergent $p$-series (because $2 > 1$).
- This tells us that our [original series converges absolutely]{.underline}.

**Q**: $\sum_{n=1}^\infin (-1)^{n+1} \frac{\sin n}{n^2}$

**A**:

Let's take the absolute value to get:

$$
\sum_{n=1}^\infin \frac{\sin n}{n^2}
$$

Let's do comparison test, specifically the direct comparison (because limit comparison wouldn't work with $\sin n$):

Letting {$b_n$} $= \frac{1}{n^2}$, we can see that the series converges by direct comparison.
- Thus [the original sum converges absolutely]{.underline}.

**Q**: $\sum_{n=1}^\infin (-1)^{n+1} \frac{3n + 4}{2n^2 + 3n + 5}$

**A**:

Let's take the absolute value to get:

$$
\sum_{n=1}^\infin \frac{3n + 4}{2n^2 + 3n + 5}
$$

We'll compare this against { $\frac{n}{n^2}$ } (limit comparison test):

$$
\begin{aligned}
	\lim_{n \to \infin} \frac{3n + 4}{2n^2 + 3n + 5} \times \frac{n}{1}
	&= \lim_{n \to \infin} \frac{3n^2 + 4n}{2n^2 + 3n + 5} \\
	&\textit{(do l'hopitals)}
	&= \lim_{n \to \infin} \frac{6}{4} \\
\end{aligned}
$$
- This is the case where $a_n$ and $b_n$ either both converge or diverge.
	* As $b_n$ is harmonic series, this tells us that the original series does not converge absolutely.
		+ The original series could still be conditionally convergent or divergent, so we don't have an answer yet.

Doing the alternating series test on the original series, we can see that it is convergent ($\lim_{n \to \infin} \frac{3n + 4}{2n^2 + 3n + 5} = 0$).
- This combined with the fact that it isn't absolutely convergent means that the [original series converges conditionally]{.underline}.
</details>

$$
\boxed{
	\begin{aligned}
	&\qquad \text{Absolute Convergence Theorem (Pt II): }\\
	&\text{If $\sum_{n=1}^\infin a_n$ converges absolutely,} \\
	&\text{so does any arrangement of the terms of the series}
\end{aligned}
}
$$


$$
\boxed{
	\begin{aligned}
	&\qquad \text{Reimann Rearrangement Theorem: }\\
	&\text{If $\sum_{n=1}^\infin a_n$ is conditionally convergent,} \\
	&\text{For any $S$ in [ $-\infin$, $\infin$ ] there exists a rearrangement of the terms of the series so it adds up to $S$}
\end{aligned}
}
$$

## Ratio Test

$$
\boxed{
\begin{aligned}
	&\qquad \text{Ratio Test:} \\
	&\text{Let $\sum_{n=1}^\infin a_n$ have nonzero terms} \\
	&\text{Suppose $\lim_{n \to \infin} | \frac{a_{n+1}}{a_n} | = \rho$} \\
	&\text{1. If $\rho < 1$, the series converges absolutely} \\
	&\text{2. If $\rho > 1$, the series diverges} \\
	&\text{3. If $\rho = 1$, test is inconclusive}
\end{aligned}
}
$$

<details><summary>Tip: When to use this test</summary>
If the series uses a factorial, this test might work.
</details>

## Root Test

$$
\boxed{
\begin{aligned}
	&\qquad \text{Root Test:} \\
	&\text{Let $\sum_{n=1}^\infin a_n$ be a series} \\
	&\text{Suppose $\lim_{n \to \infin} \hphantom{}^n \sqrt{|a_n|} = \lim_{n \to \infin} | a_n |^{\frac{1}{n}} = \rho$} \\
	&\text{1. If $\rho < 1$, the series converges absolutely} \\
	&\text{2. If $\rho > 1$, the series diverges} \\
	&\text{3. If $\rho = 1$, test is inconclusive}
\end{aligned}
}
$$

<details><summary>Example: Does it diverge?</summary>
Q:

$$
\sum_{n=1}^\infin (\frac{3n+1}{5n-2})^n
$$

A:

$$
\begin{aligned}
	\lim_{n \to \infin} n \sqrt{ (\frac{3n+1}{5n-2})^n }
	&= \lim_{n \to \infin} \frac{3n+1}{5n-2} \\
	&= \frac{3}{5}
\end{aligned}
$$

$3/5$ is less than $1$, so the series converges.
</details>

# Power Series and Functions

<details><summary>Motivating Question</summary>
**Recall**:

$$
\sum_{n=0}^\infin r^n = \frac{1}{1-r}
$$
- for $-1 < r < 1$
	* diverges for $|r| \ge 1$
- We can think of this as a function with $r=x$ our input:

$$
f(x) = \sum_{n=0}^\infin x^n = 1 + x + x^2 + x^3 + ... = \frac{1}{1-x}
$$
- for $-1 < x < 1$

**Motivating Question**: Can we write other functions as infinite sums of powers of $x$?
</details>

> ### Power Series
> 
> Let $x$ be a variable and { $c_n$ } a sequence.
> 
> A power series in $x$ centered at $x=0$ is of the form:
> 
> $$
> \sum_{n=0}^\infin c_n x^n = c_0 + c_1 x + c_2 x^2 + c_3 x^3 + ...
> $$
> 
> A power series in $x$ centered at $x=a$ is of the form:
> 
> $$
> \sum_{n=0}^\infin c_n (x-a)^n = c_0 + c_1 (x-a) + c_2 (x-a)^2 + ...
> $$

> ### Convergence of Power Series
> 
> For the power series $\sum_{n=0}^\infin c_n (x-a)^n$:
> 
> Case I: Series converges at $x=a$ and diverges for all other $x$
> 
> Case II: Series converges for all real numbers.
> 
> Case III: There exists a real number $R$ such that the series converges for $|x-a|<R$, diverges for $|x-a|>R$, and for $|x-a|=R$ nay converge or diverge.

<details><summary>Why?</summary>
Let's use the Ratio Test to determine if this power series converges:

**Q**:
$$
\sum_{n=1}^\infin \frac{x^n}{n}
$$

**A**:

$$
\begin{aligned}
	\lim_{n \to \infin} | \frac{a_{n+1}}{a_n} | &= \lim_{n \to \infin} | \frac{x^{n+1}}{n+1} \times \frac{n}{x^n} | \\
	&= \lim_{n \to \infin} |x| \times \frac{n}{n+1} \\
	&= |x| \lim_{n \to \infin} \frac{n}{n+1} \\
	&= |x|
\end{aligned}
$$

Thus, the outcome of the ratio test depends on what $|x|$ is 
- If $|x|<1$: Converges
- If $|x|>1$: Diverges
- If $|x|=1$: Inconclusive

**Investigating the Inconclusive Case**:

If $|x|=1$, then there are two cases: $x=1$ and $x=-1$

Case I: $x=1$
$$
\sum_{n=1}^\infin = \frac{1^n}{n}
$$
- Diverges (harmonic series)


Case II: $x=-1$
$$
\sum_{n=1}^\infin = \frac{(-1)^n}{n}
$$
- Converges (alternating harmonic series)

**Conclusion**:
- The power series converges when $|x|<1$ or $x=-1$
	* Diverges for all other values
	* $-1 \le x < 1$
- Alternative phrasing: Converges for $x = [-1, 1)$
	* This is why we need to use other tests to check if a power series converges.
</details>

<details><summary>Definitions: Radius and Interval of Convergence</summary>
> ### Definitions
> 
> **Radius of Convergence** ($R$): Distance from the center of the series you can be before it diverges.
> 
> **Interval of Convergence:** Interval on which power series converges.
</details>

<details><summary>Why?</summary>
**The Idea**: Use the ratio test on power series
- Let's do this more generally

$$
\lim_{n \to \infin} | \frac{c_{n+1} (x-a)^{n+1}}{ c_n (x-a)^n } | =
| x - a | \lim_{n \to \infin} | \frac{c_{n+1}}{c_n} | \\
= |x-a| \rho
$$

Cases:
1. $\rho = \infin$: Diverges for all $x$ except $x=a$ 
2. $\rho = 0$: Converges for all $x$
3. $\rho = \infin$: Converges as long as $|x-a| < R$
	- $R$ is another name for $\frac{1}{\rho}$, the [Radius of Convergence]{.underline} if the series.
</details>

<details><summary>Example: Find radius and interval of convergence</summary>
**Q**: $\sum_{n=1}^\infin \frac{(x-1)^n}{n^2}$

**A**: Let's use the ratio test

$$
\lim_{n \to \infin} | \frac{ (x-1)^{n+1} }{ (x+1)^2 } \times \frac{n^2}{(x-1)^n} | \\
= |x-1| \lim_{n \to \infin} \frac{n^2}{(n+1)^2} \\
= |x-1| < 1
$$
- Radius of Convergence is $1$

**Q**:

$$
\sum_{n=0}^\infin n! (x-3)^n
$$

**A**: Let's do ratio test

> Recall:
> $$
> \boxed{
> \begin{aligned}
> 	&\qquad \text{Ratio Test:} \\
> 	&\text{Let $\sum_{n=1}^\infin a_n$ have nonzero terms} \\
> 	&\text{Suppose $\lim_{n \to \infin} | \frac{a_{n+1}}{a_n} | = \rho$} \\
> 	&\text{1. If $\rho < 1$, the series converges absolutely} \\
> 	&\text{2. If $\rho > 1$, the series diverges} \\
> 	&\text{3. If $\rho = 1$, test is inconclusive}
> \end{aligned}
> }
> $$

$$
\begin{aligned}
	\lim_{n \to \infin} | \frac{ a_{n+1} }{ a_n } | &= 
	\lim_{n \to \infin}
	| \frac{
		(n+1)! (x-3)^{n+1}
	}{
		n! (x-3)^n
	} | \\
	&= \lim_{n \to \infin} (n+1) |x-3| \\
	&= |x-3| \lim_{n \to \infin} (n+1) \\
	&= \infin
\end{aligned}
$$
- Thus, the series converges at 3 (its center) and nowhere else.
	- **Remember**: The series always converges at its center.
- Radius of Convergence: 0
	* *(You can't go any distance from 3 without diverging)*
- There isn't really an interval to converge on.

> **Tip**: Manipulating Factorials for Cancellation
> $$
> (n+1)! = (n+1)n!
> $$

**Q**:

$$
\sum_{n=1}^\infin ( \frac{ 6x-12 }{ n } )^n
$$

**A**:

Thinking:
- We could use the ratio test, but the root test will work better.

> Recall:
> 
> $$
> \boxed{
> \begin{aligned}
> 	&\qquad \text{Root Test:} \\
> 	&\text{Let $\sum_{n=1}^\infin a_n$ be a series} \\
> 	&\text{Suppose $\lim_{n \to \infin} \hphantom{}^n \sqrt{|a_n|} = \lim_{n \to \infin} | a_n |^{\frac{1}{n}} = \rho$} \\
> 	&\text{1. If $\rho < 1$, the series converges absolutely} \\
> 	&\text{2. If $\rho > 1$, the series diverges} \\
> 	&\text{3. If $\rho = 1$, test is inconclusive}
> \end{aligned}
> }
> $$

$$
\begin{aligned}
\lim_{n \to \infin} \hphantom{}^n \sqrt{ | \frac{ 6x-12 }{ n } |^n }
&= \lim_{n \to \infin} \frac{ |6x-12| }{ n } \\
&= |6x-12| \lim_{n \to \infin} \frac{ 1 }{ n } \\
&= 0
\end{aligned}
$$
- This is zero ($<1$) for every $x$, so the series always converges.
- **Radius of Convergence:** Infinity
- **Interval of Convergence:** $(-\infin, \infin)$

**Q**: 

$$
\sum_{n \to \infin}^\infin \frac{ (-2x+4)^n }{ n^2 \times 8^n }
$$

**A**: Ratio Test

$$
\begin{aligned}
	\lim_{n \to \infin} | \frac{(-2x+4)^{n+1}}{(n+1)^2 \times 8^{n+1}} \times \frac{ n^2 \times 8^n }{ (-2x+4)^n } | 
	&= \frac{ |-2x+4| }{ 8 } \lim_{n \to \infin} \frac{n^2}{(n+1)^2} \\
	&= \frac{ |-2x+4| }{ 8 } \times 1
\end{aligned}
$$

This series will converge when $\frac{ |-2x+4| }{ 8 } < 1$, so now we need to solve for that.

$$
\begin{aligned}
	\frac{ |-2x+4| }{ 8 } &< 1 \\
	|-2x+4| &< 8 \\
	2 \times | x-2 | &< 8 \\
	| x-2 | &< 4 \\
	| x-2 | &< 4 \\
\end{aligned}
$$
- **Radius of Convergence:** 4
- We know our center is 2 and $R=4$, thus the work-in-progress interval is -2, 6 
	* However, at the endpoints the ratio test is inconclusive (equal to 1)
		+ Thus we need to test the endpoints to know what the interval of convergence is.

> Aside: Understanding $| x-2 | < 4$
> - "$x$'s distance from 2 is at most 4"

**Testing Endpoints:**

Case I: -2
$$
\sum_{n=1}^\infin \frac{ (-2(-2) + 4)^n }{ n^2 \times 8^n } = blah
$$
- Converges because it yields the convergent p-series $\frac{1}{n^2}$

Case II: 6
- Doing a bunch of algebra we eventually get—
$$
\sum_{n=1}^\infin (-1)^n \frac{1}{n^2}
$$
- —which converges by the alternating series test. 

[Thus]{.underline}, **interval of convergence** is $[-2, 6]$
</details>

## Properties of Power Series

<!-- 6.2 -->

### Combining Power Series

Suppose the two power series $\sum_{n=0}^\infin c_n x^n$ and $\sum_{n=0}^\infin d_n x^n$ converge to functions f(x) and g(x) respectively on common interval $I$.

1. $\sum_{n=0}^\infin ( c_n x^n \pm d_n x^n)$ converges to $f(x) \pm g(x)$
2. For integer $m \ge 0$, real number $b$, $\sum_{n =0}^\infin b x^m c_n x^n$ converges to $b x^m f(x)$ on $I$
3. For integer $m \ge 0$, real number $b$, $\sum_{n =0}^\infin c_n (b x^m)^n$ converges to $f(bx^m)$.

### Multiplying Power Series

Suppose the power series $\sum_{n=0}^\infin c_n x^n$ and $\sum_{n=0}^\infin d_n x^n$ converge to functions $f(x)$ and $g(x)$ on common interval $I$.

Let $e_n = c_0 d_n + c_1 d_{n-1} + c_2 d_{n-2} + ...$

Or,

$$
\sum_{k=0}^n c_k d_{n-k}
$$

Then, $(\sum_{n=0}^\infin c_n x^n) (\sum_{n=0}^\infin d_n x^n) = \sum_{n=0}^\infin e_n x^n$, which converges to $f(x)g(x)$ on $I$.


<details><summary>Example: Find first 2 terms of the power series</summary>
$$
\begin{aligned}
	\frac{2}{(x-1)(x-3)} &= \frac{-2}{1 - x} \times \frac{-1}{3 - x} \\
	&= \frac{2}{1-x} \times \frac{\frac{1}{3}}{1 - \frac{x}{3}} \\
	&= (\sum_{n=0}^\infin 2x^n)(\sum_{n=0}^\infin \frac{1}{3} (\frac{x}{3})^n) \\
	&= (2 + 2x + 2x^2 + ...)(\frac{1}{3} + \frac{x}{9} + \frac{x^2}{27} + ...)
\end{aligned}
$$

$$
e_0 = c_0 d_0 = 2(\frac{1}{3}) = \frac{2}{3} \\
e_1 = c_0 d_1 + c_1 d_0 = 2 ( \frac{1}{4} ) + 2 ( \frac{1}{3} ) \\
$$

$$
\frac{2}{3} + 2 ( \frac{1}{4} ) + 2 ( \frac{1}{3} ) = \frac{11}{6}
$$
</details>

### Calculus

$$
f(x)  = \frac{1}{1-x} = (1-x)^{-1} \\
f'(x) = \frac{1}{(1-x)^2}
$$

Thus,

$$
[ \sum_{n=0}^\infin x^n ]' = \sum_{n=1}^\infin n x^{n-1}
$$
- For $|x| < 1$

$$
	F(x) = \int \frac{1}{1-x} dx = - \ln | 1 -x| + D
$$

Thus,

$$
\int \sum_{n=0}^\infin x^n dx = C + \sum_{n=0}^\infin \frac{x^{n+1}}{n + 1}
$$
- For $|x| < 1$

---

Let $x=0$:

$$
-\ln |1 | + D = C + \sum_{n=0}^\infin \frac{0^{n+1}}{n+1} \\~\\
D = C
$$

Thus,

$$
-\ln | 1-x| = \sum_{n=0}^\infin \frac{x^{n+1}}{n+1}
$$

---

Let x=1:

Eventually you get
$$
\ln 2 = \text{Alternating harmonic series}
$$

---

Theorem: Let $f(x) = \sum_{n=0}^\infin c_n x^n = c_0 + c_1 x + c_2 x^2 + ...$ with $R$.

Then

1. f'(x) = \sum_{n=r}^\infin n c_n x^{n-2}

## Taylor and Maclaurin Series


If $f$ has derivatives of all orders at $x=a$, the Taylor series for the function $f$ at $a$ is:

$$
\sum_{n=0}^\infin \frac{f^{(n)}(a)}{n!} (x-a)^n = f(a) + f'(a)(x-a) + \frac{f''(a)}{2!} (x-a)^2 + \frac{f'''(a)}{3!} (x-a)^3 + ...
$$

$$
\boxed{
	\text{MacLaurin Series: } \sum_{n=0}^\infin \frac{f^{(n)}(0)}{n!} x^n
}
$$
- This just a Taylor series where $a=0$

The nth partial sum for a Taylor series is called the nth Taylor polynomial

$$
p_0 (x) = f(a) \\
p_1 (x) = f(a) + f'(a) (x-a) \\
p_2 (x) = f(a) + f'(a) (x-a) + \frac{f''(n)}{2!}(x-a)^2 \\
$$

Example: Find the second Maclaurin polynomial for e^x

$$
p_5 (x) = f(0) + f'(0) x + \frac{f''(0)}{2!} x^2
$$

Note how all the derivatives (f'(0), f''(0), etc.) are just $e^x$ again, and $e^0 = 1$, so:

$$
p_5 (x) = 1 + x + \frac{1}{2!} x^2
$$

The nth MacLaurin polynomial for $e^x$ is

$$
\sum_{n=0}^\infin \frac{1}{n!} x^n
$$

### Mean Value Theorem

> aka: Taylor's Theorem with remainder

Let $f$ be a function that can be differentiated $n+1$ times on an interval $I$ containing $a$

Let $R_n$ be the nth Taylor polynomial of $f$ at $a$.

$$
\text{nth Remainder: } R_n (x) = f(x) - \rho_n (x)
$$

Then for each $x$ in the interval $I$ there exists a real number $c$ between $x$ and $a$ so that

$$
R_n (x) = \frac{f^{n+1} (c) }{ (n+1)! } (x-a)^{n+1}
$$

If there exists a real number
