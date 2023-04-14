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
            validate = { enable = true },
            schemas = vim.list_extend({
                {
                    fileMatch = { "master.json" },
                    url = "https://json.schemastore.org/liquibase-3.2.json",
                },
                {
                    fileMatch = { "*.migration.json" },
                    url = "https://json.schemastore.org/liquibase-3.2.json",
                },
                {
                    fileMatch = { "turbo.json" },
                    url = "https://turborepo.org/schema.json",
                },
            }, schemastore.json.schemas()),
        },
    },
})
