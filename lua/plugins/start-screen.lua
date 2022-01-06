-- Name: Alpha
-- Descriptions: Start screen
-- Link: https://github.com/goolord/alpha-nvim

local alpha = require("alpha")
local opts = require("alpha.themes.startify").opts

local set_keymap = require("utils.set-keymap")

--------------------------------------------------------------------------------------------
------------------------------------- SETUP ------------------------------------------------
--------------------------------------------------------------------------------------------

alpha.setup(opts)

--------------------------------------------------------------------------------------------
------------------------------------- KEYMAPS ----------------------------------------------
--------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>b",
    actions = function()
        vim.cmd("Alpha")
    end,
    description = "Open start screen",
})
