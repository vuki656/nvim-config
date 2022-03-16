local ts_utils = require("nvim-lsp-ts-utils")

local set_keymap = require("utils.set-keymap")
local SERVERS = require("lsp.utils.servers")

return function(default_options, server_name)
    if server_name ~= SERVERS.TYPESCRIPT then
        return default_options
    end

    local options = {
        on_attach = function(client)
            client.resolved_capabilities.document_formatting = false

            ts_utils.setup({
                always_organize_imports = false,
                update_imports_on_move = true,
                require_confirmation_on_move = true,
            })

            ts_utils.setup_client(client)

            set_keymap({
                list = {
                    {
                        key = "<LEADER>tim",
                        actions = function()
                            vim.cmd("TSLspImportAll")
                        end,
                        description = "Import all missing typescript types",
                    },
                    {
                        key = "<LEADER>trf",
                        actions = function()
                            vim.cmd("TSLspRenameFile")
                        end,
                        description = "Rename file with typescript server",
                    },
                },
            })
        end,
    }

    return vim.tbl_deep_extend("force", {}, default_options, options)
end
