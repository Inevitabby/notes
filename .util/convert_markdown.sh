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
	# Create output directory
	OUTPUT_DIR="public/${INPUT_DIR}"
	mkdir -p "${OUTPUT_DIR}"
	# Calculate relative path to public/*.css
	RELATIVE_PATH=$(printf '../%.0s' ${INPUT_DIR//[^\/]/})
	PANDOC_ARGS+=" --css ${RELATIVE_PATH}style.css"
	# Convert Markdown to HTML
	(pandoc -i "${INPUT_FILE}" ${PANDOC_ARGS}) > "${OUTPUT_DIR}/${OUTPUT_FILE}" &
}
