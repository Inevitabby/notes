# Why Write Methods?

1. Break a problem into small manageable pieces.
2. Code reuse
	- Benefits: Saves time, money, security, simplification, organization

# `void` Methods and Value-Returning Methods

- `void` method: Performs a task and terminates
- `Value-returning method`: Performs a task and sends a value back to the code that called it.

## Two Parts of Method Declaration

- To create a method you must write a definition
	* Consist of a header and body
		+ e.g.,
			+ header: `public static void displayMessage()`
			+ body: `{ system.out.println(Hello"); }`"

Parts of a method header:
- **Method modifiers**:
	- public: Method is available to code outside the class
	- static: Method belong to a class, not a specific object.
- **Return type**
	* Can be `void` or a data-type.
- **Method name**
- Parenthesis
	* Can contain nothing or a list of parameters

# Calling a Method

- A method executes when it is called.
- The `main` method is automatically called on program start
	* Other methods are executed by method call statements.
- Method modifiers and the void return type aren't written in the method call, they are only written in the method header.

# Documenting Methods

- A method should always be documented by writing comments that appear before the method's definition
	* The comments should provide a brief explanation of the method's purpose.
	* Documentation comments begin with `/**` and end with `*/`.
		+ These comments can be read and processed by `javadoc` to produce HTML documentation.

# Passing Arguments to a Method

**Arguments**: Values that are sent into a method.
- Data type of argument in a method call must match the variable declaration in the method header.
	* Java will automatically perform widening conversions, but narrowing conversions will cause a compiler error (e.g., converting `double` to `int`).
- You can pass multiple arguments to a method (parameter list).

**Parameter**: Variable that holds the value being passed into a method.
- You may pass literals, the contents of variables, and the values of expressions as arguments
- Scope is the method in which it is declared. No statement outside the method can access the parameter variable by its name.

## Arguments Passed by Value

Passed by Value: Only a *copy* of an argument's value is passed into a parameter variable.
- All arguments of the primitive data types are passed by values.

## Passing Object References to a Method

When an object such as a `String` is passed as an argument, it is actually a *reference* to the object that is passed.
- Recall that a class type variable doesn't hold the actual data item, but the memory address of the object.
	* **Reference Variable**: A variable associated with an object.

# `String`s are Immutable Objects

**Immutable Objects**: Objects that cannot be changed.
- `String`s are immutable objects.

# `@param` Tag and `@return` Tag in Documentation Comments

`@param` tag: Lets you provide a description of each parameter in your documentation comments.
- All `@param` tags must appear after the general description, which can span several lines.

`@return` tag: Lets you provide a description of the return value.
- All `@return` tags must appear after the general description, which can span several lines.

General Format:
```java
@param parameterNameDescription
```

# More About Local Variables

Local Variable: Variable declared inside a method.
- Is not accessible to statements outside the method.
	- This is why different methods can have local variables with the same names.
- Exist only while the method is executing. Destroyed when method ends.
- Aren't automatically initialized with a default value, must be given a value before they can be used.

# Returning a Value from a Method

Data can be returned from a method to the statement that called it.

Example:
```java
// Returns int value of 700 and assigned it to num
int num = Integer.parseInt("700");
```

`return` statement: Causes method to end execution, returning a value to the statement hat called the method.
- Returned value must match the return type in the method header.

Examples:
1. Returning a `boolean` value
```java
public static boolean isValid(int number)
{
	if (number > 100)
		return false;
	return true;
}
```
2. Returning a Reference to a `String` Object
```java
public static String fullname(String first, String last)
{
	return first + " " + last;
}
```



