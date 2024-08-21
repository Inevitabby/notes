# History

Invented by David Korn of AT&T Bell Labs in the mid-1980s.
- Almost entirely upward compatible with Bourne shell.

# Variable Expression and Modifier

Variable expressions can be tested and modified by using special modifiers.

- `${variable:–word}`:
	- If variable is set and is nonnull, substitute its value;
	- Otherwise, substitute word.
- `${variable:=word}`:
	- If variable is not set or is null, set it to word; the value of variable is substituted permanently.
	- Positional parameters may not be assigned in this way.
- `${variable:+word}`:
	- If variable is set and is nonnull, substitute word;
	- Otherwise substitute nothing.
- `${variable:?word}`:
	- If variable is set and is nonnull, substitute its value;
	- Otherwise, print word and exit from the shell.

# Built-In Commands

- `set`: Print all variables, local and global.
- `env`: Print only global variables.
- `typeset`: Print all variables, integers, functions, and exported variables.
- `unset`: Undefines a non-readonly variable.

# `print`

Used instead of echo.
- Has more options.

| Option | Description                                                                      |
|--------|----------------------------------------------------------------------------------|
| `–`    | treat everything following `–` as an argument, even if it begins with `–`        |
| `–n`   | do not add ending newline to output                                              |
| `–p`   | redirect the given arguments to a co-process                                     |
| `–r`   | ignore \ escape conventions                                                      |
| `–R`   | ignore \ escape conventions; do not interpret – arguments as options (except –n) |
| `–s`   | redirect given arguments to history file                                         |
| `–un`  | redirect arguments to file descriptor `n`.                                       |

> **More on `-un`:**
> - If file descriptor is greater than 2, it must first be opened with exec.
> - If n is not specified, default file descriptor is 1 (standard output). 

# Functions

Besides the Bash way of declaring functions, Korn also supports another way to declare functions:

```bash
# Bash syntax for function declaration
my_function() { commands; }
# Korn alternative syntax
function my_function { commands; }
```

# Positional Parameters

Like Bourne, but with some C shell features.

- `$0`: References the name of the current shell script.
- `$1–$9`: Positional parameters 1–9.
- `${10}`: Positional parameter 10.
- `$#`: Evaluates to the number of positional parameters.
- `$*`: Evaluates to all the positional parameters.
- `$@`: Same as `$*`, except when double quoted.
- `"$*”`: Evaluates to "`$1` `$2` `$3`",etc.
- `"$@”`: Evaluates to "`$1`" "`$2`" "`$3`", etc.

# Test Operator (`[[ ]]`)

The Korn test command has additional operators and features over Bash.
- Wildcards can be used in string-matching tests

**String Operator Options:**

| Pattern             | Description                                    |
|---------------------|------------------------------------------------|
| `string == pattern` | string matches pattern                         |
| `string != pattern` | string does not match pattern                  |
| `string1 < string`  | ASCII value of string1 is less than string2    |
| `string1 > string`  | ASCII value of string1 is greater than string2 |
| `–z string`         | string is zero in length, null parameter       |
| `–n string`         | string is nonzero in length, nonnull parameter |

# `let` command and expression evaluation

`let` is a built-in command used to perform integer arithmetic.
- Replaces Bourne shell integer testing.
- Alternative way to use let is `(())`
	* `(())` doesn't require `$` before variable names.

**Example**: Using `let`
```ksh
$ i=5
$ let i=i+1
$ print $i
6
```

# `typeset`

`typeset`: Lets you assign variable types.

> **Example**: Using `typeset`
> ```ksh
> # Floating point number assignment to variable.
> typeset –F my_var
> ```

> **Note**: On floating-points
> Korn supports integer and floating-point arithmetic.
> - Floating-point arithmetic available only on versions newer than 1988.
