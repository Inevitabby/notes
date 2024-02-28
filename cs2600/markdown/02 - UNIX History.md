# Unix History

## History

**MULTICS**: Late 1960s, Bell Labs, MIT, and General Electric develop a time-sharing system called MULTICS (Multiplexed Information and Computing Service)
- Time-sharing: Allows multiple users to access a mainframe simultaneously

**Birth**: Ken Thompson, a computer scientist at Bell Laboratories made the first version of UNIX because MULTICS wasn't fast enough to run his video game, *"Space Wars"*.
- Chose "UNI" in opposition to "MULTI", highlighting the "do one thing well" philosophy.
- 1969: Bell Labs researchers led by Thompson and Ritchie, including Rudd Canaday developed a hierarchical file system, the concepts of computer processes and device files, a CLI, and some utility programs.
- First Version of UNIX:
	- Single-user, no networking, poor memory management, and/but,
	- Efficient, compact, and fast.

**Rewrite**: A few years later, Dennis Ritchie—a colleague—suggested rewriting UNIX in C, a language Dennis developed from the B language.
- Writing an operating system in C was unusual because many people believed that:
	1. A compiled language wouldn't be fast enough, and
	2. That operating systems should be written in machine language.

The rewrite was successful and made UNIX one of the first operating systems to have understandable source code.
- Most of the source code was C, only a small portion was in assembly.
	* Thus, porting was easy because only the small assembly language had to be rewritten for new machines as long as they had a C compiler.

Bell Laboratories used this prototype version of UNIX in its patent department, mainly for text processing.
- A lot of core UNIX utilities were made during this time (e.g., `nroff` and `troff`)

**Proliferation**: Bell Laboratories licensed UNIX source code to universities free of charge hoping that students would improve UNIX.
- Bell Laboratories did this because AT&T was prohibited from selling software due to antitrust regulations.
- Grad students at U.C. Berkeley made some major improvements like adding good memory management and networking capability.
	* The university marketed its own version of UNIX as BSD (Berkeley Standard Distribution) UNIX to the public.

**Unix Wars**: AT&T's Bell Laboratories UNIX eventually evolved into System V UNIX. 
- Leading computer manufacturers split into two groups:
	1. **UNIX International**: Led by AT&T and Sun, backed System V UNIX Release 4.
	2. **The Open Software Foundation**: Led by IBM, Digital Equipment Corporation, and Hewlett-Packard, backed OSF/1, a successor to BSD UNIX.
- Both groups tried to comply with standards set by the POSIX Committee and others.

**System V**: System V became the "apparent winner" of the UNIX Wars.
* The best features of BSD eventually made it into System V.
* List of System V-based UNIX versions that also have some BSD features:
	+ Solaris (Sun Microsystems)
	+ HP-UX (Hewlett-Packard)
	+ AIX (IBM)
	+ IRIX (Silicon Graphics, Inc.)

> **Abbreviated Early History of UNIX**:
> - UNICS: 1969, PDP-7 minicomputer
> - PDP-7 goes away, rewritten on PDP-11
> - V1: 1971
> - V3: 1973 (pipes, C language)
> - V6: 1976 (rewritten in C, base for BSD)
> - V7: 1979 (licensed, portable)

[//]: # (**Abbreviated Genealogy**:)
[//]: # (@startuml)
[//]: # ([Unix])
[//]: # ([BSD])
[//]: # ([System_V])
[//]: # ([Unix] --> [BSD])
[//]: # ([Unix] --> [System_V])
[//]: # ([System_V] --> [V2])
[//]: # ([V2] --> [V3])
[//]: # ([V2] --> [AIX])
[//]: # ([V2] --> [OSF1])
[//]: # ([V3] --> [V4])
[//]: # ([V4] --> [V4.1])
[//]: # ([V4.1] --> [Solaris])
[//]: # ([V4.1] --> [HP-UX])
[//]: # ([BSD] --> [4.2])
[//]: # ([4.2] --> [Apollo])
[//]: # ([4.2] --> [4.3])
[//]: # ([4.3] --> [Solaris])
[//]: # ([4.3] --> [HP-UX])
[//]: # (@enduml)

## Today

**Newer Versions**: Some companies still make and market their own versions of UNIX for their own hardware.
- While older UNIX versions are derived from System V or BSD, newer versions usually borrow from both.

**Linux**: An operating system that behaves a lot like UNIX and shares a lot of its philosophy.
- Shares no common code with UNIX and thus has no licensing restrictions.

**Apple's Darwin**: Based on BSD.

## The Open Source Movement

- Has fueled UNIX's growth and development
- Many vendors switching to Linux

