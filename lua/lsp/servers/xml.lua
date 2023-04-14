local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.lemminx.setup({
    capabilities = capabilities,
})
