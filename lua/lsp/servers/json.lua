local SERVERS = require("lsp.utils.servers")

return function(default_options, server_name)
    if server_name ~= SERVERS.JSON then
        return default_options
    end

    local options = {
        on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
        end,
        settings = {
            json = {
                schemas = {
                    {
                        fileMatch = { "cspell.config.json" },
                        url = "https://raw.githubusercontent.com/streetsidesoftware/cspell/main/packages/cspell-types/cspell.schema.json",
                    },
                    {
                        fileMatch = { "*.migration.json" },
                        url = "https://json.schemastore.org/liquibase-3.2.json",
                    },
                    {
                        fileMatch = { "package.json" },
                        url = "https://json.schemastore.org/package.json",
                    },
                    {
                        fileMatch = { "tsconfig*.json" },
                        url = "https://json.schemastore.org/tsconfig.json",
                    },
                    {
                        fileMatch = { ".prettier*", "prettier.config.json" },
                        url = "https://json.schemastore.org/prettierrc.json",
                    },
                    {
                        fileMatch = { ".eslint*" },
                        url = "https://json.schemastore.org/eslintrc.json",
                    },
                    {
                        fileMatch = { ".babel*" },
                        url = "https://json.schemastore.org/babelrc.json",
                    },
                    {
                        fileMatch = { "now.json", "vercel.json" },
                        url = "https://json.schemastore.org/now.json",
                    },
                    {
                        fileMatch = { "nodemon.json" },
                        url = "https://json.schemastore.org/nodemon.json",
                    },
                },
            },
        },
    }

    return vim.tbl_deep_extend("force", {}, default_options, options)
end
