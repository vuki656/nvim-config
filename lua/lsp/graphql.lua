local capabilities = require("lsp.capabilities")

require("lspconfig").graphql.setup({
    capabilities = capabilities,
})
