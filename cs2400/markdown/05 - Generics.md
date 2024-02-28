# Generic Data Types

**Generics**: Enable you to write a placeholder instead of an actual class type.
- Generics are:
	1. A generic data type, and
	2. A non-primitive type parameter
		- *(This is why `Integer`{.java} exists)*
- You define a generic class.
	* Client chooses data type of objects in collection.

> **Limitations**:
> - You cannot instantiate a generic object.
> - You cannot instantiate an array of generic objects.
>
> **`new T`{.java} is always wrong.**

> **Type-Erasure**: The generic type gets removed when being returned.

> **Why**: Generics let us escape casting hell.
> - It also looks nicer.

> **Example**:
> 1. Interface
> ```java
> public interface Pairable<T> {
> 	T getFirst();
> 	T getSecond();
> 	void changeOrder();
> }
> ```
> 2. Implementation
> ```java
> public class OrderedPair<T> implements Pairable<T> {
> 	// ... TODO
> 	public OrderedPair() {
> 	}
> 	public T getFirst() {
> 	}
> 	public T getSecond() {
> 	}
> }
> ```

> **Example**: Implementing `getFrequencyOf` in the client
> ```java
> public static int getFrequencyOf (BagInterface<String> bag, String needle) {
> 	// You can't cast arrays, you have to cast reference individually!
> 	Object[] bagArray = bag.toArray();
> 	int counter = 0;
> 	for (Object item : bagArray)
> 		// Polymorphism:
> 		// - At runtime, this will execute the String's equals()
> 		// - At compilation this will be seen as the Object's equals(), but widening means that there is no syntax error.
>  		if (item.equals(needle))
> 			counter++;
> 	return counter;
> }
> ```
