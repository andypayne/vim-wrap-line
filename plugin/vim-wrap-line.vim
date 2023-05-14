" Title:        vim-wrap-line
" Description:  A plugin to provide a way to wrap lines (similar to `gq`) when alternatives don't work.
" Last Change:  14 May 2023
" Maintainer:   Andy Payne <https://github.com/andypayne>

if exists("g:loaded_vim-wrap-line")
  finish
endif
let g:loaded_vim-wrap-line = 1

command! -nargs=0 VimWrapLine call vim-wrap-line#WrapLine()
 

" <leader> + q
:nmap <leader>q :call vim-wrap-line#WrapLine()<CR>

