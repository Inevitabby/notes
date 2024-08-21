# do while loop

Similar to a while loop, but it checks the condition last instead of first

```c
int n;
do
{
	n = get_int("Width: ");
}
while (n < 1);
```

Note how this means that the user will be repeatedly prompted until they give a valid value for `n` that is `n < 1`, then the program will continue.

You can use a while loop with a `break;` to achieve the same effect
