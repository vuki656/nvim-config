local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.yamlls.setup({
    capabilities = capabilities,
    schemaStore = {
        enable = true,
    },
})
