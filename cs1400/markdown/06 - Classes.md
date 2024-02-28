# Objects and Classes

An object exists in memory and performs a specific task
- Created from a class that contains code describing the object.
- Two general capabilities:
	* Storing Data
		+ Stored data is known as **fields**.
	* Performing Operations
		+ Operations an object can perform are **methods**
- When a program needs the services of a particular type of object, it creates that object in memory, and then calls that object's methods as necessary.

**Class**: Code that describes a particular type of object.
- Specifies the data than an object can hold (fields) and actions it can perform (methods).
	* tl;dr It's the blueprint for objects.
- Each object created from a class is an **instance** of the class.
	* Many objects of the same type can be created at runtime.

> **Remember**: 
> - Data is stored immediately within the variable (memory location) in primitive variables.
> - A pointer to another memory location is stored in reference variables.

Creating a Typical Object:
1. Declare reference variable
	- e.g., `Random rand`
2. Create object in memory and assign memory address to reference variable.
	- e.g., `= new Random();`

# Writing a Class

Suppose we want a `Rectangle` object to store `length` and `width` (fields)
- We then and also want these methods:
	* `setLength`, `setWidth`, `getLength`, `getWidth`, `getArea`

## UML Diagram

Unified Modeling Language (UML): Set of standard diagrams for graphically depicting object-oriented systems.
- `+` and `-` determine private and public data
- Return type and input variables are included.

General Structure:
@startuml
class ClassName {
	Fields
	Methods()
}
@enduml

For our `Rectangle` example:
@startuml
class Rectangle {
	-length : double
	-width : double
	+setLength(l : double) : void
	+setWidth(w : double) : void
	+getLength() : double
	+getWidth() : double
	+getArea() : double
}
@enduml

---

## Access Specifiers

**Access Specifier**: Java keyword that indicates how a field or method can be accessed.
- `public`: Can be accessed by code outside of class.
- `private`: Can only be accessed by method that are members of the same class.

```java
public class Rectangle
{
	// These variables can only be accessed by methods in the class
	private double length;
	private double width;

	// == Mutators ==

	// Note how this isn't static b/c we want each instance to have their own setLength method
	// - We only use static for methods that don't depend on specific instances
	public void setLength (double l) {
		length = l;
	}
	public void setWidth (double w) {
		width = w;
	}

	// == Accessors ==

	public double getLength () {
		return length;
	}
	public double getWidth () {
		return width;
	}

	// == Other ==

	public double getArea()
	{
		return length * width;
	}
}
```

## Accessors and Mutators (Setters and Getters)

Because of data hiding, we interact with fields with:
- **Accessors**: Methods that retrieve the data of fields.
- **Mutators**: Methods that modify the data of fields.

# Data Hiding

> Note: Important concept in OOP!

- Object hides it internal fields
	- Code outside class must use the class's public methods to operate on its private fields.
- Important for enforcing integrity of an object internal data, especially in large software systems.

# Stale Data

Data that requires calculation has the potential to become stale.
- For example, `double area = length * width` v.s. `public getArea() { return length * width }`)

# Class Layout Conventions

Common layout:
- Fields listed first
- Method listed second
	* Setters and getter typically groups

- Specific layout varies by employer and/or source
- There are tools to help formatting

# Instance Fields and Methods

**Instance Methods**: Methods that are not declared with the `static` keyword.
**Instance Fields**: Fields that each instanced object has their own version of.

> Note: Both require an object to be created to be used!

## Using Same Variable Names in Setters

Suppose the following setter:
```java
public Rectangle(double l, double w) {
	length = l;
	width = w;
}
```

We can use the `this` keyword to refer to instance fields with the same names as the arguments:
```java
public Rectangle(double length, double width) {
	this.length = length;
	this.width = width;
}
```

# Constructors

**Constructor**: Method that's automatically called when an object is created.
- Typically used to initialize instance fields and perform other object initialization tasks. 
- Special properties:
	* Have same name as the class
	* No return type (not even `void`)
		+ May not return any values
		+ This is because they aren't executed by explicit method calls.
	* Typically public
		+ (If it isn't public you won't be able to instantiate your object)

## Constructors in UML

Constructors don't have their return type listed.

For our `Rectangle` example:
@startuml
class Rectangle {
	-length : double
	-width : double
	+Rectangle(len:double, w:double)
	+setLength(l : double) : void
	+setWidth(w : double) : void
	+getLength() : double
	+getWidth() : double
	+getArea() : double
}
@enduml

# Uninitialized Local Reference Variables

We can create reference variables without initializing them.

e.g.,
```java
Rectangle box;
```

If you try to use an uninitialized local reference variable a compiler error will occur.

# The Default Constructor

If you don't write a constructor, Java will provide a default constructor that:
- Sets all object's numeric fields to 0.
- Sets all `boolean` fields to `false`.
- Sets all object's reference variables to `null`.

> **Note**: The default constructor exists only when you don't write a constructor and takes no parameters.

# No-Arg Constructor

**No-Arg Constructor**: A constructor that doesn't accept arguments.
- Often used with other overloaded constructors.

> Note: A No-Arg constructor $\ne$ the default constructor.

# Passing Objects as Arguments

When passing an argument, the object;s memory address is what's actually passed into the parameter variable.
- The receiving method thus has access to the object through the reference variable.

# Overloading Methods and Constructors

**Method Overloading**: When two or more methods have the same name but different argument lists.
- Also applies to constructors.
- Useful for providing multiple ways to perform the same operation.

e.g.,
```java
public Rectangle(double length, double width) {
	this.length = length;
	this.width = width;
}
public Rectangle() {
	this.length = 7;
	this.width = 7;
}
```

# Method Signature and Binding

**Method Signature**:
- Consists of the method's name and the data types of the method's parameters
	- Method parameter order matters (e.g., `add(int,string)` $\ne$ `add(string,int)`)
- Return type is not part of the signature.

For example, here are the method signatures of the `Rectangle` examples in the previous section:
```
Rectangle(double,double)
Rectangle()
```

**Binding**: The process of bathing a method call with the correct method
* Compiler uses method signature to determine which overloaded method to bind the call to.

# `BankAccount` Example

Here's a class that demonstrates overloaded methods and constructors.

@startuml
class BankAccount {
	-balance : double
	+BankAccount()
	+BankAccount(startBalance:double)
	+BankAccount(str:String)
	+deposit(amount:double):void
	+deposit(str:String):void
	+withdraw(amount:double):void
	+widhdraw(str:String):void
	+setBalance(b:double):void
	+setBalance(str:String):void
	+getBalance():double
}
@enduml

# Scope of Instance Fields

Variables declared as instance fields can be accessed by any instance method in the same class as the field.
- If it's declare with `public` access specifier, it can also be accessed by code outside the class, which should be avoided because it goes against data hiding.

# Shadowing

A parameter variable, in effect, is a local variable.
- Inside a method, variable names must be unique 
	* **Shadowing**: When a local variable (parameter variable) override an instance field's variable of the same name.
		- Shadowing without using `this` is discouraged.
		
# Packages and `import` Statements

**Package**: Group of related classes.
- Classes in the Java API are organized into packages.
	- Can be added through `import` statements, like so:
		1. Explicit imports (specific class)
		```java
			import java.util.Scanner;
		```
		2. Wildcard imports (whole package)
		```java
			import java.util.*;
		```
- The `java.lang` package is automatically made available to any Java class (e.g., `System`, `String`)

## Some Java Standard Packages

- `java.io`: Input/output
- `java.lang`: Java language
- `java.net`: Network communications
- `java.security`: Security
- `java.sql`: SQL databases
- `java.text`: Formatting text
- `java.util`: Various utility classes (e.g., `Scanner`, `random`)

# The `toString` Method

- Returns a string representing the state of an object.
- Can be called explicitly or implicitly.

```java
Rectangle box = new Rectangle();

// Explicitly calling toString()
System.out.println(box1.toString());

// Implicitly calling toString()
System.out.println(box1);
```
- `toString` can also be called implicitly whenever you concatenate the object with a string (e.g., `"The rectangle data is: " + box1`)
- Default `toString` method will return class name and hash of memory address of the object.

# Static Class Members

**Static fields** and **static methods** don't belong to a single instance of a class.
- Class *doesn't* have to be instantiated to eve use the class's static fields.
- Static methods can only operate on static fields.

To invoke a static method or field, the class name is used instead of an instance name, like so:
```java
// Class Name: Math
// Static Method: sqrt()
double x = Math.sqrt(25.0);
```

## Static Fields

To declare a static field, put `static` keyword between access specifier (`private`/`public`) and field type (e.g., `int`, `double`), like so:
```java
private static int instanceCount = 0;
```
- The field is initialized only once, every instantiation of the class shares a single copy of the static field.

## Static Methods

Static methods can be declared by putting `static` between access specifier and return type, like so:
```java
public static double milesToKilos(double miles)
```
- Convenient because they can be called at the class level
- Typically used to create **utility classes** (e.g., `Math`, Java Standard Library) and have no need to collect and store data.
- **Cannot** refer to non-static members of the class
- You can return references to objects like normal functions.

# The `equals` Method

Like `toString`, all objects have a default `equals` method that compares memory addresses of the objects like the `==` operator.
- Default `equals` doesn't compare the contents of objects (you can implement it yourself, though)

# Methods that Copy Objects

Two ways to copy an object:
1. **Reference-Only Copy**: Copy memory address of object into reference variable.
```java
// Reference-Only Copy
Stock company1 = new Stock("XYZ", 9.62);
Stock company2 = company1;
```
2. **Deep Copy**: Copy values into a new instance of the class.

## Copy Constructors

A constructor that accepts an existing object of the same class and clones it.

Example:
```java
// Copy Constructor
public Stock(Stock orig)
{
	this.symbol = orig.getSymbol();
	this.sharePrice = orig.getSharePrice();
}
```

```java
// Deep Copy
Stock company1 = new Stock("XYZ", 9.62);
Stock company2 = new Stock(company1):
```

# Null References

**Null Reference**: Reference variable that points to nothing.
- We can't perform any operations on null references (will cause runtime error).
- We can test for null references before trying to use references, like so:

```java
if (x != nul) { /* (do something with x) */ }
```

# `this` Reference

**`this` Reference**: Name an object can use to refer to itself.
- Can be used to overcome shadowing and allow a parameter to have same name as instance field.
- Can be used to call constructor from another constructor.
	* Allows for elaborate constructor chaining.
	* If used in a constructor, `this` must be the first statement in the constructor.

# Garbage Collection

Unused objects should be destroyed to free the memory they consumed.
- Java handles all memory operations for us.
	* We just have to set the reference to `null` for Java to garbage collect it.
		+ Remember that *all* reference variables need to be set to `null`.

# `finalize` Method

If an object has a method with the signature—
```java
public void finalize()
```

—It will run prior to the garbage collector reclaiming its memory.
	- Remember that we can't tell when `finalize` will actually be run, because the garbage collector is a background thread that runs periodically.

# Aggregation

**Object Aggregation:** Making an instance of one class a field in another class.
- Creates a "has a" relationship between objects.

Example UML Diagram:
@startuml
class BankAccount {
	-balance : double
	-assignedManager : Manager
	-preferredBranch : Branch
	+BankAccount()
	+BankAccount(startBalance:double)
	+BankAccount(str:String)
	+deposit(amount:double):void
	+deposit(str:String):void
	+withdraw(amount:double):void
	+widhdraw(str:String):void
	+setBalance(b:double):void
	+setBalance(str:String):void
	+getBalance():double
}

class Manager extends BankAccount {
-lastName : String
-firstName : String
-phone : String
+Manager(fullName:String,phone:String):void
+getName():String
+getPhone():String
}

class Branch extends BankAccount {
	-location : String
	Branch(location : String):void
	getLocation():String
}
@enduml

