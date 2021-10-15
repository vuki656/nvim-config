local capabilities = require("lsp.capabilities")

require("lspconfig").solang.setup({
    capabilities = capabilities,
})
