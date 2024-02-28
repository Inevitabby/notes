---
title: Midterm I Review
---
<!--
# vim: ft=markdown
-->

<noscript>
	<h1 style="color:red">THIS PAGE USES JAVASCRIPT TO GENERATE QUESTIONS, PLEASE TURN ON JAVASCRIPT!</h1>
	$$:($$
	<!--^ An exceedingly silly way to tell Pandoc to include KaTeX in the header-->
</noscript>

# Number Systems & Conversions

> **Notes**: [Number Systems and Conversions (CS2640)](https://inevitabby.codeberg.page/notes/cs2640/02%20-%20Number%20Systems%20and%20Conversions.html)

## Decimal to Binary

**Q1**: Convert <span id="q1" class="math inline"></span> to binary.

<details>
<summary>Answer</summary>
<p id="a1"></p>
</details>

**Q2**: Convert <span id="q2" class="math inline"></span> to binary.

<details>
<summary>Answer</summary>
<p id="a2"></p>
</details>

**Q3**: Convert <span id="q3" class="math inline"></span> to binary.

<details>
<summary>Answer</summary>
<p id="a3"></p>
</details>

## Binary to Decimal

**Q4**: Convert <span id="q4" class="math inline"></span> to decimal.

<details>
<summary>Answer</summary>
<p id="a4"></p>
</details>

**Q5**: Convert <span id="q5" class="math inline"></span> to decimal.

<details>
<summary>Answer</summary>
<p id="a5"></p>
</details>

**Q6**: Convert <span id="q6" class="math inline"></span> to decimal.

<details>
<summary>Answer</summary>
<p id="a6"></p>
</details>

## Binary to Hexadecimal

**Q7**: Convert <span id="q7" class="math inline"></span> to hexadecimal.

<details>
<summary>Answer</summary>
<p id="a7"></p>
</details>

**Q8**: Convert <span id="q8" class="math inline"></span> to hexadecimal.

<details>
<summary>Answer</summary>
<p id="a8"></p>
</details>

**Q9**: Convert <span id="q9" class="math inline"></span> to hexadecimal.

<details>
<summary>Answer</summary>
<p id="a9"></p>
</details>

## Positional Notation

**Q10**: Rewrite <span id="q10" class="math inline"></span> in positional notation.

<details>
<summary>Answer</summary>
<p id="a10"></p>
</details>

**Q11**: Rewrite <span id="q11" class="math inline"></span> in positional notation.

<details>
<summary>Answer</summary>
<p id="a11"></p>
</details>

**Q12**: Rewrite <span id="q12" class="math inline"></span> in positional notation.

<details>
<summary>Answer</summary>
<p id="a12"></p>
</details>

**Q13**: Rewrite <span id="q13" class="math inline"></span> in positional notation.

<details>
<summary>Answer</summary>
<p id="a13"></p>
</details>

## Binary Range

**Q14**: How many bits do you need to represent <span id="q14" class="math inline"></span> values?

<details>
<summary>Answer</summary>
<p id="a14"></p>
</details>

**Q15**: What is the biggest number you can represent with <span id="q15" class="math inline"></span> bits?

<details>
<summary>Answer</summary>
<p id="a15"></p>
</details>

## Binary Groupings

**Q16**: What is the smallest addressable unit of information<!-- in most computers-->?

<details>
<summary>Answer</summary>
Byte
</details>

**Q17**: What is a byte?

<details>
<summary>Answer</summary>
8 consecutive bits
</details>

**Q18**: What is a word?

<details>
<summary>Answer</summary>
4 consecutive bytes
</details>

# Binary Operations

## Bit Shifts

**Q19**: What happens to a binary number when you shift left <span id="q19" class="math inline"></span> bits?

<details>
<summary>Answer</summary>
<p id="a19"></p>
</details>

**Q20**: What is the difference between logical and arithmetic shift?

<details>
<summary>Answer</summary>
- Logical shift sets the MSBit to zero.
- Arithmetic shift duplicates the MSBit.
</details>

**Q21**: Which shift should you use to divide a <span id="q21" class="math inline"></span> integer?

<details>
<summary>Answer</summary>
<p id="a21"></p>
</details>


<!--
Which is NOT a main functional unit of the CPU?
a. Register File
b. Memory Unit (x)
c. Control Unit
d. Arithmetic and Logic Unit

During the execution of a program, what is the primary function of the PC (Program Counter)?
a. It stores the result of each instruction.
b. It maintains a count of the clock cycles.
It manages the CPU's power supply
c. It keeps track of the memory address of the next instruction. (x)

Which of the following statements best describes the von Neumann architecture?
a. It features separate memory units for data and instructions
b. It allows parallel processing of data and instructions
c. It uses a single memory unit for both data and instructions (x)
d. It relies solely on cache memory for data storage.

What are the three phases of the execution cycle in the CPU? What registers are used in each phase?
1. Fetch
	- PC
	- IR
2. Decode
	- IR
3. Execute
	- REGS
	- PC
	- IR
-->

<script>

// === General-Purpose Utility Functions ===

// Group digits into n-digit groups
function formatGroup(num, n = 4) {
	while (num.length % n != 0) {
		num = "0" + num;
	}
	return num.match(new RegExp(`.{1,${n}}`, 'g')).join(" ");
}
// Generate a random integer [min, max].
function rand(min = 0, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

// === LaTeX Solution Generator Functions ===

const Solution = {
	renderTex: function (formula, elem) {
		katex.render(formula, elem, {
			throwOnError: false
		});
	},
	decimalToBinary: function (decimal, elem) {
		const ORIGINAL_DECIMAL = decimal;
		const FORMATTED_BINARY = formatGroup(decimal.toString(2));
		// Write TeX to perform successive division 
		let solution = "";
		while (decimal != 0) {
			const START = decimal;
			const RESULT = Math.floor(START / 2);
			const REMAINDER = START % 2;
			solution += `${START} \\div 2 &= ${RESULT}&r \\quad ${REMAINDER} \\\\`;
			decimal = RESULT;
		}
		this.renderTex(String.raw`
			\text{
				${ORIGINAL_DECIMAL}$_{10}$ $=$ ${FORMATTED_BINARY}$_2$
			} \\~\\ 
			\begin{aligned}
				${solution}
			\end{aligned}
		`, elem);
	},
	binaryToDecimal: function (binary, elem) {
		const DECIMAL_ANSWER = parseInt(binary, 2);
		const FORMATTED_BINARY = formatGroup(binary);
		// Write TeX
		let solution1 = "";
		let solution2 = "";
		for (let i = binary.length - 1; i >= 0; i--) {
			if (binary[i] == "0") {
				continue;
			}
			const POW = (binary.length - 1) - i;
			solution1 = `2^{${POW}}` + solution1;
			solution2 = Math.pow(2, POW) + solution2;
			if (i != 0) {
				solution1 = " + " + solution1;
				solution2 = " + " + solution2;
			}
		}
		this.renderTex(String.raw`
			\text{
				${FORMATTED_BINARY}$_2$ $=$ ${DECIMAL_ANSWER}$_{10}$
			} \\~\\ 
			\begin{aligned}
				${solution1} &= ${solution2} \\ &= ${DECIMAL_ANSWER}
			\end{aligned}
		`, elem);
	},
	binaryToHexadecimal: function (binary, elem) {
		const ANSWER = parseInt(binary, 2).toString(16);
		const FORMATTED_BINARY = formatGroup(binary);
		this.renderTex(String.raw`
			\text{
				${FORMATTED_BINARY}$_2$ $=$ ${ANSWER}$_{16}$
			} \\~\\ 
		`, elem);
	},
	positionalNotation: function (num, base, elem) {
		// Write TeX
		let solution = "";
		const NUM_LEN = num.toString().length;
		for (let i = NUM_LEN - 1; i >= 0; i--) {
			const DIGIT = parseInt(num.toString()[i]);
			const POW = NUM_LEN - 1 - i;
			solution = `(${DIGIT} \\times ${base}^{${POW}})` + solution;
			if (i != 0) {
				solution = " + " + solution;
			}
		}
		this.renderTex(String.raw`
			${num} = ${solution}
		`, elem);
	},
	bitRangeValues: function (x, elem) {
		const RESULT = Math.ceil( Math.log(x) / Math.log(2) );
		this.renderTex(String.raw`
			\text{${RESULT}}
		`, elem);
	},
	bitRangeMax: function (x, elem) {
		const RESULT = Math.pow(2,x) - 1;
		this.renderTex(String.raw`
			\text{${RESULT}}
		`, elem);
	},
	leftShift: function (x, elem) {
		const RESULT = Math.pow(2,x);
		elem.innerText = `The number is multiplied by ${RESULT}`;
	},
	whichShift: function (x, elem) {
		if (x == "signed") {
			elem.innerText = "Arithmetic shift";
		} else {
			elem.innerText = "Logical shift";
		}
	},
}
// === Problem-Generation Functions ===

const Problem = {
	questionElem: null,
	answerElem: null,
	index: 0,
	updateElem: function (index, question = "") {
		this.questionElem = document.querySelector("#q" + index);
		this.questionElem.textContent = question;
		this.answerElem = document.querySelector("#a" + index);
	},
	decimalToBinary: function (index, min, max) {
		const RAND_INT = rand(min, max);
		this.updateElem(index, RAND_INT);
		Solution.decimalToBinary(RAND_INT, this.answerElem);
	},
	binaryToDecimal: function (index, min, max) {
		const RAND_BINARY = rand(min, max).toString(2);
		this.updateElem(index, formatGroup(RAND_BINARY));
		Solution.binaryToDecimal(RAND_BINARY, this.answerElem);
	},
	binaryToHexadecimal: function (index, min, max) {
		const RAND_BINARY = rand(min, max).toString(2);
		this.updateElem(index, formatGroup(RAND_BINARY));
		Solution.binaryToHexadecimal(RAND_BINARY, this.answerElem);
	},
	positionalNotation: function (index, base, min, max) {
		let RAND_NUM = rand(min, max);
		this.updateElem(index, RAND_NUM);
		if (base == 2) {
			this.questionElem.textContent = formatGroup(RAND_NUM.toString(2));
			Solution.positionalNotation(RAND_NUM.toString(2), base, this.answerElem);
		} else {
			Solution.positionalNotation(RAND_NUM, base, this.answerElem);
		}
	},
	bitRangeValues: function (index, min, max) {
		const RAND_INT = rand(min, max);
		this.updateElem(index, RAND_INT);
		Solution.bitRangeValues(RAND_INT, this.answerElem);
	},
	bitRangeMax: function (index, min, max) {
		const RAND_INT = rand(min, max);
		this.updateElem(index, RAND_INT);
		Solution.bitRangeMax(RAND_INT, this.answerElem);
	},
	leftShift: function (index, min, max) {
		const RAND_INT = rand(min, max);
		this.updateElem(index, RAND_INT);
		Solution.leftShift(RAND_INT, this.answerElem);
	},
	whichShift: function (index) {
		const RAND_CHOICE = Math.random() < 0.5 ? "signed" : "unsighed";
		this.updateElem(index, RAND_CHOICE);
		Solution.whichShift(RAND_CHOICE, this.answerElem);
	},
}
// === Generate Problems ===
window.addEventListener('load', function () {
	Problem.decimalToBinary(1, 0, 256);
	Problem.decimalToBinary(2, 256, 512);
	Problem.decimalToBinary(3, 512, 1024);
	Problem.binaryToDecimal(4, 0, 128);
	Problem.binaryToDecimal(5, 128, 256);
	Problem.binaryToDecimal(6, 256, 512);
	Problem.binaryToHexadecimal(7, 0, 512);
	Problem.binaryToHexadecimal(8, 512, 32768);
	Problem.binaryToHexadecimal(9, 32768, 262144);
	Problem.positionalNotation(10, 10, 0, 256);
	Problem.positionalNotation(11, 10, 256, 512);
	Problem.positionalNotation(12, 2, 0, 16);
	Problem.positionalNotation(13, 2, 16, 32);
	Problem.bitRangeValues(14, 1, 64);
	Problem.bitRangeMax(15, 1, 6);
	Problem.leftShift(19, 1, 3);
	Problem.whichShift(21);
});
</script>
