local capabilities = require("lsp.capabilities")

require("lspconfig").bashls.setup({
    capabilities = capabilities,
})
