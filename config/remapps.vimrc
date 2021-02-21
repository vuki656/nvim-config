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

" Coc spellcheck 
nmap <leader>a <Plug>(coc-codeaction-selected)

" Open clipboard history
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>

" Move lines up and down with CTRL+J/K
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Navigate buffers with ALT hjkl
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

