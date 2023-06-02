local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.yamlls.setup({
    capabilities = capabilities,
    on_attach = function(client)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.semanticTokensProvider = nil
    end,
    settings = {
        yaml = {
            schemas = require("schemastore").yaml.schemas(),
        },
    },
    schemaStore = {
        enable = true,
    },
})
