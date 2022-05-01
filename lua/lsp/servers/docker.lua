local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.dockerls.setup({
    capabilities = capabilities,
})
