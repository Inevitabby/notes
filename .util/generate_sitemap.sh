generate_sitemap() {
	printf "Generating sitemap \n"

	local public_dir="./public"
	local sitemap_file="$public_dir/sitemap.xml"

	{
		echo '<?xml version="1.0" encoding="UTF-8"?>'
		echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
		find "$public_dir" -name "*.html" -type f | sed "s|^$public_dir/\?||" | sort | while read -r file; do
			echo "  <url><loc>https://notes.inevitabby.com/$file</loc></url>"
		done
		echo '</urlset>'
	} > "$sitemap_file"
}
