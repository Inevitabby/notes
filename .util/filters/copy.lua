-- Adds a "Copy" button holding the original code to code blocks

local function escape(text)
  return (text:gsub("&", "&amp;"):gsub('"', "&quot;"):gsub("<", "&lt;"):gsub("\n", "&#10;"))
end

function CodeBlock(block)
  -- Guard: Skip Plantuml blocks
  if block.classes:includes("plantuml") then return nil end

  local button = '<button class="copy" type="button" aria-live="polite" data-code="' .. escape(block.text) .. '" onclick="copyCode(this)">copy</button>'
  return pandoc.Div({ pandoc.RawBlock("html", button), block }, { class = "copyable" })
end
