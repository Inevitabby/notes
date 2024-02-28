# Overflow

Integers and floats can overflow is you try to use more bits than you have available.

# Integer Overflow

Suppose 3 bits that allow us to count to 7 (`000`). If we try to count to 8 (`1000`) but only have 3 bits, then we will end up with ~~1~~`000`, or just 0. This is integer overflow.

Examples of integer overflow:
- The y2k problem (storing last 2 digits of any year back when memory was expensive)
- The next y2k problem: in 2038, the number representing the seconds since jan 1st 1970 overflow past 32-bits and the date will reset to 1901
	* Solution? Kick the can further, add more bits.
- Boeing airplane needing to be rebooted after 208 days until a software patch was made.
