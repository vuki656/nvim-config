" #####################################################################################
" #----------------------------------- GENERAL ---------------------------------------#
" #####################################################################################

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }   " Open FZF in a centered window
let g:indentLine_color_gui="#3b4048"                               " Set indent guideline line color
let g:undotree_SetFocusWhenToggle = 1                              " Autofocus undotree on open 
let mapleader = " "                                                " Set leader key to space
let g:undotree_SplitWidth = 40                                     " Set undotree width

" Hide ~ chars from side menus
highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg     


" #####################################################################################
" #----------------------------------- VIM SMOOTHIE ----------------------------------#
" #####################################################################################


let g:smoothie_break_on_reverse = "true"
let g:smoothie_base_speed = 20
let g:smoothie_update_interval = 30
let g:smoothie_speed_exponentiation_factor = 1.1


" #####################################################################################
" #----------------------------------- STARTIFY --------------------------------------#
" #####################################################################################

 let g:startify_files_number = 5                " Number of files to display for each group

" Categories to display
let g:startify_lists = [
       \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
       \ { 'type': 'dir',       'header': ['   Recent Project Files'. getcwd()] },
       \ { 'type': 'files',     'header': ['   Recent Files']         },
       \ ]

" Bookmarked projects
let g:startify_bookmarks = [
       \ { 'w': '~/.config/nvim/' },
       \ { 'e': '~/Projects/campfire-api/' },
       \ ]

" Don't display the following categories
let g:startify_skiplist = [
        \ '\plugged',
        \ ]


" #####################################################################################
" #----------------------------------- GITGUTTER -------------------------------------#
" #####################################################################################


" Customize indicator characters (state will be destinguished by color) 
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
let g:airline_section_x=" "                                        " Empty X Section
let g:airline_section_c = '%t'                                     " Display file name in section C
let g:airline_section_z='%{strftime(" %H:%M")}'                   " Display hour:minute in section Z

" Organize sections
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'x', 'z', 'error', 'warning' ]
      \ ]


" #####################################################################################
" #----------------------------------- FILE TREE -------------------------------------#
" #####################################################################################

let g:nvim_tree_indent_markers = 1
let g:nvim_tree_side = 'left'                                           " Set position
let g:nvim_tree_auto_close = 1                                          " Auto close if tree is last buffer 
let g:nvim_tree_ignore = [ '.git' ]                                     " Hide dirs
let g:nvim_tree_git_hl = 1                                              " Highlight files depending on git status
let g:nvim_tree_disable_netrw = 1                                       " Disable nvim default tree 

" Set which icons groups to display
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 1,
    \ 'files': 1,
    \ }

" Custom icon mapping
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'empty_open': "",
    \   'empty': "",
    \   'symlink': "",
    \   }
    \ }

" Custom colors
highlight NvimTreeGitNew guifg=#437e54
highlight NvimTreeGitRenamed guifg=#ff8f00
highlight NvimTreeGitDirty guifg=#60aae0
highlight NvimTreeFolderName guifg=#a5afbe
highlight NvimTreeEmptyFolderName guifg=#a5afbe
highlight NvimTreeFolderIcon guifg=#a5afbe

" Prevent cursor from displaying over the icons
augroup HideCursor
  au!
  au WinLeave,FileType NvimTree set guicursor=n-v-c-sm:block,i-ci-ve:ver2u,r-cr-o:hor20,
  au WinEnter,FileType NvimTree set guicursor=n-c-v:block-Cursor/Cursor-blinkon0,
augroup END
au FileType NvimTree hi Cursor blend=100


" #####################################################################################
" #----------------------------------- AUTO SAVE -------------------------------------#
" #####################################################################################

let g:auto_save = 1                                                 " Enable 
let g:auto_save_events = ["CursorHold"]                             " Events that trigger save
let g:auto_save_silent = 1                                          " Don't display a notification after save 
let g:auto_save_write_all_buffers = 1                               " Save all open buffers

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
            \'coc-fzf-preview',
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" #####################################################################################
" #----------------------- COC TRASH THAT NEEDS TO BE CHECKED ------------------------#
" #####################################################################################

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


