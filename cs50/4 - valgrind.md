# Memory Debugging with Valgrind

Example:
```c
#include <stdio.h>
#include <stdlib.h>
int main(void)
{
	int *x = malloc(3 * sizeof(int));
	x[1] = 72;
	x[2] = 73;
	x[3] = 33;
}
```

Mistake: Array assignment wasn't zero indexed.
- Because of this, we do a buffer overflow when we try to assign data outside the boundaries of the chunk of memory assigned to `x`
	* The program doesn't segmentation fault from this, so we need to use Valgrind to find this and other memory-related bugs.

Running Valgrind for our hypothetical `memory.c` example above would go like this:
```bash
valgrind ./memory
```

The non-hypothetical output would be:
```
==32127== Memcheck, a memory error detector
==32127== Copyright (C) 2002-2022, and GNU GPL'd, by Julian Seward et al.
==32127== Using Valgrind-3.21.0 and LibVEX; rerun with -h for copyright info
==32127== Command: ./memory
==32127== 
==32127== Invalid write of size 4
==32127==    at 0x10916F: main (in /home/cobalt/Scripts/CS50/4/examples/memory)
==32127==  Address 0x4a4404c is 0 bytes after a block of size 12 alloc'd
==32127==    at 0x48407C4: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
==32127==    by 0x109146: main (in /home/cobalt/Scripts/CS50/4/examples/memory)
==32127== 
==32127== 
==32127== HEAP SUMMARY:
==32127==     in use at exit: 12 bytes in 1 blocks
==32127==   total heap usage: 1 allocs, 0 frees, 12 bytes allocated
==32127== 
==32127== LEAK SUMMARY:
==32127==    definitely lost: 12 bytes in 1 blocks
==32127==    indirectly lost: 0 bytes in 0 blocks
==32127==      possibly lost: 0 bytes in 0 blocks
==32127==    still reachable: 0 bytes in 0 blocks
==32127==         suppressed: 0 bytes in 0 blocks
==32127== Rerun with --leak-check=full to see details of leaked memory
==32127== 
==32127== For lists of detected and suppressed errors, rerun with: -s
==32127== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)
```

Non-hypothetical highlights:
- `==32127==    definitely lost: 12 bytes in 1 blocks
`
	* Definite memory leak.
- `==32127== Invalid write of size 4`
	* Buffer overflow (one int is 4 bytes)

