" Enter COMMAND mode with Esc 
tnoremap <Esc> <C-\><C-n>

" Start terminal in INSERT mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" Open terminal with leader t 
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <leader>t :call OpenTerminal()<CR>
