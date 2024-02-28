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
<!--~~-->

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

## On Viewing Files

- `cat`: Concatenate and print to screen (ctrl-s and ctrl-q to stop/start)
- `head -x`: Display first $x$ lines of file
- `tail -x`: Display last $x$ lines of file
- `page`: Page file to the screen
- `more`: Display part of file to screen

> Note: `head` and `tail` both default to $x=10$

## On Misc.

- `history`: Prints command history.
- `touch`: Change file timestamps.
- `date`: Print date and time.
- `echo`: Display command line input to screen.
- `env`: Print all environment variables.

> **Tip**: You can use `!` to execute commands from history.
> ```bash
> # Execute 6000th command in history
> !6000
> # Execute previous command
> !!
> # Execute previous command that began with "echo"
> !echo
> ```
> - ... and much more

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
| `&`        | Run command in the backgound                               |
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
> $ cat >> file.txt
> Dave: Open the pod bay door, HAL.
> HAL: I'm sorry Dave. I'm afraid I can't do that.
> ^D
> ```
> - Appends some text to file.txt
