-- Name: Skills
-- Description: Mason-style TUI for skills.sh agent skills
-- Link: https://github.com/vuki656/skills.nvim

local skills = require("skills")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

skills.setup({})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>sk",
            actions = skills.open,
            description = "[Skills] Open the skills manager",
        },
        {
            key = "<LEADER>su",
            actions = skills.update_all,
            description = "[Skills] Update all skills in scope",
        },
    },
})
