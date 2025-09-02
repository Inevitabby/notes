local top_level_headers = {}
local page_links = {}

-- Get all header text
function Header(el)
  if el.level == 1 then
    local header_text = string.lower(pandoc.utils.stringify(el.content))
    table.insert(top_level_headers, header_text)
  end
  return el
end

-- Get all link text
function Link(el)
  local link_text = string.lower(pandoc.utils.stringify(el.content))
  table.insert(page_links, link_text)
  return el
end

function Meta(meta)
  if meta.description then
    return meta
  end

  local current_file_path = PANDOC_STATE.input_files[1]
  local current_file_name = current_file_path:match("([^/]+)$")
  local course = pandoc.path.directory(current_file_path)

  -- Only apply to academic courses  
  if not string.match(course, "%d$") then
    return meta
  end

  local note_title = meta.title and pandoc.utils.stringify(meta.title) or course -- TODO: Use actual title promotion

  local description_text = "Academic notes for " .. string.upper(course) .. ""

  -- I. Describe note
  if current_file_name ~= "index.md" and course ~= "." then
    if meta.title and #top_level_headers > 0 then
      local topics = table.concat(top_level_headers, ", ")
      description_text = description_text .. ". " ..
        " Covers " .. topics .. "."
      meta.description = pandoc.MetaString(description_text)
    end
  -- II. Describe course index
  elseif current_file_name == "index.md" and course ~= "." then
    if #page_links > 0 then
      local topics = table.concat(page_links, ", ")
      description_text = description_text .. 
        " covering " .. topics .. "."
    end
    meta.description = pandoc.MetaString(description_text)
  end

  return meta
end

