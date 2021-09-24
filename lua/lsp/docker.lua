local capabilities = require("lsp.capabilities")

require("lspconfig").dockerls.setup({
    capabilities = capabilities,
})
