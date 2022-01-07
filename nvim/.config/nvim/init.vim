" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim

lua << EOF
-- lua lsp package loads here
global = {}

require('lua-init')
-- a function to print stuff
-- ex- :luado put(vim.loop)
-- or inside lua good to see the object
function _G.put(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end

EOF
runtime ./general.vim
runtime ./maps.vim
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------



