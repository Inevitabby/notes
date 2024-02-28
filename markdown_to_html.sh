#!/usr/bin/env bash
cd "$(dirname "$0")" || exit
PANDOC_ARGS="-f markdown+lists_without_preceding_blankline --katex --highlight-style=pygments --wrap=preserve --standalone"
function convert_directory {
	INPUT_DIR="${1}"
	for INPUT_FILE in "${INPUT_DIR}/markdown/"*
	do
		OUTPUT_FILE=$(basename -- "${INPUT_FILE}")
		OUTPUT_FILE="${OUTPUT_FILE%.*}.html"
		eval pandoc "-i \"${INPUT_FILE}\" ${PANDOC_ARGS} -o \"${INPUT_DIR}/${OUTPUT_FILE}\""
	done
}
convert_directory "cs1300"
convert_directory "cs1400"
