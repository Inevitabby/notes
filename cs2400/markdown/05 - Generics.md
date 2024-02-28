# Generic Data Types

**Generics**: Enable you to write a placeholder instead of an actual class type.
- Generics are:
	1. A generic data type, and
	2. A non-primitive type parameter
		- *(This is why `Integer`{.java} exists)*
- You define a generic class.
	* Client chooses data type of objects in collection.

> **Note**: Generics eliminate the need to cast objects.
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
```java
public class OrderedPair<T> implements Pairable<T> {
	// ... TODO
	public OrderedPair() {
	}
	public T getFirst() {
	}
	public T getSecond() {
	}
}
```
