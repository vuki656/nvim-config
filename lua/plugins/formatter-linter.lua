-- Name: Null LS
-- Description: Proxy for linters/formatters
-- Link: https://github.com/jose-elias-alvarez/null-ls.nvim

local null_ls = require("null-ls")
local conditional = require("null-ls.utils").make_conditional_utils()

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

local formatter = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions

local has_eslint = conditional.root_has_file(".eslintrc.js") or conditional.root_has_file(".eslintrc.json")

null_ls.setup({
    sources = {
        -- Formatters
        formatter.stylua,
        formatter.fixjson,
        formatter.shfmt.with({ extra_args = { "-i=4" } }),
        formatter.eslint_d,
        formatter.prettier.with({
            condition = function()
                return has_eslint
            end,
            filetypes = {
                "vue",
                "css",
                "html",
                "yaml",
                "markdown",
                "json",
            },
            args = {
                "--stdin-filepath",
                "$FILENAME",
            },
        }),
        formatter.prettier.with({
            condition = function()
                return not has_eslint
            end,
            filetypes = {
                "vue",
                "css",
                "html",
                "yaml",
                "markdown",
                "json",
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
            },
            args = {
                "--stdin-filepath",
                "$FILENAME",
            },
        }),

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
    actions = "<CMD>lua vim.lsp.buf.formatting_sync({}, 2000)<CR>",
    description = "Run formatter and format code",
})
