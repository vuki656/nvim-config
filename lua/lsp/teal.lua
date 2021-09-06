local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")
local cmp = require("cmp_nvim_lsp")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
    },
}

if not lspconfig.teal then
    configs.teal = {
        capabilities = capabilities,
        default_config = {
            cmd = {
                "teal-language-server",
                -- "logging=on", use this to enable logging in /tmp/teal-language-server.log
            },
            filetypes = {
                "teal",
            },
            root_dir = lspconfig.util.root_pattern("tlconfig.lua", ".git"),
            settings = {},
        },
    }
end

lspconfig.teal.setup({})
