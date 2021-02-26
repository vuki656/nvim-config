" #####################################################################################
" #----------------------------------- GENERAL ---------------------------------------#
" #####################################################################################

" Enter command mode
inoremap jj <ESC>

" Rotate between the last 2 files
nnoremap <leader>r <C-^>

" Open clipboard history
nnoremap <silent> <leader>t  :<C-u>CocList -A --normal yank<cr>

" Move lines up and down 
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Navigate buffers 
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" Open/close undotree and open/close nerdtree
nnoremap <leader>u :NERDTreeToggle<CR> :UndotreeToggle<CR>

" #####################################################################################
" #----------------------------------- SEARCH ----------------------------------------#
" #####################################################################################

" Search git files
nnoremap <leader>p :GFiles<CR>

" Search all files 
nnoremap <leader>[ :Files<CR>

" Search in files
nnoremap <leader>s :Rg<CR>

" #####################################################################################
" #----------------------------------- NERDTREE --------------------------------------#
" #####################################################################################


" Find current buffer in tree view
nnoremap <leader>o :NERDTreeFind<CR>

" Toggle tree view
nnoremap <leader>1 :NERDTreeToggle<CR>

" Reload nerdtree (get new files) on cursor focus
autocmd BufEnter NERD_tree_* | execute 'normal R'


" #####################################################################################
" #----------------------------------- COC -------------------------------------------#
" #####################################################################################


" Open spellcheck popup
nmap <leader>c <Plug>(coc-codeaction-selected)<CR>

" Open auto-complete popup 
inoremap <silent><expr> <c-space> coc#refresh()

" Navigate suggestions 
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

