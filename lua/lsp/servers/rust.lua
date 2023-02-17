local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.rust_analyzer.setup({
    capabilities = capabilities,
})
