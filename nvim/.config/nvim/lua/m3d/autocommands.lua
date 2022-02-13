vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

" Disable autofold when reading buffer
au BufRead * normal zR

" Format base on FileType {{{
" Better use after/ftplugin/ 

"

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

]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
