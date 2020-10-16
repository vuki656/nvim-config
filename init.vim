syntax on
filetype plugin on

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
set signcolumn=yes			" Auto show sign column (for git diff)
set updatetime=50			" Time after the buffer is saved
set termguicolors			" Set the given color scheme from init file
set nowrap				" Don't wrap text if it goes out of view
set mouse=a				" Enables mouse scrolling

call plug#begin()

Plug 'tpope/vim-fugitive'		" Awesome git integration
Plug 'sheerun/vim-polyglot'      	" Better syntax highlighting
Plug 'vim-airline/vim-airline'   	" Line at the bottom with useful info
Plug 'joshdick/onedark.vim'      	" Onedark color scheme
Plug 'pangloss/vim-javascript'   	" JavaScript support
Plug 'leafgarland/typescript-vim'  	" TypeScript syntax
Plug 'jparise/vim-graphql'              " GraphQL syntax
Plug 'jiangmiao/auto-pairs'             " Automatically add closing bracket
Plug 'airblade/vim-gitgutter'		" Show git diff in side column

Plug 'ThePrimeagen/vim-be-good'		" Practice game

call plug#end()

colorscheme onedark

