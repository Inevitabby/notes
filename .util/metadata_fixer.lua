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
  if current_file_name == "index.md" and not meta.title and first_header then
    meta.title = pandoc.MetaString(first_header)
    meta.noheader = pandoc.MetaString("true")
  end
  return meta
end
