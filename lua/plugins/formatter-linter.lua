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

local prettier_formatter = formatter.prettier.with({
    filetypes = {
        "javascript",
        "javascriptreact",
        "vue",
        "css",
        "html",
        "json",
        "yaml",
        "markdown",
    },
    args = {
        "--stdin-filepath",
        "$FILENAME",
        "--no-semi",
        "--tab-width=4",
    },
})

local shfmt_formatter = formatter.shfmt.with({
    args = { "-i=4" },
})

null_ls.config({
    sources = {
        -- Formatters
        formatter.stylua,
        prettier_formatter,
        shfmt_formatter,

        -- Diagnostics
        diagnostics.shellcheck,
        diagnostics.hadolint,
        diagnostics.eslint,
        diagnostics.markdownlint,
        diagnostics.selene,
    },
})

require("lspconfig")["null-ls"].setup({})

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Format code
vars.remap.fn("n", "<leader>ff", ":lua vim.lsp.buf.formatting()<CR>", vars.remap.opts)
