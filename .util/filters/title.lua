local first_header = nil
local did_promotion = false
-- Get first top-level header
function Header(el)
  if el.level == 1 and not first_header then
    first_header = pandoc.utils.stringify(el.content)
  end
end
-- Set title
function Meta(meta)
  -- Set meta.title if missing
  if not meta.title and first_header then
    meta.title = pandoc.MetaString(first_header)
    meta.noheader = pandoc.MetaString("true")
    did_promotion = true
  end
  -- Set meta.course (used in template.html)
  local current_file_path = PANDOC_STATE.input_files[1]
  local current_file_name = current_file_path:match("([^/]+)$")
  local course = pandoc.path.directory(current_file_path)
  if current_file_name ~= "index.md" and course ~= "." then
    meta.course = pandoc.MetaString(string.upper(course))
  end
  return meta
end
-- Promote the first top-level Header if there was no meta.title
function Pandoc(doc) 
  if did_promotion then
    for _, block in ipairs(doc.blocks) do
      if block.t == "Header" and block.level == 1 then
        block.classes:insert("title")
        break
      end
    end
  end
  return doc
end
