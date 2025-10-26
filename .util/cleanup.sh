source .util/generate_search_index.sh
source .util/generate_sitemap.sh
export RUNNING=true

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
	rm -rf "public"
	INITIALIZE=true
	convert
	
	# Generate search index and sitemap
	generate_search_index &
	generate_sitemap &

	wait
	exit
}
export -f cleanup

# Run cleanup automatically if exiting daemon mode
trap "cleanup" SIGINT
