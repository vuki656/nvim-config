-- Name: Null LS
-- Description: Proxy for linters/formatters
-- Link: https://github.com/jose-elias-alvarez/null-ls.nvim

local null_ls = require("null-ls")

local typescript = require("typescript.extensions.null-ls.code-actions")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

local actions = null_ls.builtins.code_actions

null_ls.setup({
    default_timeout = 20000,
    sources = {
        actions.eslint_d,
        actions.shellcheck,
        actions.gitsigns,

        -- LS
        typescript,
    },
})
