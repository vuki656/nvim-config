local SERVERS = require("lsp.utils.servers")

return function(default_options, server_name)
    if server_name ~= SERVERS.YAML then
        return default_options
    end

    local options = {
        schemaStore = {
            enable = true,
        },
    }

    return vim.tbl_deep_extend("force", {}, default_options, options)
end
