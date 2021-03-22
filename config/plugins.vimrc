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
" #----------------------------------- LSP -------------------------------------------#
" #####################################################################################


" #####################################################################################
" #----------------------------------- LSP -------------------------------------------#
" #####################################################################################

" Plug 'neoclide/coc.nvim', { 'branch': 'release' }               " Intellisense
" Plug 'kevinoid/vim-jsonc'                                       " Intellisense for coc config file 

Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'

" #####################################################################################
" #----------------------------------- SEARCH ----------------------------------------#
" #####################################################################################

Plug 'nvim-telescope/telescope.nvim'                             " Base
Plug 'nvim-lua/popup.nvim'                                       " Required helper
Plug 'nvim-lua/plenary.nvim'                                     " Required helper

" #####################################################################################
" #----------------------------------- AIRLINE ---------------------------------------#
" #####################################################################################

Plug 'vim-airline/vim-airline'                                  " Enable airline
Plug 'vim-airline/vim-airline-themes'                           " Enable airline themes 

" #####################################################################################
" #----------------------------------- FILE TREE -------------------------------------#
" #####################################################################################

Plug 'kyazdani42/nvim-tree.lua'                                 " Tree
Plug 'kyazdani42/nvim-web-devicons'                             " Icons

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
" #----------------------------------- SYNTAX SUPPORT --------------------------------#
" #####################################################################################

Plug 'pantharshit00/vim-prisma'                                 " Prisma support
Plug 'jparise/vim-graphql'                                      " Graphql support

call plug#end()

lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.yamlls.setup{}
lua require'lspconfig'.cssls.setup{}
lua require'lspconfig'.diagnosticls.setup{}
lua require'lspconfig'.dockerls.setup{}
lua require'lspconfig'.graphql.setup{}
lua require'lspconfig'.html.setup{}
lua require'lspconfig'.jsonls.setup{}
lua require'lspconfig'.vimls.setup{}
lua require'lspconfig'.yamlls.setup{}
lua require'lspconfig'.bashls.setup{}
