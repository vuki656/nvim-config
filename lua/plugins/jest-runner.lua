-- Name: Jester
-- Description: Jest test runner
-- Link: https://github.com/David-Kunz/jester

local jester = require("jester")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

jester.setup({
    terminal_cmd = "ToggleTerm",
    path_to_jest_run = "yarn jest",
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>jrt",
            actions = jester.run,
            description = "Run jest test under cursor",
        },
        {
            key = "<LEADER>jrf",
            actions = jester.run_file,
            description = "Run jest file",
        },
        {
            key = "<LEADER>jrr",
            actions = jester.run_last,
            description = "Re run last test",
        },
    },
})
