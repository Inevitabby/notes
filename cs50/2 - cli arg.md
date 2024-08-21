# Command-line Arguments

Recall our usual main function:
```c
int main(void)
{
}
```

To take command-line arguments we can replace `void` with `int argc, string argv[]`, like so:

```c
int main(int argc, string argv[])
{
}
```

- `argc`: Number of arguments given
- `argv`: Array of strings given

