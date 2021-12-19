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

local prettier_options = {
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
}

-- If eslint config exists don't use prettier for js/ts files
local prettier = null_ls_helpers.conditional(function(utils)
    local has_eslint = utils.root_has_file(".eslintrc.js") or utils.root_has_file(".eslintrc.json")

    if has_eslint then
        return formatter.prettier.with({
            filetypes = prettier_options.filetypes,
            args = prettier_options.args,
        })
    else
        return formatter.prettier.with({
            filetypes = vim.tbl_deep_extend("force", prettier_options.filetypes, {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
            }),
            args = prettier_options.args,
        })
    end
end)

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

        prettier,
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
