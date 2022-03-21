-- Name: Null LS
-- Description: Proxy for linters/formatters
-- Link: https://github.com/jose-elias-alvarez/null-ls.nvim

local null_ls = require("null-ls")

local set_keymap = require("utils.set-keymap")

local formatter_prettier = require("plugins.formatter-linter.configs.prettier")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

local formatter = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions

null_ls.setup({
    sources = {
        formatter.stylua,
        formatter.fixjson,
        formatter.eslint_d,
        formatter.shfmt.with({ extra_args = { "-i=4" } }),
        formatter_prettier,

        diagnostics.shellcheck,
        diagnostics.hadolint,
        diagnostics.yamllint.with({
            extra_args = {
                "-d",
                [[{
                    rules: {
                        line-length: { max: 140 },
                        document-start: { present: false }
                    }
                }]],
            },
        }),
        diagnostics.eslint_d,
        diagnostics.shellcheck,
        diagnostics.luacheck,
        -- FIXME: tries to lint all yaml, should only be on github yaml files
        -- diagnostics.actionlint,

        actions.eslint_d,
        actions.gitsigns,
        actions.shellcheck,
    },
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>f",
    actions = vim.lsp.buf.formatting,
    description = "Run formatter and format code",
})
