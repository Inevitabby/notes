-- Convert Example Blockquotes to HTML details blocks
function BlockQuote(block)
  -- === I. Check if starts with "**Example**:" ===

  --  1. Have content and start with a paragraph
  if #block.content == 0 or block.content[1].tag ~= "Para" then
    return block
  end
  
  local first_para = block.content[1]
  local first_inline = first_para.content[1]
  
  --  2. First inline must be Strong with "Example" text
  if not first_inline or first_inline.tag ~= "Strong" or 
     #first_inline.content == 0 or 
     first_inline.content[1].tag ~= "Str" or
     first_inline.content[1].text ~= "Example" then
    return block
  end
  
  --  3. Almighty colon
  if #first_para.content < 3 or
     first_para.content[2].tag ~= "Str" or
     not first_para.content[2].text:match("^:") then
    return block
  end

  -- === II. Surrounder ===

  -- Create <summary>
  local summary_doc = pandoc.Pandoc({pandoc.Para(first_para.content)})
  local summary_html = pandoc.write(summary_doc, "html", {extensions = {}})
  summary_html = summary_html:gsub("^<p>", ""):gsub("</p>%s*$", "")

  -- Create <details> content
  local details_content = {}
  for i = 2, #block.content do
    table.insert(details_content, block.content[i])
  end

  --  1. Opening tag
  local opening = string.format('<details><summary>%s</summary>', summary_html)
  local result = {pandoc.RawBlock("html", opening)}

  --  2. Add content blocks
  for _, content_block in ipairs(details_content) do
    table.insert(result, content_block)
  end

  --  3. Closing tag
  table.insert(result, pandoc.RawBlock("html", "</details>"))

  return result
end
