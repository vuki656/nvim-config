-- Name: Null LS
-- Description: Proxy for linters/formatters
-- Link: https://github.com/jose-elias-alvarez/null-ls.nvim

local null_ls = require("null-ls")

local vars = require("utils.vars")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

local formatter = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- TODO: Prettier
-- TODO: Shfmt (pass flag to use spaces instead of default tabs)
-- TODO: shellcheck
null_ls.config({
    sources = {
        -- Formatters
        formatter.stylua,

        -- Diagnostics
        diagnostics.hadolint,
        diagnostics.eslint,
        diagnostics.markdownlint,
    },
})

require("lspconfig")["null-ls"].setup({})

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Format code
vars.remap.fn("n", "<leader>ff", ":lua vim.lsp.buf.formatting()<CR>", vars.remap.opts)
