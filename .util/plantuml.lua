-- Turn PlantUML into embedded SVGs
local function convert(uml)
  local final = pandoc.pipe("plantuml", {"-tsvg", "-pipe", "-charset", "UTF8"}, uml)
  return final
end

-- Hack-in CSS variables to create dynamic SVG colors
local function colorHack(svg)
  local cssVariables = {
    ["var(--background-color)"] = "#FFFFFF",
    ["var(--TOC-background-color)"] = "#F1F1F1",
    ["var(--blockquote-text-color)"] = "#181818",
    ["var(--text-color)"] = "#000000",
    ["var(--svg-green)"] = "#ADD1B2",
    ["var(--svg-purple)"] = "#B4A7E5",
  }
  for var, hex in pairs(cssVariables) do
    svg = svg:gsub(hex, var)
  end
  return svg
end

function CodeBlock(block)
  if block.classes[1] == "plantuml" then
    local svg = convert(block.text)
    svg = colorHack(svg)
    return pandoc.RawInline("html", "<center>" .. svg .. "</center>")
  end
end

local function getFileTitle(file)
  -- Read the file content to extract its title
  local handle = io.open(file, "r")
  if not handle then return nil end
  local content = handle:read("*all")
  handle:close()
  -- Try to extract title from YAML metadata (if exists)
  local meta = pandoc.read(content, "markdown").meta
  if meta and meta.title then
    -- Ensure that the title is a string (it should be, but just in case it's an Inlines)
    return pandoc.utils.stringify(meta.title)
  end
  -- Otherwise, fallback to the first-level header (e.g., # Title)
  local first_header = content:match("# ([^\n]+)")
  return first_header or "Untitled"  -- Fallback to "Untitled" if no header is found
end

local function generateTOC()
  local toc_entries = {}
  -- Get the base name of the current file (without directory)
  local current_file_name = PANDOC_STATE.input_files[1]:match("([^/]+)$")
  -- Get the directory where the current file is located
  local dir = PANDOC_STATE.input_files[1]:match("(.*/)")
  if not dir then dir = "./" end
  local p = io.popen('ls "' .. dir .. '"')  
  for file in p:lines() do
    -- Only include .md files, excluding the current file and index.md
    if file:match("%.md$") and file ~= current_file_name and file ~= "index.md" then
      -- Get the title of the file using the getFileTitle function
      local title = getFileTitle(dir .. file) or file -- Fallback to file name if no title found
      -- Create a URL with relative path and change .md to .html
      local url = file:gsub("%.md$", ".html")
      -- Create a link for the file with the title as the link text
      table.insert(toc_entries, pandoc.Plain {
        pandoc.Link(pandoc.Str(title), url) -- Title as the text, URL as the link
      })
    end
  end
  p:close()
  return pandoc.BulletList(toc_entries)
end

-- Replace {{AUTOTOC}} in paragraphs
function Para(elem)
  if #elem.content == 1 and elem.content[1].text == "{{AUTOTOC}}" then
    return generateTOC() -- Return dynamic TOC
  else
    return elem
  end
end
