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

local prettier = {
    files = {
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
}

local formatter_shfmt = formatter.shfmt.with({
    args = { "-i=4" },
})

null_ls.config({
    sources = {
        -- Formatters
        formatter.stylua,
        formatter.prismaFmt,
        formatter.fixjson,
        formatter_shfmt,

        -- Diagnostics
        diagnostics.shellcheck,
        diagnostics.hadolint,
        diagnostics.markdownlint,
        diagnostics.teal,
        diagnostics.write_good,
        diagnostics.codespell,

        -- If eslint config exists use eslint, else use prettier
        require("null-ls.helpers").conditional(function(utils)
            local has_eslint = utils.root_has_file(".eslintrc.js") or utils.root_has_file(".eslintrc.json")

            if has_eslint then
                return formatter.prettier.with({
                    filetypes = prettier.files,
                    args = prettier.args,
                })
            else
                return formatter.prettier.with({
                    filetypes = {
                        unpack(prettier.files),
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                    },
                    args = prettier.args,
                })
            end
        end),
    },
})

lspconfig["null-ls"].setup({})

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Format code
vars.remap.fn("n", "<leader>f", ":lua vim.lsp.buf.formatting()<CR>", vars.remap.opts)
