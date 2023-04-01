local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.yamlls.setup({
    capabilities = capabilities,
    on_attach = function(client)
        client.server_capabilities.document_formatting = false
    end,
    schemaStore = {
        enable = true,
    },
})
