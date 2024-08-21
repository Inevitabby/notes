# Introduction

**System Calls**: Set or function provided to other programs provided by the program.
- Used to request access to the resources of the machine, to communicate with other currently-running programs, and to start new programs.
- Sometimes referred to as an application programming interface (API).
- Different operating systems provide different sets of system calls.
- Over the years standard have been developed to regularize at least a subset of system calls common to all systems (e.g., POSIX) 

# Taxonomy of System Calls

Modern UNIX kernels provide several hundred system calls, typically broken into families of functions.

Some of the common taxonomy of system calls:

1. **Memory Management System Calls**: 
	- e.g., mmap(),shmget(),mprotect(),mlock(), and shmctl()
2. **Time Management System Calls**: 
	- e.g., time() ,gettimer() ,settimer() ,settimeofday() ,and alarm()
3. **File System Calls**: 
	- e,g., open(),read(),write(),close(),creat(), lseek(), link()
4. **Process System Calls**: 
	- e.g., fork() ,exec(), execl(),execv(), and wait()
5. **Socket System Calls**: 
	- e.g., socket(),bind(),connect(),listen(),accept(),send(), and recv()

**Note**: Other system calls include those used for message passing, shared memory, semaphores, and thread management.

# Libraries and System Calls

Many standard library functions are built on top of system calls.
- e.g., The `malloc()` family of functions is built on `mmap()` and `brk()`; `sleep()` is built  on a few time management system calls like `alarm()`, `fopen()`, `fread()`, `fwrite()`, and `fclose()` are built on `open()`, `read()`, `write()`, and `close()`.
- This is a common hierarchical relationship between library functions and system calls.
