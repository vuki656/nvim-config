-- Name: Null LS
-- Description: Proxy for linters/formatters
-- Link: https://github.com/jose-elias-alvarez/null-ls.nvim

local null_ls = require("null-ls")
local conditional = require("null-ls.utils").make_conditional_utils()

local set_keymap = require("utils.set-keymap")

local formatter_prettier = require("plugins.formatter-linter.configs.prettier")

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
        diagnostics.cspell.with({
            condition = function()
                return conditional.root_has_file("cspell.config.json")
            end,
        }),
        diagnostics.actionlint.with({
            runtime_condition = function(params)
                return params.bufname:find(vim.pesc(".github/workflows")) ~= nil
            end,
        }),

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
    description = "Format code",
})
