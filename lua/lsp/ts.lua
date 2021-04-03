local nvim_lsp = require "lspconfig"

nvim_lsp.tsserver.setup {
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
    end
}
