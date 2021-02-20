" ====== GENERAL =====
let g:smoothie_update_interval=50                                  " Set scroll speed 
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }   " Open FZF in a centered window
let g:indentLine_color_gui="#3b4048"                               " Set indent guideline line color

" ===== AIRLINE ======
let g:airline_theme='one'                                          " Set color scheme 
let g:airline_powerline_fonts=1                                    " Enable fonts (emojis)
let g:airline#extensions#hunks#enabled=0                           " Remove number of diff lines in file 
let g:airline_section_a=airline#section#create(['mode'])           " Display only mode in section A
let g:airline_section_z='%{strftime(" %H:%M")}'                   " Display hour:minute in section Z
let g:airline_section_x=''                                         " Remove everything from section X
let g:airline_section_y=''                                         " Remove everything from section X
let g:airline#extensions#whitespace#checks=[]                      " Remove the trailing whitespace notification
let g:airline_skip_empty_sections=1                                " Don't display empty sections

" ===== NERDTREE =====
let g:NERDTreeShowHidden=1                                         " Show hidden files/dirs in tree view 
let g:NERDTreeMinimalUI=1                                          " Remove clutter
let g:NERDTreeGitStatusUseNerdFonts = 1                            " Use hacked font icons for git status 
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
