local lsp_config = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp_config.graphql.setup({
    capabilities = capabilities,
})
