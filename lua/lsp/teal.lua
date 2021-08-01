local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")

if not lspconfig.teal then
    configs.teal = {
        default_config = {
            cmd = {
                "teal-language-server",
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
