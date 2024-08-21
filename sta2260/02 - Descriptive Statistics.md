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
\small\textit{\textit{Percentage} = \textit{Relative Frequency} \times 100}
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

<details><summary>Example</summary>
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
- $\text{Angle of a Slice} = \text{Relative Frequency} \times 360 \deg$

# Histogram

Adjacent rectangles 
