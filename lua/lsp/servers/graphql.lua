local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.graphql.setup({
    capabilities = capabilities,
})
