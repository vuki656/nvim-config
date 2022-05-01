local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.sumneko_lua.setup({
    capabilities = capabilities,
    on_attach = function(client)
        client.server_capabilities.document_formatting = false
    end,
    settings = {
        Lua = {
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
