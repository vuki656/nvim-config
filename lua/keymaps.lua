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
            description = "Rotate between last 2 opened buffers",
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
        {
            key = "<LEADER>qp",
            actions = function()
                vim.cmd.cprevious()
            end,
            description = "Navigate to previous quickfix item",
        },
        {
            key = "<LEADER>qn",
            actions = function()
                vim.cmd.cnext()
            end,
            description = "Navigate to next quickfix item",
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
            key = "<LEADER>d",
            actions = "<S-s><ESC>",
            description = "Delete everything on the line",
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
        {
            key = "<LEADER>lf",
            actions = function()
                vim.api.nvim_input("[s")
                vim.api.nvim_input("z=1<CR>")
                vim.cmd("w")
                vim.cmd("e")
                vim.api.nvim_input("A")
            end,
            description = "Go to first misspell, fix it and go back to the end of line in insert mode",
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
                vim.lsp.buf.hover({ border = "rounded" })
            end,
            description = "Show variable documentation in floating buffer",
        },
        {
            key = "<LEADER>rn",
            actions = vim.lsp.buf.rename,
            description = "Rename variable",
        },
        {
            key = "<LEADER>f0",
            actions = function()
                local cmd = "silent !prettier"
                    .. " --config-precedence=prefer-file"
                    .. " --ignore-path /dev/null"
                    .. " --no-semi --tab-width 4"
                    .. ' --print-width=80 --write "%"'

                vim.cmd(cmd)
                vim.cmd("e")
            end,
            description = "Format with Prettier",
        },
        {
            key = "H",
            actions = function()
                vim.diagnostic.open_float(0, { scope = "line" })
            end,
            description = "Show diagnostic in a floating buffer",
        },
        {
            key = "ga",
            actions = vim.lsp.buf.code_action,
            description = "Display code action list menu in floating buffer",
        },
        {
            key = "]d",
            actions = vim.diagnostic.goto_next,
            description = "Go to next diagnostic in current buffer",
        },
        {
            key = "[d",
            actions = vim.diagnostic.goto_prev,
            description = "Go to previous diagnostic in current buffer",
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- MISC -------------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>cw",
            actions = "g<C-g>",
            description = "Display word count in current buffer",
        },
        {
            key = "<LEADER>rs",
            actions = function()
                vim.cmd("luafile %")
            end,
            description = "Resource current lua buffer",
        },
        {
            key = "<LEADER>sw",
            actions = function()
                vim.cmd("set wrap")
            end,
            description = "Enable wrapping in the buffer",
        },
        {
            key = "<LEADER>sr",
            actions = function()
                vim.cmd("mkspell! ./spell/en.utf-8.add")
            end,
            description = "Recreate spell database file",
        },
        {
            key = "<LEADER>mm",
            actions = "<CMD>messages<CR>",
            description = "See neovim log",
        },
        {
            key = "<LEADER>km",
            actions = function()
                vim.cmd("Telescope keymaps")
            end,
            description = "Toggle keymap previewer",
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
