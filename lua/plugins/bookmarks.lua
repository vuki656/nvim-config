-- Name: Harpoon
-- Description: Bookmark and jump to files
-- Link: https://github.com/ThePrimeagen/harpoon

local harpoon = require("harpoon")
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

-- TODO:migrate to v2
harpoon.setup({
    menu = {
        width = 120,
        height = 10,
    },
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

-- Map 1 to 9 for file navigation
for index = 0, 9 do
    set_keymap({
        key = "<LEADER>" .. index,
        actions = function()
            harpoon_ui.nav_file(index)
        end,
        description = "Map super + " .. index .. " for file navigation",
    })
end

set_keymap({
    list = {
        {
            key = "<LEADER>ms",
            actions = harpoon_ui.toggle_quick_menu,
            description = "Open marked files list",
        },
        {
            key = "<LEADER>mf",
            actions = harpoon_mark.add_file,
            description = "Mark currently opened buffer",
        },
    },
})
