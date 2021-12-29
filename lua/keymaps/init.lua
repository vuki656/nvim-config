local set_keymap = require("utils.set-keymap")
local set_terminal_keymap = require("utils.set-terminal-keymap")

require("keymaps.custom.print-word")

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
            actions = "<CMD>nohlsearch<CR>",
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
            modes = "i",
            key = "jj",
            actions = "<ESC>",
            description = "Go to normal mode",
        },
        {
            modes = "i",
            key = "jk",
            actions = "<ESC>",
            description = "Go to normal mode",
        },
        {
            modes = "i",
            key = "kj",
            actions = "<ESC>",
            description = "Go to normal mode",
        },
        {
            modes = "i",
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
            key = "dJ",
            actions = "jddk",
            description = "Remove the line below",
        },
        {
            key = "dK",
            actions = "kdd",
            description = "Remove the line above",
        },
        {
            key = "J",
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
            actions = {
                "z=1<CR>",
                "<CMD>w<CR>",
                "<CMD>e<CR>",
            },
            description = "Apply the first misspell suggestion",
        },
        {
            key = "zl",
            actions = "z=",
            description = "Open the misspell suggestion list",
        },
        {
            key = "lf",
            actions = {
                "[s",
                "z=1<CR>",
                "<CMD>w<CR>",
                "<CMD>e<CR>",
                "A",
            },
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
            actions = "<CMD>lua vim.lsp.buf.hover()<CR>",
            description = "Show variable documentation in floating buffer",
        },
        {
            key = "<LEADER>rn",
            actions = "<CMD>lua vim.lsp.buf.rename()<CR>",
            description = "Rename variable",
        },
        {
            key = "K",
            actions = "<CMD>lua vim.diagnostic.open_float(0, { scope='line' })<CR>",
            description = "Show diagnostic in a floating buffer",
        },
        {
            key = "ga",
            actions = "<CMD>CodeActionMenu<CR>",
            description = "Display code action list menu in floating buffer",
        },
        {
            key = "]d",
            actions = "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>",
            description = "Go to next diagnostic in current buffer",
        },
        {
            key = "[d",
            actions = "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>",
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
            actions = "<CMD>luafile %<CR>",
            description = "Resource current lua buffer",
        },
        {
            key = "<LEADER>sw",
            actions = "<CMD>set wrap<CR>",
            description = "Enable wrapping in the buffer",
        },
        {
            key = "<LEADER>sr",
            actions = "<CMD>mkspell ./spell/en.utf-8.add<CR>",
            description = "Recreate spell database file",
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- TERMINAL ---------------------------------------------
------------------------------------------------------------------------------------------

set_terminal_keymap({
    key = "gim",
    actions = "<C-\\><C-n>",
    description = "Go to normal mode with in terminal",
})
