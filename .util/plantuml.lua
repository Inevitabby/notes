-- Turn PlantUML into embedded SVGs
local function convert(uml)
  local final = pandoc.pipe("plantuml", {"-tsvg", "-pipe", "-charset", "UTF8"}, uml)
  return final
end
function CodeBlock(block)
  if block.classes[1] == "plantuml" then
    local svg = convert(block.text)
    return pandoc.RawInline("html", "<center>" .. svg .. "</center>")
  end
end

