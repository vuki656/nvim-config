-- Name: Null LS
-- Description: Proxy for linters/formatters
-- Link: https://github.com/jose-elias-alvarez/null-ls.nvim

local null_ls = require("null-ls")

local set_keymap = require("utils.set-keymap")

local prettier = require("plugins.formatter-linter.configs.prettier")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

local formatter = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions

null_ls.setup({
    sources = {
        -- Formatters
        formatter.stylua,
        formatter.fixjson,
        formatter.shfmt.with({ extra_args = { "-i=4" } }),
        formatter.eslint_d,
        prettier.standalone,
        prettier.with_eslint,

        -- Diagnostics
        diagnostics.shellcheck,
        diagnostics.hadolint,
        diagnostics.yamllint,
        diagnostics.eslint_d,
        diagnostics.shellcheck,

        -- Code Actions
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
    actions = "<CMD>lua vim.lsp.buf.formatting_sync({}, 5000)<CR>",
    description = "Run formatter and format code",
})