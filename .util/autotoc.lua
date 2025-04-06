-- Returns file's meta.title or first top-level header
local function getFileTitle(file)
  local handle = io.open(file, "r")
  if not handle then return nil end
  local content = handle:read("*all")
  handle:close()
  -- 1. Try to extract title from YAML metadata (if exists)
  local meta = pandoc.read(content, "markdown").meta
  if meta and meta.title then
    return pandoc.utils.stringify(meta.title)
  end
  -- 2. Fallback to first header
  local first_header = content:match("# ([^\n]+)")
  return first_header or "Untitled"
end

-- Generate table of contents
local function generateTOC()
  local toc_entries = {}
  local current_file_name = PANDOC_STATE.input_files[1]:match("([^/]+)$")
  local dir = PANDOC_STATE.input_files[1]:match("(.*/)")
  if not dir then dir = "./" end
  local p = io.popen('ls "' .. dir .. '"')  
  for file in p:lines() do
    -- Iterate over .md files, excluding index.md
    if file:match("%.md$") and file ~= current_file_name and file ~= "index.md" then
      local title = getFileTitle(dir .. file) or file
      local url = file:gsub("%.md$", ".html")
      -- Create a link for the file with the title as the link text
      table.insert(toc_entries, pandoc.Plain {
        pandoc.Link(pandoc.Str(title), url)
      })
    end
  end
  p:close()
  return pandoc.BulletList(toc_entries)
end

-- Replace {{AUTOTOC}}
function Para(elem)
  if #elem.content == 1 and elem.content[1].text == "{{AUTOTOC}}" then
    return generateTOC()
  else
    return elem
  end
end

