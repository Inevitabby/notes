---
title: "Calculus II in One Page"
---

# Integration by Parts

$$
\boxed{
	\text{Integration by Parts: } \int u dv = uv - \int v du
}
$$
- **Usage**: Find $u$ and $dv$ in the problem, then solve for $du$ and $v$, assemble other side of equation, then solve the simpler equation.
	* What to choose for $u$: L.I.A.T.E. (pick the one higher on the list as $u$)
		1. **L**ogarithms (e.g., $\ln x$)
		2. **I**nverse trig (e.g., $arctan(x)$)
		3. **A**lgebraic (e.g., $x^2$)
		4. **T**rig (e.g., $\sin(x)$)
		5. **E**xponential (e.g., $e^x$)

> **Important**: $\int v du$ might end up being the term you started with. In that case, you can move it across the $=$ to break the loop.
> - This isn't unique to integration by parts!

# Trigonometric Integrals

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

**Steps**:
1. Substitute $x$ for trigonometry: <!--($x \to \text{ trig }$$(\theta)$)-->
<!--
| Form      | $x$           | $dx$                      | Pythagorean Identity |
|-----------|---------------|---------------------------|----------------------|
| $a^2-x^2$ | $a\sin\theta$ | $a \cos \theta$             | $\cos$ and $\sin$    |
| $x^2+a^2$ | $a\tan\theta$ | $a \sec^2 \theta$           | $\tan$ and $\sec$    |
| $x^2-a^2$ | $a\sec\theta$ | $a \sec \theta \tan \theta$ | $\sec$ and $\tan$    |
-->

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

<!--
> ### Completing the Square
> 
> Some problems requires you to complete the square to get the square root in a form that can be substituted.
> 
> $$
> \text{Completing the Square: }
> \begin{aligned}
> 	&\text{1. Rearrange such that lead coefficient is 1} \\
> 	&\text{2. Add and subtract $(b / 2)^2$} \\
> 	&\text{3. Factor and solve}
> \end{aligned}
> $$
-->

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

<!--
**Case 1: Numerator Degree < Denominator Degree with Nonrepeating Linear Factors**

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

**Case 2: Numerator Degree > Denominator Degree**

1. Do long division.
2. Follow Case 1 or Case 3.

**Case 3: Repeated Linear Terms**
-->

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
} \\~\\
y = \frac{M_x}{m} \qquad
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
	x = \frac{My}{m} \qquad y = \frac{M_x}{m}
} \\~\\
M_y = \int_a^b \rho x f(x) dx
\qquad
M_x = \int_a^b \rho \frac{[f(x_i^*)]^2}{2} dx
\\
m = \int_a^b \rho f(x) dx
$$

> **Tip**: When calculating, you can take $\rho = 1$ as they're going to cancel anyway.

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

