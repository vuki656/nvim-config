local lsp_config = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp_config.vimls.setup({
    capabilities = capabilities,
})
