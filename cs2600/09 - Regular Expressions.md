# Regular Expressions

**Regular Expression**: Set of characters that specify a pattern.
- Used when you want to search for lines containing a particular pattern.
	* We search for lines because most UNIX utilities operate on ASCII files line-by-line.
- Can only search for patterns on a single line.
	* They can't search for patterns that stat on one line and end on another.
- Powerful and flexible.
	* e.g., searching for words of a certain size, searching for words with $n$ or more variables that ends with "s", etc.
- Can match a string in more than one place (not just once per line).

> **Tangent**: "Regular" comes from term used to describe grammar and formal languages ("regular languages").

> **Remember**: Regular expressions are just patterns, what they *do* is determined by how a utility uses them.

**Two Types of Regular Expressions**:
1. "Basic"
	- Used by most programs.
2. "Extended"
	- Used by a few utilities.

## Regular Expression Metacharacters

| Regular Expression | Class    | Type          | Meaning                             |
|--------------------|----------|---------------|-------------------------------------|
| `.`                | all      | Character Set | A single character (except newline) |
| `^`                | all      | Anchor        | Beginning of line                   |
| `$`                | all      | Anchor        | End of line                         |
| `[...]`            | all      | Character Set | Range of characters                 |
| `*`                | all      | Modifier      | zero or more duplicates             |
| `\<`               | Basic    | Anchor        | Beginning of word                   |
| `\>`               | Basic    | Anchor        | End of word                         |
| `\(..\)`           | Basic    | Backreference | Remembers pattern                   |
| `\1..\9`           | Basic    | Reference     | Recalls pattern                     |
| `\{M,N\}`          | Basic    | Modifier      | $M$ to $N$ Duplicates               |
| `+`                | Extended | Modifier      | One or more duplicates              |
| `?`                | Extended | Modifier      | Zero or one duplicate               |
| `(...`\|`...)`     | Extended | Anchor        | Shows alteration                    |

> **Note**: This is just a summary, examples and detailed descriptions are further down.

## Regular Expressions v.s. Shell Metacharacters

Regular expressions and shell metacharacters are often confused with each other, but are very different.

Shell Metacharacters:
- Square brackets are similar.
- Asterisk acts similar to regular expressions (but not identical).
- Expanded *before* shell passes the argument to the program.

> **Remember**: Remember to wrap regular expressions in quotes to prevent them from being erroneously expanded by the shell!

## Structure of a Regular Expression

Three Important Parts of a Regular Expression:
1. **Anchors**: Specify position of pattern in relation to a line of text.
2. **Character Sets**: Match one or more characters in a single position.
3. **Modifiers**:  Specify how many times the previous character set is repeated.

**Examples**: Regular expressions (matches are underlined)

```regex
cks
```
> UNIX ro[cks]{.underline}\
> UNIX su[cks]{.underline}\
> UNIX is okay
- Regex that matches for the string "`cks`" (no anchor or modifier).

```regex
apple
```
> Scr[apple]{.underline} from the [apple]{.underline}
- Regex that matches for "`apple`".
	* Note how there are multiple matches.

```regex
^#*
```
> [UNIX rocks]{.underline}\
> [UNIX sucks]{.underline}\
> [UNIX is okay]{.underline}
- Useless regex with an anchor (`^`), character set (`#`), and modifier (`*`).
	* `^`: Indicates beginning of the line.
	* `#`: Matches the pound symbol (`#`).
	* `*`: Specified that the previous character set can appear any number of times, including zero.

```regex
b[eor]at
```
> I tried to eat [brat]{.underline}wurst on the [boat]{.underline}, but was [beat]{.underline}en to the punch by a seagull
- Regex that matches for "`b[eor]at`"
	- Note: Regex character classes (`[]`) behave similarly to, but aren't the same as the `[]` file substitution wildcard metacharacter.

```regex
b[^eo]at
```
> I tried to eat [brat]{.underline}wurst on the boat, but was beaten to the punch by a seagull
- Regex that matches for "`b[^eo]at`".
	* Note: We can negate character classes with `[^]` syntax.

## Utilities using Regular Expressions

| Utility | Regular Expression Type   |
|---------|---------------------------|
| `vi`    | Basic                     |
| `sed`   | Basic                     |
| `grep`  | Basic                     |
| `more`  | Basic                     |
| `ed`    | Basic                     |
| `expr`  | Basic                     |
| `awk`   | Extended                  |
| `nawk`  | Extended                  |
| `egrep` | Extended                  |
| `emacs` | Emacs regular expressions |
| `perl`  | Perl regular expressions  |

# Character Classes

## Named Character Classes

Commonly-used character classes can be referred to by name.
- e.g., `alpha`, `lower`, `upper`, `alnum`, `digit`, `punct`, `cntrl`
- Important for portability across languages.

**Format**: `[:name:]`

> **Example**: Using named character classes.
> 
> | Character Class | Named Character Class Equivalent |
> |-----------------|----------------------------------|
> | `[a-zA-Z]`      | `[[:alpha:]]`                    |
> | `[a-zA-Z0-9]`   | `[[:alnum:]]`                    |
> | `[45a-z]`       | `[45[:lower:]]`                  |

## More on Character Classes

> **Examples**: Some more examples
> - `[aeiou]` will match any of the characters [`a`]{.underline}, [`e`]{.underline}, [`i`]{.underline}, [`o`]{.underline}, or [`u`]{.underline}
> - `[kK]orn` will match [`korn`]{.underline} or [`Korn`]{.underline}

1. Ranges can also be specified in character classes

> **Examples**: Using ranges
> - `[1-9]` is the same as `[123456789]`
> - `[abcde]` is equivalent to `[a-e]`

2. You can also combine multiple ranges
- Note that the `-` character has a special meaning in a character class, but *only if* it is used within a range
	- For example, `[-123]` would match the characters `-`, `1`, `2`, or `3`

> **Example**: Combining ranges
> - `[abcde123456789]` is equivalent to `[a-e1-9]`

3. You can mix explicit characters and character ranges.

> **Example**: Mixing character ranges and an explicit character
> - `[A-Za-z0-9_]`: This pattern will match a single character that is a letter, number, or underscore:

> **Note**; The characters `]` and `-` do not have a special meaning if they *directly follow* a `[`
> - e.g., `[]0-9]` will match for any digit *or* the symbol `]`
> - Tip: You can use the backslash (`\`) to escape `]` and `-` like you do for shell metacharacters. 

## Exercises: Reading Regular Expressions

> **Instructions**: Read the following regular expressions and determine what they do/match.

Questions:
1. `^T[a-z][aeiou]`
2. `[-0-9]`
3. `[0-9\-b\]]`
	- Hint: The `\`'s are escaping some special characters.
4. `U[nN][iI]X`

Answers:
1. Matches for 3-character strings that begin with `T`, are followed by any lowercase letter, and end with a vowel.
2. Matches for any character that is a digit *or* the symbol `-`
3. Matches for any character that is a digit, the symbol `-`, the letter `b`, or the symbol `]`.
4. Matches for the strings `UniX`, `UnIX`, `UNiX`, or `UNIX`.

# More on Anchors

**Anchors**: Used to match at the beginning (`^`) or end (`$`) of a line (or both).
- Regular expressions examine the text between the separators.
	- The **end of line** character isn't included in the block of text that's searched because it is a separator.
- When using `^`, place the `^` at the beginning of the expression for it to be interpreted as an anchor.
- When using `$`, place the `$` at the end of the expression for it to be interpreted as an anchor.

| Pattern | Matches                          |
|---------|----------------------------------|
| `^A`    | "`A`" at the beginning of a line |
| `A$`    | "`A`" at the end of a line       |
| `A^`    | "`A^`" anywhere on a line        |
| `$A`    | "`$A`" anywhere on a line        |
| `^^`    | "`^`" at the beginning of a line |
| `$$`    | "$" at the end of a line         |

> **Examples**: Using anchors
> 
> ```regex
> ^bingus
> ```
> > [bingus]{.underline} bingus bingus
> - Regex that matches for the string "`bingus`" at the start of a line
> 
> ```regex
> bingus$
> ```
> > bingus bingus [bingus]{.underline}
> - Regex that matches for the string "`bingus`" at the end of a line

# More on Modifiers

## Matching a Single Character (`.`)

`.` is a special character that, by itself, matches any character (except the end of line character).

> **Example**: Using `.`
> 
> `o. ` (<- there is a space here)
> > F[or ]{.underline}me to lo[op ]{.underline}on.
> - Regex that matches for any 3-letter string that starts with a `o` and ends with a space.

## Repetition in Regular Expressions (`*`)

`*` is a special character is used to define **zero or more** occurrences of the single regular expression preceding it.
- e.g., `0*` matches zero or more `0`s, `[0-9]*` matches zero or more of any digit.
-[Only acts as a modifier if it follows a character set.]{.underline} 

> **Examples**: Using `*` 
> 
> ```regex
> ya*y
> ```
> > I got mail, [yaaaaaay]{.underline}!
> 
> ```regex
> oa*o
> ```
> > For me to p[oo]{.underline}p on.
> 
> ```regex
> a.*e
> ```
> > Scr[apple from the apple]{.underline}.
> - A match will be the longest string that satisfies the regular expression.
> 	* Notice how `apple` and `apple from the` also matched the regex, but were shorter.
<!--*-->

## Repetition Ranges (`\{` and `\}`)

To specify a minimum and maximum number of repeats, put the minimum and maximum between `\{` and `\}`.
- e.g., `\{1,3\}`
-[Only acts as a modifier if it follows a character set.]{.underline} 

> **Note**: Unlike shell metacharacters, backslash turns *on* the special meaning for `{` and `}`.

**Notation** (`\{ \}`): Ways to specify a range of repetitions for the preceding regular expression.
- `\{n\}`: Specify exactly $n$ occurrences
- `\{n, \}`: Specify at least $n$ occurrences
- `\{n,m\}`: Specify at least $n$ occurrences but no more than $m$ occurrences

> **Examples**: Using `\{ \}`
> 
> | Regular Expression | Matches                                                                      |
> | ---                | ---                                                                          |
> | `.\{0,\}`          | Exactly the same as `.*`                                                     |
> | `a\{2,\}`          | Exactly the same as `aaa*`                                                   |
> | `*`                | Any line with an asterisk                                                    |
> | `\*`               | Any line with an asterisk                                                    |
> | `\\`               | Any line with a backslash                                                    |
> | `^*`               | Any line starting with an asterisk                                           |
> | `^A*`              | Any line                                                                     |
> | `^A\*`             | Any line starting with an "`A*`"                                             |
> | `^AA*`             | Any line if it starts with one "`A`"                                         |
> | `^AA*B`            | Any line with one or more "`A`"'s followed by a "`B`"                        |
> | `^A\{4,8\}B`       | Any line starting with `4`, `5`, `6`, `7` or `8` "`A`"'s followed by a "`B`" |
> | `^A\{4,\}B`        | Any line starting with `4` or more "`A`"'s followed by a "`B`"               |
> | `^A\{4\}B`         | Any line starting with "`AAAAB`"                                             |
> | `\{4,8\}`          | Any line with "`{4,8}`"                                                      |
> | `A{4,8}`           | Any line with "`A{4,8}`"                                                     |

## Repetitions of Subexpressions (`\(` and `\)`)

`\( \)` groups parts of an expression into subexpressions.
- Subexpressions are treated like a single character.
- Lets you apply `*` and `\{\}` to more than just the previous character.

> **Note**: Unlike shell metacharacters, backslash turns *on* the special meaning for `(` and `)`.

> **Examples**: Grouping expressions with `\(\)`
> 
> `abc*`
> - Matches `ab`, `abc`, `abcc`, `abccc`, ...
> 
> `\(abc\)*`
> - Matches `abc`, `abcabc`, `abcabcabc`, ...
> 
> `\(abc\)\{2,3\}`
> - Matches `abcabc` or `abcabcabc`

## Backreferences (`\(,\)` and `\1`)

**Backreferences** let you remember what you found and see if the same pattern occurred again:
1. Mark part of a pattern with `\(` and `\)`.
	- Each occurrence of `\(` starts a new pattern.
2. Recall the remembered pattern with `\` followed by a single digit.
	- You can have 9 different remembered patterns.

> **Examples**: Using backreferences
> 
> `\([a-z]\)\1`
> - Match for two consecutive identical letters.
> 
> `\([a-z]\)\1\1`
> - Match for three consecutive identical letters.
> 
> `\([a-z]\)\([a-z]\)[a-z]\2\1`
> - Match for a 5-letter palindrome (e.g., `radar`).

# Extended Regular Expression

`egrep` and `awk` use extended regular expressions. 

**Differences from Basic Regular Expressions**:
- Special characters preceded by a backslash no longer have their special meaning.
	* "`\{`", "`\}`", "`\<`", "`\>`", "`\(`", "`\)`", "`\`"*digit*
- The character `?` matches 0 or 1 instances of the character set before.
	* Basic regular expression counterpart: `\{0,1\}`
- The character `+` matches 1 or more copies of the character set.
	* Basic regular expression counterpart: `\{1,\}`
- New metacharacters: `(`, `|` and `)` to make a **choice** of patterns.
	* e.g., `egrep '^(From|Subject): "/usr/spool/mail${USER}"` prints all `From:` and `Subject:` lines from incoming mail.

# Exercises: Reading Regular Expressions

> **Instructions**: Read the following regular expressions and determine what they do/match.

Questions:
1. `[a-zA-Z_][a-zA-Z_0-9]*`
2. `\$[0-9]+(\.[0-9][0-9])?`
3. `(1[012]|[1-9]):[0-5][0-9] (am|pm)`
4. `<[hH][1-4]>`

Answers:
1. Matches for variable names in C
2. Matches for dollar amount with optional cents
3. Matches for time of day
4. Matches for HTML headers (`<h1>`, `<H1>`, `<h2>`, ...)

