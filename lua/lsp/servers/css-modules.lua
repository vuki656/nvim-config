local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.cssmodules_ls.setup({
    on_attach = function(client)
        client.server_capabilities.definitionProvider = false
        client.server_capabilities.semanticTokensProvider = nil
    end,
    capabilities = capabilities,
})
