#!/usr/bin/env bash
cd "$(dirname "$0")" || exit
DIRECTORIES=("cs1300" "cs1400" "cs2400" "cs2600" "cs2640" "cs50" "phl2020" "mat1150" "pls2010", "mips")
N=32 # Number of parallel Pandoc processes
BASE_PANDOC_ARGS="-f markdown+lists_without_preceding_blankline --katex --highlight-style=pygments --wrap=preserve --standalone --quiet --template template.html --lua-filter=.util/plantuml.lua"
STYLE_FILE="style.min.css"
RUNNING=true
source .util/convert_markdown.sh
source .util/clean.sh
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
	rm -f "${STYLE_FILE}"
	for INPUT_DIR in "${DIRECTORIES[@]}"; do
		for HTML_FILE in "${INPUT_DIR}/"*.html; do
			clean "${INPUT_DIR}" "${HTML_FILE}"
		done
	done
	wait
	# Deduplicate the analysis style file
	sort -u -o "${STYLE_FILE}" "${STYLE_FILE}"
 	exit
}
trap "cleanup" SIGINT
# Convert Markdown to minified HTML
function convert {
	# Convert notes
	for INPUT_DIR in "${DIRECTORIES[@]}"; do
		for INPUT_FILE in "${INPUT_DIR}/markdown/"*.md
		do
			((i=i%N)); ((i++==0)) && wait # Limit number of parallel processes
			convert_markdown "${INPUT_FILE}" "${INPUT_DIR}"
		done
	done
	# Convert special files
	(pandoc -i "README.md" ${BASE_PANDOC_ARGS} | awk -f ".util/minify.awk") > "index.html" &
	(pandoc -i "ABOUT.md" ${BASE_PANDOC_ARGS} --toc | awk -f ".util/minify.awk") > "about.html" &
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
