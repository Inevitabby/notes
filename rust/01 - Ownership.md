---
title: "Ownership"
---

# Ownership

<!--
> **Layperson's Ownership**:
> - I can give away something I own.
> - I can throw away something I own.
> - If someone wants to use something I own, they have to come to me and ask for it.
-->

Suppose a string $x$ declared in `main` that is used as an argument for a function `helper(x : String)`.
- When we call `helper(x)` in Java, we give `helper` a *reference* to $x$.
- When we call `helper(x)` in Rust, we give `helper` *ownership* of $x$.

> **On Rust's Memory Management**:
> - Unlike malloc and free, memory management is about using and not using variables.
>	- When a function returns, all the data it owns gets dropped.

<details><summary>**Example**: Ownership v.s. Reference</summary>
Let's look at this Rust code:

```rust
fn main() {
	let x = format!("Hello World");
	helper(x);
	helper(x); 
}
fn helper(x : String) {
	println!(x);
}
```

This code cannot compile because when we call `helper` the first time, we give ownership of $x$ to it; and so when helper returns, it drops $x$. As a result, because we try to use $x$ on the second `helper(x)`, we get `error[E0382]: use of moved value`

---

Let's look at this Java code:

```java
void main() {
	Vector x = ...;
	helper(x);
	helper(x); 
}
void helper(Vector x) {
	println!(x);
}
```

In Java, we give access (references) to things rather than ownership, which entangles their states. When `helper` modifies $x$ in Java, it's immediately visible to `main`.

Moreover, we can never know when to free memory; even if `main` exits, due to the possibility of `helper(x)` making threads.

As a result of everything being implicitly shared, data races are a common issue. And since we can't know when things will be freeable until runtime, we just run the garbage collector when we need more memory, which pauses execution and searches for stuff to free.
</details>

# Three Categories of Values

**Non-Copyable**: Values **move** from place to place.
- *e.g., money cannot be cloned, only moved around*

**Clone**: Run custom code to copy a value.
- One way to give a function ownership without losing your copy is to clone what you want to share.
	* You can still move the value around like the non-copy type, but you can also call custom code to clone it. 
- *e.g., Strings and structs*

<details><summary>**Example**: Cloning</summary>
```rust
fn main() {
	let x = format!("Hello World");
	helper(x.clone());
	helper(x); 
}
```
- This is usually not the best way to go about it though. 
</details>

**Copy**: Some basic data types are automatically cloned when you use them, as it's very cheap.
- *e.g., integers and floating points* 

# References

## Compile-Time Read-Write-Lock

You can never have a reader/writer at the same time.

1. Creating a shared reference to $x$ **"read locks"** $x$.
	- Other readers OK.
	- No writers

2. Creating a mutable reference to $x$ **"writes locks"** $x$.
	- No other readers or writers.

Both locks last until their reference goes out of scope.
- So, don't mutate during the lifetime of a borrow.

## Shared Borrows

**Shared Borrow** (`&x`): We can borrow variables to create a reference.
- This is a nice alternative to cloning.
- Shared data is *generally* immutable. (borrowed == immutable)
	- If a lot of functions can use it, they can't all be writing to it.

> **More on Borrowed == Immutable**: 
> 
> Mutation is allowed:
> 1. In controlled scenarios with specific APIs (e.g., mutex), or
> 2. When a `mut` value is shared borrowed, it can't be mutated during the borrow—but regains mutability afterward. *(see "Example: Immutability of Shared Borrows")*

<details><summary>**Example**: Shared Borrow</summary>
As seen in the previous example, this code doesn't compile.

```rust
fn main() {
	let x = format!("Hello World");
	helper(x);
	helper(x); 
}
fn helper(x : String) {
	println!(x);
}
```

In this fix, we **borrow** the string to create a reference and update helper to take a reference to a string.

```rust
fn main() {
	let x = format!("Hello World");
	let r = &x;
	helper(r);
	helper(r); 
}
fn helper(x : &String) {
	println!(x);
}
```
- Q: Why does this work?
	* A: Because `r` is a copy type!
</details>

<details><summary>**Example**: Immutability of Shared Borrows</summary>
This is the code from the previous example, with a key change: We made made x mutable, and even push a character to it.

Shouldn't this not compile because shared referrences are immutable?

```rust
fn main() {
	let mut x = format!("Hello World");
	x.push("a");
	let r = &x;
	helper(r);
	helper(r); 
}
fn helper(x : &String) {
	println!("{}", x);
}
```

The reason the code compiles is that Rust sees `x` as mutable (as we declared it), *until* it gets borrowed.
- Thus, if we try to do a mutation while the variable `r` exists, we'll get errors. 

```rust
// Does not compile (borrowed == immutable)
fn main() {
	let mut x = format!("Hello World");
	let r = &x;
	helper(r);
	helper(r); 
	x.push("a");
}
```

```rust
// Does compile
fn main() {
	let mut x = format!("Hello World");
	{
		let r = &x;
		helper(r);
		helper(r); 
	}
	x.push("a");
}
```
- Note how we can mutate `x` once `r` is out of scope.
</details>

## Mutable Borrows

**Mutable Borrows (`&mut x`):**
- We can only have one copy at a time
- While we have a mutable reference, we cannot access the original variable.

<details><summary>**Example**: Using a Mutable Borrow</summary>

This Rust code uses borrowing to concatenate two strings:

```rust
pub fn main() {
    let (mut str1, str2) = two_words();
    str1 = join_words(str1, str2);
    println!("concatenated string is {:?}", str1);
}
fn two_words() -> (String, String) {
    (format!("fellow"), format!("Rustaceans"))
}
fn join_words(mut prefix: String, suffix: String) -> String {
    prefix.push(' ');
    for ch in suffix.chars() {
        prefix.push(ch);
    }
    prefix
}
```

This is a modification of the code to use borrowing and modify str1 in place:

```rust
pub fn main() {
    let (mut str1, str2) = two_words();
    join_words(&mut str1, &str2);
    println!("concatenated string is {:?}", str1);
}
fn two_words() -> (String, String) {
    (format!("fellow"), format!("Rustaceans"))
}
fn join_words(prefix: &mut String, suffix: &String) {
    prefix.push(' ');
    for ch in suffix.chars() {
        prefix.push(ch);
    }
}
```
</details>
