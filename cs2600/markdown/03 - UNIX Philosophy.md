# Unix Philosophy

## Philosophy

**Small is Beautiful**:
- Easy to understand
- Easy to maintain
- More efficient
- Better for reuse

**Utilities**: "A program should do one thing, it should do it well, and complex tasks should be performed by using these utilities together."
- **Pipe**: Allows user to use output of one process as input for another.
	* Core feature of UNIX because it allows for the construction of data "pipelines"

```bash
# Example of a data pipeline:
print $(who | awk '{print $1}' | sort | uniq) | sed 's| |, |g'
```

**Portability > Efficiency**:
- The most-efficient implementation is rarely portable
- Portability is better for rapidly-changing hardware

**Use Flat ASCII Files**:
- Common, simple file format ("yesterday's XML")
- Example of portability over efficiency

**Reusable Code**:
- "Good programmers write good code. Great programmers borrow good code."

**Avoid Captive Interfaces**:
- The user isn't always human.
- Good interface can have big and ugly code.
- Problems with scale

**Silence is Golden**:
- Only report if something is wrong

**Think Hierarchically**:
- e.g., Hierarchical directory structure

**Problem-Solving**:
1. Use pipes and existing utilities to solve the problem; otherwise
2. Ask others if they know how to solve the problem; otherwise
3. Write (and share) some utilities to solve the problem; otherwise
4. Write a program to solve the problem.

**Superuser**:
- A **superuser** can access data or code anywhere on the system.
- This feature is bad for security, so some versions of UNIX replace superusers with "slightly super" users.

## UNIX Contributions

UNIX features (e.g., parallel processing, IPC, file handling) are easily accessible with C via system calls.
- **System Calls**: A set of library routines.

## Standards

UNIX is written mostly in C, making it easy to port to different hardware platforms.

The many branches of UNIX try to conform to standards set by the POSIX Committee and others.
- **POSIX**: Portable Operating System Interface
