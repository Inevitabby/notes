source .util/convert_markdown.sh

export INITIALIZE=true
export BASE_ARGS="-f markdown+lists_without_preceding_blankline \
	--katex \
	--wrap=preserve \
	--standalone \
	--quiet \
	--template .util/template.html \
	-M document-css=false"
export LOG_LOCKFILE="/tmp/notes.lock"

# Add Lua filters to Pandoc arguments
for filter in .util/filters/*.lua; do
	if [ -f "$filter" ]; then
		BASE_ARGS="$BASE_ARGS --lua-filter=$filter"
	fi
done

# Convert Markdown to minified HTML
function convert {
	if [ "$INITIALIZE" == "true" ]; then
		mkdir -p "public"
		printf "Bundling CSS \n"
		minify --bundle --recursive .util/styles -o ./public/style.css
		printf "Minifying/copying search.html and lunr.js \n"
		minify "./.util/search.html" -o "./public/"
		cp "./.util/lunr.min.js" "./public/"
		minify "./.util/search.js" -o "./public/"
		printf "Copying robots.txt \n"
		cp "./.util/robots.txt" "./public/"
		wait
	fi

	# Convert notes
	for INPUT_DIR in "${DIRECTORIES[@]}"; do
		# Initialize output and mtime directories
		OUTPUT_DIR="./public/${INPUT_DIR}"
		MTIME_DIR="/tmp/.mtimes/${INPUT_DIR}"
		mkdir -p "${OUTPUT_DIR}"
		mkdir -p "${MTIME_DIR}"

		# 1. Convert Markdown
		for INPUT_FILE in "${INPUT_DIR}/"*.md; do
			# Guard: No-match globs
			[ -f "${INPUT_FILE}" ] || continue
			# Limit number of parallel processes (n=256)
			((i=i%256)); ((i++==0)) && wait 
			convert_markdown "${INPUT_FILE}" "${INPUT_DIR}" "${MTIME_DIR}" &
		done
		# 2. Copy images
		if [ -d "${INPUT_DIR}/.images" ]; then
			cp -r "${INPUT_DIR}/.images" "${OUTPUT_DIR}/"
		fi
	done
	# Convert special files
	convert_markdown "README.md" "/" "/tmp/.mtimes//" &
	convert_markdown "ABOUT.md" "/" "/tmp/.mtimes//" &
	wait

	INITIALIZE=false
}
export -f convert
