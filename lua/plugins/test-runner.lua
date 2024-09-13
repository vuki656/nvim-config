-- Name: Neotest
-- Description: Test runner
-- Link: https://github.com/nvim-neotest/neotest

-- Plugins:
-- https://github.com/marilari88/neotest-vitest

local neotest = require("neotest")

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")
local set_keymap = require("utils.set-keymap")

----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

-- TODO: setup everything (it has per project setup)
-- TODO: closest only test
neotest.setup({
    adapters = {
        require("neotest-vitest"),
    },
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>jsu",
            actions = neotest.summary.toggle,
            description = "Open neotest summary",
        },
        {
            key = "<LEADER>jrr",
            actions = neotest.run.run_last,
            description = "Run last test",
        },
        {
            key = "<LEADER>jrf",
            actions = function ()
                vim.cmd("Neotest run file")
            end,
            description = "Run file",
        },
        {
            key = "<LEADER>jrt",
            actions = neotest.run.run,
            description = "Run closest test",
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
    list = {
        { group = "NeotestDir", foreground = colors.white },
        { group = "NeotestFile", foreground = colors.orange },
    },
})
