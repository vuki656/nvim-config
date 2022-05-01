local lsp = require("lspconfig")
local ts_utils = require("nvim-lsp-ts-utils")

local set_keymap = require("utils.set-keymap")
local capabilities = require("lsp.utils.capabilities")

lsp.tsserver.setup({
    capabilities = capabilities,
    on_attach = function(client)
        client.server_capabilities.document_formatting = false

        ts_utils.setup({
            always_organize_imports = false,
            update_imports_on_move = true,
            require_confirmation_on_move = true,
        })

        ts_utils.setup_client(client)

        set_keymap({
            list = {
                {
                    key = "<LEADER>tfi",
                    actions = function()
                        vim.cmd("TSLspImportAll")
                    end,
                    description = "Import all missing typescript types",
                },
                {
                    key = "<LEADER>tfr",
                    actions = function()
                        vim.cmd("TSLspRenameFile")
                    end,
                    description = "Rename file with typescript server",
                },
            },
        })
    end,
})
