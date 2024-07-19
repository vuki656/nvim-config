-- Name: Oil
-- Description: More useful file tree
-- Link: https://github.com/stevearc/oil.nvim

local oil = require("oil")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

oil.setup({
    columns = { "icon" },
    keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<C-k>"] = false,
        ["<C-j>"] = false,
        ["<M-h>"] = "actions.select_split",
    },
    view_options = {
        show_hidden = true,
    },
})
