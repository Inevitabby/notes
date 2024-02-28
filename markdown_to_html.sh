#!/usr/bin/env bash
cd "$(dirname "$0")" || exit
BASE_PANDOC_ARGS="-f markdown+lists_without_preceding_blankline --katex --highlight-style=pygments --wrap=preserve --standalone --quiet --template template.html"
N=24 # Number of parallel Pandoc processes
function convert_directory {
	INPUT_DIR="${1}"
	# Convert Markdown to minified HTML
	for INPUT_FILE in "${INPUT_DIR}/markdown/"*
	do
		((i=i%N)); ((i++==0)) && wait
		OUTPUT_FILE=$(basename -- "${INPUT_FILE}")
		OUTPUT_FILE="${OUTPUT_FILE%.*}.html"
		PANDOC_ARGS="${BASE_PANDOC_ARGS}"
		if [ "$OUTPUT_FILE" != "index.html" ]; then
			PANDOC_ARGS+=" --toc"
		fi
		(
		# Convert Markdown to HTML
		eval pandoc "-i \"${INPUT_FILE}\" ${PANDOC_ARGS}" |
		awk -f "minify.awk"
		) > "${INPUT_DIR}/${OUTPUT_FILE}" &

# The above command is run in the background using "&"
	done
	# Delete orphaned HTML files
	for HTML_FILE in "${INPUT_DIR}/"*.html
	do
		MARKDOWN_FILE=$(basename -- "${HTML_FILE}")
		MARKDOWN_FILE="${INPUT_DIR}/markdown/${MARKDOWN_FILE%.*}.md"
		if [ ! -f "${MARKDOWN_FILE}" ]; then
			rm "${HTML_FILE}"
		fi
	done
}
convert_directory "cs1300"&
convert_directory "cs1400"&
convert_directory "cs50"&
convert_directory "phl2020"&
eval pandoc "-i \"README.md\" ${BASE_PANDOC_ARGS} -o \"index.html\""
wait # Wait for all processes to finish
