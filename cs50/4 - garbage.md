# Garbage

```c
#include <stdio.h>
#include <stdlib.h>
int main(void)
{
	int scores[3];
	for (int i = 0; i < 3; i++)
	{
		printf("%i\n", scores[i]);
	}
}
```
- This code prints 3 garbage values.

When you don't initialize values, there might be remnants of past chars, ints, floats, whatever. Never forget to initialize the value of your variables!
- Mistaking a garbage value for a pointer could lead to a segmentation fault.

