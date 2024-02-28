# History

- Written by Brian Fox of Free Software Foundation
- An attempt to create the best of all shells
- Completely backward compatible with Bourne Shell
- Tries to include some features of both C shell and Korn Shell
- Freely available for all flavors and all distros of Linux

# Performing Operations (``(())``)

Perform operations by putting the operation inside a set of double parenthesis.

> **Example**: Arithmetic with double parenthesis
> ```bash
> a=$(( 4 + 5 ))
> echo $a
> # 9
> a=$((3+5))
> echo $a
> # 8
> b=$(( a + 3 ))
> echo $b
> # 11
> b=$(( $a + 4 ))
> echo $b
> # 12
> (( b++ ))
> echo $b
> # 13
> (( b += 3 ))
> echo $b
> # 16
> a=$(( 4 * 5 ))
> echo $a
> # 20
> ```

# Length

`${#a}`{.bash} prints the length of the variable `$a`

# Arrays

Indexed array is automatically created if any variable is assigned with the syntax:
```
name[subscript]=value
```

Arrays can also be explicitly declared with:
```bash
declare -a name[subscript]
```

Referencing an array without a subscript is the same as referencing with a subscript of 0.

Any element of an array may be referenced using `${name[subscript]}`. The
braces are required to avoid conflicts with the shell’s filename expansion
operators. If the subscript is ‘`@`’ or ‘`*`’, the word expands to all members of
the array name.


