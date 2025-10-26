# Generate search index from HTML files in public directory
function generate_search_index {
    printf "Generating search index \n"

    local public_dir="./public"
    local index_file="${public_dir}/search-index.js"
    
    # Start file (opener)
    printf "window.searchIndex = [\n" > "$index_file"

    # Generate all JSON objects and do a single write
    (while read -r file; do
        # Get relative path from public directory
        local rel_path="${file#$public_dir/}"
        
        # Extract category, title, and content
        local category=$(dirname "$rel_path")
        [ "$category" = "." ] && category="root" # Special: Handle root files
        local title=$(xmllint --html --xpath 'string(//head/title)' "$file" 2>/dev/null)
        local content=$(xmllint --html --xpath "//body" "$file" 2>/dev/null | \
                        sed "s/<[^>]*>//g" | tr "\n" " " | tr -d "\r" | sed "s/  */ /g" | sed "s/^ *//;s/ *$//")
        
        # Guard: Skip if no title found
        [ -z "$title" ] && continue
        
        # Escape quotes and backslashes
        title=$(printf "%s" "$title" | sed 's/\\/\\\\/g; s/"/\\"/g')
        content=$(printf "%s" "$content" | sed 's/\\/\\\\/g; s/"/\\"/g')
        
        # Print JSON
        printf '  { "title": "%s", "content": "%s", "path": "%s", "category": "%s" }\n' \
            "$title" "$content" "$rel_path" "$category"
    done < <(find "$public_dir" -name "*.html" -type f | sort)) | \
        paste -s -d, - >> "$index_file"
    
    # Close file (closer)
    printf "];" >> "$index_file"
}
export -f generate_search_index
