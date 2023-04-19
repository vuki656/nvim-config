local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.lua_ls.setup({
    capabilities = capabilities,
    on_attach = function(client)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.semanticTokensProvider = nil
    end,
    settings = {
        Lua = {
            format = {
                enable = false,
            },
            diagnostics = {
                enable = true,
                globals = {
                    "vim",
                    "describe",
                    "it",
                    "awesome",
                    "client",
                    "before_each",
                    "after_each",
                    "mouse",
                    "screen",
                    "root",
                    "table",
                    "string",
                },
                disable = { "lowercase-global" },
            },
        },
    },
})
