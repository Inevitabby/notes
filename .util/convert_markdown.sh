source .util/check_hash.sh
# Convert Markdown to minified HTML
function convert_markdown {
	INPUT_FILE=$1
	INPUT_DIR=$2
	# Skip unchanged files
	if check_hash "${INPUT_FILE}" "${INPUT_DIR}"; then
		return
	fi
	# Console feedback
	printf " - Converting: %s\n" "${INPUT_FILE}"
	# Determine name of output file
	OUTPUT_FILE=$(basename -- "${INPUT_FILE}")
	OUTPUT_FILE="${OUTPUT_FILE%.*}.html"
	# Add a Table of Contents to all non-index files
	PANDOC_ARGS="${BASE_PANDOC_ARGS}"
	if [ "${OUTPUT_FILE}" != "index.html" ]; then
		PANDOC_ARGS+=" --toc"
	fi
	# Convert Markdown to minified HTML
	(pandoc -i "${INPUT_FILE}" ${PANDOC_ARGS} | awk -f ".util/minify.awk") > "${INPUT_DIR}/${OUTPUT_FILE}" &
}
