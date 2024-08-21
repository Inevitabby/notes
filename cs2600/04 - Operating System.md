# The Operating System

**Operating System**: Lets computers share peripherals and memory, communicate, and run more than one program.
- "The government of your computer"

**Kernel**: Performs critical system functions and interacts with the hardware.
- Connects system hardware to application software
	* Coordinates all programs running on the computer
	* Interfaces between applications and actual data processing at the hardware level.
- Manages computer resources
	* e.g., Peripherals, files, memory, etc.
- Loaded into memory during the boot process, and always stays in physical memory.

**Systems Utilities**: Programs and libraries that provide various functions through systems calls to the kernel.

# More on the Kernel

## Main Kernel Tasks

1. **Resource Allocation**: Share limited resources among competing processes.
	- Shares CPU, memory, and I/O devices
2. **Process Management**: Allow execution of applications and support them with features like hardware abstraction.
	- **Process**: Defines which memory portions an application can access
3. **Memory Management**: Allow processes to safely access system's memory.
	- Kernel has full access to the system's memory.
	- **Virtual Addressing**: Helps kernel create virtual partitions of memory in two disjointed areas:
		1. **User Space**: Reserved for applications
		2. **Kernel Space**: Reserved for the kernel
4. **I/O Device Management**: Give processes access to peripherals connected to the computer.
	- **Device Drivers**: Program that enables operating system to interact with a hardware device.
		* Provides how to control and communicate with a certain piece of hardware.
5. **Inter-Process Communication**: Provides methods for synchronization and communication between processes (IPC).
	- Various methods of IPC: Semaphore, shared memory, message queue, pipe, named FIFO, etc.
6. **Scheduling**: Gives every program a slice of time and rapidly switches from process-to-process to make it seem like they are being executed simultaneously.
	- **Scheduling Algorithms**: Algorithms which determine what process to run next and how much time it should be given. Sets **priority** among processes.
7. **System Calls and Interrupt Handling**: 
	- **System Call**: Mechanism used by an application to request a service from the operating system.
		* e.g., close, open, read, wait, write
	- Most kernels provide a C library or API to invoke their kernel functions.
8. **Security of Protection Management**: Provides protection from faults (**error control**) and from malicious behaviors (**security**)
	- **Language based protection system**: One approach to security/protection management, in which the kernel will only execute code produced by a trusted compiler.

## Kernel Subsystems

1. Process Management
	- Schedules processes to run on CPU
	- Inter-process communication (IPC)
2. Memory Management
	- Virtual memory
	- Paging and swapping
3. I/O System
	- File system
	- Device drivers
	- Buffer cache

## System Calls

**System Calls**: Set of functions provided to other programs to interface with the kernel.
- Used to request access to the resources of the machine, communicate with other programs, start new programs, etc.
- Grouped by families based on function
	* e.g., Memory management, time management, process management, ...

> **Note**: Standards and programming languages\
> Over the years, standards have been developed to standardize some system calls across UNIX versions, like the ones set by the POSIX committee.
> - Many programming languages' standard library functions use system calls as part of their code.
	* e.g., C's `malloc()` function actually uses the `mmap()` and `brk()` system calls behind the scenes.


> Note: The standard C library provides a portion of the system call interface for many versions of UNIX and Linux.

### UNIX System Calls

**Kernel API**: Interface to the kernel.
- Over 1k system calls available on Linux.

**Five Categories of System Calls**:
1. **File Management**
	- e.g., `mkdir()`, `open()`, `read()`
2. **Process Control**
	- e.g., `fork()`, `exit()`, `nice()`
3. **Information Management**
	- e.g., `getuid()`, `time()`, `alarm()`, `sleep()`
4. **Device Management**
	- e.g., `ioctl()`, `read()`, `write()`
5. **Communication**
	- e.g., `pipe()`, `shmget()`, `mmap()`

# UNIX Structural Layout

1. User Space
2. Kernel
3. Devices

