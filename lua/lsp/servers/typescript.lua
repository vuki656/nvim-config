local SERVERS = require("lsp.utils.servers")

return function(default_options, server_name)
    if server_name ~= SERVERS.TYPESCRIPT then
        return default_options
    end

    local options = {
        on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
        end,
    }

    return vim.tbl_deep_extend("force", {}, default_options, options)
end
