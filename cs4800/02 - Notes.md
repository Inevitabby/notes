---
title: "Software Engineering Notes in One Page"
---

# What is Software Engineering?

**Software Engineering**: The application of a **systematic**, **quantifiable**, and **disciplined** approach to the development, operation, and maintenance of software.
- Quantifiable: Measurable.
- Disciplined: Guidelines & conventions.

# Software Development Cycles

**Software Development Life Cycle:**
1. Requirements Engineering
2. Design
3. Implementation (Writing Code)
4. Verification (Testing)
5. Maintenance.

## Waterfall

**Waterfall Model:**
- You go through each step of the SDLC linearly and strictly, you can't go back.
- Used for strict, mission-critical applications
- Too inflexible for most real-world software development

## Incremental

**Incremental Model:**
- You can go back phases when necessary.
	* No real cycle.
- You aim to create a small working version of the project as early as possible.
	* Each iteration is functional

## Evolutional

**Evolutionary Models**
- You go through the full SDLC over-and-over.
- You can't go back, but you can tweak things on the next cycle.

## Formal Methods

**Formal Methods**
- Using mathematical techniques to derive mathematical guarantees of correctness or at least high-levels of assurance, usually with automated tools.
- Apple mostly in *design* and *verification* stages.
- Some problems are unsolvable, like verifying if an algorithm halts.

# AGILE

## AGILE

AGILE: An evolutionary software development process
- Cross-collaboration between teams very important.
	1. The teams are independent,
	2. But everyone knows how to do everything (cross-functional)
- Adaptable and flexible.
- Early and continuous delivery.
- Regular evaluation and tuning of process.
- Simplicity

> **Optimal Conditions for Application of AGILE:**
> - Criticality is low—medium.
> - Team of experienced independent individuals.
> - Requirements change often.
> - Small number of developments.

## Extreme Programming (XP)

**Extreme Programming:**
- Frequent delivery in short cycles
- Checkpoints at which requirements are evaluated.
- Pair programming
	* One driver, one passenger.
- Unit testing

## SCRUM

**SCRUM:**
- Roles:
	1. Product Owner
	2. SCRUM Master
	3. Development Team
- Frequent reviews
- Planning:
	* Timeboxed management
	* Sprint planning meeting at the beginning
	* Daily SCRUM meetings

# Requirements Engineering

**Requirements Engineering**: The part of the process where requirements are defined.

1. Requirements Elicitation:
	- Elicitation: Client tells you what they want
	- Analysis: Negotiate, find use-case scenarios
	- Modeling
2. Requirements Specification:
	- SRS
		* Split into function and non-funcional
3. Requirements Validation: Stakeholders approve the plan.
4. Requirements Maintenance

# Data Modeling

# System Design

## Structural Partitioning

Design is partitioned along data and functional boundaries.
- e.g., all these functions all work with the user profile, so we put it in the user manager, etc.

## Modularity

Components should be separate and have well-defined boundaries

## Low-Coupling

Different modules have minimal amount of dependencies

## High Cohesion

The stuff inside the modules should be interacting with each other as much as possible.

# SOLID Principles

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

## Structural/Behavior Patterns

2. The these patterns, the problem is architecture.

### Decorators Pattern: (Structural)

Dynamically add functionality o a component by wrapping the core component with another component that adds the extra functionality.
- e.g., You have a core item/widget/object, and you want to add features to it dynamically
- e.g., adding code to a window v.s. modifying it: Window and scrollbar have common interface `DecoratedWindow`

### Command Pattern: (Behavior Pattern)

Decouple data from behavior by abstraction actions into a command interface.
- A separate class encapsulates function calls on the data.

**Example**:

```
public class Student {
	
}

interface StudentCommand {
	execute()
}

class AvgGpaCommand implements StudentCommand {
	@override
	public float execute() {
		// implementation
	}
}

class CommandProc {
	Table commands
	executeCommand(String comm) {
		commands.get(comm.execute());
	}
	executeAll() {
	}
	addCommand(StudentCommand, String name)
```


### Adapter Pattern: (Structural)

Pattern that allows changing one interface into another one, by wrapping the adapter.

### Iterator Pattern: (Behavior)

Pattern used on collections.

```java
public interface Iterator<E> {
	E next();
	boolean hasNext();
}
```

### Visitor Pattern: (Behavior)

Pattern used to implement the function applied to every element at a particular structure as it's traversed.


