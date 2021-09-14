local sumneko_root_path = os.getenv("HOME") .. "/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"
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

require("lspconfig").sumneko_lua.setup({
    capabilities = capabilities,
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    settings = {
        Lua = {
            runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
            completion = { enable = true, callSnippet = "Both" },
            diagnostics = {
                enable = true,
                globals = { "vim", "describe", "it" },
                disable = { "lowercase-global" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                    [vim.fn.expand("/usr/share/awesome/lib")] = true,
                },
                -- adjust these two values if your performance is not optimal
                maxPreload = 2000,
                preloadFileSize = 1000,
            },
        },
    },
})
