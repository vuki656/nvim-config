-- Name: Null LS
-- Description: Proxy for linters/formatters
-- Link: https://github.com/jose-elias-alvarez/null-ls.nvim

local null_ls = require("null-ls")
local null_ls_helpers = require("null-ls.helpers")

local set_keymap = require("utils.set-keymap")

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
        formatter.shfmt.with({ args = { "-i=4" } }),
        formatter.eslint_d,

        -- Diagnostics
        diagnostics.shellcheck,
        diagnostics.hadolint,
        diagnostics.yamllint,
        diagnostics.eslint_d,

        -- Code Actions
        actions.eslint_d,
        actions.gitsigns,

        -- If eslint config exists use eslint, else use prettier
        null_ls_helpers.conditional(function(utils)
            local has_eslint = utils.root_has_file(".eslintrc.js") or utils.root_has_file(".eslintrc.json")

            if has_eslint then
                return formatter.prettier.with({
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
                })
            else
                return formatter.prettier.with({
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
                })
            end
        end),
    },
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>f",
    actions = "<CMD>lua vim.lsp.buf.formatting()<CR>",
    description = "Run formatter and format code",
})
