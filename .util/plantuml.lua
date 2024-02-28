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

