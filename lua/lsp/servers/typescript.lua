local typescript = require("typescript")

local set_keymap = require("utils.set-keymap")
local capabilities = require("lsp.utils.capabilities")

typescript.setup({
    disable_formatting = true,
    debug = true,
    server = {
        capabilities = capabilities,
        on_attach = function()
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
