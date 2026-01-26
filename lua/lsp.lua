local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_file_operations = require("lsp-file-operations")
local lsp_utils = require("lspconfig.util")
local schemastore = require("schemastore")
local set_keymap = require("utils.set-keymap")
local ts_error_formatter = require("format-ts-errors")
-- local typescript = require("typescript-tools")

------------------------------------------------------------------------------------------
----------------------------------- UTILS ------------------------------------------------
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

ts_error_formatter.setup({
    add_markdown = false,
    start_indent_level = 0,
})

-- Allows for auto update of imports when file rename done in nvim tree
lsp_file_operations.setup()

vim.diagnostic.config({
    signs = false,
    underline = true,
    virtual_text = false,
})

vim.lsp.config("angularls", {
    capabilities = lsp_capabilities,
    root_dir = lsp_utils.root_pattern("angular.json"),
})

vim.lsp.config("cssmodules_ls", {
    capabilities = lsp_capabilities,
    on_attach = function(client)
        client.server_capabilities.definitionProvider = false
    end,
})

vim.lsp.config("jsonls", {
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
})

vim.lsp.config("yamlls", {
    capabilities = lsp_capabilities,
    settings = {
        yaml = {
            schemas = require("schemastore").yaml.schemas(),
            schemaStore = {
                enable = false,
                url = "",
            },
        },
    },
})

vim.lsp.config("lua_ls", {
    capabilities = lsp_capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

-- vim.lsp.config("vtsls", {
--     capabilities = lsp_capabilities,
--     filetypes = { "vue" },
--     settings = {
--         vtsls = {
--             tsserver = {
--                 globalPlugins = {
--                     {
--                         name = "@vue/typescript-plugin",
--                         location = vim.fn.stdpath("data")
--                             .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
--                         languages = { "vue" },
--                         configNamespace = "typescript",
--                         enableForWorkspaceTypeScriptVersions = true,
--                     },
--                 },
--             },
--         },
--     },
-- })

local M = {}

M.servers = {
    "angularls",
    "bashls",
    "buf_ls",
    "css_variables",
    "cssls",
    "cssmodules_ls",
    "docker_compose_language_service",
    "dockerls",
    "gopls",
    "graphql",
    "html",
    "jsonls",
    "lemminx",
    "lua_ls",
    "prismals",
    "pyright",
    "stylelint_lsp",
    "tailwindcss",
    "taplo",
    "terraformls",
    "tsgo",
    "vimls",
    "yamlls",
}

local SERVERS_WITH_CUSTOM_CONFIG = {
    "angularls",
    "cssmodules_ls",
    "jsonls",
    "lua_ls",
    "yamlls",
}

local DEFAULT_SERVERS = vim.tbl_filter(function(server)
    return not vim.tbl_contains(SERVERS_WITH_CUSTOM_CONFIG, server)
end, M.servers)

for _, server in ipairs(DEFAULT_SERVERS) do
    vim.lsp.config(server, {
        capabilities = lsp_capabilities,
    })
end

-- This is separate as it handles the whole thing itself, no lsp
-- typescript.setup({
--     capabilities = lsp_capabilities,
--     root_dir = lsp_utils.root_pattern(".git"),
--     handlers = {
--         ["textDocument/publishDiagnostics"] = function(_, result, context, config)
--             if result.diagnostics == nil then
--                 return
--             end
--
--             local ids = 1
--
--             while ids <= #result.diagnostics do
--                 local entry = result.diagnostics[ids]
--
--                 local formatter = ts_error_formatter[entry.code]
--
--                 entry.message = formatter and formatter(entry.message) or entry.message
--
--                 ids = ids + 1
--             end
--
--             vim.lsp.diagnostic.on_publish_diagnostics(_, result, context, config)
--         end,
--     },
--     on_attach = function()
--         set_keymap({
--             list = {
--                 {
--                     key = "<LEADER>tfi",
--                     actions = function()
--                         vim.cmd("TSToolsAddMissingImports")
--                     end,
--                     description = "Add missing imports",
--                 },
--             },
--         })
--     end,
--     settings = {
--         separate_diagnostic_server = true,
--         tsserver_file_preferences = {
--             quotePreference = "double",
--         },
--     },
-- })

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspDisableSemanticTokens", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client then
            client.server_capabilities.semanticTokensProvider = nil
        end
    end,
})

-- Override default LspRestart to work with new LSP setup config
vim.api.nvim_create_user_command("LspRestart", function(kwargs)
    local name = kwargs.fargs[1]

    for _, client in ipairs(vim.lsp.get_clients({ name = name })) do
        local bufs = vim.lsp.get_buffers_by_client_id(client.id)

        client:stop()

        vim.wait(30000, function()
            return vim.lsp.get_client_by_id(client.id) == nil
        end)

        local client_id = vim.lsp.start(client.config, { attach = false })

        if client_id then
            for _, buf in ipairs(bufs) do
                vim.lsp.buf_attach_client(buf, client_id)
            end
        end
    end
end, {
    nargs = "?",
    complete = function()
        return vim.tbl_map(function(client)
            return client.name
        end, vim.lsp.get_clients())
    end,
})

return M
