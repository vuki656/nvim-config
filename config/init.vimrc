call plug#begin()

" ====== CORE =============
Plug 'sheerun/vim-polyglot'                                     " Syntax highlighting 
Plug 'neoclide/coc.nvim', {'branch': 'release'}                 " Intellisense

" ====== SEARCH ===========
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }             " Base fzf package
Plug 'junegunn/fzf.vim'                                         " Vim fzf adaptation

" ====== COSMETIC ==========
Plug 'rakr/vim-one'                                             " Theme
Plug 'airblade/vim-gitgutter'                                   " Show git diff in side column

" ====== AIRLINE ===========
Plug 'vim-airline/vim-airline'                                  " Enable airline
Plug 'vim-airline/vim-airline-themes'                           " Enable airline themes 

" ====== NERDTREE ==========
Plug 'Xuyuanp/nerdtree-git-plugin'                              " Tree git diff 
Plug 'preservim/nerdtree'                                       " Tree
Plug 'ryanoasis/vim-devicons'                                   " Tree icons 
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                  " Tree coloring by file type

" ====== QUALITY OF LIFE ====
Plug 'psliwka/vim-smoothie'                                     " Smooth scrolling
Plug 'jiangmiao/auto-pairs'                                     " Automatically add closing bracket

call plug#end()
