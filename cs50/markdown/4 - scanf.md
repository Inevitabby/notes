# Getting Input with Scanf

## Int

```c
int main(void)
{
	int x;
	printf("x: ");
	scanf("%i", &x);
	printf("x: %i\n", x);
}
```

## String

Non-functional:
```c
int main(void)
{
	char *s;
	printf("s: ");
	scanf("%s", s);
	printf("s: %s", s);
}
```
- This just returns `"s: null"` because `char *s` needs dynamic memory allocation while `int x` has a fixed space in memory.

Possible fixes:
- Use `memalloc(n)`, but then you run the risk of segfaulting on a large input.
- The cs50 library way, which is to call memalloc on every keystroke to dynamically allocate memory quite dynamically.
