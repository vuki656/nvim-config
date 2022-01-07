-- Name: Nvim Cheatsheat
-- Description: Search for language snippets from cht.sh
-- Link: https://github.com/RishabhRD/nvim-cheat.sh

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>ch",
    actions = function()
        vim.cmd("Cheat")
        vim.api.nvim_input("i")
    end,
    description = "Search language code snippets with cht.sh",
})
