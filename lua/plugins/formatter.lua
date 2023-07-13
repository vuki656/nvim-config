-- Name: Formatter
-- Description: Formatter
-- Link: https://github.com/mhartington/formatter.nvim

local formatter = require("formatter")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- UTILS -----------------------------------------------
------------------------------------------------------------------------------------------

local fixjson = require("formatter.filetypes.json").fixjson
local prettier = require("formatter.filetypes.json").prettier
local eslint = require("formatter.defaults.eslint_d")
local stylua = require("formatter.filetypes.lua").stylua
local shfmt = require("formatter.filetypes.sh").shfmt

local javascript = function()
    if vim.loop.fs_stat(".eslintrc.js") == nil then
        return prettier()
    end

    return eslint()
end

local protolint = function()
    return {
        exe = "protolint",
        args = {
            "lint",
            "--fix",
        },
        ignore_exitcode = true,
        stdin = false,
    }
end

local stylelint = function()
    return {
        exe = "stylelint",
        args = {
            "--fix",
        },
        stdin = false,
        try_node_modules = true,
    }
end

local dotenv = function()
    return {
        exe = "dotenv-linter",
        args = {
            "fix",
            "--no-backup",
        },
        stdin = false,
        ignore_exitcode = true,
    }
end

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

formatter.setup({
    filetype = {
        json = {
            fixjson,
            prettier,
        },
        yaml = {
            prettier,
        },
        typescript = {
            javascript,
        },
        javascript = {
            javascript,
        },
        javascriptreact = {
            javascript,
        },
        typescriptreact = {
            javascript,
        },
        graphql = {
            prettier,
            eslint,
        },
        css = {
            prettier,
            stylelint,
        },
        markdown = {
            prettier,
        },
        lua = {
            stylua,
        },
        proto = {
            protolint,
        },
        sh = {
            shfmt,
            dotenv,
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>fp",
            actions = function()
                vim.cmd("FormatWriteLock")
            end,
            description = "Format code",
        },
    },
})
