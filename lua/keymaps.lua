local keymaps_utils = require("keymaps-utils")
local set_keymap = require("utils.set-keymap")
local set_terminal_keymap = require("utils.set-terminal-keymap")

------------------------------------------------------------------------------------------
----------------------------------- NAVIGATION -------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>ro",
            actions = "<C-^>",
            description = "[Vim] Switch to previous buffer",
        },
        {
            key = "<C-h>",
            actions = "<C-w>h",
            description = "Navigate to the left buffer",
        },
        {
            key = "<C-l>",
            actions = "<C-w>l",
            description = "Navigate to the right buffer",
        },
        {
            key = "<C-j>",
            actions = "<C-w>j",
            description = "Navigate to the buffer below",
        },
        {
            key = "<C-k>",
            actions = "<C-w>k",
            description = "Navigate to the buffer above",
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- BUFFER -----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<C-s>",
            actions = "<C-w><",
            description = "Shift buffer to the left",
        },
        {
            key = "<C-a>",
            actions = "<C-w>>",
            description = "Shift buffer to the right",
        },
        {
            key = "<BS>",
            actions = function()
                vim.cmd.nohlsearch()
            end,
            description = "Clear search highlight",
        },
        {
            key = "n",
            actions = "nzzzv",
            description = "Center the next search result jump inside buffer",
        },
        {
            key = "N",
            actions = "Nzzzv",
            description = "Center the next search result jump inside buffer",
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- LINE -------------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            modes = { "i" },
            key = "jj",
            actions = "<ESC>",
            description = "Go to normal mode",
        },
        {
            modes = { "i" },
            key = "jk",
            actions = "<ESC>",
            description = "Go to normal mode",
        },
        {
            modes = { "i" },
            key = "kj",
            actions = "<ESC>",
            description = "Go to normal mode",
        },
        {
            modes = { "i" },
            key = "kk",
            actions = "<ESC>",
            description = "Go to normal mode",
        },
        {
            key = "gj",
            actions = "o<ESC>'[k",
            description = "Insert empty line below",
        },
        {
            key = "gk",
            actions = "O<ESC>j",
            description = "Insert empty line above",
        },
        {
            key = "V",
            actions = "v$",
            description = "Highlight until the end of the line",
        },
        {
            key = "vv",
            actions = "V",
            description = "Highlight the whole line",
        },
        {
            key = "J",
            actions = "jddk",
            description = "Remove the line below",
        },
        {
            key = "K",
            actions = "kdd",
            description = "Remove the line above",
        },
        {
            key = "M",
            actions = "mzJ`z",
            description = "Fold line by line and keep current position",
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- SPELLCHECK -------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "zn",
            actions = "]s",
            description = "Go to next misspelled word",
        },
        {
            key = "zp",
            actions = "[s",
            description = "Go to previous misspelled word",
        },
        {
            key = "zf",
            actions = function()
                vim.api.nvim_input("z=1<CR>")
                vim.cmd("w")
                vim.cmd("e")
            end,
            description = "Apply the first misspell suggestion",
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- LSP --------------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "L",
            actions = function()
                vim.lsp.buf.hover({ border = "rounded", max_width = 80 })
            end,
            description = "Show variable documentation in floating buffer",
        },
        {
            key = "<LEADER>lr",
            actions = vim.lsp.buf.rename,
            description = "[LSP] Rename variable under cursor",
        },
        {
            key = "H",
            actions = function()
                local bufnr = vim.diagnostic.open_float(0, keymaps_utils.get_diagnostic_float_opts())
                keymaps_utils.highlight_diagnostic_inline_code(bufnr)
            end,
            description = "Show diagnostic in a floating buffer",
        },
        {
            key = "ga",
            actions = vim.lsp.buf.code_action,
            description = "Display code action list menu in floating buffer",
        },
        {
            key = "<LEADER>ln",
            actions = function()
                keymaps_utils.goto_diagnostic("next")
            end,
            description = "[LSP] Go to next diagnostic",
        },
        {
            key = "<LEADER>lp",
            actions = function()
                keymaps_utils.goto_diagnostic("prev")
            end,
            description = "[LSP] Go to previous diagnostic",
        },
        {
            key = "<LEADER>lj",
            actions = function()
                vim.cmd.cnext()
            end,
            description = "[Vim] Go to next quickfix item",
        },
        {
            key = "<LEADER>lk",
            actions = function()
                vim.cmd.cprevious()
            end,
            description = "[Vim] Go to previous quickfix item",
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- MISC -------------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>um",
            actions = "<CMD>messages<CR>",
            description = "[Vim] Show neovim messages log",
        },
        {
            key = "<LEADER>ok",
            actions = function()
                vim.cmd("Telescope keymaps")
            end,
            description = "[Telescope] Open keymaps picker",
        },
        {
            key = "q:",
            actions = "<NOP>",
            description = "Disable q:",
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- TERMINAL ---------------------------------------------
------------------------------------------------------------------------------------------

set_terminal_keymap({
    key = "gim",
    actions = "<C-\\><C-n>",
    description = "Go to insert mode in terminal",
})
