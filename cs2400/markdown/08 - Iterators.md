# Iterator

**Iterator**: Object that traverses a collection of data.
- Each item only considered **once**.
	* You *can* modify the item as it's accessed.
		+ But you should refrain from doing so!
- Should be implemented as a *distinct inner-class* that interacts with the ADT.
	- Should have a cursor that keeps track of traversal location.
		* Usually an `int` .

> **Tip**: Enhanced for loop can implicitly call a class's iterator, like so:
> ```java
> BagInterface<String> bag = new ArrayBag<>(); // (assume ArrayBag implements an iterator)
> for (String x : bag) {
> 	// etc...
> }
> ```
> - This is not a language feature, but part of the class structure.

> **Remember**: Iterators traverse serially, you can't traverse backwards.

> **Note**: `toArray()`
> - The `toArray()` we implemented in `ArrayBag.java` is basically a naive iterator that uses lots of memory.

> **Example**: Iterator interface
> ```java
> package java.util; // (this must be imported)
> public interface Iterator<T> {
>	// Required
> 	boolean hasNext();
> 	T next();
>	// Optional (default)
> 	void remove();
> }
> ```
> - **Remember**: A class can implement multiple things!

> **Example**: Iterable interface
> ```java
> package java.lang;
> public interface Iterable<T> {
> 	Iterator<T> iterator();
> }
> ```

> **Example**: Iterable ArrayBag
> ```java
> public class ArrayBag<T> implements BagInterface<T>, Iterable<T> {
> 	// (ArrayBag implementation here)
> 	@Override
> 	public Iterator<T> iterator() {
> 		return new BagIterator();
> 	}
> 	private class BagIterator<T> implements Iterator<T>{
> 		private int cursor;
> 		public BagIterator() {
> 			cursor = 0;
> 		}
> 		@Override
> 		public boolean hasNext() {
> 			return cursor < entries;
> 		}
> 		@Override
> 		public T next() {
> 			if (hasNext()) {
> 				return bag[cursor++];
> 			}
> 			throw new NoSuchElementException();
> 		}
> 	}
> }
> ```
> 
> **Usage**:
> ```java
> # Option 1:
> Iterator<String> bagIterator = bag.iterator();
> while (bagIterator.hasNext()) {
> 	System.out.println(bagIterator.next());
> }
> # Option 2:
> for (String x : bag) {
> 	System.out.println(x);
> }
> ```
