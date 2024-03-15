---
title: Hashing
---

# Hashing

> **Why?**: Hashing lets us turn search keys into integer indices that can be accessed at $O(1)$
> - Hashing is a data-dependent problem, there's no singular "right" way to do it.

**Hash Function**: Takes a search key and produces the integer index of an element in the hash table.
- Search key is mapped—or hashed—to the index.
- **Collision**: When two or more keys have the same hash.

> **Real-world Examples**:
> - Checking if a message has been modified by its CRC value.

> **Remember**: Override the Object class's default `hashcode` when necessary!
> - The default `hashcode` function just returns an object's memory address.
> - **Example**: The `String` and `Integer` class already implement their own `hashcode` function.

> **Ideal Hashing**: \
> ```
> Function add(key,value) {
> 	index=h(key);
> 	hashTable[index]=value;
> }
> ```
> - Supposing that we have perfect hashing (no collision). 

## Typical Hashing

**Typical Hashing**: 
1. Convert search key to integer (hash code)
2. Compress code into range of indices for hash table.

> **Hash Code v.s. Hash Index**
> - **Hash Code:** The integer result of the hash function.
> - **Hash Index:** The hash code % Table Length
>	- *(This is what we use as the search key.)*
>	- aka: Compressing

**Good Hash Functions**
1. Minimize Collisions
2. Be fast to compute.

## Handling Collisions 

**Reducing Collisions**:
1. Improve the hash function
	- e.g., distributing entries uniformly throughout the hash table.
		* *(usually requires statistical analysis)*
2. Increase table size.

**Handling Collisions**:
1. Use another location in the hash table
	- *(e.g., linear probing)*
2. Change the structure of the hash tale so that each location can represent more than one value.
	- *(this introduces searching and a whole slew of problems like deleting entries)*

**Linear Probing**: Resolves collision during hashing by examining consecutive locations in hash table.
- Basically just probing the next location until we find an empty location.

**Three Kinds of Locations in a Hash Table**:
1. Occupied
2. Empty
3. Available

## Computing Hash Codes

> **Example**: Hashing a Unicode string
> - **Naive Approach:** Sum every character's Unicode integer value.
> - **Another Approach:** Multiply each character's integer value by its position in the String and sum the values.
> $$
> u_0 g^{n-1} +
> u_1 g^{n-2} +
> u^{n-2} g +
> u_{n-1}
> $$
> ```java
> int hash = 0;
> int n = s.length();
> for (int i = 0; i < n; i++) {
> 	hash = g * hash + s.charAt(i);
> }
> ```
> - *(The $g$ constant was arrived at statistically)*

**Hash Code for Primitives:**
- Use the key itself if data type is `int`
- `Byte`, `short`, `char`: Cast to `int`
- Other primitives: Manipulate internal binary representations.

> **More on Compressing a Hash Code:**
> $$\text{Scaling an Integer: hash code} \% n$$
> - Best to use an odd number for $n$
> - Prime number often gives good distribution of hash values.
> ```java
> private int getHashIndex(K key) {
> 	int hashIndex = key.hashCode() % hashTable.length;
> 	if (hashIndex < 0) {
> 		hashIndex = hashIndex + hashTable.length;
> 	}
> 	return hashIndex;
> }
> ```
> - Note how we handle negative hash codes!

