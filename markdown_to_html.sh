#!/usr/bin/env bash
cd "$(dirname "$0")" || exit
INPUT_DIR="markdown"
PANDOC_ARGS="-f markdown+lists_without_preceding_blankline --katex --highlight-style=pygments --wrap=preserve --standalone"
for INPUT_FILE in "$INPUT_DIR"/*
do
	OUTPUT_FILE=$(basename -- "${INPUT_FILE}")
	OUTPUT_FILE="${OUTPUT_FILE%.*}.html"
	eval pandoc "-i \"${INPUT_FILE}\" ${PANDOC_ARGS} -o \"${OUTPUT_FILE}\""
done
