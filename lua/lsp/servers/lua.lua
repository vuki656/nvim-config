local SERVERS = require("lsp.utils.servers")

return function(default_options, server_name)
    if server_name ~= SERVERS.LUA then
        return default_options
    end

    local options = {
        on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
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
    }

    return vim.tbl_deep_extend("force", {}, default_options, options)
end
