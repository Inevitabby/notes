# Loops

Loop forever:
```c
while(true)
{
	printf("meow")
}
```

Repeat n (3) times:
```c
int i = 0;
while (i < 3)
{
	printf("meow")
	i++;
}
```

For n (3) times:
```c
for (int i = 0; i < 3; i++)
{
	printf("meow")
}
```

> **Key Takeaway**: There's many ways to do loops, which is why conventions (e.g., using `int i` for counters, starting at `0`) are important

There are subtle differences in differences of scope between while and for loops, but they can generally do the same things

