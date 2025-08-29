source .util/generate_search_index.sh
source .util/generate_sitemap.sh
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
	
	# Generate search index and sitemap
	generate_search_index
	generate_sitemap

	wait
	exit
}

# Run cleanup automatically if exiting daemon mode
trap "cleanup" SIGINT
