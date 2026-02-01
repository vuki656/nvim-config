local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local schemastore = require("schemastore")

return {
    angularls = {
        capabilities = lsp_capabilities,
        root_markers = { "angular.json" },
    },
    cssmodules_ls = {
        capabilities = lsp_capabilities,
        on_attach = function(client)
            client.server_capabilities.definitionProvider = false
        end,
    },
    jsonls = {
        capabilities = lsp_capabilities,
        settings = {
            json = {
                validate = {
                    enable = true,
                },
                schemas = vim.list_extend({
                    {
                        fileMatch = { "turbo.json" },
                        url = "https://turborepo.org/schema.json",
                    },
                }, schemastore.json.schemas()),
            },
        },
    },
    yamlls = {
        capabilities = lsp_capabilities,
        settings = {
            yaml = {
                schemas = schemastore.yaml.schemas(),
                schemaStore = {
                    enable = false,
                    url = "",
                },
            },
        },
    },
    lua_ls = {
        capabilities = lsp_capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
            },
        },
    },
}
