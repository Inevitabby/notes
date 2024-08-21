# Representing Letters in Binary (ASCII)

Because everything is represented in bits, global agreed-upon standards are needed for representing letters and characters.
- Ex: `65` in decimal is equal to the letter `A`; or `01000001 = A`

Question: How does the computer know when we mean `65` or `A`?
- We determine the context with things like prefixes and file formats.

Problem: ASCII is quite US-centric
- Solution: more global standards *(see: Unicode)*

## Measuring Bits

Suppose we send the message: `72 73 33` (`"HI!"`)
* Suppose each char is represented with 8 bits, that's 24 bits to send one message

However, bits are pretty small (physically and mathematically), so we don't usually measure things in bits

- **Byte**: 8 bits
	* The biggest number we can store in a byte is 255 (`11111111`)

## Unicode

256 different unique values for a byte works for English ASCII, but other global standards are needed to support other languages and things like emojis. One solution is **unicode**.

- **Unicode**: Superset of ASCII that supports a wider variety of characters. Supports 8-bit ASCII for backwards compatibility and 16-bits for >65,000 characters and 32-bits for >4 billion characters.
	- Unicode standardizes the description of characters. Manufacturers and companies and font creators and users determine how those characters are displayed.
		* Can lead to miscommunication (e.g., gun vs water gun for the same emoji)
