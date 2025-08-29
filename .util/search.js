const flavorTexts = [
	"SEARCH FOR [Big Shot] DEALS!! DONT MISS OUT!!",
	"SEARCH NOW AND BECOME A [Big Shot]!",
	"SEARCH NOW!!! BECOME A [Big Shot]!",
];
const input = document.getElementById("searchInput");
if (Math.random() < 0.05) {
	input.placeholder = flavorTexts[Math.floor(Math.random() * flavorTexts.length)];
}

// Initialize Lunr index
let searchIndex;
let documents = {};

// Build the search index
function buildIndex() {
	// Store documents for lookup
	window.searchIndex.forEach((doc, i) => {
		documents[i] = doc;
	});

	// Create Lunr index
	searchIndex = lunr(function() {
		this.ref('id');
		this.field('title', { boost: 5 });
		this.field('content', { boost: 10 });
		this.field('category');

		window.searchIndex.forEach((doc, i) => {
			this.add({
				id: i,
				title: doc.title,
				content: doc.content,
				category: doc.category
			});
		});
	});
}

// Simple query preparation with wildcards
function prepareSearchQuery(query) {
	const terms = query.trim().split(/\s+/);

	return terms.map(term => {
		// Remove existing wildcards
		term = term.replace(/[*]/g, '');

		// Skip empty or very short terms
		if (term.length < 2) {
			return term;
		}

		// Add wildcards for partial matching
		if (term.length >= 3) {
			return `${term}*`;
		} else {
			return term;
		}
	}).join(' ');
}

// Simple search function
function performSearch(query) {
	if (!query.trim()) {
		document.getElementById('results').innerHTML = '';
		return;
	}

	const searchQuery = prepareSearchQuery(query);
	const results = searchIndex.search(searchQuery);
	displayResults(results);
}

// Display search results
function displayResults(results) {
	const resultsDiv = document.getElementById('results');

	if (results.length === 0) {
		resultsDiv.innerHTML = '<div class="no-results">No results found</div>';
		return;
	}

	let html = '';

	results.forEach(result => {
		const doc = documents[result.ref];
		html += `
<div class="result">
<div class="result-title">
<a href="${doc.path}">${doc.title}</a>
</div>
<div class="result-category">${doc.category}</div>
</div>
`;
	});

	resultsDiv.innerHTML = html;
}

// Initialize
document.addEventListener('DOMContentLoaded', function() {
	buildIndex();

	// Set up search input
	const searchInput = document.getElementById('searchInput');
	searchInput.addEventListener('input', function() {
		performSearch(this.value);
	});

	// Add keyboard shortcuts
	searchInput.addEventListener('keydown', function(e) {
		if (e.key === 'Escape') {
			this.value = '';
			document.getElementById('results').innerHTML = '';
		}
	});
});
