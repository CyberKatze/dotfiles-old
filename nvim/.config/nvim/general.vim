" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  colorscheme dracula
endif

"---------------------------
set autoread      " Reload files changed outside vim
set hidden	"buffer hidden
" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !
set numberwidth=5
"set list listchars=tab:»·,trail:·,nbsp:·
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
set mouse=a
set tabstop=4
set softtabstop=4
set shiftwidth=4
"au BufNewFile,BufRead *.py,*.vhdl
"    \ set textwidth=79 |
"    \ set expandtab |
"    \ set autoindent |
"    \ set fileformat=unix
au BufNewFile,BufRead *.js,*.html,*.css,*.yml
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set ignorecase
set incsearch
set hls
set ruler
"filenams
au BufRead * normal zR

"Conceal half-width space with space
call matchadd('Conceal', '\%u200c', 10, -1, {'conceal':' '})
set conceallevel=2 concealcursor=nv
set termbidi
"Latex
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_general_viewer = 'qpdfview'
