---
title: "Software Development Principles"
---

# SOLID

**SOLID**: A set of software design principles that are about building scalable and maintainable software.
1. **Single Responsibility Principle**:
	- Every component/function/module should be responsible for only one thing.
2. **Open for Extension, Closed for Modification**:
	- You should be able to add features in the future without modifying existing code.
3. **Liskov Substitution Principle**:
	- If you have a class A and a subtype B, you should be able to replace any instance of class A with class B and the system should behave exactly as behavior.
		* This is about behavior, not syntax.
		* e.g., if A has a function called product, don't override and change the behavior in B.
4. **Interface Segregation Principle**:
	- Favor specific interfaces over general ones.
		* e.g., breaking services into particular APIs
5. **Dependency Inversion Principle**:
	- Depend on abstractions rather than concretions
		* If you depend on concrete stuff, you'll probably break the O in SOLID.

```java
// 1: Depending on concretions
private List list;
public ListUser(List l) {
	list = new ArrayList();
}

// 2: Delay the instantiation of the list
// - This inverts the dependency back onto the client code.
// - This is used a lot in user interfaces because of how extensible it is.
private List list;
public ListUser(List l) {
	this.list = l;
}
```

# Design Patterns

**Design Patterns**: A set of patterns that should be applied to a list of problems that often arise in software engineering. There are 4 categories.

## Creation Patterns

1. **Creation Patterns**
	- "goto is considered harmful" -> "new is considered harmful"
	- `new` creates an immediate dependency on a concrete type
		* You need to know when and how to use `new`

### Factory Method

**Factory Method**: 
- Not scalable

### Abstract Factory

**Abstract Factory**: Delegate objection creation completely into another class.
- For system-wide situations.

```java
public interface ListManager {
	public List createList();
}

public class C {
	ListManager l;
	// use an implementation of ListManager here
}
```

### Dependency Injection

**Dependency Injection**: Decouple layers by injecting dependencies through function argument injection. Concrete types are injected at object creation.

### Prototype

**Prototype**: Have a prototypical object represent particular kinds of objects in your system, and every time you need a new object you clone the prototype.
- Not used much except for doing like UI widgets and stuff.

### Object Pool

**Object Pool**: Front-load the allocation of objects.
- Creating objects is expensive, in an environment like a server, it'd be really expensive to be created and deleting thousands of objects; so front-loading the allocations can save.

### Builder

**Builder**: Used to abstract the construction of a complex object.
- Has a bunch of setter methods and a method to create an instance.
