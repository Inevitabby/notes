source .util/generate_search_index.sh
RUNNING=true

# Run conversion on all files
stty -echo
function cleanup() {
	stty echo
	wait

	# Exit manually
	[ "$RUNNING" = false ] && exit
	RUNNING=false

	# Convert all notes from scratch
	printf "\e[1;32mCleaning up HTML files...\e[0m\n"
	rm -rf ".md5sums" "public"
	convert
	
	# Generate search index
	generate_search_index

	wait
	exit
}

# Run cleanup automatically if exiting daemon mode
trap "cleanup" SIGINT
