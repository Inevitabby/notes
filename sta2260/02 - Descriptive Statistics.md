---
title: "Descriptive Statistics"
---

# Frequency Table

## For Categorical Data

Given the following data set:
- Blood Type Data: A AB A A AB O AB A O A O B O O A

The resulting frequency table is:

| Blood Type | Frequency | Relative Frequency |
|------------|-----------|--------------------|
| A          | 6         | $6/15=0.4$         |
| AB         | 3         | $3/15=0.2$         |
| B          | 1         | $1/15=0.0667$      |
| O          | 5         | $5/15=0.3333$      |
| Total:     | 15        | $1$                |

> **Note**: Total = $n$

$$
\boxed{
	\text{Relative Frequency} = \frac{
		\text{Frequency}
	}{
		\text{\# of Observations}
	}
}
\\~\\
\small\textit{\textit{Percentage} = \textit{Relative Frequency} $\times 100$}
$$

> **Remember**: A table should summarize its data.

## For Numerical Data

How to construct a frequency table for numerical data:
- Sort data from smallest to largest.
- Group data into $k$ classes.
- Count number of observations in each class.

Rules:
- [Same width]{.underline} for all classes *recommended*.
- [No overlap]{.underline} between class intervals.
- [No gap]{.underline} between class intervals
	*(Each observation should be counted once)*


$$
\boxed{
	\text{Ideal \# of Classes: }
	k = [ \sqrt{n} ]
}
$$

$$
\boxed{
	\text{Width of Each Class: }
	w = \frac{
		\text{largest} - \text{smallest}
	}{
		k
	}
}
$$

<details><summary>Example: Creating a frequency table</summary>
Q: Task Time Data: 19, 23, 26, 30, 32, 34, 37, 39, 41, 44, 44, 46, 55

A:

Number of observations: $n = 13#

Number of classes: $k = [ \sqrt{13} ] = 4$

Width of intervals:
$$
w = \frac{55-19}{4} = 9
$$

So:

| Class | Interval          | Frequency | Relative Frequency | Percentage        |
|-------|-------------------|-----------|--------------------|-------------------|
| 1     | $19 \le x < 28$   | 3         | $3/13$             | 23.0769           |
| 2     | $28 \le x < 37$   | 3         | $3/13$             | 23.0769           |
| 3     | $37 \le x < 46$   | 5         | $5/13$             | 38.4615           |
| 4     | $46 \le x \le 55$ | 2         | $2/13$             | 15.3846           |
</details>

# Bar and Pie Chart

**Bar Graph**: Graph made of bars whose heights represent the [frequencies]{.underline} of respective categories.
- *aka: Bar Chart, Bar Plot*

**Pie Chart**: Circle divided into portions that represent [relative frequencies]{.underline} (or percentages) of respective categories.
- $\text{Angle of a Slice} = \text{Relative Frequency} \times 360 \degree$

# Histogram

**Histogram**: Chart where adjacent rectangles heights' and widths' represent the frequencies[^fn1] and the widths of the class respectively.
- Using relative frequency normalizes scale and makes comparisons easier.[^fn2]

> **Distributions of Data:**
> 1. Symmetric
> 2. Skewed (left/right)
> 3. Uniform
> 4. Bimodal

[^fn1]: Can be frequency or relative frequency.

[^fn2]: Very useful in medical sciences when looking at data sets with different $n$ sizes.

## Density Histogram

**Density Histogram**: A histogram that uses density rather than frequency.
- *(can be thought of as a normalized histogram)*
- Use this when comparing things with different intervals.

$$
\text{Density} = \frac{
	\text{Relative Frequency}
}{
	\text{Width}
}
$$

<details><summary>Example: Calculating density</summary>
Q: Calculate density

| Class | Interval          | Frequency | Relative Frequency | Percentage        |
|-------|-------------------|-----------|--------------------|-------------------|
| 1     | $19 \le x < 28$   | 3         | $3/13$             | 23.0769           |
| 2     | $28 \le x < 37$   | 3         | $3/13$             | 23.0769           |
| 3     | $37 \le x < 46$   | 5         | $5/13$             | 38.4615           |
| 4     | $46 \le x \le 55$ | 2         | $2/13$             | 15.3846           |

$$
w = 9
$$

A:

| Class | Interval          | Frequency | Relative Frequency | Percentage | Density                |
|-------|-------------------|-----------|--------------------|------------|------------------------|
| 1     | $19 \le x < 28$   | 3         | $3/13$             | 23.0769    | $3/13 \div 9 = 0.0256$ |
| 2     | $28 \le x < 37$   | 3         | $3/13$             | 23.0769    | $3/13 \div 9 = 0.0256$ |
| 3     | $37 \le x < 46$   | 5         | $5/13$             | 38.4615    | $5/13 \div 9 = 0.0427$ |
| 4     | $46 \le x \le 55$ | 2         | $2/13$             | 15.3846    | $2/13 \div 9 = 0.0171$ |

</details>

> **Density Historygram**: Total area of histogram = 1

## Dotplot

**Dotplot**: Chart where you place a dot above a number line to represent the data set.
- One of the simplest methods for graphing and understanding quantitative data.
- Easy to detect outliers.

**Histogram or Dotplot?**
- Small to Intermediate: Dotplot
- Big 

## Line Plot

**Line Plot**: Like a dot plot, but you draw lines from the top of each plot.
- Removing the empty space at the bottom of the graph can emphasize trends.

# Measures of Center

**Mean**: Arithmetic Mean

$$
\text{Mean} = \frac{\text{Sum of All Observations}}{\text{\# of Observations}}
$$

**Sample Mean** ($\bar{x}$): Mean calculated for sample data.
- Most popular measure of center.
- Has many good statistical properties.
- Sensitive to outliers.

**Population Mean** ($\mu$): Mean calculated for population, usually unknown.

$$
\mu = \frac{\sum x_i}{N} \quad \text{and} \quad x = \frac{\sum x_i}{n}
$$

<details><summary>Example: Calculating mean</summary>
Q: Find the mean of the data set:

27, 31, 30, 32, 34, 35

A:

$$
\begin{aligned}
	x &= \frac{27 + 31 + 30 + 32 + 34 + 35}{6} \\
	&= \frac{189}{6} \\
	&= 31.5
\end{aligned}
$$

Thus, the mean is 31.5.
</details>

**Median**: The middle value of a sorted data set.
- Robust (not sensitive to outliers)
- Not unique.

$$
\begin{aligned}
	\text{If $n$ is odd: }& 
		x_{ \frac{n+1}{2} } \\
	\text{If $n$ is even: }&
		\frac{ x_{ \frac{n}{2} } + x_{ \frac{n}{2} + 1 } }{ 2 }
\end{aligned}
\text{If $n$ is odd: } x_{ \frac{n+1}{2} }
$$

> **Note**: Order Notation
> 
> $$
> \text{Raw Data: } x_1, x_2, x_3, ..., x_n \to 
> \text{Sorted Data: } x_{ ( 1 ) }, x_{ ( 2 ) }, x_{ ( 3 ) }, ..., x_{ ( n ) }
> $$

# Measures of Position

## Quarties

**Quartiles**: Summary measures that divide a sorted data set into four equal parts.
- Each part contains 25% of the data.

$Q_1$: Median of the lower half of the data.  

$Q_2$: Median of the entire data set.

$Q_3$: Median of the upper half of the data.

<details><summary>Example: Calculating mean</summary>
Q: Find the quartiles of the data set:

1, 2, 8, 12, 14, 17, 20, 22, 23, 24, 25

A:

$Q_2$ is 17 (it is the center of the dats set)

$Q_1$ is 8 (we ignore 17 when getting the center of the lower half)

$Q_3$ is 23 (we ignore 17 when getting the center of the lower half)

> **Note**: If $n$ has been even—that is, we had two numbers in the center—those numbers would be used in their respective calculation for $Q_1$ and $Q_3$.
</details>

## Percentiles

$k$th percentile ($P_k$): $k\%$ od the data is smaller than this value.
- Generalized version of quartiles.

> **Example**: If you scored in the 90th percentile ($P_{90}$) on a test, 90% of the test scores are below you.

$$
\boxed{
	P_k = \text{Value of the $\frac{kn}{100}$th term in a sorted data set}
} \\~\\
x_{\frac{kn}{100}}
$$

> **Quartiles Notated as Percentiles**:
> $$
> Q_1 = P_{25} \\
> Q_2 = P_{50} \\
> Q_3 = P_{75} \\
> $$

<details><summary>Example: Calculating percentile</summary>
Q: Find the 30th percentile of the data set:

4 8 9 15 18 19 20 22 25 28 30

A:

$n=11$, $k=30$

First, let's find the *position* of the 30th percentile (remember, an index must be a whole number):
$$
	P_{30} = \frac{30 \times 11}{100} = 3.3 \approx 3
$$

Our answer is the *value* at the position we just found:
$$
P_{30} = x_3 = 9
$$

Thus, the 30th percentile of the data set is 9.

---

Q: Find the 65th percentile of the data set:

4 8 9 15 18 19 20 22 25 28 30

A:

$n=11$, $k=65$

First, let's find the *position* of the 30th percentile (remember, an index must be a whole number):
$$
	P_{30} = \frac{65 \times 11}{100} = 7.15 \approx 7
$$

Our answer is the *value* at the position we just found:
$$
	P_{65} = x_7 = 20
$$

Thus, the 65th percentile of the data set is 20.
</details>

# Measures of Spread

**Measures of Spread:** Measures the *variation* of data.
- *aka: Measures of Variation/Dispersion*
- All measures of spread are positive.

> **Why?:** Measures of Center don't reveal the whole picture of the distribution of a data set.

## Range & IQR

**Range**: The total width of the distribution.
- Quick and easy computation.
- Loses a great amount of data. 
- Very sensitive to outliers.

$$
\boxed{
	\text{Range} = x_n - x_1
} \\~\\
\small\textit{max - min}
$$

<details><summary>Example: Calculating range</summary>
Q: Find the range of the data set

10, 12, 17, 20, 50

A: 50 - 10 = 40
</details>

**Interquartile Ranger (IQR):** The width of 50% of the data in the middle of the data.
- Robust, less sensitive to outliers.

$$
\text{IQR} = Q_3 - Q_1
$$

<details><summary>Example: Calculating IQR</summary>
Q: Find the IQR of the data set:

33, 35, 37, 40, 41, 42, 44, 46, 50

A:

$$
33, \textcolor{red}{35, 37,} 40, \textcolor{green}{41}, 42, \textcolor{blue}{44, 46,} 50
$$
- $Q_1$ is the average of 35 and 37, or 36.
- $Q_2$ is 41.
- $Q_3$ is the average of 44 and 46, or 45.

Thus, the IQR is $45 - 36 = 9$
</details>

## Deviation

**Deviation**: Distance from a data point to the mean.
- *(distance from the center of the data)*
- $\sum \text{deviation} = 0$
- To compare deviations, we can add up their:
	1. Absolute value, or
	2. Square root.

$$
\boxed{
	\text{Deviation} = x_i - \bar{x}
}
$$

**Sample Variance** ($s^2$): An average of squares of deviations
- The measurement unit of $s^2$ is the square of the original unit.

$$
\boxed{
	\text{Sample Variance: }
	s^2 = \frac{1}{n-1} \sum_{i=1}^n (x_1 - \bar{x})^2
	= \frac{1}{n-1} { \sum_{i=1}^n x_i^2 - n \bar{x}^2 }
} \\~\\
\small\textit{1st form: Layman's version, 2nd form: Efficient version}
$$

> **Layman's Version:** Find the deviation of each data point, square each deviation, add the squared values, and divide by $n-1$.
> - Why $n-1$ instead of $n$? The reasons for that are outside this course, apparently.

<details><summary>Example: Calculating deviation and sample variance</summary>
Q: Find the deviation for each data point in the data set:

1.6, 2.4, 3.5, 4.3, 4.8

A:

Mean ($\bar{x}$) = $\frac{1.6 + 2.4 + 3.5 + 4.3 + 4.8}{5} = 3.32$

| Value | Deviation ($d_i$) | $d_i^2$ |
|-------|-------------------|---------|
| 1.6   | $1.6-3.32=-1.72$  | 2.9584  |
| 2.4   | $2.4-3.32=-0.92$  | 0.8464  |
| 3.5   | $3.5-3.32=0.18$   | 0.0324  |
| 4.3   | $4.3-3.32=0.98$   | 0.9604  |
| 4.8   | $4.8-3.32=1.48$   | 2.1904  |
| Sum   | 0                 | 6.9880  |

$$
\text{Sample Variance (Layman's Form)} = \frac{6.9880}{n - 1}
= \frac{6.9880}{5 - 1}
= 1.747
$$
</details>

<details><summary>Example: Calculating sample variance (efficient form)</summary>
Q: Find the deviation for each data point in the data set:

1.6, 2.4, 3.5, 4.3, 4.8

A:

Mean ($\bar{x}$) = $\frac{1.6 + 2.4 + 3.5 + 4.3 + 4.8}{5} = 3.32$

| Data ($x_i$) | $x_i^2$       |
|--------------|---------------|
| 1.6          | $1.6^2=2.56$  |
| 2.4          | $2.4^2=5.76$  |
| 3.5          | $3.5^2=12.25$ |
| 4.3          | $4.3^2=18.49$ |
| 4.8          | $4.8^2=23.04$ |
| Sum          | 62.1          |

Recall the formula:
$$
\boxed{
	s^2 = \frac{1}{n-1} { \sum_{i=1}^n x_i^2 - n \bar{x}^2 }
}
$$

In the above table, we found that $\sum_{i=1}^n x_i^2 = 62.1$, and we can now plug in the rest of the formula:

$$
\begin{aligned}
	s^2 &= \frac{1}{n-1} { \sum_{i=1}^n x_i^2 - n \bar{x}^2 } \\
	&= \frac{1}{n-1} { 62.1 - n \bar{x}^2 } \\
	&= \frac{1}{5-1} { 62.1 - 5 \times \bar{3.32}^2 } \\
	&= \frac{1}{5-1} { 62.1 - 5 \times 3.32^2 } \\
	&= 1.747
\end{aligned}
$$

This formula saves a lot of time over the layman's form.
</details>

**Sample Standard Deviation** ($s$): $s = \sqrt{s^2}$
- This is how we make the measurement unit match the original.

<details><summary>Example: Calculating sample standard deviation</summary>
Q: Given that $s^2 = 1.747$, find $s$.

A: $s = \sqrt{1.747} = 1.3217$
</details>

> **Summary**: 
> - The larger values, the larger variability of the data set.

# Boxplot

**Boxplot**: Shows center, spread, and skew of a data set.
- Good for large samples

