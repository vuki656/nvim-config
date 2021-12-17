local lsp_config = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp_config.cssls.setup({
    capabilities = capabilities,
})
