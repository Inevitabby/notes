# Eclipse Debugging

> **Note**: I don't use Eclipse, but might as well take notes.

- Double-click on a line to insert a breakpoint
- Click the debug icon to start the debugger
	* You will be prompted on whether you want to switch to the debugger perspective.

# Universal Terms

- **Step into** goes into the method and executes each piece step-by-step.
- **Step over** executes the method as one step.
- **Step return** runs the  remainder of the current method as one step.
- **Resume** leaves the debugger.
- **Line breakpoint** temporarily pauses execution at this line.

# Randomly Generating Integers in a Range

```java
// Random number between 1 and MAX
Random rand = new Random();
int x = rand.nextInt(MAX) + 1;
```

```java
// Random number between MIN and MAX
Random rand = new Random();
int x = **rand**.nextInt(MAX-MIN+1) + MIN;
```
