local first_header = nil
-- Get first top-level header
function Header(el)
  if el.level == 1 and not first_header then
    first_header = pandoc.utils.stringify(el)
  end
end
-- Set title if missing
function Meta(meta)
  local current_file_name = PANDOC_STATE.input_files[1]
    and PANDOC_STATE.input_files[1]:match("([^/]+)$")
  -- Use top-level header if meta.title unavailable
  if not meta.title and first_header then
    meta.title = pandoc.MetaString(first_header)
    meta.noheader = pandoc.MetaString("true")
  end
  return meta
end
-- Promote the first top-level Header to h1.title if it's the meta.title
function Pandoc(doc)
  -- Exit if no meta.title
  if not doc.meta.title then
    return nil
  end
  -- Get meta.title
  local meta_title_text = pandoc.utils.stringify(doc.meta.title)
  -- Find the first top-level header
  for _, el in ipairs(doc.blocks) do
    if el.t == 'Header' and el.level == 1 then
      local header_text = pandoc.utils.stringify(el)
      -- Promote if == meta.title
      if header_text == meta_title_text then
        el.classes:insert('title')
      end
      break
    end
  end
  return doc
end

