local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.docker_compose_language_service.setup({
    capabilities = capabilities,
})
