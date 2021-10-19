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

null_ls.config({
    sources = {
        -- Formatters
        formatter.stylua,
        formatter.fixjson,
        formatter.markdownlint,
        formatter.shfmt.with({ args = { "-i=4" } }),

        -- Diagnostics
        diagnostics.shellcheck,
        diagnostics.hadolint,
        diagnostics.markdownlint,
        diagnostics.teal,
        diagnostics.yamllint,
        diagnostics.write_good.with({ extra_args = { "--no-passive" } }),

        -- If eslint config exists use eslint, else use prettier
        require("null-ls.helpers").conditional(function(utils)
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

lspconfig["null-ls"].setup({})

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Format code
vars.remap.fn("n", "<leader>f", ":lua vim.lsp.buf.formatting()<CR>", vars.remap.opts)
