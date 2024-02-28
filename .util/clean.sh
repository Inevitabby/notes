# Copy existing style file into analysis file
if [ -f "${MANUAL_STYLE_FILE}" ]; then
	cp "${MANUAL_STYLE_FILE}" "${ANALYSIS_STYLE_FILE}"
fi
# Delete orphaned HTML files and hashes
function clean_orphan {
	INPUT_DIR=$1
	HTML_FILE=$2
	MARKDOWN_FILE=$(basename -- "${HTML_FILE}")
	MARKDOWN_FILE="${INPUT_DIR}/markdown/${MARKDOWN_FILE%.*}.md"
	if [ ! -f "${MARKDOWN_FILE}" ]; then
		printf " - Deleting orphan: %s\n" "${MARKDOWN_FILE}"
		rm "${HTML_FILE}"
		HASH_FILE=".md5sums/${INPUT_DIR}/$(basename -- "${MARKDOWN_FILE}").hash"
		[ -f "$HASH_FILE" ] && rm "${HASH_FILE}"
	fi
}
# Extract CSS from <style> tags
function extract_css {
	HTML_FILE=$1
	# Return if file doesn't exist (deleted by clean_orphan)
	if [ ! -f "${HTML_FILE}" ]; then
		return;
	fi
	# Extract CSS
	CSS=$(awk -v RS='</style>' 'RT{gsub(/.*<style[^>]*>/,"");print}' "$HTML_FILE")
	# Skip files that have already been processed
	if [ "$CSS" == "" ]; then
		return;
	fi
	# Append CSS to a style file for further processing
	echo "${CSS}" >> "${STYLE_FILE}"
	# Replace <style> tags in the HTML with a <link> pointing to the style.min.css
	NUM_PARENTS=$(tr -cd '/' <<< "${HTML_FILE}" | wc -c)
	((NUM_PARENTS--))
	RELATIVE_PATH="${STYLE_FILE}"
	for ((i = 0; i < NUM_PARENTS; i++)); do
		RELATIVE_PATH="../${RELATIVE_PATH}"
	done
	sed -i "s|<style>.*<\/style>|<link rel=\"stylesheet\" type=\"text/css\" href=\"${RELATIVE_PATH}\">|" "$HTML_FILE"
	wait
}
function clean {
	INPUT_DIR=$1
	HTML_FILE=$2
	clean_orphan "${INPUT_DIR}" "${HTML_FILE}"
	extract_css "${HTML_FILE}"
}
