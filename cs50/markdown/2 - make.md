# Make

Make is not a compiler. It's a utility that makes it easier to compile code using a compiler.

Make is actually running Clang (c language) automatically.

Compiling manually with Clang:
1. `clang hello.c`: Compiles `hello.c` to `a.out` (assembler output)
2. `clang hello.c -o hello`: Compiles `hello.c` to `hello`
3. `clang hello.c -o hello -lcs50`: Link in the cs50.h header file
4. etc., as programs get more complex—which is why we just use Make to abstract away the process

