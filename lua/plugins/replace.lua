-- Name: Spectre
-- Description: Global search and replace
-- Link: https://github.com/nvim-pack/nvim-spectre

local set_keymap = require("utils.set-keymap")
local spectre = require("spectre")

------------------------------------------------------------------------------------------
------------------------------------ SETUP -----------------------------------------------
------------------------------------------------------------------------------------------

spectre.setup({
    open_cmd = "new",
    live_update = false,
    find_engine = {
        ["rg"] = {
            args = {
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--hidden",
            },
        },
    },
})

--------------------------------------------------------------------------------------------
------------------------------------- KEYMAPS ----------------------------------------------
--------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>pw",
    actions = function()
        spectre.toggle()
    end,
    description = "[Spectre] Project-wide search and replace",
})
