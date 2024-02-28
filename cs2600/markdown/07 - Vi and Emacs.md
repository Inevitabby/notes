# UNIX Editors

**Text Editor**: Program that lets you create and test in a computer file.
- Not the same thing as a word processor.
- Often come with learning curves.

Standard text editors available on most UNIX systems:
- `ed`: Standard line editor
- `ex`: Extended line editor
- `vi/vim`: Visual editor
- `sed`: Non-interactive stream editor for batch processing of files

Popular editors available on most UNIX platforms:
- `emacs`: Editor with many other capabilities, or vice versa.
- `nedit`: GUI-style text editor similar to emacs
- `pico/nano`: Easy beginner editor

> **History**: `vi`
> - `ed` was the first editor used by Thompson and Ritchie for many years.
> - George Coulouris developed an improved version of `ed` on UNIX and called it `em`.
> - `vi` was developed in 1976 by Bill Joy, a graduate student at UC Berkeley, from the `em`.
> - `em` was improved-upon by Bill Joy and called `ex` (extended ed) and included with the first release of BSD in 1978.
> - Second release of BSD in 1979 introduced an executable called `vi` that did little more than open `ex` in visual mode.

> **History/Overview**: `vim`
> 
> `vim`: "Vi Improved" (originally "Vi Imitation")
> - Written by Bram Moolenaar, a Dutch software engineer.
> - According to Stack Overflow's 2018 Developer Survey, Vim is the most-popular terminal editor, used by 25.8% of all software developers and 40% of Sysadmin/DevOps people.
> 
> Extended (from `vi`) features:
> - Ported to more OS's
> - Support for syntax highlighting, code folding, etc. for several popular programming languages 
> - Integrates with `cscope`
> - Multilevel undo/redo
> - Screen splits
> - Edit files inside compressed archives
> - Built-in diff (`vimdiff`)
> - Support for plugins and finder control over configuration and startup files
> - Can be scripted with Vimscript.

> **History/Overview**: `emacs`
> 
> **EMACS (Editor MACroS)**: Family of text editors characterized by their extensibility.
> - **GNU Emacs**: "The extensible, customizable, self-documenting, real-time display editor"
> 	- The post popular version of EMACS.
> 	- Created by Richard Stallman for the GNU Project.
> - **XEmacs**: Variant that branched form GNU Emacs in 1991.
> - Written in C and a dialect of LISP for commands and extensions.
> - Original EMACS written in 1976 by Carl Mikkelsen, David A. Moon, and Guy L. Steele Jr.
> - Among the oldest free and open source projects still under development.

> **Note**: Emacs and vi are the two main contenders in the editor wars of UNIX culture.

# `vi`/`vim`: The Standard Editor

`vi` supplies command for:
- Inserting and deleting text.
- Replacing text.
- Moving around the file
- Finding and substituting strings
- Cutting and pasting text
- Reading and writing to other files.

`vi` uses a buffer. Edited files exist in a temporary buffer in memory, which you can write to a new or existing file, or not write at all.

`vi` operates in different modes, which can be entered in various ways:
1. **Command Mode**:
	- Used for navigating through the file
	- Everything typed is interpreted as a command
	- Default mode
	- `i` enters insert mode
	- `:` to enter a command (`<CR>` to submit command)
		* `w` to write
		* `q` to quit
		* `<cmd>!` to force
		* `tutor` to open vimtutor
		* `h <query>` for help
		* `s` to substitute
		* `!<cmd>` to run `<cmd>` in the shell
2. **Insert Mode**:
	- Used of inserting text
	- Everything typed is inserted
	- `<Esc>` returns to command mode

> **Example**: Opening/creating a file for editing
> ```bash
> vi filename
> ```

<center>
[![Diagram demonstrating Vim movement commands](.images/vim-shortcuts.png)](.images/vim-shortcuts.png "Vim Movement Commands")
*Source: [@LevelbossMike/vim_shortcut_wallpaper](https://github.com/LevelbossMike/vim_shortcut_wallpaper)*
</center>

> **Note**: The power of Vim is when motions become natural (like touch-typing), allowing you to create and use Vim motions without much thought or memorization. It's a steep learning curve, but you don't have to learn everything to become a fast typist.

**Basic Movement**:
- `h`/`l`: Left/Right
- `j`/`k`: Down/Up

**Basic Commands**:
- `r`: Replace
- `x`: Delete
- `u`: Undo
- `<CTRL>r`: Redo
- `y`: Yank
- `p`: Paste
- `.`: Repeat last change.
- `=`: Format

> **Note**: There are lots of commands that start with `g` or `z` that you might come across. However, `g` and `z` aren't actually a basic command like `x` or `p`, they're just a prefix because there are only so many keys on the keyboard.
> - `g` *does* have a mnemonic meaning, though: "goto"
>	- e.g., `gd` to goto definition of a variable or function

**Search**:
- `/[pattern]`: Search forward for pattern.
- `?[pattern]`: Search backward for pattern.
- `n`: Next instance
- `N`: Previous instance

**Basic Vim Motions**: `{OPERATOR}{COUNT}{MOTION}`
- e.g., `d2w` to delete two words, `d5j` to delete file lines down, etc.

**Text Object Vim Motions**: `{OPERATOR}{A|I}{TEXT-OBJECT}`
- e.g., `daw` to delete a word, `ci"` to change in-between double quotes, etc.
- **Default Text Objects**:
	* `w`: Word
	* `s`: Sentence
	* `'`, `",` \`: Quotes
	* `p`: Paragraph
	* `b`, `(,` `):` Block surrounded by ()
	* `B`, `{,` `}:` Block surrounded by {}
	* `<,` `>:` Block surrounded by <>
	* `[,` `]:` Block surrounded by []
	* `t`: Tag (like HTML tags)

**Learning Vim**:
1. Built-in `:vimtutor`.
2. Cheat sheets, videos, etc.
3. Practice.
	- Gradually learn things only as needed (e.g., marks, registers, macros, substitution, splits) 

> **Special Marks (advanced, but helpfiul)**:
> 
> | Command     | Description                                                   |
> |-------------|---------------------------------------------------------------|
> | `'.`        | jump to position where last change occurred in current buffer |
> | `'"`        | jump to position where last exited current buffer             |
> | `'0`        | jump to position in last file edited (when exited Vim)        |
> | `'1`        | like `'0` but the previous file (also `'2` etc)               |
> | `''`        | jump back (to line in current buffer where jumped from)       |
> | `''`        | jump back (to position in current buffer where jumped from)   |
> | `'[` / `']` | jump to beginning/end of previously changed or yanked text    |
> | `'<` / `'>` | jump to beginning/end of last visual selection                |

**Resource Configuration File**: The resource configuration file for `vi` is `~/.exrc`

# Emacs

- Any character typed in Emacs is automatically inserted into the file unless it includes a command prefix.
- Many of the command are bound to key combinations, prefaced with the `<CTRL>` and `<META>` keys.
	* Commands are either:
		1. Control characters (hold down `<CTRL>` while typing other characters), or
		2. Are prefixed by one of a set of reserved characters (e.g., `<ESC>` or `<CTRL>x`)
- Emacs window can be divided into several windows, each of which contains a view into a buffer.

> **Example**: Opening/creating a file for editing
> ```bash
> emacs filename
> ```

## Modes in Emacs

Modes are the methods by which Emacs features are expressed in the context of specific types of content.
- For example, indentation behavior in a C source code file is different to HTML or a simple txt file.

Two types of modes:
1. **Major**: 
	- Emacs chooses a major mode automatically when you visit a file.
		* Normally based on file name (e.g., file extension), but can also use special text in the file.
	- `<ALT>x valid-mode-name`: Set the mode of a buffer.
		* e.g., `<ALT>x c-mode`
	- Most major modes fall into three major groups:
		1. Modes for normal text, either plain or markup
			- e.g., Text mode, HTML mode, SGML mode, TeX mode, Org mode, etc.
		2. Modes for specific programming languages
			- e.g., Lisp mode (and its many variants), C mode, Fortran mode, etc.
		3. Modes that are not associated directly with files.
			- Used in buffers created for specific purposes by Emacs.
2. **Minor**: 

## Emacs Configuration

Emacs uses Emacs Lisp for configuration (and other things).

## Basic Commands

**Basic Commands**:
- `<CTRL>x <CTRL>f`: "find" file i.e. open/create a file in buffer
- `<CTRL>x <CTRL>s`: save the file
- `<CTRL>x <CTRL>w`: write the file to an alternate name
- `<CTRL>x <CTRL>v`: find alternate file
- `<CTRL>x i`: insert file at cursor position
- `<CTRL>x b`: create/switch buffers
- `<CTRL>x <CTRL>b`: show buffer list
- `<CTRL>x k`: kill buffer
- `<CTRL>x`: suspend emacs
- `<CTRL>X <CTRL>c`: close down emacs

**Basic Movement Commands**:
- `<CTRL>f`: forward char
- `<CTRL>b`: backward char
- `<CTRL>p`: previous line
- `<CTRL>n`: next line
- `<ALT>f`: forward one word
- `<ALT>b`: backward one word
- `<CTRL>a`: beginning of line
- `<CTRL>e`: end of line
- `<CTRL>v`: one page up
- `<ALT>v`: scroll down one page
- `<ALT><`: beginning of text
- `<ALT>>`: end of text

**Basic Editing Commands:**
- `<ALT>n`: repeat the following command n times
- `<CTRL>u`: repeat the following command 4 times
- `C-u n`: repeat n times
- `C-d`: delete a char
- `<ALT>d`: delete word
- `<ALT>Del`: delete word backwards
- `<CTRL>k`: kill line
- `C-t`: transpose two chars
- `<ALT>t`: transpose two words
- `<CTRL>x <CTRL>t`: transpose lines
- `<ALT>u`: make letters uppercase in word from cursor position to end
- `<ALT>c`: simply make first letter in word uppercase
- `<ALT>l`: opposite to <ALT>u
- `<CTRL><SPACE>`: Set beginning mark (for region marking for example)
- `<CTRL>-W`: kill (delete) the marked region
- `<ALT>W`: copy the marked region
- `<CTRL>y`: "yank"(paste) the copied/killed region/line
- `<ALT>y`: yank earlier text (cycle through kill buffer)
- `<CTRL>x <CTRL>x`: exchange cursor and mark

**Important and Useful Commands:**
- `<CTRL>g`: quit the command combination typed in incorrectly
- `<CTRL>x u`: undo previous action
- `<ALT>x`: revert-buffer RETURN (insert like this) undo all changes since last save
- `<ALT>x recover-file RETURN`: Recover text from an autosave-file
- `<ALT>x recover-session RETURN`: if you edited several files

**Help Commands**:
- `<CTRL>h c`: which command does this keystroke invoke
- `<CTRL>h k`: which command does this keystroke invoke and what does it do?
- `<CTRL>h l`: what were my last 100 typed keys
- `<CTRL>h w`: what key-combo does this command have?
- `<CTRL>h f`: what does this function do
- `<CTRL>h v`: what's this variable and what is it's value
- `<CTRL>h b`: show all key commands for this buffer
- `<CTRL>h t`: start the emacs tutorial
- `<CTRL>h i`: start the info reader
- `<CTRL>h <CTRL>k`: start up info reader and go to a certain key-combo point
- `<CTRL>h F`: show the emacs FAQ
- `<CTRL>h p`: show infos about the Elisp package on this machine

**Search/Replace Commands**:
- `<CTRL>s`: Search forward
- `<CTRL>r`: search backward
- `<CTRL>g`: return to where search started (if you are still in search mode)
- `<ALT>%`: query replace
	- `<SPACE>` or `y`: replace this occurrence
	- `<DEL>` or `n`: don't replace
	- `.`: only replace this and exit (replace)
	- `,`: replace and pause (resume with Space or y)
	- `!`: replace all following occurrences
	- `^`: back to previous match
	- <CR> or `q`: quit replace

**Search/Replace with Regex (Regular Expressions)**:
- `<ALT> C-s`: RETURN search for regular expression forward
- `<ALT> C-r`: RETURN search for regular expression backward
- `<ALT> C-s`: incremental search
- `<CTRL>s`: repeat incremental search
- `<ALT> <CTRL>r`: incremental search backwards
- `<CTRL>r`: repeat backwards
- `<ALT>x query-replace-regexp`: search and replace

> **Regex Characters**:
> - `^`: beginning of line
> - `$`: end of line
> - `.`: single char
> - `.*`: group or null of chars
> - `\<`: beginning of a word
> - `\>`: end of a word
> - `[]`: every char inside the brackets (for example [a-z] means every small letter)

## More Commands

> **Note**: These commands probably won't come up in any exams, so I'm separating them for the sake of organization, but keeping them for posterity.

**Window Splitting and Movement Commands**:
- `<CTRL>x 2`: split window vertically
- `<CTRL>x o`: change to other window
- `<CTRL>x 0`: delete window
- `<CTRL>x 1`: close all windows except the one the cursors in
- `<CTRL>x ^`: enlarge window
- `<ALT>x`: shrink-window command says it ;-)
- `<ALT> <CTRL>v`: scroll other window
- `<CTRL>x 4 f`: find file in other window
- `<CTRL>x 4 o`: change to other window
- `<CTRL>x 4 0`: kill buffer and window
- `<CTRL>x 5 2`: make new frame
- `<CTRL>x 5 f`: find file in other frame
- `<CTRL>x 5 o`: change to other frame
- `<CTRL>x 5 0`: close this frame

**Shell Commands**:
- `<ALT>x`: shell starts shell modus
- `<CTRL>c <CTRL>c`: same as `<CTRL>c` under unix (stop running job)
- `<CTRL>d`: delete char forward
- `<CTRL>c <CTRL>d`: Send EOF
- `<CTRL>c <CTRL>z`: suspend job (`<CTRL>z` under UNIX)
- `<ALT>p`: show previous commands

**Programming Commands**:
- `<ALT> <CTRL>\`: indent region between cursor and mark
- `<ALT>m`: move to first (non-space) char in this line
- `<ALT>^`: attach this line to previous
- `<ALT>;`: formatize and indent comment

**Programming Commands: C, C++ and Java Modes**:
- `<ALT>a`: beginning of statement
- `<ALT>e`: end of statement
- `<ALT> <CTRL>a`: beginning of function
- `<ALT> <CTRL>e`: end of function
- `<CTRL>c RETURN`: Set cursor to beginning of function and mark at the end
- `<CTRL>c <CTRL>q `:indent the whole function according to indention style
- `<CTRL>c <CTRL>a`: toggle modus in which after electric signs (like `{}:';./*`) Emacs does the indention
- `<CTRL>c <CTRL>d`: toggle auto hungry mode in which Emacs deletes groups of spaces with one del-press
- `<CTRL>c <CTRL>u`: go to beginning of this preprocessor statement
- `<CTRL>c <CTRL>c`: comment out marked area

**Programming Commands: More General**
- `<ALT>x outline-minor-mode`: collapses function definitions in a file to a mere {...}
- `<ALT>x show-subtree`: If you are in one of the collapsed functions, this un-collapses it In order to achieve some of the feats coming up now you have to run etags `*.c` `*.h` `*.cpp` (or what ever ending you source files have) in the source directory
- `<ALT>.`: (Thats Meta dot) If you are in a function call, this will take you to it's definition
- `<ALT>x tags-search ENTER`: Searches through all you etaged
- `<ALT>,`: (Meta comma) jumps to the next occurrence for tags-search
- `<ALT>x tags-query-replace`: This lets you replace some text in all the tagged files

**Programming Commands: GDB**
- `<ALT>x gdb`: starts up gdb in an extra window (assuming you have gdb installed on your machine)

**Macro Commands**:
- `<CTRL>x (`: start macro definition
- `<CTRL>x )`: end of macro definition
- `<CTRL>x e`: execute last definied macro
- `<ALT>n <CTRL>x e`: execute last defined macro n times
- `<ALT>x name-last-kbd-macro`: give name to macro (for saving)
- `<ALT>x insert-keyboard-macro`: save named macro into file
- `<ALT>x load-file`: load macro
- `<ALT>x macroname`: execute macroname

**Text Commands**:
- `<ALT>s`: center line
- `<ALT>S`: center paragraph
- `<ALT>x`: center-region name says

**Bookmark Commands:**
- `<CTRL>x r m`: set a bookmark at current cursor pos
- `<CTRL>x r b`: jump to bookmark
- `<ALT>x bookmark-rename`: rename bookmark
- `<ALT>x bookmark-delete`: delete bookmark
- `<ALT>x bookmark-save`: save bookmark
- `<CTRL>x r l`: list bookmarks
	- `d`: mark bookmark for deletion
	- `r`: rename bookmark
	- `s`: save all listed bookmarks
	- `f`: show bookmark the cursor is over
	- `m`: mark bookmarks to be shown in multiple window
	- `v`: show marked bookmarks (or the one the cursor is over)
	- `t`: toggle listing of the corresponding paths
	- `w "`: path to this file
	- `x`: delete marked bookmarks
	- `Del`: ?
	- `q`: quit bookmark list

