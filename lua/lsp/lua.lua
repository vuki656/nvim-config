local sumneko_root_path = os.getenv("HOME") .. "/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

local capabilities = require("lsp.capabilities")

require("lspconfig").sumneko_lua.setup({
    capabilities = capabilities,
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    settings = {
        Lua = {
            runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
            completion = { enable = true, callSnippet = "Both" },
            diagnostics = {
                enable = true,
                globals = { "vim", "describe", "it", "awesome", "client", "mouse", "screen", "root" },
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
