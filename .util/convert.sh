source .util/convert_markdown.sh

FIRST_RUN=true
BASE_ARGS="-f markdown+lists_without_preceding_blankline \
	--katex \
	--wrap=preserve \
	--standalone \
	--quiet \
	--template .util/template.html \
	-M document-css=false"

# Add Lua filters to Pandoc arguments
for filter in .util/filters/*.lua; do
	if [ -f "$filter" ]; then
		BASE_ARGS="$BASE_ARGS --lua-filter=$filter"
	fi
done

# Convert Markdown to minified HTML
function convert {
	if [ "$FIRST_RUN" = "true" ]; then
		FIRST_RUN=false
		mkdir -p "public"
		printf "Bundling CSS \n"
		minify --bundle --recursive .util/styles -o ./public/style.css
		printf "Minifying/copying search.html and lunr.js \n"
		minify "./.util/search.html" -o "./public/"
		cp "./.util/lunr.min.js" "./public/"
		minify "./.util/search.js" -o "./public/"
		printf "Copying robots.txt \n"
		cp "./.util/robots.txt" "./public/"
	fi

	# Convert notes
	for INPUT_DIR in "${DIRECTORIES[@]}"; do
		for INPUT_FILE in "${INPUT_DIR}/"*.md
		do
			# Limit number of parallel processes (n=32)
			((i=i%32)); ((i++==0)) && wait 
			convert_markdown "${INPUT_FILE}" "${INPUT_DIR}"
			 # Copy images if present
			if [ -d "${INPUT_DIR}/.images" ]; then
				OUTPUT_DIR="./public/${INPUT_DIR}"
				mkdir -p "${OUTPUT_DIR}"
				cp -r "${INPUT_DIR}/.images" "${OUTPUT_DIR}/"
			fi
		done
	done
	# Convert special files
	convert_markdown "README.md" "/"
	convert_markdown "ABOUT.md" "/"
	wait
}
