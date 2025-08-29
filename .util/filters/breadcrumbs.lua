local first_header = nil

-- Get first top-level header
function Header(el)
  if el.level == 1 and not first_header then
    first_header = pandoc.utils.stringify(el)
  end
  return el
end

-- Extract title from markdown file
function get_title_from_file(file_path)
  -- === Get AST ===
  --  1. Read the content of the external file into a string
  local file = io.open(file_path, "r")
  if not file then
    return nil
  end
  local content = file:read("*all")
  file:close()
  --  2. Parse into a new AST
  local external_doc = pandoc.read(content, 'markdown')
  
  -- === Get Title ===
  --  I. Check meta.title
  if external_doc.meta.title then
    local meta_title = pandoc.utils.stringify(external_doc.meta.title)
    if meta_title ~= '' then
      return meta_title
    end
  end
  --  II. Fallback to the first top-level header
  for _, block in ipairs(external_doc.blocks) do
    if block.t == 'Header' and block.level == 1 then
      return pandoc.utils.stringify(block.content)
    end
  end

  return nil
end

-- Generate breadcrumbs
function Meta(meta)
  local current_file_path = PANDOC_STATE.input_files[1]
  local current_file_name = current_file_path:match("([^/]+)$")

  -- Special Case: Skip README
  if current_file_name == "README.md" then
    return meta
  end

  -- Split path into parts
  local path_parts = {}
  for part in current_file_path:gsub("%.md$", ""):gmatch("[^/]+") do
    table.insert(path_parts, part)
  end

  -- Get relative path to README
  local home_path = "../"
  if #path_parts == 1 then
    home_path = "./index.html"
  end

  -- Build HTML
  local nav_content = {'<nav id="breadcrumbs"><a href="' .. home_path .. '">Home</a>'} -- Opener
  local current_title = (meta and meta.title and pandoc.utils.stringify(meta.title)) or first_header or path_parts[2]
  if #path_parts >= 1 then
    if current_file_name == "index.md" or current_file_name == "ABOUT.md" then
      -- Case I: index files
      table.insert(nav_content, ' > ' .. current_title)
    else
      -- Case II: non-index files
      local intermediate_index_path = path_parts[1] .. "/index.md"
      local intermediate_title = get_title_from_file(intermediate_index_path) or path_parts[1]

      table.insert(nav_content, ' > <a href="index.html">' .. intermediate_title .. '</a>')
      table.insert(nav_content, ' > ' .. current_title)
    end
  end
  table.insert(nav_content, '</nav>') -- Closer

  -- Add to metadata
  meta.breadcrumbs = pandoc.MetaInlines({pandoc.RawInline('html', table.concat(nav_content))})
  return meta
end

