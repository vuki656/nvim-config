------------------------------------------------------------------------------------------
----------------------------------- CORE -------------------------------------------------
------------------------------------------------------------------------------------------

require('sets')
require('remaps')
require('plugins')
require('colorscheme')

------------------------------------------------------------------------------------------
----------------------------------- PLUGINS ----------------------------------------------
------------------------------------------------------------------------------------------

require('plugins.nvim-tree')                                         -- File tree
require('plugins.autopairs')                                         -- Autopair 
require('plugins.nvim-compe')                                        -- Autocompletion
require('plugins.dev-icons')                                         -- Icons 
require('plugins.galaxyline')                                        -- Staus line
require('plugins.gitsigns')                                          -- Sidebar git status
require('plugins.lspkind')                                           -- Icons for autocompletion
require('plugins.lspsaga')                                           -- LSP utils wrapper 
require('plugins.smoothie')                                          -- Better scrolling 
require('plugins.startify')                                          -- Start screen
require('plugins.telescope')                                         -- Finder
require('plugins.indentLine')                                        -- Indent lines
require('plugins.trouble')                                           -- Issue list
require('plugins.todo-comments')                                     -- TODO comments finder

------------------------------------------------------------------------------------------
----------------------------------- LSPs -------------------------------------------------
------------------------------------------------------------------------------------------

require('lsp.bash')
require('lsp.css')
require('lsp.docker')
require('lsp.graphql')
require('lsp.html')
require('lsp.json')
require('lsp.lua')
require('lsp.ts')
require('lsp.vim')
require('lsp.yaml')
require('lsp.diagnostics')

