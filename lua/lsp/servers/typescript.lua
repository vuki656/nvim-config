local lsp_utils = require("lspconfig.util")
local typescript = require("typescript")

local capabilities = require("lsp.utils.capabilities")
local set_keymap = require("utils.set-keymap")

typescript.setup({
    disable_formatting = true,
    server = {
        capabilities = capabilities,
        root_dir = lsp_utils.root_pattern(".git"),
        on_attach = function(client)
            client.server_capabilities.document_formatting = false
            client.server_capabilities.semanticTokensProvider = nil

            set_keymap({
                list = {
                    {
                        key = "<LEADER>tfi",
                        actions = function()
                            vim.cmd("TypescriptAddMissingImports")
                        end,
                        description = "Import all missing typescript types",
                    },
                    {
                        key = "<LEADER>tfr",
                        actions = function()
                            vim.cmd("TypescriptRenameFile")
                        end,
                        description = "Rename file with typescript server",
                    },
                },
            })
        end,
    },
})
