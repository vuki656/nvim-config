call plug#begin()

" #####################################################################################
" #----------------------------------- CORE ------------------------------------------#
" #####################################################################################

Plug 'sheerun/vim-polyglot'                                     " Syntax highlighting 
Plug 'tpope/vim-fugitive'                                       " Git command integration directly into vim
Plug 'mbbill/undotree'                                          " Better undo history
Plug 'rakr/vim-one'                                             " Theme
Plug 'airblade/vim-gitgutter'                                   " Show git diff in side column

" #####################################################################################
" #----------------------------------- COC -------------------------------------------#
" #####################################################################################

Plug 'neoclide/coc.nvim', { 'branch': 'release' }               " Intellisense
Plug 'kevinoid/vim-jsonc'                                       " Intellisense for coc config file 

" #####################################################################################
" #----------------------------------- SEARCH ----------------------------------------#
" #####################################################################################

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }             " Base fzf package
Plug 'junegunn/fzf.vim'                                         " Vim fzf adaptation


" #####################################################################################
" #----------------------------------- AIRLINE ---------------------------------------#
" #####################################################################################

Plug 'vim-airline/vim-airline'                                  " Enable airline
Plug 'vim-airline/vim-airline-themes'                           " Enable airline themes 

" #####################################################################################
" #----------------------------------- NERDTREE --------------------------------------#
" #####################################################################################

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" #####################################################################################
" #----------------------------------- QUALITY OF LIFE -------------------------------#
" #####################################################################################

Plug 'jiangmiao/auto-pairs'                                     " Automatically add closing bracket
Plug 'airblade/vim-rooter'                                      " Change working dir to project root (enables nerdtree to be opened in project root)
Plug 'Yggdroot/indentLine'                                      " Indent guide lines
Plug 'psliwka/vim-smoothie'                                     " Smooth scrolling
Plug 'tpope/vim-commentary'                                     " Comment code blocks 
Plug 'mhinz/vim-startify'                                       " Nice looking home screen

" #####################################################################################
" #----------------------------------- OTHER -----------------------------------------#
" #####################################################################################

Plug 'pantharshit00/vim-prisma'                                 " Prisma support

call plug#end()
