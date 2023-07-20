-- Name: Formatter
-- Description: Formatter
-- Link: https://github.com/mhartington/formatter.nvim

local formatter = require("formatter")
local formatter_utils = require "formatter.util"

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- UTILS -----------------------------------------------
------------------------------------------------------------------------------------------

local fixjson = require("formatter.filetypes.json").fixjson
local eslint = require("formatter.defaults.eslint_d")
local stylua = require("formatter.filetypes.lua").stylua
local shfmt = require("formatter.filetypes.sh").shfmt

local prettier = function()
    return {
        exe = "prettier",
        args = {
            "--stdin-filepath",
            formatter_utils.escape_path(formatter_utils.get_current_buffer_file_path()),
            "--tab-width 4"
        },
        stdin = true,
        try_node_modules = true,
    }
end

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
        jsonc = {
            fixjson,
            prettier,
        },
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
        liquid = {
            prettier
        }
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
