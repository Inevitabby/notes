<<<<<<< HEAD
---
title: Introduction to Statistics
---

# Introduction

## What is Statistics?

**Statistics**: Methods to collect, analyze, present, interpret data, and make decisions.

**Two Types of Statistics**:
1. **Descriptive**: Methods to organize, display, and describe data.
	- e.g., Tables, graphs, summary measures
2. **Inferential**: Methods that use sample results to help ake decisions or predictions about a population.
	- e.g., T-test, confidence

> **Note**: Probability lies in-between descriptive and inferential statistics.

> **Course Progression**: Descriptive Statistics $\to$ Probability $\to$ Inferential Statistics

## Terms in Statistics

**Population**: The [entire]{.underline} group of individuals that we want information about.
- Usually impossible to observe the entire population.

**Sample**: The [subset]{.underline} of the population we examine to gather information.
- **Good Sample**: Contains important features/traits of the population. 

**Random Sample**: Sample where each element in the population has a chance of being selected.

**Sample Size ($n$)**: The number of observations in a sample.

**Variable**: Characteristic of a person or thing.
- e.g., age

**Observation ($x_i$)**: Value of a variable for an element.
- e.g., $x_1 = 10 \text{years}$

**Data Set ($X$)**: Collection of observations on $\ge 1$ variables.

> **Example**: Finding the average number of plushies students have in their bedrooms
> - Population: All students at my college.
> - Sample: The students walking past the entrance to the library who I polled as they passed.
> - Sample Size: $n$ = The number of students I asked.
> - Variable: # of plushies in bedroom.
> - Observation: "$x_1 = 2$, $x_2 = 10$, etc."

# Types of Variables

**Two Types of Variables**:
1. **Numerical (Quantitative)**: Variables whose values are [numeric]{.underline}.
	- e.g., age, weight, height
2. **Categorical (Qualitative)**: Variables whose values are [not numeric]{.underline}.
	- e.g., hair color, blood-type, gender

> **Important**: Variable type is determined by how we use it. 
> - e.g., 
>	- Numerical Age: 19, 42, 69, etc.
>	- Categorical Age: Young, Average, Old

> **Note**: Different types require different analyses.

# Random Sampling

**Simple R.S.** Select $n$ objects at random from the population.
- Every possible sample size $n$ has the same chance of being selected.

**Stratified R.S.** Divide population into strata[^fn1], then select simple random sample for each stratum.
- e.g., Splitting population into male/female, old/young, etc.

[^fn1]: Non-overlapping groups

**Cluster R.S.** Divide population into clusters[^fn2], select clusters at random, then select simple random sample for each cluster.
- e.g., A study on high school curriculum may select a few states (clusters) 
	* Where is each state is a cluster, and each school district is a cluster.

[^fn2]: Groups

> **Note**: Clusters v.s. Strata (some v.s. all)
> - Clusters are [representative]{.underline} of their population.
>	- e.g., You can describe the population using any cluster.
> - Strata must be used together to describe their population.
>	- e.g., If you have male and female strata, you can't just use the male stratum to describe the population.

**Systematic R.S.** Select every $k$th element in the population.
- e.g., "I will measure every tenth student who enters the cafeteria", if a basketball team walks past, they won't skew the measurements heavily.

**Multi-Stage R.S.**: A mixture or combination of at least two methods above (except simple R.S.)

> **Note**: In this course, we'll assume the samples we're given are good samples and gotten through simple R.S., unless told otherwise.
||||||| fae446c
=======
---
title: Introduction to Statistics
---

# What is Statistics?

**Statistics**: Methods to collect, analyze, present, interpret data, and make decisions.

**Two Types of Statistics**:
1. **Descriptive**: Methods to organize, display, and describe data.
	- e.g., Tables, graphs, summary measures
2. **Inferential**: Methods that use sample results to help make decisions or predictions about a population.
	- e.g., T-test, confidence

> **Note**: Probability lies in-between descriptive and inferential statistics.

> **Course Progression**: Descriptive Statistics $\to$ Probability $\to$ Inferential Statistics

# Terms in Statistics

**Population**: The [entire]{.underline} group of individuals that we want information about.
- Usually impossible to observe the entire population.

**Sample**: The [subset]{.underline} of the population we examine to gather information.
- **Good Sample**: Contains important features/traits of the population. 

**Random Sample**: Sample where each element in the population has a chance of being selected.

**Sample Size ($n$)**: The number of observations in a sample.

**Variable**: Characteristic of a person or thing.
- e.g., age

**Observation ($x_i$)**: Value of a variable for an element.
- e.g., $x_1 = 10 \text{years}$

**Data Set ($X$)**: Collection of observations on $\ge 1$ variables.

> **Example**: Finding the average number of plushies students have in their bedrooms
> - Population: All students at my college.
> - Sample: The students walking past the entrance to the library who I polled as they passed.
> - Sample Size: $n$ = The number of students I asked.
> - Variable: # of plushies in bedroom.
> - Observation: "$x_1 = 2$, $x_2 = 10$, etc."

# Types of Variables

**Two Types of Variables**:
1. **Numerical (Quantitative)**: Variables whose values are [numeric]{.underline}.
	- e.g., age, weight, height
2. **Categorical (Qualitative)**: Variables whose values are [not numeric]{.underline}.
	- e.g., hair color, blood-type, gender

> **Important**: Variable type is determined by how we use it. 
> - e.g., 
>	- Numerical Age: 19, 42, 69, etc.
>	- Categorical Age: Young, Average, Old

> **Note**: Different types require different analyses.

# Random Sampling

**Simple R.S.** Select $n$ objects at random from the population.
- Every possible sample size $n$ has the same chance of being selected.

**Stratified R.S.** Divide population into strata[^fn1], then select simple random sample for each stratum.
- e.g., Splitting population into male/female, old/young, etc.

[^fn1]: Non-overlapping groups

**Cluster R.S.** Divide population into clusters[^fn2], select clusters at random, then select simple random sample for each cluster.
- e.g., A study on high school curriculum may select a few states (clusters) 
	* Where is each state is a cluster, and each school district is a cluster.

[^fn2]: Groups

> **Note**: Clusters v.s. Strata (some v.s. all)
> - Clusters are [representative]{.underline} of their population.
>	- e.g., You can describe the population using any cluster.
> - Strata must be used together to describe their population.
>	- e.g., If you have male and female strata, you can't just use the male stratum to describe the population.

**Systematic R.S.** Select every $k$th element in the population.
- e.g., "I will measure every tenth student who enters the cafeteria", if a basketball team walks past, they won't skew the measurements heavily.

**Multi-Stage R.S.**: A mixture or combination of at least two methods above (except simple R.S.)

> **Course Note**: Assume the samples we're given are good samples unless told otherwise.


>>>>>>> 40c26e6c1c641d6af3426dca081468db4c91358f
