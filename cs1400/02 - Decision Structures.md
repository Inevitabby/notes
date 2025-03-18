---
title: "Decision Structures"
---

# The `if` Statement

Decides whether or not a section of code executes.
- Uses a `boolean` to decide

```java
if (boolean expression is true)
	execute next statement
```

## Flowcharts

If statements can be modeled as a flow chart.

## One-line Style

This—
```java
if (average > 95)
	grade = 'A';
```

—is functionally equivalent to:
```java
if (average > 95) grade = 'A';
```

## Block `if` Statements

Curly braces are used to group conditionally executed statements.

e.g.,
```java
if (expression)
{
	statement1;
	statement2;
}
```

> **Note**: Some trick questions will leave out the curly braces but indent blocks to look like they are conditionally executed when only the first line is conditional.

# Relational Operators and Boolean Expressions

**Boolean Expression**: Any variable or calculation that results in a true or false condition.

Typically, we'll use relational operators in boolean expressions because they return true or false.

| Relational Operator | Meaning                     |
| --                  | --                          |
| >                   | is greater than             |
| <                   | is less than                |
| >=                  | is greater than or equal to |
| <=                  | is less than or equal to    |
| ==                  | is equal to                 |
| !=                  | is not equal to             |

> **Reminder**: `=` is the assignment operator, `==` is the comparison operator!

# Flag

Flag: `boolean` variable that monitors some condition in a program
- When a condition is true, flag is set to `true`
- e.g.,
```java
boolean isPrime = true;
if (5 % 4 == 0)
	isPrime = false;
if (5 % 3 == 0)
	isPrime = false;
if (5 % 2 == 0)
	isPrime = false;
if (isPrime)
	System.out.println("5 is prime");
```

# Comparing Characters

Characters can be tested with relational operators.
- Characters are stored in memory using the Unicode character format
	* Unicode is stored as a 16-bit number
- Characters a **ordinal**, they have an order in the Unicode character set
	* Because characters are ordinal, they can be compared to each other.
		+ e.g., "A" is represented by 65, "B" is represented by 66, etc. so we don't even need to reference the Unicode table to compare chars.

```java
char x = 'A';
if (x < 'B')
	System.out.println("A is less than B");
```

# if-else Statements

```java
if (expression)
	statementTrue;
else
	statementFalse;
```

> Note: Curly braces not required if there is only one statement
> - But they can help with readability

## Nested `if` statements

**Nested `if` Statement:** An `if` statement inside another if statement (single or block, doesn't matter)
- Executed only if the outer `if` statement is true.

![](.images/nested-if-flow.png)
```java
if (coldOutside)
{
	if (snowing)
	{
		wearParka();
	}
	else
	{
		wearJacket();
	}
}
else
{
	wearShorts();
}
```

# `if-else-if` Statements

- Makes certain types of nested decision logic simpler to write.
- Nested `if` can become very complex.

```java
if (expression)
{
	// a
}
else if (expression)
{
	// b
}
else if (expression)
{
	// c
}
else{
	// catch whatever
}
```

Note how only one block can be executed

# Logical Operators

Two logical (AND, OR) and one unary (NOT) operators are provided in Java.

| Operator | Meaning |
| --       | --      |
| `&&`     | AND     |
| `||`     |   OR      |
| `!` | NOT |

# The `System.out.printf` Method

Print formatted string.
- Format specifier syntax: `%[flags][width][.precision]conversion`
	* `Flags`: Padding with zeros, left-justifying, comma separators
	* `Width`: Minimum field width for value
	* `.precision:` Number of decimal places number should be rounded to
	* `Conversion`: `f` for floating-point, `d` for decimal integer, `s` for string

**Examples:**

```java
double grossPay = 874.12;
System.out.printf("Your pay is %f \n", grossPay);
```
- `%f`: Format specifier. Indicates that a floating-point value will be used.

---

```java
double grossPay = 874.12111;
System.out.printf("Your pay is %.2f \n", grossPay);
```
- `%.2f`: Format specifier. Indicates that a floating-point value will be printed, rounded to two decimal placed.

---

```java
double grossPay = 5874.12111;
System.out.printf("Your pay is %,.2f \n", grossPay);
```
- `%,.2f`: Format specifier. Indicates that a floating-point value will be printed, rounded to two decimal placed, with commas separating thousands

---

```java
String name = "Ringo";
System.out.printf("Your name is %s", name);
```
- `%s`: Format specifier. Indicates that a string will be printed.

---

```java
int number = 9;
System.out.printf("The value is %6d", number);
```
- `%6d`: Format specifier. Indicates that an integer will appear in a field that is 6 spaces wide.

# `String.format`

Works exactly like `System.out.printf`, except it returns a reference to the formatted string instead of printing to the console.

# Comparing `String` Objects

> Common Mistake: Trying to compare two `String` objects with relational operators (`==`)
> - Objects are just pointers to their location in RAM; you need to use object methods to compare strings.

```java
String name1 = "john", name2 = "John";
String name3 = new String("John");
String name4 = new String("John");
```
- `name1` and `name2` share the same memory address; `name3` and `name4` each have their own unique pointers.

Common methods:
- `equals()`
- `equalsIgnoreCase()`
- `compareTo()`
	* Compares string lexicographically (character by character)
- `compareToIgnoreCase()`

# The Conditional Operator

```java
BooleanExpression ? Value1 : Value2
```
- Forms a conditional expression
	* Is a ternary (three operand) operator
	* Can be used to simple statements that work like `if-else`
- If `BooleanExpression` is `true`, value of conditional expression is `Value1`
- If `BooleanExpression` is `false`, value of conditional expression is `Value2`

```java
z = x > y ? 10 : 5;
// functional equivalent:
if (x>y)
	z = 10;
else
	z = 5;
```

# The `switch` Statement

Allows you to use value of variable/expression to determine how a program will branch.

```java
switch (SwitchExpression)
{
	case CaseExpression;
		break;
	case CaseExpression;
		break;
	case CaseExpression;
		break;
	default:
		// blah
}
```
- `SwitchExpression` can be a `char`, `byte`, `short`, `int`, `long`, or `String`
- If `SwitchExpressions` matched the `CaseExpression`, the statements between the colon and `break`  will be executed.

## The `case` Statement

- `break` ends the `case`
	* `break` is optional, this allows the program to "fall through" statements
- `default` section is optional, executed if no `CaseExpression` matches

