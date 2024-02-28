#!/usr/bin/env bash
cd "$(dirname "$0")" || exit
DIRECTORIES=("cs1300" "cs1400" "cs50" "phl2020")
BASE_PANDOC_ARGS="-f markdown+lists_without_preceding_blankline --katex --highlight-style=pygments --wrap=preserve --standalone --quiet --template template.html"
STYLE_FILE="style.min.css"
N=24 # Number of parallel Pandoc processes
source check_hash.sh
# Convert Markdown to minified HTML
for INPUT_DIR in "${DIRECTORIES[@]}"; do
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
done
(eval pandoc "-i \"README.md\" ${BASE_PANDOC_ARGS}" | awk -f "minify.awk") > "index.html" &
(eval pandoc "-i \"ABOUT.md\" ${BASE_PANDOC_ARGS} --toc" | awk -f "minify.awk") > "about.html" &
wait
# Prep temporary style file
TMP_STYLE_FILE="/tmp/${STYLE_FILE}"
cp "${STYLE_FILE}" "${TMP_STYLE_FILE}"
# Clean up output
for INPUT_DIR in "${DIRECTORIES[@]}"; do
	for HTML_FILE in "${INPUT_DIR}/"*.html
	do
		MARKDOWN_FILE=$(basename -- "${HTML_FILE}")
		MARKDOWN_FILE="${INPUT_DIR}/markdown/${MARKDOWN_FILE%.*}.md"
		# I. Delete orphaned HTML files and hashes
		if [ ! -f "${MARKDOWN_FILE}" ]; then
			rm "${HTML_FILE}"
			HASH_FILE=".md5sums/${INPUT_DIR}/$(basename -- "${MARKDOWN_FILE}").hash"
			[ -f "$HASH_FILE" ] && rm "${HASH_FILE}"
		fi
		# II. Generate shared style.css
		CSS=$(awk -v RS='</style>' 'RT{gsub(/.*<style[^>]*>/,"");print}' "$HTML_FILE")
		# Skip files that have already been processed
		if [ "$CSS" == "" ]; then
			continue;
		fi
		# Add any new CSS to a style file in /tmp/ for further processing
		echo "${CSS}" >> "${TMP_STYLE_FILE}"
		# Replace <style> tags in the HTML with a <link> pointing to the style.min.css
		NUM_PARENTS=$(tr -cd '/' <<< "$HTML_FILE" | wc -c)
		RELATIVE_PATH="${STYLE_FILE}"
		for ((i = 0; i < NUM_PARENTS; i++)); do
			RELATIVE_PATH="../${RELATIVE_PATH}"
		done
		sed -i "s|<style>.*<\/style>|<link rel=\"stylesheet\" type=\"text/css\" href=\"${RELATIVE_PATH}\">|" "$HTML_FILE"
	done
done
# Deduplicate the style file in /tmp/ and write it to style.min.css
sort -u -o "${STYLE_FILE}" "${TMP_STYLE_FILE}"
