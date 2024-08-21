# Exit Status / Exit Codes

`return` a non-zero number from `main()` to indicate that there was an error. This means that you have 4 billion possible error codes.
- If you don't return a value explicitly, the exit code will be 0.

Example:
```c
int main(int argc, string argv[])
{
	if (argc != 2)
	{
		printf("missing args", argv[1]);
		return 1;
	}
	printf("hello, %s\n", argv[1]);
	return 0;
}
```

