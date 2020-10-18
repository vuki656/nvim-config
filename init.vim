syntax on
filetype plugin on

" Unmap arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set number                      				" Show current line number
set relativenumber               				" Show line number relative to line you are on
set incsearch                    				" Enables search results as you type
set smartindent                  				" Enable smart indenting
set spell spelllang=en_us					" Enable spell check and set language
set signcolumn=yes						" Auto show sign column (for git diff)
set updatetime=50						" Time after the buffer is saved
set termguicolors						" Set the given color scheme from init file
set nowrap							" Don't wrap text if it goes out of view
set mouse=a							" Enables mouse scrolling
set noswapfile							" Disable swap files

call plug#begin()

Plug 'tpope/vim-fugitive'					" Awesome git integration
Plug 'sheerun/vim-polyglot'      				" Better syntax highlighting
Plug 'vim-airline/vim-airline'   				" Enable airline (bottom bar with useful info)
Plug 'vim-airline/vim-airline-themes'				" Enable airline themes 
Plug 'joshdick/onedark.vim'      				" Onedark color scheme
Plug 'pangloss/vim-javascript'   				" JavaScript support
Plug 'leafgarland/typescript-vim'  				" TypeScript syntax
Plug 'jparise/vim-graphql'    	                		" GraphQL syntax
Plug 'jiangmiao/auto-pairs'         				" Automatically add closing bracket
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }		" Base fzf package
Plug 'junegunn/fzf.vim'						" Vim fzf adaptation
Plug 'airblade/vim-gitgutter'				 	" Show git diff in side column
Plug 'valloric/youcompleteme'				 	" Autcompletion

Plug 'ThePrimeagen/vim-be-good'				 	" Practice game

call plug#end()

let mapleader = " "						 " Set leader key to space
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } } " Open FZF in a centered window

" Airline config
let g:airline_theme='onedark'					 " Set font
let g:airline_powerline_fonts = 1         			 " Enable fonts (emojis)
let g:airline#extensions#hunks#enabled=0 			 " Remove number of diff lines in file 
let g:airline_section_a=airline#section#create(['mode'])	 " Display only mode in section A
let g:airline_section_z='%{strftime(" %H:%M")}'      		 " Display hour:minute in section Z
let g:airline_section_y=' %-0.30{getcwd()}'			 " Display current working directory
let g:airline_section_x=''					 " Remove everything from section X
let g:airline_skip_empty_sections = 1			 	 " Don't display empty sections
let g:airline#extensions#whitespace#checks=[]		 	 " Remove the trailing whitespace notification

colorscheme onedark

" Open FZF finder
nnoremap <leader>p :FZF<CR>
