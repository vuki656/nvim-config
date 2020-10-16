syntax on

" Unmap arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set number                      	" Show current line number
set relativenumber               	" Show line number relative to line you are on
set incsearch                    	" Enables search results as you type
set smartindent                  	" Enable smart indenting
set spell spelllang=en_us		" Enable spell check and set language
set updatetime=50			" Time after the buffer is saved

call plug#begin()

Plug 'sheerun/vim-polyglot'      	" Better syntax highlighting
Plug 'vim-airline/vim-airline'   	" Line at the bottom with usefull info
Plug 'joshdick/onedark.vim'      	" Onedark color scheme
Plug 'pangloss/vim-javascript'   	" JavaScript support
Plug 'leafgarland/typescript-vim'  	" TypeScript syntax
Plug 'jparise/vim-graphql'              " GraphQL syntax
Plug 'jiangmiao/auto-pairs'             " Automaticaly add closing bracket
Plug 'airblade/vim-gitgutter'		" Show git diff in side column

call plug#end()

" Theme config
set termguicolors
colorscheme onedark

