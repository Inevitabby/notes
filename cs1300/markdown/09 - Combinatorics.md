# Pigeonhole Principle

1. If more than $k$ items are placed into $k$ bins, then at least one bin has more than one item.
2. How many people must be in a room to guarantee that two people have the last name begin with the same initial?
	- 26 alphabets, hence 27 people are must be in the room.
3. How many times must a single die be rolled in order to guarantee getting the same value twice?
	- 7 times, because there are 6 possible outcomes.Go

# Permutations

**Permutation**: *Ordered* arrangement of objects.
- If you change the order, it becomes a different permutation.

The number of permutations of $r$ distinct objects chosen from $n$ distinct objects is denoted by $P(n,r)$
- Example: Suppose we have 10 total pool of students ($n$) and want to know how many ways we can order 5 students ($r$) without repetition.
	* $P(10,5): 10 \times 9 \times 8 \times 7 \times 6 = 30240$

Mathematically, for $r \le n$, an $r$-permutation from $n$ objects is defined by:

$$
\begin{aligned}
	P(n,r) &= n \times (n-1) \times (n-2) \times ... \times (n-r+1) \\
	&= \frac{
		n \times (n-1) \times (n-2) \times ... \times (n-r+1) \times (n-r)!
	}{
		(n-r)!
	}
\end{aligned}
$$

So:
$$
P(n,r) = \frac{
	n!
}{
	(n-r)!
}
$$
- for $0 \le r \le n$

## Special Cases

**Empty Set**: $P(n,0)=\frac{n!}{n!}=1$
- There's only one way to order an arrangement of 0 objects.
	* Mathematical proof: 

**Picking Only One Object**: $P(n,1)=\frac{n!}{(n-1)!}=n$
- There's only one way to order an arrangement of 1 object.

**Arranging $n$ objects**: $P(n,n)=\frac{n!}{0!}=n!$
- This is just the multiplication principle—you can order $n$ objects in $n!$-distinct ways.

## Examples

**Problem**: Ten athletes compete in an Olympic event. Gold, silver and bronze medals are awarded to the first three in the event, respectively. How many ways can the awards be presented?

$$
\text{3 Objects from a Pool of 10: }
P(10,3) = \frac{10!}{7!} = 720
$$

**Problem**: How many ways can six people be seated on six chairs?

$$
P(6,6) = 6! = 720
$$

**Problem**: How many ways can six people be seated in a circle?

$$
\text{In a circle: }=(n-1)!=5!
$$
- Why? Because you can rotate the circle six times. These rotations aren't new permutations because the seating is relative (the rotations aren't unique permutations)

![](.images/relative-permutations.png)

**Problem**: How many permutations of the letters ABCDEF contain the letters DEF together in any order?

1. You can arrange DEF in $P(3,3)=3!$ ways
2. So really, we are arranging A, B, C, and the whole block of DEF
3. Using multiplication principle: $P(3,3) \times P(4,4) = 3! 4!$

**Problem**: The professor’s dilemma: how to arrange four books on OS, seven on programming, and three on data structures on a shelf such that books on the same subject must be together?

$$
\begin{aligned}
\text{All Possible Permutations} &= \text{OS} \times \text{Programming} \times \text{Data Structures} \\
&= [ P(4,4) \times P(7,7) \times P(3,3) \times P(3,3) ] \times P(3,3) \\
&= (4!7!3!)3! \\
&= 4354560
\end{aligned}
$$

# Combinations

If we don't care about order in permutations, we're talking about **combinations**, which are denoted by:

$$
	C(n,r) = \frac{n!}{(n-r)!r!}
$$
- After each combination, if you order the chosen $r$ objects, you'll be calculating the permutation again (because there are $r!$ ways to order those $r$ chosen objects).
$$
\text{Relationship between Combinations and Permutations: }
C(n,r) \times r! = P(n,r)
$$
	
> Note: $C(n,r)$ is much smaller than $P(n,r)$ by definition.

## Special Cases

**Empty Set**: $C(n,0) = 1$
- Only one way to choose 0 objects from n objects

**Choosing One Object**: $C(n,1) = n$

**Choosing $n$ Objects From $n$ Objects**: $C(n,n) = 1$

## Examples

**Problem**: How many ways can we select a committee of 3 from 10.

$$
C(10,3) = \frac{10!}{7!3!}
$$

**Problem**: How many ways can a committee of two women and three men be selected from a group of five different women and six different men?

$$
\text{Two Women from 5 Possible: } C(5,2) = \frac{5!}{3!2!}
\\
\text{Three Men from 6 Possible: } C(6,3) = \frac{6!}{3!3!}
\\~\\
C(5,2) \times C(6,3) = \frac{5!}{3!2!} \times \frac{6!}{3!3!}
$$

**Problem**: How many poker hands five-card poker hands contain cards all of the same suit?

$$
C(\text{13 \text{cards in every suit},5 \text{cards in a hand}}) \times 4 \text{ suits} \\
4C(13,5)=5148
$$

**Problem**: How many five-card poker hands can be dealt from a standard 52-card deck?

$$
C(52,5)=2,598,960
$$

# Examples: Eliminating Duplicates

**Problem**: How many distinct permutations can be made from the characters in the word YORK?
- Answer: $P(4,4) = \frac{4!}{0!} = 4!$

**Problem**: How many distinct permutations can be made from the characters in the word WASHINGTON?
- Pitfall: We can't do $P(10,10)$ because the letter "N" is used twice
- Answer: $\frac{10!}{2!}$, because everything gets counted twice by $10!$

**Problem**: How many distinct permutations can be made from the characters in the word ILLINOIS?
- Answer: $\frac{8!}{2!3!}$
	* The $2!$ is for double-counting of the two N's
	* The $3!$ is for triple-counting of the three I's

**Problem**: How many distinct permutations can be made from the characters in the word MISSISSIPPI?
- Answer: $\frac{11!}{4!4!2!}$
	* Divisions account for the 4 S's, 4 P's, and 2 I's. 

# Class Exercises

**Problem**: How many permutations of the characters in the word COMPUTER are there? How many of these end in a vowel?


$$

\text{Possibilities: C,M,P,T,R,O/U/E (2x),O/U/E (1x)}
$$
$$
\text{Permutations Ending in a Vowel: } 3 \times 7!
$$

**Problem**: How many distinct permutations of the characters in ERROR are there?

$$
\frac{5!}{3!}
$$

**Problem**: A set of four coins is selected from a box contains five dimes and seven quarters. Find the number of sets which has two dimes and two quarters.

$$
C(5,2) \times C(7,2) = \frac{5!}{3!2!} \times \frac{7!}{5!2!} = 10 \times 21 = 210
$$

**Problem**: How to select a committee of 3, from 4 men and 3 women, where there must be at least 1 man and 1 woman in the committee.

$$
\frac{
C(4,1) \times C(3,1) \times C(3 \text{ (remaining men)} + 2 \text{ (remaining women)},1)
}{
2 \text{ (for double-counting, because different order doesn't make selections unique)}
}
$$
- Double-Counting Explanation: {Alice, Bob, Michael} and {Michael, Bob, Alice} are the same.

**Problem**: How many ways can you seat 11 men and 8 women in a row?

$$
P(19,19) = 19!
$$

**Problem**: How many ways can you seat 11 men and 8 women in a row if all the men sit together and the women sit together?

$$
11! \times 8! \times 2!
$$

**Problem**: How many ways can you seat 11 men and 8 women in a row where no 2 women are to sit together?

$$
11! \text{ (ways to arrange the men)} \times P(12,8) \text{ (places for the eight women to sit)}
$$

**Problem**: How many ways can you seat 11 men and 8 women in a circle where no 2 women are to sit together?

$$
10! \text{ (ways to arrange the men in the circle)} \times P(11,8)
$$

