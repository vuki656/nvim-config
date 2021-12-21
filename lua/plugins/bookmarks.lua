-- Name: Harpoon
-- Description: Bookmark and jump to files
-- Link: https://github.com/ThePrimeagen/harpoon

local harpoon = require("harpoon")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

harpoon.setup({
    menu = {
        width = 120,
        height = 10,
    },
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        { key = "<LEADER>1", actions = '<CMD>lua require("harpoon.ui").nav_file(1)<CR>' },
        { key = "<LEADER>2", actions = '<CMD>lua require("harpoon.ui").nav_file(2)<CR>' },
        { key = "<LEADER>3", actions = '<CMD>lua require("harpoon.ui").nav_file(3)<CR>' },
        { key = "<LEADER>4", actions = '<CMD>lua require("harpoon.ui").nav_file(4)<CR>' },
        { key = "<LEADER>5", actions = '<CMD>lua require("harpoon.ui").nav_file(5)<CR>' },
        {
            key = "<LEADER>ms",
            actions = '<CMD>lua require("harpoon.ui").toggle_quick_menu()<CR>',
            description = "Open marked files list",
        },
        {
            key = "<LEADER>mf",
            actions = '<CMD>lua require("harpoon.mark").add_file()<CR>',
            description = "Mark currently opened buffer",
        },
    },
})
