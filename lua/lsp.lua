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
        })
    end,
    ["cssmodules_ls"] = function()
        lsp.cssmodules_ls.setup({
            capabilities = lsp_capabilities,
            on_attach = function(client)
                client.server_capabilities.definitionProvider = false
            end,
        })
    end,
    ["jsonls"] = function()
        lsp.jsonls.setup({
            capabilities = lsp_capabilities,
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
            settings = {
                yaml = {
                    schemas = require("schemastore").yaml.schemas(),
                },
            },
            schemaStore = {
                enable = false,
                url = "",
            },
        })
    end,
    ["vtsls"] = function()
        lsp.vtsls.setup({
            filetypes = { "vue" },
            settings = {
                vtsls = {
                    tsserver = {
                        globalPlugins = {
                            {
                                name = "@vue/typescript-plugin",
                                location = "/home/domagoj/.nvm/versions/node/v22.3.0/lib/node_modules/@vue/typescript-plugin/index.js",
                                languages = { "vue" },
                                configNamespace = "typescript",
                                enableForWorkspaceTypeScriptVersions = true,
                            },
                        },
                    },
                },
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
    on_attach = function()
        set_keymap({
            list = {
                {
                    key = "<LEADER>tfi",
                    actions = function()
                        vim.cmd("TSToolsAddMissingImports")
                    end,
                    description = "Add missing imports",
                },
                {
                    key = "<LEADER>tfr",
                    actions = function()
                        vim.cmd("TSToolsRenameFile")
                    end,
                    description = "Rename JS file",
                },
            },
        })
    end,
    settings = {
        separate_diagnostic_server = true,
        expose_as_code_action = {
            "add_missing_imports",
            "remove_unused_imports",
        },
        tsserver_file_preferences = {
            quotePreference = "single",
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        client.server_capabilities.semanticTokensProvider = nil
    end,
})
