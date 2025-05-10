# Delete orphaned HTML files and hashes
function clean_orphan {
	INPUT_DIR=$1
	HTML_FILE=$2
	MARKDOWN_FILE=$(basename -- "${HTML_FILE}")
	MARKDOWN_FILE="${INPUT_DIR}/${MARKDOWN_FILE%.*}.md"
	if [ ! -f "${MARKDOWN_FILE}" ]; then
		printf " - Deleting orphan: %s\n" "${MARKDOWN_FILE}"
		rm "${HTML_FILE}"
		HASH_FILE=".md5sums/${INPUT_DIR}/$(basename -- "${MARKDOWN_FILE}").hash"
		[ -f "$HASH_FILE" ] && rm "${HASH_FILE}"
	fi
}
# Clean up a HTML file
function clean {
	INPUT_DIR=$1
	HTML_FILE=$2
	clean_orphan "${INPUT_DIR}" "${HTML_FILE}"
}
