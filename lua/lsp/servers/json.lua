local lsp = require("lspconfig")

local schemastore = require("schemastore")
local capabilities = require("lsp.utils.capabilities")

lsp.jsonls.setup({
    capabilities = capabilities,
    on_attach = function(client)
        client.server_capabilities.document_formatting = false
    end,
    settings = {
        json = {
            schemas = vim.list_extend({
                {
                    fileMatch = { "*.migration.json" },
                    url = "https://json.schemastore.org/liquibase-3.2.json",
                },
            }, schemastore.json.schemas()),
        },
    },
})
