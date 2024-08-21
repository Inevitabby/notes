# Type Conversion

Floats will be truncated when being stored in ints.

So if we want to do floating point math with ints, one option is to cast it like such:
```c
int x = 2;
int y = 3;
float z = (float) x / (float) y;
```
