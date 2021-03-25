require('plugins')
require('remaps')
require('plugins')
require('sets')
require('colorscheme')

require('plugins.gitsigns')
require('plugins.smoothie')
require('plugins.lspsaga')
require('plugins.compe')

require'lspconfig'.gopls.setup{}
require('lsp.bash.lua')
require('lsp.css.lua')
require('lsp.diagnostics.lua')
require('lsp.docker.lua')
require('lsp.graphql.lua')
require('lsp.html.lua')
require('lsp.json.lua')
require('lsp.lua.lua')
require('lsp.ts.lua')
require('lsp.vim.lua')
require('lsp.yaml.lua')


