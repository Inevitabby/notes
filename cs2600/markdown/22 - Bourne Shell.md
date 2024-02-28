# Bourne Shell

# Background

- Early Unix shell written by Steve Bourne of Bell Labs.
- Provided with many commercial versions of UNIX.
- Many system shell scripts are written for Bourne Shell.
- Long and successful history.
- Often substituted with Bourne Again Shell (bash).

# Functions

**Built-in Commands:**
- `trap`
- `set`
- `read`

**Redirection:**
- `<&`
- `>&`

**Programming Language:**
- `for`
- `case`
- `while`
- `if`

**Sequences**:
- `[...]`

**Variables:**
- `export`
- `readonly`

**Startup**:
- `.profile`

# User-Defined Variables

Variables don't have to be declared.
- Attempting to read an undeclared variable will result in an empty string with no warnings or errors.
- There must be no spaces around the `=` sign.
	* e.g., `VAR="Hello"` works, `VAR = "Hello"` doesn't work.

> **Example**
> ```bash
> #!/bin/sh
> my_message="Hello World"
> echo $my_message
> ```

# `read`

Lets you take input from `stdin`.

> **Example**
> ```bash
> #!/bin/sh
> echo What is your name?
> read name
> echo "Hello $name- hope you're well.”
> ```

# `export`

Lets you export the variable for it to be inherited by another program.
- Doesn't can passed back to your interactive shell.
	* To receive environment changes you need to `source` the script, which runs the script in your interactive shell instead of a non-interactive child shell.

> **Example**:
> ```bash
> $ source ./.profile
> ```

# Curly Braces for Variables

Using curly braces for variables is a common convention in UNIX.

| Form               | Meaning                                  |
|--------------------|------------------------------------------|
| `${variable?word}` | Complain if undefined                    |
| `${variable-word}` | Use new value if undefined               |
| `${variable+word}` | Opposite of the above                    |
| `${variable=word}` | Use new value if undefined, and redefine |

> **Note**: An empty string (`""`) counts as null.

> **Example**:
> ```bash
> $ d=`expr $d+1`
> ```
> - Generates error if `$d` isn't defined.
> 
> ```bash
> $ d=`expr ${d-0}+1`
> ```
> - Uses 0 if `$d` is defined.

# Undefine Variables

`unset`: Undefines variables.

> **Remember**: The shell evaluates the variables and then operates on the results.
> - e.g., Supposing `B` is undefined, then `A=$B`{.bash} and `A=`{.bash} are the exact same thing.

# Special Variables

- `$1`, `$2,` `...`, `$9`: Positional parameters.
	* Positional parameter variables are limited to numbers 1—9.
		+ The Bourne shell requires workarounds like `shift`, which shifts all the variables to the left.
- `$0`: Scriptname
- `$*`:  All positional parameters
- `$@`:  All positional parameters with spaces
- `$#`:  Number of parameters
- `$$`:  Current process ID
- `$!`:  ID of Background job
- `$?`:  error status
- `$`: Set variables

> **Note**: Limited range of positional parameters
> - `$10` is equivalent to the value of the first argument (`$1`) with a zero (`0`) at the end of it.
> 	* `${10}` doesn't work either (though `${10}` is supported in Bash and Korn).

> **Example**: Using `shift` to move positional parameters.
> 
> These two snippets assign the same positional variables to `arg*`:
> 1. 
> ```bash
> arg1=$1;shift;
> arg2=$1;shift;
> arg3=$1;shift;
> ```
> 
> 2. 
> ```bash
> arg1=$1
> arg2=$2
> arg3=$3
> ```

> **Example**: `$*`
> ```bash
> #!/bin/sh
> # usage: shift.sh `date`
> echo $*;shift;
> echo $*;shift;
> echo $*;shift;
> ```
> 
> ```bash
> $ ./shift.sh `date`
> Mon Jan 8 07:26:57 PM PST 2024
> Jan 8 07:26:57 PM PST 2024
> 8 07:26:57 PM PST 2024
> ```
<!--*-->

> **Example**: `$#`
> ```bash
> #!/bin/sh
> # usage: ./param_counter ...
> echo "Number of arguments are $6"
> ```
> 
> ```bash
> $ ./param_counter.sh 1 2 3 4 5 6
> Number of arguments are 6
> ```

# Debugging Bourne Shell Scripts

`-x`: Flag for the Bourne shell that echoes every command being ran.

**Ways to Turn it On:**
1. Inside the script you can use `set -x` and `set x` to toggle it in the script body.
2. Inside the script you can add it to the shebang (e.g., `#!/bin/sh -x`{.bash})
3. You can run add it at the command line (e.g., `$ -x ./script.sh`{.bash})

# `expr`

**Four Types of Operations `expr` Performs:**
1. Arithmetic
2. Logical
3. Relational
4. String

| Operator | Type       | Meaning                  |
|----------|------------|--------------------------|
| `+`      | Arithmetic | Addition                 |
| `-`      | Arithmetic | Subtraction              |
| `*`      | Arithmetic | Multiplication           |
| `/`      | Arithmetic | Division                 |
| `%`      | Arithmetic | Remainder                |
| `=`      | Relational | Equal to                 |
| `>`      | Relational | Greater Than             |
| `>=`     | Relational | Greater Than or Equal to |
| `<`      | Relational | Less Than                |
| `<=`     | Relational | Less than or Equal to    |
| `!=`     | Relational | Not Equal to             |
| `|`     | Boolean    | Or                       |
| `&`      | Boolean    | And                      |
| `:`      | String     | Match or substitute      |

> **Examples**: Using `expr`
> ```bash
> $ echo `expr 2 + 5`
> 7
> $ echo `expr length "cat"`
> 3
> $ echo `expr substr "donkey" 4 3`
> key
> $ echo `expr index "donkey" "key"`
> 4
> ```

# Flow Control Statements

**Control Structures**:
- `if` ... `then`
- `for` ... `in`
- `while`
	* Executes the given commands until the condition is true.
- `until`
	* Executes until a given condition becomes true.
		+ Opposite logic of while.
- `case`
- `break` and `continue`

**Three Ways to Group Commands**:
- A simple command
	* Collection of words separated by spaces
- A pipeline
	* Group of simple command separated by a `|` character.
	* Returns the exit status of the last command.
- A list
	* A series of pipelines, separated by `&`, `;`, `&&`, or `||`; terminated by a semicolon, ampersand, or newline character.

> **Example:** Grouping commands
> ```
> if list then list fi
> if list then list else list fi
> if list then list elif list then list fi
> if list then list elif list then list elif list then list fi
> if list then list elif list then list else list fi
> if list then list elif list then list elif list else list fi
> while list do list done
> until list do list done
> ```

> **Example**: Using `case`
> ```bash
> #!/bin/sh
> while read f
> do
> case $f in
> 	hello)
> 		echo English ;;
> 	howdy)
> 		echo American ;;
> 	gday)
> 		echo Australian ;;
> 	bonjour)
> 		echo French ;;
> 	"guten tag")
> 		echo German ;;
> 	*)
> 		echo Unknown Language: $f ;;
> esac
> done < myfile
> ```

## More on `test` Expressions

> **Format**: `[ expression ]`

`test` returns a zero exit code of the expression evaluates to true; a nonzero exit status otherwise.
- Is a built-in Bourne shell command

> **Example**
> ```bash
> #!/bin/sh
> a=10
> b=20
> if [ $a == $b ]
> then
> 	echo "a is equal to b"
> elif [ $a -gt $b ]
> then
> 	echo "a is greater than b"
> elif [ $a -lt $b ]
> then
> 	echo "a is less than b"
> else
> 	echo "None of the condition met”
> fi
> ```

## Functions

Use the `function` keyword, like so:
```bash
#!/bin/sh
function square {
	sq=`expr $1 \* $1`
	echo "Number to be squared is $1."
	echo "The result is $sq "
}
echo "Give me a number to square. "
read number
value_returned=`square $number`
echo $value_returned
```
