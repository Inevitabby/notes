# Terminal

## Terminal Emulation

**Terminal emulation** is negotiated between your client machine and the UNIX server.
- Your virtual terminal ID (e.g. `pts/0`) and **type** (e.g., `vt100`) are negotiated when you first connect and login.

## Some Environment Variables

- **$PATH**: Stores paths containing all the programs you can run.
	* e.g., `/home/inevitabby/.local/share/pnpm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/lib/llvm/16/bin:/usr/lib/llvm/15/bin:/etc/eselect/wine/bin:/opt/cuda/bin`
- **$TERM**: Stores login terminal type.
	* e.g., `xterm-256color`
- **$SHELL**: Stores path to current shell.
	* e.g., `/bin/zsh`

## Special Control Keys

- `<CTRL>c`: Interrupt
- `<CTRL>d`: Halt or EOF
- `<CTRL>g`: Bell
- `<CTRL>h`: Backspace
- `<CTRL>l`: Redraw screen 
- `<CTRL>u`: Kill line
- `<CTRL>w`: Kill word
- `<CTRL>z`: Suspend
- `<CTRL>s`: Stop the screen from scrolling
- `<CTRL>q`: Continue scrolling

## Shell and its Environment

**Shell**: User interface to the operating system.
- Program that runs on login.
- Functionality:
	* Execute other programs
	* Manage files and processes

Files can configure the environment upon login, e.g.,
- `~/.profile`: Bourne/Korn shells
- `~/.login`: C shell
- `~/.zshrc`: Zsh shell

> Things you can do with a shell:
> - Command history
> - Command line editing
> - File expansion (tab completion)
> - Command expansion
> - Key bindings
> - Spell correction
> - Job control
> - This:
> 
> > ```
> > $ cowsay -f bong "I love systems programming"
> >  ____________________________ 
> > < I love systems programming >
> >  ---------------------------- 
> >          \
> >           \
> >             ^__^ 
> >     _______/(oo)
> > /\/(       /(__)
> >    | W----|| |~|
> >    ||     || |~|  ~~
> >              |~|  ~
> >              |_| o
> >              |#|/
> >             _+#+_
> > ```
<!--~~__-->

## The UNIX Prompt

After you log in and the shell startup files have run, the shell will display a **prompt**.
- Different shells and systems have different **prompts**.
	* Most common are `$`, `#`, and `%`.
- Prompt can be changed with shell configuration files.
- A prompt and a cursor tells you that the system is ready for your commands.

# Your Home Directory

- `.`: Current **working** directory
- `..`: Parent directory
- `.login`: **login** script file (csh)
- `.profile`: **login** script file (sh/ksh)
- `.logout`: **logout** script file
- `.plan`: **finger** resource file
- `.cshrc`: **resource configuration** script file for C shell
- `.bashrc`: **resource configuration** script file for Bourne Again shell
- `.exrc`: **resource configuration** script file for vi

> Note: Hidden files begin with `.` and don't show up by default.

# Commands

## Standard Command Format

> **Format**: `command [options] <arguments>`
> - `[options]`: Modify how the command works
> 	- aka: Flags
> 	- Single letters prefixed with a dash (`-`)
> 	- Combined or separated
> 		* e.g., `-a -l` is the same as `-al`
> 	- Come before arguments
> - `<arguments>`: Define command scope.
> 	- Can be optional or mandatory
> 	- Some commands assume a default argument if none are given
> 	- Usually files or directories
> - Stuff in brackets is optional
> - Boldface words are literals (must be typed as is)

> **Note**: Commands are case-sensitive, and spaces must be inserted between commands, options, and arguments.

## Manual Pages (`man`)

> **Format**: `man <command>`\
> **Format**: `man -k <keyword>`

**`man`**: Utility to display the manual page for a shell command, system program, library function, etc.
- Format:
	1. Name
	2. Synopsis
	3. Description (options, defaults, descriptions, examples)
	4. Files
	5. See Also
	6. Bugs
- Common Keymaps:
	* `<space>`: Move forward a page
	* `b`: Move backwards a page
	* `/`: Begin search
	* `n`: See next search result
	* `N`: See previous search result
	* `h`: More commands
	* `q`: Quit.

<!--
- Manual page sections are typically divided into the following topics:
	1. Commands and application programs
	2. System calls
	3. Library functions
	4. Special files
	5. File formats and conventions
	6. Games
	7. Miscellaneous
	8. System administration utilities
	9. Kernel routines (non-standard)
-->

## Set Terminal Type (`stty`)

`stty`: Command to [s]{.underline}et [t]{.underline}erminal [ty]{.underline}pe options.
- Lets you show or change terminal characteristics.

> Examples:
> ```bash
> # List all terminal settings
> stty -a
> # Make the erase key <Ctrl>h
> stty erase ^h
> ```

# More Commands

## On User Information

- `who`: Prints who is logged on, when and where
	* `who am i`: Identifies your username and terminal ID.
		+ rel: `who mom likes`
- `finger`: Prints more login information than `who`
- `uname`: Print name of operating system
- `id`: Displays user id and all group names and ids.

## On Communicating with Others 

- `write`: One-way messaging.
- `talk`: Interactive messaging
- `mail`: Simple and old email program
- `mailx`: Improved `mail`

## On Manipulating Files and Directories

- `ls`: Lists files in a directory
- `rm`: Removes files and directories
- `cp`: Copies files and directories
- `mv`: Moves/renames files (and directories)
- `cd`: Changes directories
- `mkdir`: Make empty directories
- `rmdir`: Remove empty directory
- `pwd`: Display name of present working directory:
- `file`: Display file type
- `du`: Display disk usage
- `df`: Display free disk space
- `wc`: Count lines, word, and bytes in a file
- `which`: Looks for an executable in your `$PATH`
- `ln`: Create a link
- `sort`: Sort lines of text files
- `uniq`: List unique items.
- `find`: Find files.
- `diff`: Compare lines among files
- `cmp`: Test two files for equality, returning location of first differing byte.
	* Faster than diff, usually used on binary files.
- `comm`: Reads two already-sorted files and outputs three columns:
	1. Lines in first file only
	2. Lines in second file only
	3. Lines in both files

> **More on `ls` (list files in a directory)**:\
> 
> > **Format**: `ls [-alRF...] <file-list>`
> - `-a`: List all files including the dot (hidden) files
> - `-l`: Long format (show file type, permissions, links, owner, etc)
> - `-R`: Recursively list subdirectories
> - `-F`: List directories with file type

> **More on `cp` (copying files)**:\
> 
> > **Format**: `cp [-ir...] <file1> <file2>`\
> > **Format**: `cp [-ir...] <file-list> <directory`>\
> > **Format**: `cp [-ir...] <directory> <directory>`
> - `-i`: Interactive, prompt whenever a file will be overwritten
> - `-r`: Recursive, copy a whole directory tree
> 
> > **Examples**:
> > ```bash
> > # Change directory to parent
> > cd ..
> > # Change directory to current working directory
> > cd .
> > ```

> **More on `mv` (moving/renaming files and directories)**:\
> 
> > **Format**: `mv [-i...] <file1> <file2>`\
> > **Format**: `mv [-i...] <file-list> <directory>`\
> > **Format**: `mv [-i...] <directory> <directory>`

> **More on `rm` (deleting files)**\
> 
> > **Format**: `rm <file-list>`\
> > **Format**: `rm -r <directory>`\
> > **Format**: `rm i <file>`

> **More on `file` (display file type)**\
> 
> > **Example**:
> > ```bash
> > # Determine file type
> > file *
> > ```

## On Viewing Files

- `cat`: Concatenate and print to screen (`<CTRL>s` and `<CTRL>q` to stop/start)
- `head -x`: Display first $x$ lines of file
- `tail -x`: Display last $x$ lines of file
- `page`: Page file to the screen
- `more`: Display part of file to screen

> Note: `head` and `tail` both default to $x=10$

## On Misc.

- `history`: Prints command history.
- `touch`: Update file timestamps (creates empty file if it doesn't exist).
- `date`: Print date and time.
- `echo`: Display command line input to screen.
- `env`: Print all environment variables.
- `clear`: Clears the terminal
- `cal`: Prints calendar for any year and month.
- `bc`: A calculator
- `xargs`: Run each line of input as an argument to a specified command

> **Tip**: You can use `!` to execute commands from history.
> ```bash
> # Execute 6,000th command in history
> !6000
> # Execute previous command
> !!
> # Execute previous command that began with "echo"
> !echo
> ```
> - ... and much more

> **`bc` Features:**
> - Arithmetic operators
> - Increment/decrement operators
> - Assignment operators
> - Comparison or relational operators
> - Logical or boolean operators
> - Math functions
> - Conditional statements
> - Iterative statements
>
> > **Example**:
> > ```bash
> > $ echo "10-5" | bc
> > 5
> > ```

> **Example**: Using `xargs`
> ```bash
> # Remove all pdf files in /tmp
> find /tmp -name "*.pdf" | xargs rm
> # Print disk usage of man utility
> which man | xargs du
> ```

## `tar`

> **Format**: `tar [-cxzvf...] <archive> <file>`\

`tar`: Utility to creates a tape archive and can also compress with gzip.
- Flags:
	* `-c`: Create an archive
	* `-x`: Extract an archive (untar)
	* `-z`: Compress the archive with gzip
	* `-v`: Display progress in the terminal (verbose mode)
	* `-f`: Specify filename of the archive

> **Example**: Creating a compressed archive of your home directory
> ```bash
> $ tar -czvf archive.tar.gz ~
> ```

# Process Subsystem Utilities

- `ps`: Monitors status of processes
- `kill`: Send a signal to a pid
- `wait`: Parent process wait for one of its children to terminate
- `nohup`: Makes a command immune to the hangup and terminate signal
- `sleep`: Sleep in seconds
- `nice`: Run processes at low priority

> **Example**: Using `ps`
> ```bash
> $ ps
>   PID TTY          TIME CMD
>  2937 pts/13   00:00:00 zsh
>  2949 pts/13   00:00:00 zsh
>  2950 pts/13   00:00:00 zsh
>  2959 pts/13   00:00:00 gitstatusd-linu
>  2993 pts/13   00:00:00 sleep
>  5314 pts/13   00:00:00 ps
>  5315 pts/13   00:00:00 xsel
> $ kill 2937
> $ ps
>   PID TTY          TIME CMD
>  2949 pts/13   00:00:00 zsh
>  2950 pts/13   00:00:00 zsh
>  2959 pts/13   00:00:00 gitstatusd-linu
>  2993 pts/13   00:00:00 sleep
>  5314 pts/13   00:00:00 ps
>  5315 pts/13   00:00:00 xsel
> ```

> **`kill` signals**:\
> - `1`: HUP (hang up)
> - `2`: INT (interrupt)
> - `3`: QUIT
> - `6`: ABRT (abort)
> - `9`: KILL (non-catchable, non-ignorable)
> - `14`: ALRM (alarm clock)
> - `15`: TERM (software termination)

# Sending Processes to the Background

**Method 1. Ampersand (`&`)**:

Add an ampersand (`&`) to the end of a command to make it run in the background.

> **Example**:
> ```bash
> sleep 1h &
> ```

**Method 2. `bg` and `fg`**:

If you have a process in the foreground you'd like to send to the background, *suspend* it with `<Ctrl>z`.

Then, run `bg` to continue the process in the background.
- Run `fg` to send the process back to the foreground.

# Shell Metacharacters

| Symbol   | Meaning                                                    |
|----------|------------------------------------------------------------|
| `>`      | Output redirection (overwrite)                             |
| `>>`       | Output redirection (append)                                |
| `<`        | Input redirection                                          |
| `*`        | File substitution wildcard, zero or more characters        |
| `?`        | File substitution wildcard, one character                  |
| `[]`       | File substitution wildcard, any character between brackets |
| `cmd`      | Command substitution                                       |
| `$(cmd)`  | Command substitution                                       |
| `|`        | The pipe                                                   |
| `;`        | Command sequence                                           |
| `||`     | OR conditional                                             |
| `&&`       | AND conditional                                            |
| `()`       | Group commands                                             |
| `&`        | Run command in the background                              |
| `#`        | Comment                                                    |
| `$`        | Expand value of variable                                   |
| `\`        | Prevent or escape interpretation of next character         |
| `<<`       | Input direction                                            |

> **Examples**: Output redirection
> 
> ```bash
> $ echo "hi" > file.txt
> ```
> - Stores "hi" in file.txt
> 
> ```bash
> $ date -u > file.txt
> ```
> - Stores current date (UTC) in file.txt
> 
> ```bash
> $ cat >> file.txt
> Dave: Open the pod bay door, HAL.
> HAL: I'm sorry Dave. I'm afraid I can't do that.
> ^D
> ```
> - Appends some text to file.txt

> **Example**: Input redirection
> 
> ```bash
> cat < file.txt
> ```
> - Prints contents of file.txt by running `cat` and using the contents of `file.txt` as `stdin`.
>	- You could also use `cat file.txt` since `cat` accept files as arguments, not just `stdin`, but this is an example of the `<` character.

> Examples: File substitution wildcards
> 
> ```bash
> $ ls –l foo*
> ```
> - List all files that begin with the word "foo" followed by anything else
>	- e.g., "foo", "foo1", and "foo.txt" will be listed, but not "bar.txt".
> 
> ```bash
> $ ls –l foo?
> ```
> - List all files that begin with the word "foo" followed by any single character
>	- In other words, it lists all files that begin with "foo" and are 4 characters long.
>		- e.g., "foo1" will be listed, but not "foo.txt".
> 
> ```bash
> $ ls –l foo[1-3]
> ```
> - List all files that begin with the word "foo" followed by any single character between number 1 and 3 (inclusive)
>	- The `-` is specifying range.
>	- e.g., "foo1" and "foo2" will be listed, but not "foo4".
> 
> ```bash
> $ ls –l foo[23]
> ```
> - List all files that begin with the word "foo" followed by any single character which is either 2 or 3
>	- The `[]` without a range means exclusive or.
>	- e.g., "foo2" and "foo3" will be listed, but not "foo1".
> 
> ```bash
> $ ls [!f-z]???
> ```
> - List all files that begin with the characters a through e and followed by any three characters
>	- The `!` is a negation, meaning that we're matching everything that's not between f and z/

## On Escaping Metacharacters

> **Warning**: Forgetting to escape certain metacharacters can have disastrous results (e.g., accidentally expanding a `*` in a `rm` command)
> - Which is why we double-quote a variable references whenever possible.

There are three ways to pass metacharacters without interpreting them:
1. **Backslash** (`\`): Put a backslash in front of them.
	- Can get a little inconvenient if you have a lot of metacharacters to escape.
2. **Single Quotes** (`''`): Surround a string with single quotes to protect all characters except the backslash
3. **Double Quotes** (`""`): Surround a string with double quotes to protect all characters except the backslash, dollar sign, and grave accent.

> **Remember**: The difference between single and double quotes is that we can do expansion with $ and \` in double quotes.

> **Example**: Escaping metacharacters in three different ways
> ```bash
> $ echo 5 \> 3
> 5 > 3
> ```
> 
> ```bash
> $ echo '`date`'
> `date`
> ```
> 
> ```bash
> $ echo "`date`"
> Thu Dec 28 04:16:54 PM PST 2023
> ```

## On Variable Expansion

> **Remember**: You can view environmental variables with `env`

You can expand the value of variables with `$`.

> **Example**: Variable expansion
> ```bash
> $ echo $TERM
> xterm-256color
> ```
> 
> ```bash
> $ my_variable="hello" && echo $my_variable
> hello
> ```

## On Command Sequences

Two ways to control the order commands are executed:\
1. **Semicolon** (`;`): Executes left-to-right, e.g.,
```bash
$ date; pwd; ls
```
2. **Parenthesis** (`()`): Groups commands together, e.g.,
```bash
$ (date; pwd; ls) > out.txt
```

## On Conditional Execution

We can use the exit codes of commands to conditionally execute other commands.

> **Examples**: Conditional execution
> ```bash
> $ gcc hello.c && ./a.out
> ```
> - Run compiled code only if compilation was successful.
> 
> ```bash
> $ gcc hello.c || notify-send "Compilation failed"
> ```
> - Send notification only if gcc fails.

## On Command Substitution

&#96;`command`&#96; and `$(command)` gets replaced by the output of `command` in the prompt.

> **Example**: Command substitution
> 
> ```bash
> $ echo `date`
> Thu Dec 28 01:31:19 PM PST 2023
> ``` 
> 
> ```bash
> $ echo date # Same as above, but without command substitution
> date
> ```

# A Simple UNIX Trick

Running `^x^y` in the terminal will run the previous command with all instances of `x` replaced with `y`.
- Doesn't have to be single characters.

```bash
$ ly
Command not found
```
```bash
$ ^y^s
foo.txt bar.txt
```

# Auto Completion in Shells

Most shells can complete a filename, command name, username, or shell variable based on what you've typed when you hit the `<TAB>` key.
- If nothing appears, hitting `<TAB>` a second time will show a list of possible completions.

# Understanding Links

**Directories** are lists of files and directories.
- Each directory links to a file on the disk.
	* Two directories can link to the same file.
- Moving files doesn't actually move data, it just does the following:
	1. Creates link in a new location
	2. Delete link in old location.
- Each file has a link count.

## Hard v.s. Soft Links

| Hard Links                                      | Soft Link (Symbolic Link)                                     |
| ---                                             | ---                                                           |
| Target must exist                               | Target can exist or not exist                                 |
| Allowed within one file systems only            | Allowed between different file systems                        |
| Links directly to the place the file is stored  | Links to the entry in the file system table (node)            |
| Removing the link means removing the whole file | Removing the link only removes the node, not the file itself. |

> **On Soft Links:** Soft links can be thought of as directory entries that merely point to the name of another file.
> - Soft links don't contribute to the link count.
> - Soft links also work on directories, unlike hard links. 

> **Example**: Creating soft link with `ln` (making `vi` links to `nvim`)
> ```bash
> $ ln -s /usr/bin/vi /usr/bin/nvim
> ```
