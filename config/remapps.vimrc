" Enter command mode
inoremap jj <ESC>

" Find current buffer in tree view
nnoremap <leader>o :NERDTreeFind<CR>

" Toggle tree view
nnoremap <leader>1 :NERDTreeToggle<CR>

" Search git files with FZF
nnoremap <leader>p :GFiles<CR>

" Rotate between the last 2 files
nnoremap <leader>r <C-^>

" Open auto-complete popup 
inoremap <silent><expr> <c-space> coc#refresh()

" Coc spellsheck 
nmap <leader>a <Plug>(coc-codeaction-selected)
