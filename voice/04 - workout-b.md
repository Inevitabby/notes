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
var context = false;
function createContext() {
	context = new(window.AudioContext || window.webkitAudioContext)();
}

// Play note
let currOsc = null;
function play(frequency) {
	if (!context) createContext();
	if (currOsc) currOsc.stop();

	const osc = context.createOscillator();
	const gain = context.createGain();

	osc.frequency.value = frequency;
	osc.connect(gain).connect(context.destination);

	gain.gain.setValueAtTime(0, context.currentTime);
	gain.gain.setTargetAtTime(0.42, context.currentTime, 0.02);

	osc.start();
	currOsc = osc;

	setTimeout(() => {
		gain.gain.setTargetAtTime(0, context.currentTime, 0.1);
		setTimeout(() => osc.stop(), 200);
		currOsc = null;
	}, 1250);
}

// Make Hz clickable
const regex = /\b(\d+)Hz\b/g;
const walker = document.createTreeWalker(
	document.body,
	NodeFilter.SHOW_TEXT,
	node => node.parentElement.matches("script, style") 
		? NodeFilter.FILTER_REJECT 
		: NodeFilter.FILTER_ACCEPT
);
const nodesToProcess = [];
while (walker.nextNode()) nodesToProcess.push(walker.currentNode);
for (const node of nodesToProcess) {
	const text = node.nodeValue;
	if (!regex.test(text)) continue;
	regex.lastIndex = 0;
	const fragment = document.createDocumentFragment();
	let lastIndex = 0;
	let match;
	while ((match = regex.exec(text))) {
		const [fullMatch, frequency] = match;
		if (match.index > lastIndex) fragment.append(text.substring(lastIndex, match.index));
		const link = Object.assign(document.createElement("a"), {
			href: "#",
			textContent: fullMatch,
			onclick: e => (e.preventDefault(), play(+frequency))
		});
		Object.assign(link.style, {
			cursor: "pointer",
			textDecoration: "underline",
			textDecorationStyle: "dotted"
		});
		fragment.append(link);
		lastIndex = regex.lastIndex;
	}
	if (lastIndex < text.length) fragment.append(text.substring(lastIndex));
	node.parentNode.replaceChild(fragment, node);
}
</script>
