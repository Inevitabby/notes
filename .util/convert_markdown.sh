source .util/check_hash.sh

# Convert a Markdown file to minified HTML
function convert_markdown {
	INPUT_FILE=$1
	INPUT_DIR=$2

	# Skip unchanged files
	check_hash "${INPUT_FILE}" "${INPUT_DIR}" && return

	# Console feedback
	printf " - Converting: %s\n" "${INPUT_FILE}"

	# Derive output filename (by stripping extension from input file and appending .html)
	OUTPUT_FILE=$(basename -- "${INPUT_FILE}")
	OUTPUT_FILE="${OUTPUT_FILE%.*}.html"
	#  Special Case: Make README.md the index
	[ "$INPUT_FILE" = "README.md" ] && OUTPUT_FILE="index.html"

	# Additional Pandoc arguments
	# 1. Calculate relative path to public/style.css
	RELATIVE_PATH=$(printf '../%.0s' ${INPUT_DIR//[^\/]/})
	ARGS="--css ${RELATIVE_PATH}style.css"
	#  Special Case: Root-level files
	[ "$INPUT_DIR" = "/" ] && ARGS="--css style.css"
	# 2. Add a Table of Contents to all non-index files
	[ "${OUTPUT_FILE}" != "index.html" ] && ARGS+=" --toc"

	# Create output directory
	OUTPUT_DIR="public/${INPUT_DIR}"
	mkdir -p "${OUTPUT_DIR}"

	# Set Pandoc arguments
	[ "$INPUT_FILE" = "README.md" ] && ARGS+=" -M title=Notes -M noheader=true" # Special Case: Manually set README.md title
	ARGS="${BASE_ARGS} ${ARGS}"

	# Convert Markdown to HTML
	pandoc -i "${INPUT_FILE}" ${ARGS} | minify --type html --quiet --output "${OUTPUT_DIR}/${OUTPUT_FILE}" &
}

