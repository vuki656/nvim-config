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

require('plugins.nvim-tree')            
require('plugins.autopairs')
require('plugins.nvim-compe')
require('plugins.dev-icons')
require('plugins.galaxyline')
require('plugins.gitsigns')
require('plugins.lspkind')
require('plugins.lspsaga')
require('plugins.smoothie')
require('plugins.startify')
require('plugins.telescope')
require('plugins.indent-line')
require('plugins.todo-comments')
require('plugins.which-key')
require('plugins.harpoon')

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

