#!/usr/bin/env bash
cd "$(dirname "$0")" || exit
BASE_PANDOC_ARGS="-f markdown+lists_without_preceding_blankline --katex --highlight-style=pygments --wrap=preserve --standalone --quiet --template template.html"
N=24 # Number of parallel Pandoc processes
source check_hash.sh
function convert_directory {
	INPUT_DIR="${1}"
	# Convert Markdown to minified HTML
	for INPUT_FILE in "${INPUT_DIR}/markdown/"*
	do
		((i=i%N)); ((i++==0)) && wait
		# Skip conversion if Markdown file hasn't changed
		if check_hash "${INPUT_FILE}" "${INPUT_DIR}"; then
			continue
		fi
		# Determine name of output file
		OUTPUT_FILE=$(basename -- "${INPUT_FILE}")
		OUTPUT_FILE="${OUTPUT_FILE%.*}.html"
		# Add a Table of Contents to all non-index files
		PANDOC_ARGS="${BASE_PANDOC_ARGS}"
		if [ "$OUTPUT_FILE" != "index.html" ]; then
			PANDOC_ARGS+=" --toc"
		fi
		# Convert Markdown to minified HTML
		(eval pandoc "-i \"${INPUT_FILE}\" ${PANDOC_ARGS}" | awk -f "minify.awk") > "${INPUT_DIR}/${OUTPUT_FILE}" &
	done
	# Delete orphaned HTML files and hashes
	for HTML_FILE in "${INPUT_DIR}/"*.html
	do
		MARKDOWN_FILE=$(basename -- "${HTML_FILE}")
		MARKDOWN_FILE="${INPUT_DIR}/markdown/${MARKDOWN_FILE%.*}.md"
		if [ ! -f "${MARKDOWN_FILE}" ]; then
			rm "${HTML_FILE}"
			HASH_FILE=".md5sums/${INPUT_DIR}/$(basename -- "${MARKDOWN_FILE}").hash"
			[ -f "$HASH_FILE" ] && rm "${HASH_FILE}"
		fi
	done
}
convert_directory "cs1300"&
convert_directory "cs1400"&
convert_directory "cs50"&
convert_directory "phl2020"&
(eval pandoc "-i \"README.md\" ${BASE_PANDOC_ARGS}" | awk -f "minify.awk") > "index.html" &
(eval pandoc "-i \"ABOUT.md\" ${BASE_PANDOC_ARGS} --toc" | awk -f "minify.awk") > "about.html" &
wait # Wait for all processes to finish
