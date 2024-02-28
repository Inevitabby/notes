#!/usr/bin/env bash
cd "$(dirname "$0")" || exit
INPUT_DIR="cs1300"
PANDOC_ARGS="-f markdown+lists_without_preceding_blankline --katex --highlight-style=pygments --wrap=preserve --standalone"
for INPUT_FILE in "${INPUT_DIR}/markdown/"*
do
	OUTPUT_FILE=$(basename -- "${INPUT_FILE}")
	OUTPUT_FILE="${OUTPUT_FILE%.*}.html"
	eval pandoc "-i \"${INPUT_FILE}\" ${PANDOC_ARGS} -o \"${INPUT_DIR}/${OUTPUT_FILE}\""
done
