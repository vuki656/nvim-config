local lsp_utils = require("lspconfig.util")
local typescript = require("typescript")

local capabilities = require("lsp.utils.capabilities")
local error_formatter = require("format-ts-errors")
local set_keymap = require("utils.set-keymap")

typescript.setup({
    disable_formatting = true,
    server = {
        capabilities = capabilities,
        root_dir = lsp_utils.root_pattern(".git"),
        handlers = {
            ["textDocument/publishDiagnostics"] = function(_, result, context, config)
                if result.diagnostics == nil then
                    return
                end

                local ids = 1

                while ids <= #result.diagnostics do
                    local entry = result.diagnostics[ids]

                    local formatter = error_formatter[entry.code]

                    entry.message = formatter and formatter(entry.message) or entry.message

                    ids = ids + 1
                end

                vim.lsp.diagnostic.on_publish_diagnostics(_, result, context, config)
            end,
        },
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
