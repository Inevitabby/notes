# Code Examples (Linear Search)

```c
// Linear Search Through Number
int numbers[] = {4, 6, 8, 2, 7, 5, 0};
const int NEEDLE = 8;
for (int i = 0; i < 7; i++) {
	if (numbers[i] == NEEDLE) { // Found
		return 0;
	}
}
return 1; // Not Found
``` 

```c
// Linear Search Through Names
string names[] = {"Bill", "Charlie", "Fred", "George", "Ginny", "Percy", "Ron"};
for (int i = 0; i < 7; i++) {
	if (strcmp(names[i], "Ron") == 0) { // Found
		return 0; 
	}
}
return 1; // Not Found
``` 

```c
// Linear Search Through Phonebook
string names[] = {"Carter", "David"};
string numbers[] = {"+1-617-495-1000", "+1-949-468-2750"};
for (int i = 0; i < 2; i++) {
	if ((strcomp(names[i], "David") == 0) { // Found
		printf("Found %s". numbers[i]);
		return 0;
	}
}
return 1; // Not Found
```
- Issues with the Phonebook:
	- You're sort of just trusting that names and numbers are lined up
		* It'd be better if we could couple these disparate variables.

