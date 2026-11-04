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

-- Render inlines/blocks as an HTML string
local function to_html(blocks)
  return pandoc.write(pandoc.Pandoc(blocks), "html")
end

-- List a course's notes as {file, title, url}:
--  index.md's links first (keeping their order and labels), then unlisted notes by filename
local function get_course_notes(dir)
  local notes, files, exists, listed = {}, {}, {}, {}
  for _, file in ipairs(pandoc.system.list_directory(dir)) do
    if file:match("%.md$") and file ~= "index.md" then
      table.insert(files, file)
      exists[file] = true
    end
  end
  table.sort(files)
  --  I. Linked notes
  local index = io.open(dir .. "/index.md", "r")
  if index then
    pandoc.read(index:read("*all"), "markdown"):walk({ Link = function(link)
      local file = (link.target:gsub("%%20", " ")):match("^([^/:#]+)%.html$")
      file = file and file .. ".md"
      if file and exists[file] and not listed[file] then
        listed[file] = true
        table.insert(notes, { file = file, title = pandoc.utils.stringify(link.content), url = link.target })
      end
    end })
    index:close()
  end
  --  II. Unlisted notes
  for _, file in ipairs(files) do
    if not listed[file] then
      table.insert(notes, { file = file, title = get_title_from_file(dir .. "/" .. file) or file, url = (file:gsub("%.md$", ".html")) })
    end
  end
  return notes
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

      -- Sibling notes: dropdown in the current crumb, plus previous/next links
      local notes, current = get_course_notes(path_parts[1]), 1
      for i, note in ipairs(notes) do
        if note.file == current_file_name then current = i end
      end
      local items = {}
      for i, note in ipairs(notes) do
        items[i] = { pandoc.Plain(i == current and pandoc.Strong(note.title) or pandoc.Link(note.title, note.url)) }
      end
      table.insert(nav_content, ' > <details><summary>' .. current_title .. '</summary>' .. to_html({ pandoc.BulletList(items) }) .. '</details>')

      local prev, next, links = notes[current - 1], notes[current + 1], {}
      if prev then table.insert(links, pandoc.Link("← " .. prev.title, prev.url, "", { rel = "prev" })) end
      table.insert(links, pandoc.Link("↑ Index", "index.html"))
      if next then table.insert(links, pandoc.Link(next.title .. " →", next.url, "", { rel = "next" })) end
      meta.pagination = pandoc.MetaBlocks({ pandoc.RawBlock("html", '<nav id="pagination">' .. to_html({ pandoc.Plain(links) }) .. '</nav>') })
    end
  end
  table.insert(nav_content, '</nav>') -- Closer

  -- Add to metadata
  meta.breadcrumbs = pandoc.MetaInlines({pandoc.RawInline('html', table.concat(nav_content))})
  return meta
end

