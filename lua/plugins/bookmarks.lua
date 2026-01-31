-- Name: Harpoon
-- Description: Bookmark and jump to files
-- Link: https://github.com/ThePrimeagen/harpoon

local harpoon = require("harpoon")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

harpoon:setup({
    settings = {
        save_on_toggle = true,
    },
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

-- Map 1 to 9 for file navigation
for index = 1, 9 do
    set_keymap({
        key = "<LEADER>" .. index,
        actions = function()
            harpoon:list():select(index)
        end,
        description = "[Harpoon] Jump to marked file slot " .. index,
    })
end

set_keymap({
    list = {
        {
            key = "<LEADER>ms",
            actions = function()
                harpoon.ui:toggle_quick_menu(harpoon:list(), {
                    border = "rounded",
                    title_pos = "center",
                })
            end,
            description = "[Harpoon] Open marked files list",
        },
        {
            key = "<LEADER>mf",
            actions = function()
                harpoon:list():add()
            end,
            description = "[Harpoon] Mark current file",
        },
    },
})
