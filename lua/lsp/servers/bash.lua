local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.bashls.setup({
    capabilities = capabilities,
})
