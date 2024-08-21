# Two Kinds of Programming

1. **Applications Programming**: Make software that provide services to the user directly.
2. **Systems Programming**: Make software and software platforms that provide services to other software, and are performance critical.
	- Requires lots of hardware awareness.
	- Because the software is performance critical, efficiency is a major goal.
	- System software coordinates data transfer across the various components and deals with very low level operations.
		* e.g., Compiling, linking, starting/stopping programs, file I/O, etc.
	- System programs use system calls to provide higher level services. 
	- Language of choice is usually C.

# Low-Level Programming

**Low-level languages** are very close to the hardware level and deal with things like registers and memory allocation.

> **Low-level languages are used in systems programming so that programs...**:
> - ... can operate in resource-constrained environments
> - ... are efficient with little runtime overhead.
> - ... can use direct and "raw" control over memory access and control flow.
> - ... can be partially written in assembly language if needed.

> **The language for most systems programming is C because**:
> - C gives a set of low-level programming tools that are unmatched by any other programming language.
> - C is powerful because you can express programming instructions using a combination of low level and high-level constructs.

# Learning Systems Programming

Understanding systems programming means understanding and combining:
1. The basics of UNIX, and
	- e.g., Logins, shell, environment, file systems, file hierarchy, basic utilities, users and groups, root, special device files, system calls.
2. The basic of C.
	- e.g., Data types, I/O, arrays, functions, pointers, memory management, data structures
