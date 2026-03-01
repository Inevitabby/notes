local note_count = 0

function Note(el)
  note_count = note_count + 1
  local num_str = tostring(note_count)
  -- 1. Create sidenote content
  local content = pandoc.utils.blocks_to_inlines(el.content)
  table.insert(content, 1, pandoc.Strong(pandoc.Str(num_str .. ". ")))
  -- -- TODO Loosely reuse this backlink logic for a on hover feature
  -- table.insert(content, pandoc.Link(
  --   {pandoc.Str("↩︎")},
  --   "#fnref" .. num_str,
  --   "",
  --   {class="footnote-back", role="doc-backlink"}
  -- ))
  -- 2. Create sidenote span
  local direction = (note_count % 2 == 0) and "right" or "left"
  local sidenote = pandoc.Span(content, { class = "sidenote " .. direction, id = "fn" .. num_str })
  -- 3. Insert sidenote and footnote
  return { el, sidenote }
end
