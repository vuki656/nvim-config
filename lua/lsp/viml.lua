local capabilities = require("lsp.capabilities")

require("lspconfig").vimls.setup({
    capabilities = capabilities,
})
