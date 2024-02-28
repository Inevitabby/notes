# Counting Memory

We tend to count memory using hexadecimal rather than binary.
- Uses the `0x` prefix.
- e.g., `0x10` is just `10`, the hexadecimal representation of `16`

## Example: Storing an Int

```c
#include <stdio.h>
int main(void)
{
	int n = 50;
	printf("%i\n", n);
}
```

1. An int typically takes 4 bytes
2. The number `50` has an address for where it is in memory, like `0x123`
