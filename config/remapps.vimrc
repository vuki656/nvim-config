" #####################################################################################
" #----------------------------------- GENERAL ---------------------------------------#
" #####################################################################################

" Exit with Q
command! Q :q

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

" Open/close undotree and open/close nerdtree
nnoremap <leader>u :NvimTreeToggle<CR> :UndotreeToggle<CR>

" #####################################################################################
" #----------------------------------- SEARCH ----------------------------------------#
" #####################################################################################

" Find files
nnoremap <leader>ff <cmd>Telescope find_files<cr>

" Find text in files
nnoremap <leader>ft <cmd>Telescope live_grep<cr>

" Find git branches
nnoremap <leader>fb <cmd>Telescope git_branches<cr>

" #####################################################################################
" #----------------------------------- FILE TREE -------------------------------------#
" #####################################################################################

" Toggle tree view
nnoremap <C-n> :NvimTreeToggle<CR>

" Find current buffer in tree 
nnoremap <leader>o :NvimTreeFindFile<CR> :NvimTreeRefresh<CR> 

" Collapse all dirs, focus only the opened buffer, and put cursor back to buffer
nnoremap <leader>9 :NvimTreeToggle<CR> :NvimTreeToggle<CR> :NvimTreeFindFile<CR> :execute "normal! \<C-w>l"<CR>

" #####################################################################################
" #----------------------------------- COC -------------------------------------------#
" #####################################################################################

" Applying codeAction to the selected region ("a" is base key)
" => aw => current word
" => ap => current paragraph
" => many others in doc
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Open auto-complete popup 
inoremap <silent><expr> <c-space> coc#refresh()

" Navigate auto-complete suggestions popup
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Fix eslint issues
nnoremap <leader>ef :CocCommand eslint.executeAutofix<CR>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Go to definition
nmap <silent><leader>gd <Plug>(coc-definition)

" See all variable references
nmap <silent><leader>gr <Plug>(coc-references)

" Rename local variable instance 
nmap <leader>rn <Plug>(coc-rename)

" Format selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Open COC fix box for all file problems
nmap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use enter to autoselect the first autocomplete action and put it in buffer
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" COC `:Format` command to format current buffer
command! -nargs=0 Format :call CocAction('format')

" COC Formatter setup
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
