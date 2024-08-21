---
preserve-tabs: true
---

# `grep`

`grep`: Command-line utility (filter) for searching plaintext data for lines that match a regular expression.
- Etymology: `ed` command g/re/p ([g]{.underline}lobally search for a [r]{.underline}egular [e]{.underline}xpression and [p]{.underline}rint matching lines)
- Regular expression concepts we've seen so far are common to `grep` and `egrep`.
- Get in the habit of **double quoting** your regular expressions to protect special metacharacters.

> **Tangent**: `grep` variants
> - `egrep` variant supports extended regular expression syntax.
>	* Added by Alfred Aho after Ken Thompson's original implementation.
> - `fgrep` variant searches for any list of `fixed` strings using the Aho-Corasick string matching algorithm.

> **Note**: Utilities to use regular expressions are usually filters. 

## Popular `grep` Options

- `-e pattern`: Provide a pattern
- `-i`: Ignore uppercase vs. lowercase.
- `-v`: Invert match.
- `-c`: Output count of matching lines only.
- `-l`: Output matching files only.
- `-n`: Precede each matching line with a line number.
- `-h`: Output matching lines without preceding them by file names.
- `-s`: Suppress error messages about nonexistent or unreadable files.
- `-f file`: Take regexes from a file.
- `-o`: Output the matched parts of a matching line.

## Examples: Using `grep` 

```bash
$ cat datafile.txt
northwest       NW      Charles Main            3.0     .98     3       34
western         WE      Sharon Gray             5.3     .97     5       23
southwest       SW      Lewis Dalsass           2.7     .8      2       18
southern        SO      Suan Chin               5.1     .95     4       15
southeast       SE      Patricia Hemenway       4.0     .7      4       17
eastern         EA      TB Savage               4.4     .84     5       20
northeast       NE      AM Main Jr.             5.1     .94     3       13
north           NO      Margot Weber            4.5     .89     5        9
central         CT      Ann Stephens            5.7     .94     5       13
$ grep "NW" datafile.txt
northwest       NW      Charles Main            3.0     .98     3       34
$ grep "^north" datafile.txt
northwest       NW      Charles Main            3.0     .98     3       34
northeast       NE      AM Main Jr.             5.1     .94     3       13
north           NO      Margot Weber            4.5     .89     5        9
$ grep "3$" datafile.txt
western         WE      Sharon Gray             5.3     .97     5       23
northeast       NE      AM Main Jr.             5.1     .94     3       13
central         CT      Ann Stephens            5.7     .94     5       13
$ grep "Charles Main" datafile.txt
northwest       NW      Charles Main            3.0     .98     3       34
$ grep "5\.." datafile.txt
western         WE      Sharon Gray             5.3     .97     5       23
southern        SO      Suan Chin               5.1     .95     4       15
northeast       NE      AM Main Jr.             5.1     .94     3       13
central         CT      Ann Stephens            5.7     .94     5       13
$ grep "^[we]" datafile.txt
western         WE      Sharon Gray             5.3     .97     5       23
eastern         EA      TB Savage               4.4     .84     5       20
$ grep "[^0-9]" datafile.txt
northwest       NW      Charles Main            3.0     .98     3       34
western         WE      Sharon Gray             5.3     .97     5       23
southwest       SW      Lewis Dalsass           2.7     .8      2       18
southern        SO      Suan Chin               5.1     .95     4       15
southeast       SE      Patricia Hemenway       4.0     .7      4       17
eastern         EA      TB Savage               4.4     .84     5       20
northeast       NE      AM Main Jr.             5.1     .94     3       13
north           NO      Margot Weber            4.5     .89     5        9
central         CT      Ann Stephens            5.7     .94     5       13
$ grep "[A-Z][A-Z] [A-Z]" datafile.txt
eastern         EA      TB Savage               4.4     .84     5       20
northeast       NE      AM Main Jr.             5.1     .94     3       13
$ grep "ss* " datafile.txt
northwest       NW      Charles Main            3.0     .98     3       34
southwest       SW      Lewis Dalsass           2.7     .8      2       18
$ grep "[a-z]\{9\}" datafile.txt
northwest       NW      Charles Main            3.0     .98     3       34
southwest       SW      Lewis Dalsass           2.7     .8      2       18
southeast       SE      Patricia Hemenway       4.0     .7      4       17
northeast       NE      AM Main Jr.             5.1     .94     3       13
$ grep "\(3\)\.[0-9].*\1 *\1" datafile.txt
$ grep "\(3\)\.[0-9].*\1" datafile.txt
northwest       NW      Charles Main            3.0     .98     3       34
$ grep "\<north" datafile.txt
northwest       NW      Charles Main            3.0     .98     3       34
northeast       NE      AM Main Jr.             5.1     .94     3       13
north           NO      Margot Weber            4.5     .89     5        9
$ grep "\<north\>" datafile.txt
north           NO      Margot Weber            4.5     .89     5        9
$ grep "\<[a-z].*n\>" datafile.txt
northwest       NW      Charles Main            3.0     .98     3       34
western         WE      Sharon Gray             5.3     .97     5       23
southern        SO      Suan Chin               5.1     .95     4       15
eastern         EA      TB Savage               4.4     .84     5       20
northeast       NE      AM Main Jr.             5.1     .94     3       13
central         CT      Ann Stephens            5.7     .94     5       13
```

<!--

```bash
$ grep "NW" datafile.txt
```
> northwest       [NW]{.underline}      Charles Main            3.0     .98     3       34

```bash
$ grep "^north" datafile.txt
```
> [north]{.underline}west       NW      Charles Main            3.0     .98     3       34
> [north]{.underline}east       NE      AM Main Jr.             5.1     .94     3       13
> [north]{.underline}           NO      Margot Weber            4.5     .89     5        9

```bash
$ grep "3$" datafile.txt
```
> western         WE      Sharon Gray             5.3     .97     5       2[3]{.underline}
> northeast       NE      AM Main Jr.             5.1     .94     3       1[3]{.underline}
> central         CT      Ann Stephens            5.7     .94     5       1[3]{.underline}

```bash
$ grep "Charles Main" datafile.txt
```
> northwest       NW      [Charles Main]{.underline}            3.0     .98     3       34

```bash
$ grep "5\.." datafile.txt
```
> western         WE      Sharon Gray             [5.3]{.underline}     .97     5       23
> southern        SO      Suan Chin               [5.1]{.underline}     .95     4       15
> northeast       NE      AM Main Jr.             [5.1]{.underline}     .94     3       13
> central         CT      Ann Stephens            [5.7]{.underline}     .94     5       13

```bash
$ grep "^[we]" datafile.txt
```
> [w]{.underline}estern         WE      Sharon Gray             5.3     .97     5       23
> [e]{.underline}astern         EA      TB Savage               4.4     .84     5       20

```bash
$ grep "[^0-9]" datafile.txt
```
> [northwest       NW      Charles Main]{.underline}            3[.]{.underline}0     [.]{.underline}98     3       34
> [western         WE      Sharon Gray]{.underline}             5[.]{.underline}3     [.]{.underline}97     5       23
> [southwest       SW      Lewis Dalsass]{.underline}           2[.]{.underline}7     [.]{.underline}8      2       18
> [southern        SO      Suan Chin]{.underline}               5[.]{.underline}1     [.]{.underline}95     4       15
> [southeast       SE      Patricia Hemenway]{.underline}       4[.]{.underline}0     [.]{.underline}7      4       17
> [eastern         EA      TB Savage]{.underline}               4[.]{.underline}4     [.]{.underline}84     5       20
> [northeast       NE      AM Main Jr.]{.underline}             5[.]{.underline}1     [.]{.underline}94     3       13
> [north           NO      Margot Weber]{.underline}            4[.]{.underline}5     [.]{.underline}89     5        9
> [central         CT      Ann Stephens]{.underline}            5[.]{.underline}7     [.]{.underline}94     5       13

```bash
$ grep "[A-Z][A-Z] [A-Z]" datafile.txt
```
> eastern         EA      [TB S]{.underline}avage               4.4     .84     5       20
> northeast       NE      [AM M]{.underline}ain Jr.             5.1     .94     3       13

```bash
$ grep "ss* " datafile.txt
```
> northwest       NW      Charle[s]{.underline} Main            3.0     .98     3       34
> southwest       SW      Lewi[s]{.underline} Dalsass           2.7     .8      2       18

```bash
$ grep "[a-z]\{9\}" datafile.txt
```
> [northwest]{.underline}       NW      Charles Main            3.0     .98     3       34
> [southwest]{.underline}       SW      Lewis Dalsass           2.7     .8      2       18
> [southeast]{.underline}       SE      Patricia Hemenway       4.0     .7      4       17
> [northeast]{.underline}       NE      AM Main Jr.             5.1     .94     3       13

```bash
$ grep "\(3\)\.[0-9].*\1" datafile.txt
```
northwest       NW      Charles Main            [3.0     .98     3       3]{.underline}4

```bash
$ grep "\<north" datafile.txt
```
> [north]{.underline}west       NW      Charles Main            3.0     .98     3       34
> [north]{.underline}east       NE      AM Main Jr.             5.1     .94     3       13
> [north]{.underline}           NO      Margot Weber            4.5     .89     5        9

```bash
$ grep "\<north\>" datafile.txt
```
> [north]{.underline}           NO      Margot Weber            4.5     .89     5        9

```bash
$ grep "\<[a-z].*n\>" datafile.txt
```
> [northwest       NW      Charles Main]{.underline}            3.0     .98     3       34
> [western         WE      Sharon]{.underline} Gray             5.3     .97     5       23
> [southern        SO      Suan Chin]{.underline}               5.1     .95     4       15
> [eastern]{.underline}         EA      TB Savage               4.4     .84     5       20
> [northeast       NE      AM Main]{.underline} Jr.             5.1     .94     3       13
> [central         CT      Ann]{.underline} Stephens            5.7     .94     5       13
-->
