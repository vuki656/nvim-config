local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.taplo.setup({
    capabilities = capabilities,
})
