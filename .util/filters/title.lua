local first_header = nil
local did_promotion = false
-- Get first top-level header
function Header(el)
  if el.level == 1 and not first_header then
    first_header = pandoc.utils.stringify(el.content)
  end
end
-- Set meta.title if missing
function Meta(meta)
  if not meta.title and first_header then
    meta.title = pandoc.MetaString(first_header)
    meta.noheader = pandoc.MetaString("true")
    did_promotion = true
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
