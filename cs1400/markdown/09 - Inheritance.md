# Generalization vs. Specialization

Real-life objects are typically specialized versions of general objects.

# The "is a" Relationship

Relationship between a superclass and an inherited class.
- Examples:
	* A grasshopper is an insect
	* A poodle is a dog
	* A car is a vehicle

A specialized object has all the characteristics of the general object + additional characteristics that make it special.
- In OOP, *inheritance* is used to create an "is a" relationship among classes.
	* We do this by *extending* the capabilities of a class
		+ The **superclass** is the general class (parent)
		+ The **subclass** is the specialized class (child)
		
# Extending a class (`extends`) keyword

```java
public class Grasshopper extends Insect
```
- Subclass inherits fields and methods from the superclass
- New fields and methods can be added to subclass

TO SHOW INHERITANCE IN UML, USE AN ARROW
<!--
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
-->

# Inheritance, Fields, and Methods

Members of the superclass that are private:
- Aren't inherited by the subclass
- Exist in memory when the object of the subclass is created
- May only be accessed by methods of the superclass.

Members of the superclass that are public:
- Are inherited by the subclass
- May be directly accessed from the subclass

# Inheritance and Constructors

Constructors aren't inherited.
- When a subclass is instantiated, and instance of its parent class is created implicitly, and the superclass default constructor is executed first.

# The Superclass's Constructor

The `super` keyword refers to an object's superclass (reference variable) and can be used to access members of the superclass.
- This is how we can explicitly call the superclass constructor from the subclass.
	* Has to be the first statement if explicitly called.
- If not explicitly called, the no-arg superclass constructor will be called automatically, which is equivalent to `super();`

## Overriding Superclass Methods

**Method Overriding**: When a subclass has a method with the *same* signature as a superclass method, the subclass method overrides the superclass method.
- @Override annotation before the method header tells the compiler to fail if the method doesn't override one in the superclass
- Subclass uses the overrided method.
	* Can still access the superclass method via `super` (e.g., `super.setScore(100)`)

> Remember:
> 1. Overriding can only happen in an inheritance relationship. 
> 2. Overloading is when methods share the same name but different parameters (different signatures)—don't confuse it with overriding!

### Preventing a Method from Being Overridden

`final` modifier prevents overriding of a superclass method.

```java
public final void message()
```
- Attempting to override will cause compiler to generate an error

# Abstract Classes and Methods

```java
public abstract class ClassName
```

An `Abstract` class:
- Is used to ensure that a subclass implements a method.
- Cannot be instantiated, but other classes can inherit from it.
- Serves as a superclass for other classes
- Represents the generic of abstract form of all the classes that are derived from it
- Appears in a superclass but must be overridden in a subclass
	* If a subclass fails to override an abstract method, the compiler will generate an error
- Has only a header and no body.
```java
AccessSpecifier abstract ReturnType Methodname(ParameterList);
```
- Noticed how the header ends with a semicolon.
- Any class that contains an abstract method is automatically abstract

Abstract classes are drawn like regular class in UML, except the name of the  class and abstract methods are italicized.

Non-abstract classes are called concrete classes.

# Protected Members

Third access specification: `protected`
- May be accessed by methods in a subclass
	* This unrestricted access makes some tasks easier, but it is better to make all fields `private` and provide `public` setters/getters. 
- Access is somewhere between private and public.
- Denoted by `#` symbol in UML

@startuml
class BankAccount {
	#score : double
	+setScore(s : double) : void
	+getScore() : void
	+getGrade() : char
}
@enduml

# Default Access Modifier

If you don't provide an access specifier for a class member, the member is given package access by default, meaning that any method in the same package may access the member.
- Denoted by `~`

@startuml
class BankAccount {
	~score : double
	+setScore(s : double) : void
	+getScore() : void
	+getGrade() : char
}
@enduml

# Chains of Inheritance

A superclass can inherit from another class.
- Classes are often depicted graphically in a class hierarchy.

# The `Object` Class

All Java classes are directly or indirectly derived from a class named `Object` in the `java.lang` package.
- Any class that doesn't specify the extends keyword is automatically derived from the Object class (`public class MyClass extends Object`).
	* Ultimately, every class is derived from the **Object** class.

Thus, every class inherits the `Object` class's members (which we often override):
- `toString()`: Returns string containing class name and hash of memory address.
- `equals()`: Accepts address of an object and returns true if it is the same address as the calling object's address.

# Polymorphism

**Polymorphism**: Ability to take many forms.
- In Java, a reference variable is polymorphic because it can reference objects of type different from its own, as long as those types are subclasses of its type.

A superclass reference variable can reference objects of a subclasses.
```java
GradedActivity exam;
```

1. We can use the exam variable to reference a GradedActivity object
```java
exam = new GradedActivity();
```
2. Or we can create a reference to a `FinalExam` object
```java
GradedActivity exam = new FinalExam(50,7);
```

## Polymorphism and Dynamic Binding

When a superclass variable references a subclass object that has overridden a method in the superclass, the subclass's version will be run when it's called.

Java performs *dynamic binding* or *late binding* when a variable contains a polymorphic reference.
- The JVM determines at runtime which method to call, using the polymorphic object's type rather than the reference type.

# The `instanceof` Operator

`instanceof` can be used to determine whether an object is an instance of a particular class.

```java
FinalExam exam = new FinalExam(20,2);
if (exam instanceof GradedActivity)
	// Does run
else
	// Doesn't run
```


