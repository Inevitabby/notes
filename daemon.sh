#!/usr/bin/env bash
cd "$(dirname "$0")" || exit
DIRECTORIES=("cs1300" "cs1400" "cs2400" "cs2600" "cs2640" "cs50" "phl2020" "mat1150" "pls2010" "ffmpeg" "sta2260" "cs3560" "cs4800" "cs3650" "cs3110" "trans")
N=32 # Number of parallel Pandoc processes
BASE_PANDOC_ARGS="-f markdown+lists_without_preceding_blankline --katex --highlight-style=pygments --wrap=preserve --standalone --quiet --template template.html -M document-css=false --lua-filter=.util/metadata_fixer.lua --lua-filter=.util/autotoc.lua --lua-filter=.util/plantuml.lua"
RUNNING=true
source .util/convert_markdown.sh
source .util/clean.sh
# Copy style files
cp ".util/style.css" "public/" -u
cp ".util/default.css" "public/" -u
# Cleanup output files on exit
stty -echo
function cleanup() {
	stty echo
	# Stop conversion loop
	RUNNING=false
	wait
	# Convert all notes
	printf "\e[1;32mCleaning up HTML files...\e[0m\n"
	rm -rf ".md5sums"
	convert
	# Clean up outputted files
	for INPUT_DIR in "${DIRECTORIES[@]}"; do
		for HTML_FILE in "public/${INPUT_DIR}/"*.html; do
			clean "${INPUT_DIR}" "${HTML_FILE}"
		done
	done
	wait
	# TODO Minify style files
 	exit
}
trap "cleanup" SIGINT
# Convert Markdown to minified HTML
function convert {
	# Convert notes
	for INPUT_DIR in "${DIRECTORIES[@]}"; do
		for INPUT_FILE in "${INPUT_DIR}/"*.md
		do
			((i=i%N)); ((i++==0)) && wait # Limit number of parallel processes
			convert_markdown "${INPUT_FILE}" "${INPUT_DIR}"
			if [ -d "${INPUT_DIR}/.images" ]; then # Copy images if present
				OUTPUT_DIR="./public/${INPUT_DIR}"
				mkdir -p "${OUTPUT_DIR}"
				cp -r "${INPUT_DIR}/.images" "${OUTPUT_DIR}/"
			fi
		done
	done
	# Convert special files
	ARGS+="${BASE_PANDOC_ARGS} --css default.css --css style.css"
	(pandoc -i "README.md" -M title="Academic Notes" -M noheader="true" ${ARGS} | awk -f ".util/minify.awk") > "public/index.html" &
	(pandoc -i "ABOUT.md" ${ARGS} --toc | awk -f ".util/minify.awk") > "public/about.html" &
	# Wait for all subprocesses to finish
	wait
}
# Oneshot mode
if [[ $1 == "-o" ]]; then
	cleanup
fi
# Conversion loop
printf "\e[1;32mConversion daemon is running...\e[0m\n"
while $RUNNING; do
	convert
	sleep 1
done
