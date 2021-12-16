" Status line
if !exists('*fugitive#statusline')
  set statusline=%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[L%l/%L,C%03v]
  set statusline+=%=
  set statusline+=%{fugitive#statusline()}
endif

"cnoreabbrev g Git
"cnoreabbrev gopen GBrowse

nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
