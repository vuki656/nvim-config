local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.docker_compose_language_service.setup({
    capabilities = capabilities,
    on_attach = function(client)
        client.server_capabilities.document_formatting = false
    end,
})
