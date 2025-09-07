-- Faux lexer for CLRS-style pseudocode

-- These get bolded
local KEYWORDS = {
  "ALGORITHM",
  "if", "then", "else",
  "do", "to", "for", "while",
  "and", "or", "not",
  "return"
}

-- These are normal-ed
local OPERATORS = {
  "<-", "->",
  "<", ">",
  "=", ">=", "<=", "!=",
  "+", "-", "*"
}

-- Defines ASCII-to-KaTeX mappings
local KATEX_MAPPINGS = {
  ["->"] = "rightarrow",  ["<-"] = "leftarrow",
  ["<="] = "le",          [">="] = "ge",
  ["<"] = "lt",           [">"] = "gt",
  ["!="] = "ne",
  ["*"] = "large{*}",          ["-"] = "text{$-$}",    ["+"] = "text{$+$}"
}

-- Insert raw HTML to a table
local function insert_raw_html(elems, tag)
  table.insert(elems, pandoc.RawInline("html", tag))
end

-- Bold/italicize tokens based on simple rules
local function format_token(token)
  -- I. Bold keywords
  for _, keyword in ipairs(KEYWORDS) do
    if keyword == token then
      return pandoc.Span(pandoc.Strong(pandoc.Str(token)), {class = "kw"})
    end
  end
  -- II. Operators stay normal
  for _, operator in ipairs(OPERATORS) do
    if operator == token then
      return KATEX_MAPPINGS[token]
        and pandoc.Math("InlineMath", "\\" .. KATEX_MAPPINGS[token]) -- Special Case: Return KaTeX
        or pandoc.Span(pandoc.Str(token), {class = "op"}) -- Normal: Return span
    end
  end
  -- III. KaTeX-ify all else
  return pandoc.Math("InlineMath", token)
end

-- Format a line
local function format_line(line)
  -- Get indentation and content
  local indent, content = line:match("^(%s*)(.*)$")
  local elems = {}

  -- Opening tag
  insert_raw_html(elems, "<code>")

  -- Add-back indentation
  if #indent > 0 then
    local preserved_indent = string.gsub(indent, " ", "&nbsp;")
    insert_raw_html(elems, preserved_indent)
  end

  -- Split line into tokens
  local tokens = {}
  for token in content:gmatch("%S+") do
    table.insert(tokens, token)
  end

  -- Process token-by-token
  for i, token in ipairs(tokens) do
    table.insert(elems, format_token(token))
    if i < #tokens then
      table.insert(elems, pandoc.Space())
    end
  end

  -- Closing tag
  insert_raw_html(elems, "</code><br />")

  return elems
end

function CodeBlock(block)
  -- Return if not a clrs code block
  if block.classes[1] ~= "clrs" then return nil end

  local elems = {}

  -- Opening tag
  insert_raw_html(elems, "<div class='sourceCode'><pre class='sourceCode'>")

  -- Split text into lines
  local text_with_newline = block.text .. "\n"
  for line in text_with_newline:gmatch("([^\n]*)\n") do
    -- Special Case: Comments
    if line:match("^%s*//") then
      table.insert(elems, pandoc.Span(pandoc.Code(line), {class = "co"}))
      insert_raw_html(elems, "<br />")
      goto continue
    end

    -- Process line and add to output
    for _, elem in ipairs(format_line(line)) do
      table.insert(elems, elem)
    end

    ::continue::
  end

  -- Closing tag
  insert_raw_html(elems, "</pre></div>")

  return pandoc.Span(elems)
end
