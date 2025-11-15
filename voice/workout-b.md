---
title: "B. Pitch"
---

> Exploring comfortable pitch lift *and* depth.

> **On Notation** — All mentions of 196Hz are stand-ins for 165Hz/175Hz/196Hz, for brevity. This means you should progress upwards with practice.

# B1: Hum pitch

> **Rationale**: Encourage vocal folds to vibrate easily at 196Hz

1. Sit comfortably and be mindful of your body and breathing.
2. Listen to the sound of 196Hz.
3. Now hum "mmmm" with your lips gently together to produce the same pitch for about six seconds.
4. Feel the tickling-buzzing sensation as the voice reaches your lips, and monitor your pitch tuning.

> **Aside** — Remember that digitally-produced tones will always sound different than the human voice.

<!-- **Tip** — You may find it helpful to add a kinaesthetic/visual element to guide your pitch *(e.g., conducting your pitch by gesturing with your hand)*. -->

# B2: Vibrating phone
















































<script>
// Source - https://stackoverflow.com/questions/39200994/how-to-play-a-specific-frequency-with-javascript
// Posted by Giacomo Pigani, modified by community
// Retrieved 2025-11-15, License - CC BY-SA 4.0

// Create Web Audio API Context
var audioCtx = false;
function createContext() {
	audioCtx = new(window.AudioContext || window.webkitAudioContext)();
	audioCtx.volume = 0.42;
}

// Play note
function play(frequency) {
	if (audioCtx == false) createContext();
	var gainNode = audioCtx.createGain();
	var oscillator = audioCtx.createOscillator();
	gainNode.gain.value = 0.42;
	oscillator.type = "sine";
	oscillator.frequency.value = frequency;

	oscillator.connect(gainNode);
	gainNode.connect(audioCtx.destination);

	oscillator.start();
	setTimeout(
		function() {
		oscillator.stop();
	}, 1500);
}

// Make Hz clickable
const regex = /\b(\d+)Hz\b/g;
const nodeFilter = {
	acceptNode(node) {
		if (node.parentElement.tagName === "SCRIPT" || 
				node.parentElement.tagName === "STYLE") {
			return NodeFilter.FILTER_REJECT;
		}
		return NodeFilter.FILTER_ACCEPT;
	}
};
let walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT, nodeFilter, false);
let nodesToProcess = [];
while (walker.nextNode()) {
	nodesToProcess.push(walker.currentNode);
}
for (let node of nodesToProcess) {
	const text = node.nodeValue;
	if (!regex.test(text)) continue;
	regex.lastIndex = 0; 
	const fragment = document.createDocumentFragment();
	let lastIndex = 0;
	let match;
	while ((match = regex.exec(text)) !== null) {
		const frequency = match[1];
		const fullMatch = match[0];
		const beforeText = text.substring(lastIndex, match.index);
		if (beforeText) {
			fragment.appendChild(document.createTextNode(beforeText));
		}
		let link = document.createElement("a");
		link.href = "#";
		link.textContent = fullMatch;
		link.style.cursor = "pointer";
		link.style.textDecoration = "underline";
		link.style.textDecorationStyle = "dotted";

		link.onclick = (e) => {
			e.preventDefault();
			play(parseInt(frequency, 10));
		};

		fragment.appendChild(link);
		lastIndex = regex.lastIndex;
	}

	const afterText = text.substring(lastIndex);
	if (afterText) {
		fragment.appendChild(document.createTextNode(afterText));
	}

	node.parentNode.replaceChild(fragment, node);
}
</script>
