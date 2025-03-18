---
title: "Java Fundamentals"
---

# Parts of a Java Program

- A Java source code file:
	* Contains one or more Java classes
	* In this class we'll generally have one class per file
	* Can only have 1 public class.
		+ The public class and the filename of the source code file must match
			+ i.e., A class named `Simple` must be in `Simple.java`

---

- **Comments**: Are ignored by the compiler
	* `//` and `/* */`
- **Class Header**: Tells the compiler things about the class such as what other classes can use it (`private`/`public`), that it is a Java class (`class`), and its name (`simple`).
	* All methods and data for a class go in-between its respective curly braces.
	* e.g.,
```java
public class Simple {}
```

# Semi-colons in Java

Java statements, curly braces, comments, and Java framework code don't need semicolons.

# Console Output and Stdio

The console window displays only text.
- aka: The standard output device.
```java
System.out.println("Programming is fun!");
```
- This line uses the `System` class's $\to$ `out` object's $\to$ `println` method to output text to standard output.
	* Note: `println` Appends a newline (`\n`) while `print` does not

The standard input device is typically the keyboard
- Java's standard Java library implements standard input.

# Java Escape Characters

| Char | Name            | Description                                          |
| ---  | ---             | ---                                                  |
| `\n`   | newline         | Advances cursor to next line                         |
| `\t`   | tab             | Causes cursor to skip to next tab stop               |
| `\b`   | backspace       | Causes cursor to back up, or move left, one position |
| `\r`   | carriage return | Causes cursor to go to beginning of current line     |
| `\\`   | backslash       | Causes a backslash to be printed                     |
| `\'`   | single quote    | Causes a single quotation mark to be printed         |
| `\"`   | double quote    | Causes a double quotation mark to be printed         |

With these escape sequences, complex text output can be achieved.

# Variables and Literals

- **Variable**: Named storage location in the computer's memory
- **Literal**: Value that is written into the code of a program
```java
public class Variable
{
	public static void main(String[] args)
	{
		int value; // Variable declaration

		value = 5; // Assignment statement (stores '5' in memory)
		System.out.print("The value is "); // "The value is " is a string literal
		System.out.println(value); // Prints the integer '5'
	}
}
```

# The `+` Operator

`+` can be used two ways:
1. As an addition operator
	* e.g., `5 + 5`, yields `10`
2. As a concatenation operator
	* If either side of the `+` operator is a `String`, the result will be a `String`.
	* e.g., `"5" + 5`, yields `"55"`

**Warnings on String Literals**:
- A string literal value cannot span lines in a Java source code file.
- Be careful with quotes, you may assign the wrong data type or mess up the syntax.

# Identifiers

**Identifiers**: Programmer-defined names that represent classes, variables, or methods
- Cannot be any Java reserved keywords
- Should be self-documenting (e.g., `int numberStudents` rather than `int nS`)
- May only contain `a-z`, `A-Z`, `0-9`, `_`, or `$`
	* First char may not be a digit
	* May not contain a space (` `)

**Naming Conventions**:
- **Variables and Methods**: lowerCamelCase
- **Class Names**: UpperCamelCase
- General rule of thumb for naming variables and classes is to stick to nouns or noun phrases.

# Primitive Data Type

**Primitive Data Type**: The type of data the variable can hold
- Each variable has a data type
- Determines the amount of memory the variable uses
- You cannot use them to create objects (can only hold a single value, no attributes or methods)

**Numeric Data Types**:
| Name   | Size    | Range                                                              |
| ---    | ---     | ---                                                                |
| byte   | 1 byte  | Integers in range -128 to 127                                      |
| short  | 2 bytes | Integers in the range -32768 to 32767                              |
| int    | 4 bytes | Integers in the range -2147483648 to 2147483647                    |
| long   | 8 bytes | Integers in the range -9223372036854775808 to 9223372036854775807 |
| float  | 4 bytes |                                                                    |
| double | 8 bytes |                                                                    |

Tip: You can declare several variables of the same type like so:
```java
int length, width, area
```

# Floating Point Data Types

Data types that allow fractional values.

Java Floating-Point Data Types:
- `float`: Single-precision, 7 decimal points
	* Can be represented in scientific notation.
- `double`: Double precision, 15 decimal points

> Note: Remember to append `F` to a float.

# `boolean` Data Type

Can have two possible values: `true` or `false`.
- Takes 1 bit of RAM

```java
boolean bool;
bool = true;
```

# `char` Data Typ

Provides access to single characters
- `char` literals are enclosed in single quotation marks

```java
char letter;
letter = 'A';
```

# Unicode

- Characters are stored as Unicode numbers
	* Each character requires 2 bytes of RAM

```java
char letter = 65;
System.out.println(letter); // Prints 'A'
```

# Constants with `final`

Variables whose value cannot be changed (read-only).
- Replacing literal values (e.g., magic numbers) with constants leads to cleaner code.
- Style recommendation: Uppercase, words separated by underscores

```java
final double INTEREST_RATE = 0.069;
```

# The `Scanner` Class

Defined in `java.util`, allows reading input from the keyboard.

Imported like so:
```java
import java.util.Scanner;
```

Scanner objects work with `System.in`, the standard input device.
- Scanner objects retrieve the input formatted as primitive values or strings.

```java
// Create Scanner object
Scanner keyboard = new Scanner(System.in);
```

`Scanner` class methods to return input as a ...:
- `nextByte()`: Byte
- `nextDouble()`: Double
- `nextFloat()`: Float
- `nextInt()`: Int
- `next()`: String (until the first space)
- `nextLine()`: String (the entire input)
- `nextLong()`: Long
- `nextShort()`: Short

> **Note**: Remember to close a Scanner object to prevent memory leaks.
> - e.g., `input.close();`

# Variable Assignment and Initialization

Assignment Operator (`=`): Stores a value in a variable
- Operand on left side must be variable name
- Operand on right side must be a literal or expression/variables that evaluates to compatible type.

More on variables:
- Can only hold one value at a time
- Local variables (variables declared inside a method) do not receive a default value

# Binary Arithmetic Operators

Java has five arithmetic operators:
| Operator | Meaning        |
| ---      | ---            |
| `+`      | Addition       |
| `-`      | Subtraction    |
| `*`      | Multiplication |
| `/`      | Division       |
| `%`      | Modulus        |

- The binary operators must have two operands.
- Division by zero results in an error.
- Each operator must have a left and right operand.

# Unary and Ternary Operators

| Operator | Meaning  |
| ---      | ---      |
| `-`        | Negation |

- Other unary operators and the ternary operator will be discussed later.

# Integer Division

Integer division is truncated. Pay attention to types.

e.g.,
```java
double number = 5/2;
System.out.println(number); // Prints "2.0"

number = 5.0/2;
System.out.println(number); // Prints "2.5"
```

# Operator Precedence

| Operator | Associativity | Example                   | Result |
| ---      | ---           | ---                       | ---    |
| -        | Right to left | $x = -4 + 3$              | $-1$   |
| * / %    | Left to right | $x = -4 + 4 % 3 * 13 + 2$ | 11     |
| + -      | Left to right | $x = 6 + 3 - 4 + 6 * 3$   | 23     |

## Grouping with Parenthesis

- When parenthesis are used in an expression, innermost parenthesis are processed first.
- Parenthesis on the same level are processed left-to-right

# `Math` Class

Java's `Math` class contains useful methods for complex mathematical operations. e.g.,

- `Math.pow()`
- `Math.sqrt()`
- `Math.max()`
- `Math.abs()`
- `Math.abs()`
- `Math.min()`
- `Math.log10()`
- etc...

Predefined $\pi$:
- `Math.PI`


## Combined Assignment Operators

Allow programmer to perform arithmetic and assignment with a single operator.

| Operator | Example |
| --       | --      |
| +=       | x+=5    |
| -=       | y-=2    |
| *=       | z*=10   |
| /=       | a /=b   |
| %=       | c %=3   |

## Conversion between Primitive Data Types

Java performs some conversions between data types automatically if the conversion will not result in the loss of data.

```java
int x;
double y = 2.5;
x = y; // Compile error! (data loss)
```

```java
int x;
short y = 2;
x = y; // This is fine
```

Ranking of numeric data types (Java automatically converts smaller to larger, this is called the widening operation):
- `double`
- `float`
- `long`
- `int`
- `short`
- `byte`

### Cast Operator

If you need to perform the narrowing conversion, you need to use the cast operator.

```java
TARGET_DATA_TYPE x = (TARGET_DATA_TYPE) number;
```

## Promotion

Java performs promotion automatically when operands are of different data types.
- e.g., if `sum` is a `float` and `count` is an `int`, the value of `count` is converted to a `float` to perform the following calculation: `result = sum / count`

## The `String` Class

`String` is not a primitive data type, it is a class from the Java standard library.
- Notice how `String` is uppercase because it is a class.

## Primitive vs. Class Type Variables

Primitive variables actually contain the value they've been assigned.

Objects (instances of classes) aren't stored in variables. Objects are referenced by variables.
- They store a pointer to the value in memory
- The variable *references* the object.

## `String` Objects

- You can create a String object in memory and store its address in a String variable with a simple assignment of a String literal. 
	* Strings are the only objects that can do this.
```java
// Easy string object creation and assignment
String value = "Hello";
// Standard way to create objects
String value = new String("Hello");
```
- `String` objects are immutable.
- Java maintains a String constant pool with String objects can be referenced by other variables.
	* e.g., In the following example, `name` and `otherName` reference the same `String` objects.
```java
String name = "Hello";
String otherName = "Hello"
```
- Important String library methods:
	* `length()`
	* `charAt(index)`
		+ Remember: Java is zero-indexed.
	* `toLowerCase()`
	* `toUpperCase()`

## Scope

**Scope**: The part of a program that has access to a variable's contents.
- Variables declared inside a method are called local variables.
	* e.g., Variables declared in the `main` method are local variables
	* A local variable's scope begins at its declaration and ends at the end of the method in which it was declared.
		+ Thus, you cannot use a variable before it has been declared.
- You cannot create two local variables with the same name in the same scope.

## Commenting Code and Javadoc

| Style        | Description          |
| --           | --                   |
| `//`         | Single line comment. |
| `/* ... */`  | Block comment.       |
| `/** ... */` | Javadoc comment.     |

> Note on Javadoc comments: Allows comments to be documented by the javadoc utility. Can be built into HTMl documentation.
> - e.g., `javadoc <source_code.java>` created `index.html` and several documentation files in the same directory as the input file.

## Programming Style

Although the compiler doesn't care about white space, humans do!

### Indentation

Programs should use proper indentation.
- Each block of code should be indented a few spaces from its surrounding block.

## Dialog Boxes

**Dialog Boxes**: Small graphical window that displays a message to the user or requests input.
- A variety of dialog boxes can be displayed using `JOptionPane` class.
	* `JOptionePane` can be imported via: `import javax.swing.JOptionPane;`
- Two dialog boxes options:
	- Message Dialog: Displays a message
	- Input Dialog: Prompted user for input

## The Parse Methods

**Parse Methods**: Method that converts a `String` to a number.
- Each of the numeric wrapped classes has a parse method 
	* e.g., `Integer` class has a method that converts a `String` to an `int`.

```java
int x = Integer.parseInt("2599");
float y = Float.parseFloat("12.3");
// etc...
```

