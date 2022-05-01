local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.cssls.setup({
    capabilities = capabilities,
})
