-- Name: Null LS
-- Description: Proxy for linters/formatters
-- Link: https://github.com/jose-elias-alvarez/null-ls.nvim

local conditional = require("null-ls.utils").make_conditional_utils()
local null_ls = require("null-ls")

local set_keymap = require("utils.set-keymap")

local eslint = require("plugins.formatter-linter.configs.eslint")
local prettier = require("plugins.formatter-linter.configs.prettier")
local typescript = require("typescript.extensions.null-ls.code-actions")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

local formatter = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions

null_ls.setup({
    default_timeout = 20000,
    sources = {
        formatter.stylua,
        formatter.fixjson,
        formatter.protolint,
        formatter.shfmt.with({ extra_args = { "-i=4" } }),
        prettier.formatter,
        eslint.formatter,

        diagnostics.protolint,
        diagnostics.dotenv_linter,

        actions.eslint_d,
        actions.shellcheck,
        actions.gitsigns,

        -- LS
        typescript,
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
                vim.lsp.buf.format({ async = true })
            end,
            description = "Format code",
        },
        {
            key = "<LEADER>fd",
            actions = function()
                vim.cmd("! dotenv-linter fix --no-backup %")
                vim.api.nvim_input("<CR>")
            end,
            description = "Format env files",
        },
        {
            key = "<LEADER>fs",
            actions = function()
                vim.cmd("! stylelint --fix %")
                vim.api.nvim_input("<CR>")
            end,
            description = "Format css files with stylelint",
        },
    },
})
