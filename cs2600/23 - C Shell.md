# History

- Created by Bill Joy at U.C. Berkeley in the late 1970s.
- Used as interactive login shell and a shell script command processor.
- Command language interpreter incorporating:
	* History
	* Job control
	* Interactive file name and username completion
	* C-like syntax

# Version

Two versions:
1. `/bin/csh`: The original BSD version of csh.
2. `/bin/tcsh`: An improved version of csh called tcsh.
	- On many systems csh is linked here.

# Login

When you login the shell is started in your home directory and commands are read from `.cshrc` and `.login` 

# Functionality

- `history`: Command to view command history.
- `alias` mechanism to make transformations on commands.
- `unalias` to unalias commands.
- `fg`, `bg`, and `^Z` work the same.
- `source` can be used to read commands into the current shell. 

# Command Line Arguments

**Special Variables:**
 - `$0`: Name of the script
 - `$1`, `$2`, `...`, `$9`, `${10}`, `${11}`, `...`: Parameter variables
 - `$*`: All parameters
 - `$#argv`: Number of arguments

- `$arv[1]`, `$arr[2]`, ...: Parameter variables
	* Note: Array subscripts start at 1 in C, not 0.
- `$argv[*]`: All arguments
- `$argv`: All arguments
- `$#argv`: Number of arguments
- `$argv[$#argv]`: Last argument

# Reading Input from User

`$<`: Reads a line from `stdin` up to but not including newline.
- You can split a string separated by spaces into an array with `set string=( $string )`

> **Example**
> ```csh
> #!/bin/csh
> echo "Name: "
> set name=$<
> echo Greetings, $name
> ```

# Basic Operators

| Operator  | Description             |
|-----------|-------------------------|
| ()        | Grouping                |
| !         | Logical note            |
| > >= < <= | Greater than, less than |
| ||          | Logical or              |
| && | Logical and           |
| =~ | String matches        |
| !~ | String does not match |

# Control Structures

```csh
if (expression) command
if (expression) command then
	command
endif
if (expression) command then
	command
else if (expression) then
else
	command
endif
```

**Example**
```csh
if ($#arv < 2) then
	echo "Too few arguments"
	exit
endif
```

# File Queries

- `-e file`: File merely exists (may be protected)
- `-r file`: File exists and is readable,
- `-w file`: File is writeable
- `-x file`: File is executable
- `-o file`: File is owned
- `-z file`: File has size 0
- `-f file`: File is an ordinary file
- `-d file`: File is a directory

# Arithmetic (`@`)

```csh
#!/bin/csh
if ( $#argv == 0 ) then
	echo -n "Enter time in minutes: "
	@ min = $<
else
	@ min = $1
endif
@ sec = $min * 60
echo “$min minutes is $sec seconds”
```

# Switch Case

```csh
#!/bin/csh -f
# Script name: colors
echo -n "Which color do you like? "
set color = $<
switch ("$color")
case bl*:
	echo I feel $color
	echo The sky is $color
	breaksw
case red:
	 # Is is red or is it yellow?
	case yellow:
	echo The sun is sometimes $color.
	breaksw
default:
	echo $color not one of the categories.
	breaksw
endsw
```

# Looping Constructs

Predetermined Iterations:
- `repeat`
	* Format: `repeat command number`
		+ Executes `command` `number` times.
	* Ex: `repeat 100 echo "Hello"`
- `foreach`
```csh
foreach name ( wordlist )
	commands
end
```
- wordlist: list of words, or multi-valued variable

Condition-based Iterations:
- `while`
```csh
while ( expression )
	commands
end
```
- use when number of iterations not known in advance

> **Example**: `foreach`
> ```csh
> set list = ( one two three )
> foreach word ( $list )
> 	echo $word
> end
> ```

> **Example**: `while`
> ```csh
> #! /bin/csh
> @ var = 5
> while ( $var > 0 )
> 	echo $var
> 	@ var --
> end
> ```

# Loop Control

- `break`
- `continue`

# Quoting

- Command Substitution: \`...\`
- Double Quotes: `"..."`
	* Prevent breakup of string into words.
	* Disabled most wildcard characters and the single quote.
		+ `$` keeps meaning
		+ `!` history references keep meaning
- Single Quotes: `'...'`
	* Escapes everything except `!`

# `eval`

`eval`: Evaluates string and executes the result.

**Example**
```csh
set x=23
set y=x
eval echo \$$y
```

# Debugging

```csh
% csh –n scriptname
```
- Parse commands but do not execute them

```csh
% csh –v scriptname
```
- Display each line of the script before execution

```csh
% csh –x scriptname
```
- Displays each line of the script after variable substitutions and before
execution

> **Note**: Flags can also be added to shebang
