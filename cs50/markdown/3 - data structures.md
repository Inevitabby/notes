# Data Structures

We can create our own custom data types like how we can create our own functions.

- Objects in object-oriented languages can store functions alongside data. C is not an object-oriented language.

## Example

Let's create a `person` data type to bind a name and number together!

```c
typedef struct
{
	string name;
	string number;
}
person;
```

Now we can re-implement the phonebook:
```c
// Linear Search Through Names
person people[2];
person[0].name = "Carter";
person[0].number = "+1-617-495-1000";
person[1].name = "David";
person[1].number = "+1-949-468-2750";
for (int i = 0; i < 2; i++) {
	if ((strcomp(people[i].name, "David") == 0) { // Found
		printf("Found %s". people[i].number);
		return 0;
	}
}
return 1; // Not Found
```

- This is better design than the previous solution because each person is encapsulated in their own data type (name and number).
- Using a 2D array isn't fundamentally as good as a `struct` because it still relies on an honor system (less encapsulation).
