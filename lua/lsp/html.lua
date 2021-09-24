local capabilities = require("lsp.capabilities")

require("lspconfig").html.setup({
    capabilities = capabilities,
})
