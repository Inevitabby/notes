# Generate search index from HTML files in public directory
function generate_search_index {
    local public_dir="./public"
    local index_file="$public_dir/search-index.js"
    
    printf "Generating search index"
    
    # Start the JavaScript file
    cat > "$index_file" << 'EOF'
window.searchIndex = [
EOF
    
    # Track if we need comma separation
    local first_file=true
    
    # Process all HTML files
    find "$public_dir" -name "*.html" -type f | sort | while read -r file; do
        # Get relative path from public directory
        local rel_path="${file#$public_dir/}"
        
        # Extract directory for category (handle root files)
        local category=$(dirname "$rel_path")
        if [ "$category" = "." ]; then
            category="root"
        fi
        
        # Extract title from HTML (between <title> tags)
        local title=$(grep -o '<title>[^<]*</title>' "$file" 2>/dev/null | sed 's/<title>\(.*\)<\/title>/\1/')
        
        # Extract text content (strip HTML tags, normalize whitespace)
        local content=$(sed 's/<[^>]*>//g' "$file" | tr '\n' ' ' | sed 's/  */ /g' | sed 's/^ *//;s/ *$//')
        
        # Skip if no title found
        if [ -z "$title" ]; then
            continue
        fi
        
        # Add comma if not first file
        if [ "$first_file" = false ]; then
            echo "," >> "$index_file"
        fi
        first_file=false
        
        # Escape quotes and backslashes for JSON
        title=$(echo "$title" | sed 's/\\/\\\\/g; s/"/\\"/g')
        content=$(echo "$content" | sed 's/\\/\\\\/g; s/"/\\"/g')
        
        # Add entry to index
        printf '  {\n    "title": "%s",\n    "content": "%s",\n    "path": "%s",\n    "category": "%s"\n  }' "$title" "$content" "$rel_path" "$category" >> "$index_file"
    done
    
    # Close the JavaScript array
    echo "" >> "$index_file"
    echo "];" >> "$index_file"
    
    printf "\n"
}
