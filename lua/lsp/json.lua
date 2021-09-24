local capabilities = require("lsp.capabilities")

require("lspconfig").jsonls.setup({
    capabilities = capabilities,
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
    end,
    filetypes = { "json", "jsonc" },
    settings = {
        json = {
            schemas = {
                {
                    fileMatch = { "package.json" },
                    url = "https://json.schemastore.org/package.json",
                },
                {
                    fileMatch = { "tsconfig*.json" },
                    url = "https://json.schemastore.org/tsconfig.json",
                },
                {
                    fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
                    url = "https://json.schemastore.org/prettierrc.json",
                },
                {
                    fileMatch = { ".eslintrc", ".eslintrc.json" },
                    url = "https://json.schemastore.org/eslintrc.json",
                },
                {
                    fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
                    url = "https://json.schemastore.org/babelrc.json",
                },
                {
                    fileMatch = { "now.json", "vercel.json" },
                    url = "https://json.schemastore.org/now.json",
                },

                {
                    fileMatch = { "nest-cli.json" },
                    url = "https://json.schemastore.org/nest-cli.json",
                },
                {
                    fileMatch = { "markdownlint.json" },
                    url = "https://json.schemastore.org/markdownlint.json",
                },
            },
        },
    },
})

