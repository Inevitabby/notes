local whitelist = {
  ["Example"] = true,
  ["Aside"]   = true,
}

-- Convert "Example" Blockquotes to HTML <details> blocks
function BlockQuote(block)
  -- I. Ensure start is "**<KEY>**:"

  -- Guard: Blockquote must have content and begin with a paragraph element
  if #block.content == 0 or block.content[1].tag ~= "Para" then
    return block
  end

  local first_para = block.content[1]
  local first_inline = first_para.content[1]

  -- Guard: First element must be bold text and be a whitelisted key
  if not first_inline or first_inline.tag ~= "Strong" or 
      #first_inline.content == 0 or 
      first_inline.content[1].tag ~= "Str" or
      not whitelist[first_inline.content[1].text] then
    return block
  end

  -- Guard: Must end with a colon
  if #first_para.content < 2 or
      first_para.content[2].tag ~= "Str" or
      not first_para.content[2].text:match("^:") then
    return block
  end

  -- Guard: Ignore one-liners (no body to collapse)
  if #block.content < 2 then
    return block
  end

  -- II. Surround content in HTML tags and output result

  local result = {
    pandoc.RawBlock("html", "<details><summary>"),
    pandoc.Plain(first_para.content),
    pandoc.RawBlock("html", "</summary>")
  }

  for i = 2, #block.content do
    table.insert(result, block.content[i])
  end

  table.insert(result, pandoc.RawBlock("html", "</details>"))

  return result
end
