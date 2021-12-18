local lsp_config = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp_config.tsserver.setup({
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
    end,
    capabilities = capabilities,
})
