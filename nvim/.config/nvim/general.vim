" vim:foldmethod=marker

" True Color {{{
" Se
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  colorscheme dracula
endif
" }}}

" General setting {{{
" Trigger autoread when changing buffers or coming back to vim in terminal.
set autoread hidden	"buffer hidden
au FocusGained,BufEnter * :silent! !
set numberwidth=4
set list listchars=tab:»·,trail:·,nbsp:·
set cursorline

 "Open new split panes to right and bottom, which feels more natural
set splitbelow splitright

" Set the system clipboard to "+ and remap to <leader>y
set clipboard=unnamedplus
nnoremap <leader>y "+y

"Open link, or path with graphical app
map gx yiW:!xdg-open <cWORD><CR> <C-r>"  &<CR><CR>

"Start scrolling when we're 8 lines away from margins
set scrolloff=8 sidescrolloff=15 sidescroll=1
set nu nowrap rnu
set mouse=a
set tabstop=2
set ts=2 sts=2 sw=2 expandtab
set smartindent nohlsearch incsearch 
set colorcolumn=80

" Preventing commenting the next line
au BufRead,BufNewFile * set formatoptions=""

" Add space for sign column
set signcolumn=yes

" Give more space for displaying messages
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" Delays and poor user experience.
set updatetime=50

" Search highlighting
set ignorecase
set incsearch
set hls
set ruler

" Disable autofold when reading buffer
au BufRead * normal zR
set nofoldenable

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" }}}

" Relative numbering {{{
" Toggle relative numbering, and set to absolute on loss of focus or insert mode
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

" }}}

" Format base on FileType {{{
" Better use after/ftplugin/ 

"
au BufNewFile,BufRead *.js,*.html,*.css,*.yml
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" set foldmethod=marker for config files
au FileType,BufRead,BufNewFile *.conf,*.vim,*.lua
	\ set foldmethod=marker |

" Latex {{{

" Conceal half-width space with space
au FileType,BufRead,BufNewFile *.tex
	\ call matchadd('Conceal', '‌', 10, -1, {'conceal':'-'}) |
	\ set conceallevel=2 |
	\ set concealcursor=nvi |
	\ set termbidi |
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_general_viewer = 'qpdfview'

" }}}

" }}}

" This add Mark after modificatoin or insertion {{{
let g:detect_mod_reg_state = -1
function! DetectRegChangeAndUpdateMark()
    let current_small_register = getreg('"-')
    let current_mod_register = getreg('""')
    if g:detect_mod_reg_state != current_small_register || 
                \ g:detect_mod_reg_state != current_mod_register
        normal! mM
        let g:detect_mod_reg_state = current_small_register
    endif
endfunction

" Mark I at the position where the last Insert mode occured across the buffer
autocmd InsertLeave * execute 'normal! mI'

" Mark M at the position when any modification happened in the Normal or Insert
" mode
autocmd CursorMoved * call DetectRegChangeAndUpdateMark()
autocmd InsertLeave * execute 'normal! mM'

" }}}
