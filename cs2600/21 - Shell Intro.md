# What is a Shell?

**Shell**: Takes input from the user in the form of commands, processes it, and then gives an output.
- Interface through which a user can work on the programs, commands, and scripts.
- Accessed by a terminal which runs it.
- While a kernel is the innermost part of an operating system, a shell is the outermost part.
	- Like a wrapper for the UNIX kernel, protecting it (hence, shell)
- Functionality:
	* Interactive use
	* Customization of your UNIX session
	* Programming
- Automatically executed when you log on and provides a CLI to the user.
- A program like any other.

> Basic Form of Shell:
> ```pseudocode
> while (read command) {
> 	parse command
> 	execute command
> }
> ```

# Shell Families

Two main shell families in UNIX:
1. The Bourne Shell: Prompt is `$`.
	- POSIX Bourne Shell: sh
		* `/bin/sh`
	- Korn Shell: ksh
		* `/bin/ksh`
	- Bourne Again Shell: bash
		* `/bin/bash`
2. C Shell: Prompt is `%`.
	- C Shell: csh
		* `/bin/csh`
	- Trusted C Shell: tcsh
		* `/bin/tcsh`

> **Note**: Z Shell (`zsh`) is inspired by both Korn shell and Trusted C Shell, and thus doesn't fit within a single shell family. 

# History

The original Bourne shell distributed with V7 Unix in 1979.
- Became the standard shell for writing shell scripts.
- Written by Steve Bourne
- Still to be found in /bin/sh on many commercial Unix systems.

Berkeley C shell (csh) offered features that were more pleasant for interactive use.
- Additional features:
	* Command history
	* Job control.
- For a long time the standard practice was to use the Bourne shell for programming and the C shell for daily use.

David Korn at Bell Labs enhanced the Bourne shell by adding csh-like features to it.
- Additional features:
	- History
	- Job control
	- Additional programmability.
- Eventually, the Korn shell’s feature set surpassed both the Bourne shell and the C shell, while remaining compatible with the Bourne shell for shell programming.

Today, the POSIX standard defines the “standard shell” language and behavior based on the System V Bourne shell, with a selected subset of features from the Korn shell.

The Free Software Foundation, in keeping with its goal to produce a complete Unix work-alike system, developed a clone of the Bourne shell written from scratch, the Bourne-Again Shell.
- Over time, Bash has become a POSIX-compliant version of the shell, with many additional features.
- A large part of these additional features overlap the features of the Korn shell, but Bash is not an exact clone of the Korn shell.

# Shell Source Code

| Shell                        | Location                                    |
|------------------------------|---------------------------------------------|
| Bash                         | ftp://ftp.gnu.org/gnu/bash                  |
| Bash source code patches     | ftp://ftp.gnu.org/gnu/bash/bash-3.0-patches |
| Ksh93                        | http://www.research.att.com/sw/download/    |
| The Z Shell                  | http://www.zsh.org                          |
| The Public Domain Korn Shell | http://web.cs.mun.ca/~michael/pdksh/        |
| Tcsh                         | http://www.tcsh.org                         |

# Common Features in Bash, Korn, and C Shells

| Symbol        | Description                                            |
|---------------|--------------------------------------------------------|
| `>`           | Redirect output.                                       |
| ``>>`         | Append to file.                                        |
| ``<`          | Redirect input.                                        |
| ``<<`         | “Here” document (redirect input).                      |
| `|`          | Pipe output.                                           |
| ``&`          | Run process in background.                             |
| ``;`          | Separate commands on same line.                        |
| ``~`          | Home directory symbol.                                 |
| ``*`          | Match any character(s) in filename.                    |
| ``?`          | Match single character in filename.                    |
| ``[ ]`        | Match any characters enclosed.                         |
| ``()`         | Execute in subshell.                                   |
| ``{ }`        | Expand elements in list.a                              |
| ``' '`        | Substitute output of enclosed command.                 |
| ``" "`        | Partial quote (allows variable and command expansion). |
| ``' '`        | Full quote (no expansion).                             |
| ``\`          | Quote following character.                             |
| ``$ var`      | Use value for variable.                                |
| ``$$`         | Process ID.                                            |
| ``$0`         | Command name.                                          |
| ``$ n`        | n th argument (0 ≤ n ≤ 9).                             |
| ``$*`         | All arguments as simple words.                         |
| ``#`          | Begin comment.                                         |

| Command    | Description                                               |
|------------|-----------------------------------------------------------|
| `bg`       | Background execution.                                     |
| `break`    | Break from loop statements.                               |
| `cd`       | Change directory.                                         |
| `continue` | Resume a program loop.                                    |
| `echo`     | Display output.                                           |
| `eval`     | Evaluate arguments.                                       |
| `exec`     | Execute a new shell.                                      |
| `fg`       | Foreground execution.                                     |
| `history`  | List previous commands.                                   |
| `jobs`     | Show active jobs.                                         |
| `kill`     | Terminate running jobs.                                   |
| `shift`    | Shift positional parameters.                              |
| `suspend`  | Suspend a foreground job (such as a shell created by su). |
| `time`     | Time a command.                                           |
| `umask`    | Set default file permissions for new files.               |
| `unset`    | Erase variable or function definitions.                   |
| `wait`     | Wait for a background job to finish.                      |

# Different Features in Bash, Korn, and C Shells

| bash               | ksh                | tcsh             | Meaning/action                                           |
|--------------------|--------------------|------------------|----------------------------------------------------------|
| `$`                | `$`                | `%`              | Prompt.                                                  |
| `>|`               | `>|`              | `>!`             | Force redirection.                                       |
|                    |                    | `>>!`            | Force append.                                            |
| `> file 2>&1`      | `> file 2>&1`      | `>& file`        | Combine stdout and stderr.                               |
| `>& file`          |                    | `>& file`        | Combine stdout and stderr.                               |
| `' '`              | `' '`              | `' '`            | Substitute output of enclosed command.                   |
| `$()`              | `$()`              |                  | Substitute output of enclosed command. (Preferred form.) |
| `$HOME`            | `$HOME`            | `$home`          | Home directory.                                          |
| `var = value`      | `var = value`      | `setvar=value`   | Variable assignment.                                     |
| `export var = val` | `export var = val` | `setenv var val` | Set environment variable.                                |
| `${ nn }`          | `${ nn }`          |                  | More than nine args can be referenced.                   |
| `"$@"`             | `"$@"`             |                  | All args as separate words.                              |
| `$#`               | `$#`               | `$#argv`         | Number of arguments.                                     |
| `$?`               | `$?`               | `$status`        | Exit status.                                             |
| `$!`               | `$!`               |                  | Last background Process ID.                              |
| `$-`               | `$-`               |                  | Current options.                                         |
| `. file`           | `. file`           | `source file`    | Read commands in file.                                   |
| `aliasx=y`         | `aliasx=y`         | `alias x y`      | Name $x$ stands for $y$.                                 |


| bash                  | ksh               | tcsh                | Meaning/action                             |
|-----------------------|-------------------|---------------------|--------------------------------------------|
| `cd ~-`               | `cd ~-`           | `popd/pushd`        | Switch directories.                        |
| `popd/pushd`          |                   | `popd/pushd`        | Switch directories.                        |
| `done`                | `done`            | `end`               | End a loop statement.                      |
| `esac`                | `esac`            | `endsw`             | End case or switch.                        |
| `exit [ n ]`          | `exit [ n ]`      | `exit [( expr )]`   | Exit with a status.                        |
| `for/do`              | `for/do`          | `foreach`           | Loop through values.                       |
| `echo -E`             | `print -r`        | `glob`              | Ignore echo escapes.                       |
| `hash`                | `alias -t`        | `hashstat`          | Display hashed commands (tracked aliases). |
| `hash cmds`           | `alias -t cmds`   | `rehash`            | Remember command locations.                |
| `hash -r`             | `PATH=$PATH`      | `unhash`            | Forget command locations.                  |
| `history`             | `history`         | `history`           | List previous commands.                    |
| `fc -s`               | `r`               | `!!`                | Redo previous command.                     |
| `fc -s str`           | `r str`           | `! str`             | Redo command that starts with str.         |
| `fc -s x = y [ cmd ]` | `r x = y [ cmd ]` | `! cmd :s/ x / y /` | Edit command, then execute.                |
| `if ((i==5))`         | `if ((i==5))`     | `if ($i==5)`        | Sample if statement.                       |
| `fi`                  | `fi`              | `endif`             | End if statement.                          |
| `ulimit`              | `ulimit`          | `limit`             | Set resource limits.                       |
| `pwd`                 | `pwd`             | `dirs`              | Print working directory.                   |
| `read`                | `read`            | `$<`                | Read from standard input.                  |
| `trap INTR`           | `trap INTR`       | `onintr`            | Ignore interrupts.                         |
| `unalias`             | `unalias`         | `unalias`           | Remove aliases.                            |
| `until`/`do`          | `until`/`do`      |                     | Begin until loop.                          |
| `while`/`do`          | `while`/`do`      | `while`             | Begin while loop.                          |

# Learning a Shell

- Invoking the shell
- Syntax
- Functions
- Variables
- Arithmetic expressions
- Command history
- Job control
- Command execution
- Restricted shells
- Built-in commands

# Shell Script

**Shell Script:** A regular text file that contains shell or UNIX commands.
- Useful for automating repetitive tasks and administrative tools and for storing commands for later execution.
- Needs execution permissions.
- Spawns a child process irrespective of the default shell.
	* The child process is a non-interactive shell that runs the commands in the shell script.

## Shebang (`#!`)

**Shebang**: Specifies shell to execute a program.
- Begins with `#!`.
- As the absolute path of shells can differ from system-to-system, it can be beneficial to use the `env` utility to search the `$PATH` environment variable for the location of a shell.
	* A bit overkill for Bash, but can be useful for other binaries like Python, which can be located in a wide variety of places.

> **Examples**
> - `#!/bin/sh`
> - `#!/bin/bash`
> - `#!/bin/csh`
> - `#!/usr/bin/tcsh`
> - `#!/usr/bin/env bash`

> **Recommended Extensions**
> - `.sh`: Bourne shell or Bourne Again Shell script
> - `.csh`: C shell script
> - `ksh`: Korn shell script
> 
> > **Remember**: File extensions don't matter in UNIX, but can be helpful for organization.

## Comments

The hash symbol (`#`) can be used to create comments.

> **Example**: 
> ```bash
> #!/usr/bin/env bash
> echo "Hello, world!" # This is a comment
> ```
