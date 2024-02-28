# `sed`

`sed`: Powerful UNIX filter that parses and transforms text using a simple, compact programming language.
- Etymology: [S]{.underline}tream-oriented, non-iterative, text [ed]{.underline}itor.
- Non-interactively modifies the lines in a line by using regular expressions.
- Used for text processing, especially with the substitution command.

> `sed` History:
> - Developed from 1973 — 1974 by Lee E. McMahon of Bell Labs.

## Architecture

**General Idea**:
1. Commands in a `sed` script are applied in order to each line.
	- Each line goes into pattern space, where it gets acted-on by the script.
2. If a command changes the input, subsequent commands will be applied to the modified line in the pattern space, not the original input line.
	- Remember: `sed` is a filter (the input file is unchanged).
3. Results are sent to `stdout`.

**Flow of Control**:
1. `sed` starts at the first line of the input file and runs it through the script file.
2. `sed` reads the next line of the input and restarts from the beginning of the script file.
3. etc...
- All commands in the script file are compare to, and potentially act, all lines in the input file. 

**When `sed` Copies a Line into Pattern Space...**:
1. If the [address]{.underline} of the command matches the line in the *pattern space*, the [command]{.underline} is applied to that line.
	- If a command changes the line in *pattern space*, subsequent commands operate on the modified line.
2. If the command has no address, [it is applied to every line]{.underline} as it enters *pattern space*. 
3. When all commands have been read, the line in *pattern space* is written to standard output and a new line is read into *pattern space*.

# `sed` Scripts

> **Format**: `[address[, address]][!]command [arguments]`

A **script** is a file of commands
- Each **command** consists of up to two *addresses* and an *action*.
- The *address* can be a regular expression or line number.

## Addressing

An **address** can be either a line number or a pattern, enclosed in slashes (`/pattern/`)
- A pattern is described using BREs (basic regular expressions).
- If no pattern is specified, the command will be applied to all lines of the input file.
	* To refer to the last line use (`$`)

Most command accept two addresses:
1. If one address is given, the command operates only on that line.
2. If two comma-separated addresses are given, then the command operates on the range of lines between the first and second address, inclusively.
	- e.g., `1,10` applies through lines 1—10 inclusively.

The `!` operator can be used to **negate** an address.
- e.g., `address!command` applies *command* to every line that doesn't match *address*.

## Commands

**Commands** are written as single letters.

> **Examples**: Using the `d`elete command
> 
> ```bash
> $ sed 'd' < file.txt
> ```
> - Delete all lines (print nothing)
> 
> ```bash
> $ sed '6d' < file.txt
> ```
> - Delete line 6 (print everything except line 6).

### Applying Multiple Commands to an Address (`{}`)

**Braces** (`{}`) can be used to apply multiple commands to an address.

> **Format**:
> ```
> [/pattern/[,/pattern/]] {
> 	command1
> 	command2
> 	...
> }
> ```

> **Syntax Notes**:
> - Opening brace (`{`) must be the *last character* on a line
> - Closing brace (`}`) must be on a *line by itself*
> - Spaces cannot follow the braces

# More on Commands

> **Tip**: Commands can be separated from the `[address]` by spaces for readability.
> - e.g., `sed '1,3p'`{.bash} and `sed '1,3 p'`{.bash} do the same thing

## Some Commands

### `d`: delete

> **Format**: `[address1][,address2]d`
- Deletes the addressed line(s) from pattern space, so they aren't passed to `stdout`.
	* After delete is run, `sed` moves onto the next line and begins applying commands from the top of the script again.

> **Example**: Using `d`elete
> ```bash
> $ sed '1,10d' < file.txt
> ```
> - Delete lines 1 through 10 (print `file.txt` without the first ten lines).

### `p`: print

> **Format**: `[address1][,address2]p`
- Prints the addressed line(s) line to `stdout`.
	* Leads to duplicated output of lines.
		- (unless `sed` is run with `-n` to suppress automatic printing of pattern space.)

> **Example**: Using `p`rint
> ```bash
> $ sed -n '1,10 p' < file.txt
> ```
> - Print lines 1 through 10.

### `s`: substitute

> **Format**: `[address(es)]s/pattern/replacement/[flags]`
> * `/`...`/`...`/`: Delimiters.
> * `pattern`: Search pattern.
> * `replacement`: Replacement string for `pattern`.
> * optional `flags`:
> 	+ `n`: Number between 1—512 indicating which occurrence of pattern should be replaced.
> 	+ `g`: Global, replace all occurrences of `pattern` in the pattern space.
>		- If `n` and `g` aren't set, then `sed` will only match the first occurrence of `pattern` per line (behaves like `-n1`).
> 	+ `p`: Print contents of pattern space.
- Substitutes a pattern with a replacement string.

> **Note on `s`ubstitution delimiters**: The `/` delimiter can be escaped with `\` if you want to use it literally in a pattern (e.g., `sed 's/\/usr\/local\/bin/\/common\/bin/’ < file.txt`),
> - Or, you could use any other character as a delimiter, it just has to show up thrice and be escaped if you want to use it literally.
> 	* e.g., `sed 's|github.com|codeberg.org|g' README.md`

> **Example**: Using `s`ubstitute
> ```bash
> $ echo "I love Linux" | sed 's|Linux|GNU/Linux|g'
> I love GNU/Linux
> ```
> - Replace first occurrence of "`Linux`" with "`GNU/Linux`" on every line.

### `a`: append

> **Format**: 
> ```
> [address]a\
> text
> ```
- Appends a line after the address.

> **Note**: append doesn't accept address ranges.

> **Example**: Using `a`ppend
> ```bash
> $ echo "Hello" | sed '/Hello/ a\World'
> Hello
> World
> ```
> - Appends "`World`" after every line containing "`Hello`"

### `i`: insert

> **Format**: 
> ```
> [address]i\
> text
> ```
- Insert a line before the address.

> **Note**: insert doesn't accept address ranges.

> **Example**: Using `i`nsert
> ```bash
> $ echo "World" | sed '/World/ i\Hello'
> Hello
> World
> ```
> - Inserts "`Hello`" before every line containing "`World`"

### `c`: change

> **Format**: 
> ```
> [address(es)]c\
> text
> ```
- Change current line with a new one.

> **Example**: Using `c`hange
> ```bash
> $ echo "REPLACEME" | sed '/REPLACEME/ c\bingus'
> bingus
> ```

### `y`: transform

> **Format**: `[address[,address]] y/<string1>/<string2>/`
- - `<string1>` and `<string2>`: Any character that matches a character in `string1` is translated into the corresponding character in `string2`.

Operates like `tr`. Does character-to-character translation. 
- Accepts zero, one, or two addresses.

> **Example**: Using transform (`y`)
> ```bash
> $ sed 'y/abc/xyz/'
> ```
> - Replaces every instance of `a` with `x`, `b` with `y`, and `c` with `z`
> 	* Functionally equivalent to `tr 'abc' 'xyz'`{.bash}

### `q`: quit

> **Format**: `[address]q`
- Terminates `sed`. No more input lines are read, nothing goes to `stdout`.
	* Can be used to save time when you only want to process some portion of the beginning of the file.

> **Note**: quit takes at most one address.

> **Example**: Using `q`uit
> ```bash
> sed '100 q' file.txt
> ```
> - Print first 100 lines of `file.txt` to `stdout`.

## Examples: Using `p`, `d`, and `!`

> **Examples**: Using the `d`elete command (more advanced)
> ```bash
> $ sed '11,$ d' < file.txt
> ```
> - Delete all lines between line 11 and last line (print the first 10 lines of a file).
> 
> ```bash
> $ sed '1,/^$/ d' < file.txt
> ```
> - Delete all lines between line 1 and the first blank line (`^$`) (print a mail message with the header chopped off).
> 	* Tip: `^$` means "start of line immediately followed by end of line", aka an empty line.
> 
> ```bash
> $ sed '/^$/' < file.txt
> ```
> - Delete empty lines (print non-empty lines).
> 
> ```bash
> $ sed '/^$/,$d' < file.txt
> ```
> - Deletes from the first blank line through the last line of the file
> 
> ```bash
> $ sed '/^$/,10d' < file.txt
> ```
> - Deletes from the first blank line through line 10
> 
> ```bash
> $ sed '/^ya*y/,/[0-9]$/d' < file.txt
> ```
> - Deletes from the first line that begins with `yay`, `yaay`, `yaaay`, etc. through the first line that ends with a digit.
<!--*-->

> **Examples**: Using the `p`rint command
> 
> ```bash
> $ sed 'p' < file.txt
> ```
> - Print every line in `file.txt` twice.
> 
> ```bash
> $ sed -n 'p' < file.txt
> ```
> - Print every line in `file.txt` once.
> 	* Remember: `-n` suppresses automatic printing of pattern space!
> 
> ```bash
> $ sed '/^$' < file.txt
> ```
> - Print every line in `file.txt`, printing double of every empty line. 
> 
> ```bash
> $ sed -n '1,10 p' < file.txt
> ```
> - Print lines 1 through 10.
> 
> ```bash
> $ sed -n '/^$/,$ p' < file.txt
> ```
> - Print lines from the first blank line to the last line of `file.txt`

> **Examples**: Reversing restrictions with `!`
> 
> ```bash
> $ sed -n '/match/ p' < file.txt
> ```
> - Acts like `grep` 
> 
> ```bash
> $ sed -n '/match/ !p' < file.txt
> ```
> - Acts like `grep -v` 
> 
> ```bash
> $ sed -n '1,10 p’ < file.txt
> $ sed -n '11,$ !p’ < file.txt
> $ sed '1,10 !d’ < file.txt
> $ sed '11,$ d' < file.txt
> ```
> - All four of these commands print the exact same thing!
> 	* This is to demonstrate how `p`rint and `d`elete are opposite functions.

## Examples: More on `s`ubstitution

> **Examples**: Using `s`ubstitution
> ```bash
> $ sed 's/one/ONE/g' < file.txt
> ```
> - Replace every occurrence of "`one`" with "`ONE`".
> 
> ```bash
> $ sed 's/false/true/g' < file.txt
> ```
> - Replace every occurrence of "`false`" with "`true`".

> **Example**: Behavior of `s`ubstitution (important!)
> 
> Suppose a file named `file.txt` with this content:
> ```txt
> one two three, one two three four
> three two one
> one hundred
> ```
> 
> If you ran `sed 's/one/ONE/' < file.txt`, the output would be:
> ```
> $ sed 's/one/ONE/' < file.txt
> ONE two three, one two three four
> three two ONE
> ONE hundred
> ```
> - Note how only the first instance of "`one`" gets affected on each line (if you want to apply substitution to all occurrences use the global flag)
> 	- Remember: Each line gets processed separately, and substitute defaults to substituting the first occurrence.
> 
> If you ran `sed 's/one/ONE/2' < file.txt`, the output would be:
> ```
> $ sed 's/one/ONE/2' < file.txt
> one two three, ONE two three four
> three two one
> one hundred
> ```
> - Note how only the second occurrence is modified.

> **Examples**: Using `s`ubstitution (cont.)
> 
> ```bash
> $ sed ‘s/nice/bazinga/’ < file.txt
> ```
> - Replace first occurrence of "`nice`" with "`bazinga`" on every line.
> 
> ```bash
> $ sed ‘s/Tom/Jerry/2’ < file.txt
> ```
> - Replace second occurrence of "`Tom`" with "`Jerry`" on every line.
> 
> ```bash
> $ sed -n ‘s/one/ONE/2 p’ < file.txt
> ```
> - Replace second occurrence of "`one`" with "`ONE`" on every line and print only modified lines (`p`).
> 
> ```bash
> $ sed '1,100 s/A/a/g’ < file.txt
> ```
> - Substitute all occurrences of "`A`" with "`a`" on lines 1 through 100.

## Examples: More on Reversing Restrictions (`!`)

> **Examples**: Using `!`
> ```bash
> $ cat file.txt
> The brown cow
> The black cow
> $ sed '/black/ !s/cow/horse/' < file.txt
> The brown horse
> The black cow
> ```
> - Substitute "`horse`" for "`cow`" on all lines that don't contain "`black`".
> 
> ```bash
> $ sed '1,5 !d' < file.txt
> ```
> - Delete all lines except 1 — 5 (print lines 1 through 5).

## Example: Using `a`ppend, `i`nsert, and `c`hange with `{}`

> **Example**: Using `a`ppend, `i`nsert, and `c`hange with curly braces (`{}`)
> $ cat file.txt
> That person looks pretty fishy.
> $ sed '/fishy/ {
> i\
> \nPonyo, Ponyo, Ponyo fishy in the sea
> a\
> who could you really be?
> c\
> Tiny little fishy,
> }' < file.txt
> 
> Ponyo, Ponyo, Ponyo fishy in the sea
> Tiny little fishy,
> who could you really be?

## Example: Using transform (`y`)

> **Example**: Using transform (`y`)
> ```bash
> $ echo "TESTING" | sed 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'
> testing
> ```
> - Transform uppercase to lowercase.
