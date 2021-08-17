-- Name: Null LS
-- Description: Proxy for linters/formatters
-- Link: https://github.com/jose-elias-alvarez/null-ls.nvim

local null_ls = require("null-ls")
local lspconfig = require("lspconfig")

local vars = require("utils.vars")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

local formatter = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local formatter_prettier = formatter.prettier.with({
    filetypes = {
        "javascript",
        "javascriptreact",
        "vue",
        "css",
        "html",
        "json",
        "yaml",
    },
    args = {
        "--stdin-filepath",
        "$FILENAME",
        "--no-semi",
        "--tab-width=4",
    },
})

local formatter_shfmt = formatter.shfmt.with({
    args = { "-i=4" },
})

null_ls.config({
    sources = {
        -- Formatters
        formatter.stylua,
        formatter_prettier,
        formatter_shfmt,

        -- Diagnostics
        diagnostics.shellcheck,
        diagnostics.hadolint,
        diagnostics.eslint,
        diagnostics.markdownlint,
        diagnostics.selene,
        diagnostics.teal,
        diagnostics.write_good,
    },
})

lspconfig["null-ls"].setup({})

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Format code
vars.remap.fn("n", "<leader>f", ":lua vim.lsp.buf.formatting()<CR>", vars.remap.opts)
