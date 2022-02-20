-- Name: Alpha
-- Descriptions: Start screen
-- Link: https://github.com/goolord/alpha-nvim

local alpha = require("alpha")
local startify_theme = require("alpha.themes.startify")

local set_keymap = require("utils.set-keymap")

--------------------------------------------------------------------------------------------
------------------------------------- SETUP ------------------------------------------------
--------------------------------------------------------------------------------------------

-- Custom layout
startify_theme.config.layout = {
    { type = "padding", val = 1 },
    startify_theme.section.header,
    { type = "padding", val = 2 },
    startify_theme.section.mru_cwd,
    startify_theme.section.mru,
    { type = "padding", val = 1 },
    startify_theme.section.bottom_buttons,
    startify_theme.section.footer,
}

alpha.setup(startify_theme.config)

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
