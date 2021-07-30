-- Name: Neorg
-- Description: Org-mode and markdown had a child
-- Link: https://github.com/vhyrro/neorg

local neorg = require("neorg")
local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

neorg.setup({
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    my_workspace = "~/notes",
                },
            },
        },
        ["core.keybinds"] = {
            config = {
                default_keybinds = true,
                neorg_leader = "<Leader>o",
            },
        },
    },
})

-- Treesitter support
parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = { "src/parser.c" },
        branch = "main",
    },
}
