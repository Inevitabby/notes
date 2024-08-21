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

# Distributions of Data

**Distributions of Data:**
1. Symmetric
2. Skewed (left/right)
3. Uniform
4. Bimodal

# Histogram

Adjacent rectangles whose heights and widths represent the frequencies[^fn1] and the widths of the class respectively.
- Using relative frequency normalizes scale and makes comparisons easier.[^fn2]

[^fn1]: Can be frequency or relative frequency.

[^fn2]: Very useful in medical sciences when looking at data sets with different $n$ sizes.

## Density Histogram

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

# Measures of Center

# Measures of Spread (Variation, Dispersion)

> **Why?:** Measures of Center don't reveal the whole picture of the distribution of a data set.

**Measures of Spread:** Measures the variation of data.

**Range**: Quick and easy computation.
- Could lose a great amount of data (because it only uses two points), very sensitive to outliers.

$$
\text{Range} = x_n - x_1
$$

**Interquartile Ranger (IQR):** Measures the width of 50% of the data in the middle.

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

**Sample Standard Deviation**

