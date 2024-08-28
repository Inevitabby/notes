---
title: "Analyzing Systems"
---

# Terminologies

**Terminologies**:
- **System**: Collection of components that work to achieve an outcome.
- **Subsystem**: System part of larger system.
- **Computer Application (App)**: Computer software program.
- **Information System**: Set of components that collect, process, store, and output information to complete business tasks.
	* Broader than "app"
	* Includes database and related manual processes.
- **Project**: Planned undertaking with beginning and end that procures definite result.
	- Requires knowledge of systems development.
	- Used to develop and information system.
- **Functional Decomposition**: Dividing system into subsystems.
- **System Boundary**: Separation between automated and manual part of system.
- **Database**: Centrally managed collection of data accessible to *many* users and systems simultaneously.
- **Techniques**: Strategies for completing *specific* system development activities.
- **Methodology**: Way of doing something
	* Unified Process
	* Extreme Programming
	* Scrum

# Programming Paradigms

**Programming Paradigms**: Stately we follow to program.
- The *way* we code.

**Two General Programming Paradigms**:
1. **Imperative**
	- List of instructions tell computer what to do step-by-step.
		- Describe explicitly which steps to perform to get the solution.
	- e.g., Java, C, Python, Ruby, etc.
	- Analogy: Telling your friend step-by-step how to fix your car.
2. **Declarative**
	- Express the logic of computation without talking about its control flow.
		* Desired result is described directly.
	- e.g., HTML, SQL, Prolog, Lisp, etc.
	- Analogy: Telling your friend to fix your car but don't care about the steps.
	- Two major programming paradigms that are declarative: 
		1. Functional programming 
		2. Logic programming.

**Procedural v.s. Object-Oriented Programming Paradigms:**
- **Procedural Programming**: Top-down approach 
	- Relies on procedures or routines.
- **Object-Oriented Programming**: Bottom-up approach
	- Superset of imperative programming with extra features.
	- Organizes program as a collection of objects.
		* Each object has properties and can do certain tasks.
- *(both are imperative paradigms)*

## More on OOP

**Characteristics of OOP**:
- **Identity**
	* Data is quantized into discrete objects.
- **Classification**
	* Object attributes and operations are grouped into classes.
- **Abstraction**
	* Simplifies focus to only relevant data and processes.
- **Encapsulation**
	* Data and methods to manipulate data are bound-together and protected from outside.
- **Inheritance**
	* Classes can derive properties and methods from another class.
- **Polymorphism**
	* Different subclasses of the same superclass can implement their shared interface in different ways.

# System Development

> **Goal**: Identify the classes in our system.
> - Attributes should have to do something with the nature of the object.
>	- or; **Attributes should be vital to defining the object**.
> - Think through every use case.

**System Development**: (Analysis) What $\to$ (Design) How
- **Analysis**: Process of understanding and specifying in detail *what* the information system should accomplish.
- **Design**: Process of specifying *how* the components should be implemented.

**Systems Analyst**: Business professional who uses analysis and design techniques to solve business programs with information technology.


**Software Development**:
1. Understand the business need
2. Capture the system vision
	- Problem Description
	- System Capabilities
	- Business Benefits
3. Define a solution
4. Communicate the vision and solution.
5. Build the solution
6. Confirm the solution meets the need
7. Launch the solution system.

**Iterative Development**: Approach to systems development in which the system is grown piece-by-piece through multiple iterations.
- Complete mini project, then repeat processes to refine and add more.
- Makes Agile development possible.

**Agile Development**: Information development process that emphasizes flexibility to anticipate new requirements during development.
- Fast on feet, responsive to change.

<!--
**Ridgeline Mountain Outfitters**:
- Large Retail Company
	* Outdoor and sporting clothing and accessories
- Rocky Mountain and Western States:
	* Mail and Phone Order
	* Retail Stores
	* E-Retail

Problem: Split into subsystems:
- RMO Tradeshow System
	* They go out to trade shows and note products, they show pamphlets, catalogues, etc.
	* They want a system where the people at trade shows enter data into the system instead of sending pamphlets back to HQ.
1. Collect Products, Companies, and Contact Information, and pictures of products.

Classes:

Product:
- Price
- Image
- Vendor
- Description

Supplier:
- Name
- Phone

Contact Person:
- Name
- Phone
- Email
- Image

Since we can have multiple images, it's better to define another class for Image.
-->
