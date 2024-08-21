# Pointer Arithmetic

Recall our array notation:
```c
char *s = "HI!";
printf("%c", s[0]);
printf("%c", s[1]);
printf("%c", s[2]);
```

This is just syntactic sugar for manipulating the pointers as-they-are, like so:

```c
char *s = "HI!";
printf("%c", *s); // Retrieve (*) the data at pointer s 
printf("%c", *(s + 1));
printf("%c", *(s + 2));
```

Or,

```c
int numbers[7] = {4,6,8,2,7,5,0};
printf("%i\n", *numbers);
printf("%i\n", *(numbers + 1));
printf("%i\n", *(numbers + 2));
printf("%i\n", *(numbers + 3));
printf("%i\n", *(numbers + 4));
printf("%i\n", *(numbers + 5));
printf("%i\n", *(numbers + 6));
```
- Note how we're incrementing the pointers with `1` rather than having to figure out the size of the data type ourselves and adding 4 bytes to get to the next chunk of data in memory.
- Notice how there is no `*` or `&` when we define `numbers`, but we still treat it like a pointer.
	* An array can be treated as the address of the first element in that array.
		+ However, there is no `\0` character for arrays.

## Example: Comparisons

Notice this functional code which determines if two integers are equal:
```c
int main(void)
{
	int i = get_int("i: ");
	int j = get_int("j: ");
	if (i == j)
		printf("Same");
	else
		printf("Different");
}
```

Notice this non-functional code for determining if two integers are equal:
```c
int main(void)
{
	string s = get_string("s: ");
	string t = get_string("t: ");
	if (s == t)
		printf("Same");
	else
		printf("Different");
}
```
- This fails because `s` and `t` are literally just pointers to the first character of their respective, separate strings (e.g., `0x123 != 0x420`).
	* The `string` abstraction kinda hides this 
	* `get_string` returns the address of the first char of a string

Here's a functional comparison using `strcmp` from `string.h` (provides string-related functions, doesn't set a `string` typedef):
```c
int main(void)
{
	string s = get_string("s: ");
	string t = get_string("t: ");
	if (strcmp(s,t) == 0)
		printf("Same");
	else
		printf("Different");
}
```
- `strcmp` likely loops over each character and checks if they're equal that way

## Pop Question: Address Reuse

```c
string s = get_string();
string t = s;
t[0] = toupper(t[0]);
printf("%s\n", s);
printf("%s\n", t);
```

This prints out the same string twice (the user's input string, but with the first letter capitalized). Why?
- `string t = s` sets t equal to s, which is an address like `0x123`, the pointer of the first character in the string s.
	* `t` and `s` both actually share the same address in memory because of this—we have two pointers to the same location in memory.

If we want a genuine copy of `s`, we'll need to use dynamic memory allocation.

