# Coding Guidelines

**Formatting**:
- *camelCase* everything, but...
	* *UpperCamelCase* `final`, enums, and interfaces.
- Prefer `double` over `float`.
- Follow specification.
- Don't use "unnecessary" variables.
- Use `@overrides` whenever possible.

**Math**:
- Keep formula's in their "standard" order

```java
// Good
public double getPerimeter() {
	return (2.0 * Math.PI * this.radius);
}
// Bad
public double getPerimeter() {
	return (Math.PI * 2.0 * this.radius);
}
```

- When squaring a value, don't use the `Math` library's `Pow` function.
	* You can use `Pow` if the exponent is 3 or greater.
