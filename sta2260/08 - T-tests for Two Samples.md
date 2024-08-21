---
title: "Statistical Inferences"
---

# T-tests for Two Independent Samples

In practice, we want to compare two groups from different populations.
- We don't just compare means though, we want to compare distributions!

How to Compare:



**Example**: Stem lengths of soybean plants with different fertilizers.

1. 20.2, 22.9, 23.3, 20, 19.4, 22, 22.1, 22, 21.9, 21.5, 19.7, 21.5, 20.9
2. 22.2, 23.5, 21.5, 23.5, 22.4, 23.8, 22.4, 20.4, 21, 24.7

Q: Is there a significant difference in the effect of two fertilizers?

Let's get/note mean and sample deviation:

- $X_1 = 21.34$
- $s_1 = 1.22$
- $n_1 = 13$

- $x_2 = 22.54$
- $s_2 = 1.35$
- $n_2 = 10$

Q: "Is there a significant difference in the effect of two fertilizers?":
- $H_0$: $\mu_1 = \mu_2$
- $H_1$: $\mu_1 \ne \mu_2$

Q: "Is the new fertilizer better than the old one?":
- $H_0$: $\mu_1 \ge \mu_2$
- $H_1$: $\mu_1 < \mu_2$

**Test Statistic**: Standard method to choose between $H_0$ and $H_1$.

$$
\boxed{
	\text{Test Statistic for Comparing 2 Means: }
	T = \frac{
		(X_1 - X_2) - (\mu_1 - \mu_2)
	}{
		SE_{(X_1 - X_2)}
	}
}
$$

