#!/usr/bin/env bash
cd "$(dirname "$0")" || exit
PANDOC_ARGS="-f markdown+lists_without_preceding_blankline --katex --highlight-style=pygments --wrap=preserve --standalone --quiet"
N=16 # Number of parallel Pandoc processes
function convert_directory {
	INPUT_DIR="${1}"
	for INPUT_FILE in "${INPUT_DIR}/markdown/"*
	do
		((i=i%N)); ((i++==0)) && wait
		OUTPUT_FILE=$(basename -- "${INPUT_FILE}")
		OUTPUT_FILE="${OUTPUT_FILE%.*}.html"
		eval pandoc "-i \"${INPUT_FILE}\" ${PANDOC_ARGS} -o \"${INPUT_DIR}/${OUTPUT_FILE}\""&
	done
}
convert_directory "cs1300"&
convert_directory "cs1400"&
convert_directory "cs50"&
convert_directory "phl2020"&
eval pandoc "-i \"README.md\" ${PANDOC_ARGS} -o \"index.html\""
wait < <(jobs -p) # Wait for all processes to finish
