local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_file_operations = require("lsp-file-operations")
local servers = require("lsp.servers")

lsp_file_operations.setup()

vim.diagnostic.config({
    signs = false,
    underline = true,
    virtual_text = false,
    float = {
        border = "rounded",
    },
})

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

for _, server in ipairs(M.servers) do
    local config = servers[server] or { capabilities = lsp_capabilities }

    vim.lsp.config(server, config)
end

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspDisableSemanticTokens", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client then
            client.server_capabilities.semanticTokensProvider = nil
        end
    end,
})

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
