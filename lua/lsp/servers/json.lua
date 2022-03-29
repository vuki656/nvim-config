local schemastore = require("schemastore")

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
                schemas = vim.list_extend({
                    {
                        fileMatch = { "*.migration.json" },
                        url = "https://json.schemastore.org/liquibase-3.2.json",
                    },
                }, schemastore.json.schemas()),
            },
        },
    }

    return vim.tbl_deep_extend("force", {}, default_options, options)
end
