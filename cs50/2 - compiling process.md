# Compiling Process

Compile is an umbrella term for doing the following steps:
1. Preprocessing
	- Get prototypes, find and replace `#include`'s
2. Compiling
	- Translate to Assembly language; the closest you can get to actual binary.
	- Each CPU has its on instruction set
		* This is why you can't take software compiled for Windows and run it on Mac
3. Assembling
	- Turning the Assembly into 0s and 1s
4. Linking
	- Stitch stdio, cs50, whatever into one file.

