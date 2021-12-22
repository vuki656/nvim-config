local SERVERS = require("lsp.utils.servers")

return function(default_options, server_name)
    if server_name ~= SERVERS.LUA then
        return default_options
    end

    local options = {
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
                        "mouse",
                        "screen",
                        "root",
                    },
                    disable = { "lowercase-global" },
                },
            },
        },
    }

    return vim.tbl_deep_extend("force", {}, default_options, options)
end
