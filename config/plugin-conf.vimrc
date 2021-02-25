" #####################################################################################
" #----------------------------------- GENERAL ---------------------------------------#
" #####################################################################################


let g:smoothie_update_interval=50                                  " Set scroll speed 
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }   " Open FZF in a centered window
let g:indentLine_color_gui="#3b4048"                               " Set indent guideline line color
let g:smoothie_base_speed=15                                       " Set smoothie scroll speed 
let g:undotree_SetFocusWhenToggle = 1                              " Autofocus undotree on open 
let mapleader = " "                                                " Set leader key to space

" Hide ~ chars from side menus
highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg     


" #####################################################################################
" #----------------------------------- GITGUTTER -------------------------------------#
" #####################################################################################


" Customize indicator characters (mimic intellij side bars with diff colors depending on status )
let g:gitgutter_sign_added = '▊'
let g:gitgutter_sign_modified = '▊'
let g:gitgutter_sign_removed = '▊'
let g:gitgutter_sign_removed_first_line = '▊'
let g:gitgutter_sign_removed_above_and_below = '▊'
let g:gitgutter_sign_modified_removed = '▊'



" #####################################################################################
" #----------------------------------- AIRLINE ---------------------------------------#
" #####################################################################################


let g:airline_theme='one'                                          " Set color scheme 
let g:airline_powerline_fonts=1                                    " Enable fonts (emojis)
let g:airline#extensions#hunks#enabled=0                           " Remove number of diff lines in file 
let g:airline#extensions#whitespace#checks=[]                      " Remove the trailing whitespace notification
let g:airline_skip_empty_sections=1                                " Don't display empty sections
let g:airline_section_a=airline#section#create(['mode'])           " Display only mode in section A
let g:airline_section_c=" "                                        " Empty C section
let g:airline_section_x=" "                                        " Empty X Section
let g:airline_section_z='%{strftime(" %H:%M")}'                   " Display hour:minute in section Z

" Organize sections
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'x', 'z', 'error', 'warning' ]
      \ ]


" #####################################################################################
" #----------------------------------- NERDTREE --------------------------------------#
" #####################################################################################


let g:NERDTreeMinimalUI=1                                          " Remove clutter
let g:NERDTreeGitStatusUseNerdFonts=1                              " Use hacked font icons for git status 
let g:WebDevIconsDefaultFolderSymbolColor="#abb2bf"                " Set folder colors to white
let g:DevIconsEnableFoldersOpenClose=1                             " Enable folder open/close icon change
let g:NERDTreeDirArrowExpandable = ''                              " Remove open state arrow
let g:NERDTreeDirArrowCollapsible = ''                             " Remove closed state arrow

" Set folder name to white
highlight Directory guifg=#abb2bf

" Remove / from folder names
augroup nerdtreehidetirslashes
	autocmd!
	autocmd FileType nerdtree syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
augroup end

" Automatically close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Remove top path section
augroup nerdtreehidecwd
	autocmd!
	autocmd FileType nerdtree setlocal conceallevel=3 | syntax match NERDTreeHideCWD #^[</].*$# conceal
augroup end


" #####################################################################################
" #----------------------------------- COC -------------------------------------------#
" #####################################################################################


let g:coc_global_extensions = [
            \'coc-spell-checker',
            \'coc-css',
            \'coc-cssmodules',
            \'coc-diagnostic',
            \'coc-eslint',
            \'coc-highlight',
            \'coc-html',
            \'coc-docker',
            \'coc-htmlhint',
            \'coc-html-css-support',
            \'coc-json',
            \'coc-markdownlint',
            \'coc-prisma',
            \'coc-spell-checker',
            \'coc-tsserver',
            \'coc-xml',
            \'coc-yaml',
            \'coc-yank',
            \]

" Set the coc error/warn underline to curly line
highlight CocUnderline gui=undercurl term=undercurl

" Set the error underline to custom red
highlight CocErrorHighlight guifg=#e06c75 gui=undercurl term=undercurl

" Set the warning underline to custom yellow
highlight CocWarningHighlight guifg=#e5c07b gui=undercurl term=undercurl


" #####################################################################################
" #----------------------- COC TRASH THAT NEEDS TO BE CHECKED ------------------------#
" #####################################################################################
"  TextEdit might fail if hidden is not set.
set hidden

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

