" #####################################################################################
" #----------------------------------- GENERAL ---------------------------------------#
" #####################################################################################

" Enter command mode
inoremap jj <ESC>

" Rotate between the last 2 files
nnoremap <leader>8 <C-^>

" Open open start screen
nnoremap <leader>b :Startify<CR>

" Open clipboard history
nnoremap <silent> <leader>t  :<C-u>CocList -A --normal yank<cr>

" Move lines up and down 
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Navigate buffers 
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k

" Empty folder name color is blue
" Open/close undotree and open/close nerdtree
nnoremap <leader>u :NvimTreeToggle<CR> :UndotreeToggle<CR>

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
" #----------------------------------- FILE TREE -------------------------------------#
" #####################################################################################

" Toggle tree view
nnoremap <C-n> :NvimTreeToggle<CR>

" Find current buffer in tree
nnoremap <leader>o :NvimTreeFindFile<CR> :NvimTreeRefresh<CR>

" #####################################################################################
" #----------------------------------- COC -------------------------------------------#
" #####################################################################################

" Open auto-complete popup 
inoremap <silent><expr> <c-space> coc#refresh()

" Navigate suggestions 
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

