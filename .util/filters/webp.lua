-- Points images at the optimized WebP copies made by convert.sh

local function to_webp(url)
  local base, ext = url:match("^(.*%.images/[^/]+)%.(%a+)$")
  if ext == "jpg" or ext == "png" or ext == "gif" then
    return base .. ".webp"
  end
  return url
end

function Image(img)
  img.src = to_webp(img.src)
  return img
end

function Link(link)
  link.target = to_webp(link.target)
  return link
end
