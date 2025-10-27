-- Sets the `canonical_url` metadata variable for index files

local base_url = "https://notes.inevitabby.com"

-- Generate and set the canonical URL
function Meta(meta)
  -- Guard: Do nothing if canonical_url is already set
  if meta.canonical_url then
    return meta
  end

  -- I. Get path variables

  local current_file_path = PANDOC_STATE.input_files[1]
  local current_file_name = current_file_path:match("([^/]+)$")
  local canonical_url = ""

  -- Guard: Do nothing for non-index pages
  if not (current_file_name == "index.md" or current_file_name == "README.md") then
    return meta
  end

  -- II. Get canonical URL

  local dir = pandoc.path.directory(current_file_path)
  local canonical_url = ""
  
  if dir == "." then
    -- Case A: Root index file
    canonical_url = base_url .. "/"
  else
    -- Case B: Subdirectory index file
    canonical_url = base_url .. "/" .. dir .. "/"
  end
  
  -- III. Set variable and return

  meta.canonical_url = pandoc.MetaString(canonical_url)
  return meta
end

