-- Name: git-conflict
-- Description: Git conflict highlighter
-- Link: https://github.com/akinsho/git-conflict.nvim

local git_conflict = require("git-conflict")

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")
local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

git_conflict.setup({
    disable_diagnostics = true,
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>ht",
            actions = function()
                vim.cmd("GitConflictChooseTheirs")
            end,
            description = "[GitConflict] Accept their changes",
        },
        {
            key = "<LEADER>ha",
            actions = function()
                vim.cmd("GitConflictChooseBoth")
            end,
            description = "[GitConflict] Accept both/all changes",
        },
        {
            key = "<LEADER>ho",
            actions = function()
                vim.cmd("GitConflictChooseOurs")
            end,
            description = "[GitConflict] Accept our changes",
        },
        {
            key = "<LEADER>hj",
            actions = function()
                vim.cmd("GitConflictNextConflict")
            end,
            description = "[GitConflict] Go to next conflict",
        },
        {
            key = "<LEADER>hk",
            actions = function()
                vim.cmd("GitConflictPrevConflict")
            end,
            description = "[GitConflict] Go to previous conflict",
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
    list = {
        {
            group = "GitConflictIncomingLabel",
            background = colors.orange,
            foreground = colors.background,
            options = "bold",
        },
        {
            group = "GitConflictIncoming",
            background = colors.background,
        },
        {
            group = "GitConflictCurrentLabel",
            background = colors.green,
            foreground = colors.background,
            options = "bold",
        },
        {
            group = "GitConflictCurrent",
            background = colors.background,
        },
        {
            group = "GitConflictAncestorLabel",
            background = colors.red,
            foreground = colors.background,
            options = "bold",
        },
        {
            group = "GitConflictAncestor",
            background = colors.background_light,
            foreground = "NONE",
        },
    },
})
