" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  colorscheme dracula
endif

"---------------------------
set autoread      " Reload files changed outside vim
" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !
set numberwidth=5
set list listchars=tab:»·,trail:·,nbsp:·
set cursorline

 "Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

"Toggle relative numbering, and set to absolute on loss of focus or insert mode
set nu
set rnu
function! ToggleNumbersOn()
    set nu
    set rnu!
endfunction
function! ToggleRelativeOn()
    set rnu
endfunction
autocmd FocusLost * call ToggleNumbersOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleNumbersOn()
autocmd InsertLeave * call ToggleRelativeOn()

"--------------------------------
"

