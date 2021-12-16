if !exists('g:loaded_devicons') | finish | endif

lua << EOF
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
require("nvim-web-devicons").set_icon {
  tex = {
    icon = "",
    color = "#3Db117",
    cterm_color = "58",
    name = "Tex"
  }
}
EOF
