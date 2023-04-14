local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.vimls.setup({
    capabilities = capabilities,
})
