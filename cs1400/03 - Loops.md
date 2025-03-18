---
title: "Loops"
---

# The Increment and Decrement Operators

```java
number++;
number--;
++number;
--number;
```

# The `while` loop

```java
while (condition)
{
	// statements;
}
```
- Statements will execute repeatedly while condition is true
- The `while` loop is a **pretest loop**, which means that it'll test the value of the condition before executing the loop.
	* So, a `while` loop executes 0 or more times.
- Loops that don't end are called **infinite loops**

# Using the `while` Loop for Input Validation

```java
System.out.print("Enter a number in the range of 1 through 100: ");
number = keyboard.nextInt();
// Validate the input.
while (number < 1 || number > 100)
{
	System.out.println("That number is invalid.");
	System.out.print("Enter a number in the range of 1 through 100: ");
	number = keyboard.nextInt();
}
```

# Mixing Calls to `nextLine` with Calls to Other Scanner Methods

`String`'s `nextInt`, `nextDouble` and `next` methods don't consume the newline character, causing the newline to be consumed by whatever reads `System.in` next.
- This can cause the program to skip over `nextLine` and other methods than consume newlines

E.g.,
```java
Scanner scanner = new Scanner(System.in);
System.out.println("Enter your name: ");
String name = scanner.nextLine();
System.out.println("Enter your age: ");
int age = scanner.nextInt();
System.out.println("Enter your city: ");
String city = scanner.nextLine();
System.out.println("Hi " + name + ", your age is " + age + " and your city is " + city);
```
- Output: `Hi John, your age is 10 and your city is`

Fix:
```java
Scanner scanner = new Scanner(System.in);
System.out.println("Enter your name: ");
String name = scanner.nextLine();
System.out.println("Enter your age: ");
int age = scanner.nextInt();
scanner.nextLine(); // Consume newline
System.out.println("Enter your city: ");
String city = scanner.nextLine();
System.out.println("Hi " + name + ", your age is " + age + " and your city is " + city);
```
- Output: `Hi John, your age is 10 and your city is Pomona`

The `do-while` Loop

```java
do
{
	// statements;
}
while (condition);
```

- `do-while` is a **posttest loop**, which means it'll execute the loop before testing the condition.
	* This means a `do-while` loop will always perform at least one iteration.


# The `for` Loop

```java
for (initialization; test; update)
{
	// statement
}
```
1. Perform initialization expression (done only once)
2. Evaluate the test expression. If it is false, terminate the loop
3. Execute the body of the loop
4. Perform update expression, then go back to step 2

> **Note**: The `for` loop is a pre-test loop

Two Categories of Loops:
- **Conditional Loops**: Executes as long as a particular condition exists
	* e.g., `while`, `do-while`
- **Count-Controlled Loops**: Loop that repeats a specific number of times.

# Running Totals and Sentinel Values

- **Running Total**: Sum of numbers that accumulate with each iteration of a loop.
	* Can be used to calculate the total of a series of numbers
	* **Accumulator**: Variable used to keep the running total.
- **Sentinel Value**: Used to notify program to stop acquiring input
	* Used because the end point of input data isn't always known
		+ e.g., user prompts where the user types "STOP" to exit a loop, end-of-file markers for file input

```java
double runningTotalSales = 0.0; // Accumulator (Running Total)
double sales = 0.0;
while (sales != -1) // Sentinel value
{
	totalSales += sales;
	sales = scanner.nextDouble();
}
```

# Nested Loops

- Loops can be nested
	* Inner loop will execute all of its iterations each time the outer loop executes once.

# The `break` and `continue` Statements

- `break` can be used to terminate a loop
- `continue` will cause the currently executing iteration of a loop to terminate and the next iteration to begin

> **Important**: `break` and `continue` bypass normal mechanisms and can make code hard to read & maintain—use only when needed

# Deciding Which Loop to Use

`while`:
- Pretest

`do-while`
- Post-test

`for`:
- Pretest
- Prefer over a `while` if there is some type of counting variable involved

# Generating Random Numbers with the `Random` class

```java
import java.util.Random;
Random randomNumbers = new Random();
```
- `nextDouble()`: Return random double within 0.0 and 1.0
- `nextFloat`: Returns random float within 0.0 and 1.0
- `nextInt`: Returns random int within range of int (-2,147,483,648, 2,147,483,648)
- `nextInt(int n)`: Returns random int with range of 0 to $n-1$
- `nextLong()`: Returns random long within range of long (-9,223,372,036,854,775,808, 9,223,372,036,854,775,808)

