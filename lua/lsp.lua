local lsp = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_config = require("lspconfig")
local lsp_file_operations = require("lsp-file-operations")
local lsp_utils = require("lspconfig.util")
local mason_lspconfig = require("mason-lspconfig")
local schemastore = require("schemastore")
local set_keymap = require("utils.set-keymap")
local ts_error_formatter = require("format-ts-errors")
local typescript = require("typescript-tools")

------------------------------------------------------------------------------------------
----------------------------------- UTILS ------------------------------------------------
------------------------------------------------------------------------------------------

local default_on_attach = function(client)
    if client.server_capabilities.semanticTokensProvider then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

-- Allows for auto update of imports when file rename done in nvim tree
lsp_file_operations.setup()

vim.diagnostic.config({
    signs = false,
    underline = true,
    virtual_text = false,
})

mason_lspconfig.setup_handlers({
    function(server_name)
        lsp_config[server_name].setup({
            capabilities = lsp_capabilities,
            on_attach = function(client)
                default_on_attach(client)
            end,
        })
    end,
    ["cssmodules_ls"] = function()
        lsp.cssmodules_ls.setup({
            capabilities = lsp_capabilities,
            on_attach = function(client)
                default_on_attach(client)

                client.server_capabilities.definitionProvider = false
            end,
        })
    end,
    ["jsonls"] = function()
        lsp.jsonls.setup({
            capabilities = lsp_capabilities,
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
    end,
    ["yamlls"] = function()
        lsp.yamlls.setup({
            capabilities = lsp_capabilities,
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
    end,
})

-- This is separate as it handles the whole thing itself, no lsp
typescript.setup({
    capabilities = lsp_capabilities,
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
                        vim.cmd("TSToolsAddMissingImports")
                    end,
                    description = "Import all missing typescript types",
                },
            },
        })
    end,
    settings = {
        separate_diagnostic_server = true,
    },
})
