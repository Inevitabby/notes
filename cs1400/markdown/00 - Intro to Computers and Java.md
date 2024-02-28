# Intro to Computers and Java

# Why Program?

- We rely on computers in our day-to-day lives
	* e.g., word processing, games, etc.
- Computer programmers implement programs that perform functions
- Programming is an art and a science.
	* Art: Careful design, mathematical procedures, UI, manuals, etc.
	* Science: Analytical correctness, strict syntax, experimentation (debugging)

# Computer Systems: Hardware and Software

- Hardware: Tangible physical pieces of the computer
	* Major Parts:
		+ CPU, Main Memory, Secondary Memory, I/O Devices
- Software: Intangible

## CPU

* CPU as I/O Machine:
	+ Instruction -> CPU (Arithmetic Logic Unit & Control Unit) -> Result
	+ To process program info, the CPU performs the fetch, decode, execute cycle
		1. Fetch: a
		2. Decode: b
		3. Execute: c

## Main Memory

* Aka: Random-access memory (RAM)
* Contains:
	+ Sequence of instructions of the running programs
	+ Data used by those programs
* Divided into units called bytes
* A byte consists of eight bits that may be either on or off
	+ Bits form a pattern that represents a char or number
	+ Smallest unit of measurement for a computer
	+ Each byte in memory is assigned a unique number known as an address.
* RAM is volatile, stuff in RAM is loss on power-off.

## Secondary Memory

- Can store info for longer periods of time (non-volatile)
- Common Sources:
	* HDD
	* SSD
	* External drive
	* USB drive
	* CD/DVD drive

> Why Are SSDs Faster than HDDs?
> - HDDs are essentially spinning metal platters while SSDs store and retrieve data using only flash-memory chips without any moving mechanical parts.

## Input Devices

Any data the computer collects from the outside world

## Output Devices

## Software

### Operating Systems

Set of programs that manages the computer's hardware devices and controls their processes.

Most modern OS are multitasking (multitasking !== parallel processing), or time sharing (can do more than one task over a given time period)

### Application Software

Specialized environment for the user to work in.
- e.g., spreadsheets, games, tax software, etc.

This is the type of software we'll be working with.

# Programming Languages

Special language used to write computer programs

An algorithm is a set of well-defined sequential steps to completing a task.

A computer program is a set of instructions that enable the computer to solve a problem *or* perform a task
- A program usually implements algorithms.

A computer needs the algorithm to be written in machine language, which is written using binary.
- Each CPU has its own machine language
	* e.g., Motorola 68000, Intel x86, ARM, etc.
- Programming languages translate human-friendly text into machine language.
	* The first programming language was Assembly.
	* High-level programming languages aren't processor dependent
		+ e.g., Java, C, BASIC, COBOL, Python, etc.

## Procedural Programming

Older programming languages were procedural.
- A procedure is a set of programming language statements that, together, perform a specific task.
- Procedures typically operate on data items separate from the procedures
- Data items are commonly passed from one procedure to another
- Procedures are developed to operate on the program's data
- Data tends to be global to the entire program

## Object-Oriented Programming

- Centers on creating objects rather than procedures
- Objects are a melding of data and procedures that manipulate that data
	* They are self-contained units
- Data in an object are known as attributes
- Procedures in an object are known as methods.
- OOP combines data and behavior via encapsulation
	* Data hiding is an object's ability to hide data from other objects in the program.
	* Only an object's methods should be able to directly manipulate its attributes
	* Other objects can only manipulate other objects' attributes via its methods
		+ This indirect access is known as a programming interface.

# Software Engineering

Encompasses the whole process of crafting computer software.
- Software engineers perform several tasks:
	- Designing, Writing, Testing, Debugging, Documenting, Modifying, Maintaining
- Software engineers develop:
	- Program specifications, diagrams of screen output, pseudocode, examples of expect I/O, etc.

Software engineers use special software designed for testing programs.
- More commercial software applications are large and complex, requiring a team of programs.
	* Program requirements are thoroughly analyzed and divided into subtasks that are handled by individual teams or individuals within a team

# Java History

1991:
- Green Team formed at Sun Microsystems to speculate about important technological trends in the future.
	* Concluded that computers would merge with consumer appliances
- There was a need for a programming language that would run on various consumer devices with different processors
	* Java (first named Oak) was developed for this purpose 
	* Programs written in Java were translated into an intermediate language known as byte code.
		+ Another program would translate the byte code into machine language that could be executed by the processor of a consumer device.
- Java applications can be of multiple types:
	- Desktop, web, mobile
	- Standalone or client-server applications in multiple layers

# What Is a Program Made Of?

Common conceptions:
- Keywords (reserved)
	* e.g., "`int`", "`void`", "`main`" in Java (note: keywords are lowercase and case-sensitive in Java)
- Operators
- Punctuation
- Programmer-defined names (identifiers)
- Syntax (strict syntactic rules)
	* e.g., semicolons are used to end Java statements

## Lines vs Statements

- Statement: A complete Java instruction that causes the computer to perform an action
- Line: A single line of code.
	* Blank lines are used to make a program more readable.

## Variables

- Data in a Java program is stored in RAM
- Variable names represent a location in memory
	* The Java Virtual Machine (JVM) decides where the value will be placed in memory
- Variables are created by the programmer who assigns it a programmer-defined identifier

## The Compiler and JVM

- A Java programmer writes Java programming statements
	* These statements are known as source code
- A text editor is used to edit and save a Java source code file
- Source code file shave a .java file extension
- A compiler is a program that translated source code into an executable form
	* Syntax errors will be discovered during compilation
		+ Syntax errors are mistakes that the programmer has made that violate the rules of the programming language
- Most compilers translate source code into executable files containing machine code
	* The Java compiler translates java source code into byte code of the JVM to execute

# What is a Program Made Of? (cont.)

- Java byte code cannot be run by the CPU, it needs to be run by the JVM. 
	* Byte code end with the *.class* extension
	* The JVM emulates a microprocessor
		+ This is why Java is called an interpreted language.

Java is both a compiled and interpreted language!
- Source code compiled into byte code
- Byte code interpreted by the JVM

# Portability

- Portable: A program may be written on one type of computer and run on a wide variety of computers with little or no modification.
- Java programs are highly portable and can run on any OS with a JVM

# Java Editions

Different editions of the Java Development Kit:
- SE: Standard Edition
- EE: Enterprise Edition
- ME: Micro Edition

# Quick Reference: Compiling and Running Java Code

1. Compile Source Code to Byte Code: `javac <file.java>`
	- `javac` is the java compiler
	- Tip: `javac *.java` to compile all Java files in the CWD
2. Run Byte Code: `java <classname>`

*e.g., `javac HelloWorld.java && java HelloWorld`*

# The Programming Process

1. Clearly define what the program should do.
2. Visualize the program running on the computer.
3. Use design tools to create a model of the program.
4. Check the model for logical errors.
5. Compiled the code
6. Correct errors found during compilation (cycle between 5 and 6)
7. ???

# Types of Errors

1. Compile Error: `x = 2`
2. Run-Time Error: `x = 2/0;`
3. Logical Error: `grossPay = hours + payrate;`
