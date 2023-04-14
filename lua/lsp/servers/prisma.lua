local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.prismals.setup({
    capabilities = capabilities,
})
