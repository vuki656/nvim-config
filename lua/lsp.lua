local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp = require("lspconfig")
local lsp_config = require("lspconfig")
local lsp_utils = require("lspconfig.util")
local mason_lspconfig = require("mason-lspconfig")
local schemastore = require("schemastore")
local set_keymap = require("utils.set-keymap")
local ts_error_formatter = require("format-ts-errors")
local typescript = require("typescript")

------------------------------------------------------------------------------------------
----------------------------------- UTILS ------------------------------------------------
------------------------------------------------------------------------------------------

local default_on_attach = function(client)
    client.server_capabilities.semanticTokensProvider = nil
end

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

-- Setup server diagnostics
vim.diagnostic.config({
    signs = false, -- Disable LSP signs
    underline = true, -- Underline diagnostics
    virtual_text = false, -- Hide virtual text diagnostics
})

mason_lspconfig.setup_handlers({
    function(server_name)
        lsp_config[server_name].setup({
            capabilities = cmp_capabilities,
            on_attach = function(client)
                default_on_attach(client)
            end,
        })
    end,
})

------------------------------------------------------------------------------------------
----------------------------------- CUSTOM ------------------------------------------------
------------------------------------------------------------------------------------------

lsp.cssmodules_ls.setup({
    on_attach = function(client)
        default_on_attach(client)

        client.server_capabilities.definitionProvider = false
    end,
})

lsp.jsonls.setup({
    on_attach = default_on_attach,
    settings = {
        json = {
            validate = {
                enable = true,
            },
            schemas = vim.list_extend({
                {
                    fileMatch = { "master.json" },
                    url = "https://json.schemastore.org/liquibase-3.2.json",
                },
                {
                    fileMatch = { "*.migration.json" },
                    url = "https://json.schemastore.org/liquibase-3.2.json",
                },
                {
                    fileMatch = { "turbo.json" },
                    url = "https://turborepo.org/schema.json",
                },
            }, schemastore.json.schemas()),
        },
    },
})

lsp.lua_ls.setup({
    on_attach = default_on_attach,
    settings = {
        Lua = {
            format = {
                enable = false,
            },
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
})

lsp.yamlls.setup({
    on_attach = default_on_attach,
    settings = {
        yaml = {
            schemas = require("schemastore").yaml.schemas(),
        },
    },
    schemaStore = {
        enable = true,
    },
})

typescript.setup({
    disable_formatting = true,
    server = {
        root_dir = lsp_utils.root_pattern(".git"),
        handlers = {
            ["textDocument/publishDiagnostics"] = function(_, result, context, config)
                if result.diagnostics == nil then
                    return
                end

                local ids = 1

                while ids <= #result.diagnostics do
                    local entry = result.diagnostics[ids]

                    local formatter = ts_error_formatter[entry.code]

                    entry.message = formatter and formatter(entry.message) or entry.message

                    ids = ids + 1
                end

                vim.lsp.diagnostic.on_publish_diagnostics(_, result, context, config)
            end,
        },
        on_attach = function(client)
            default_on_attach(client)

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
