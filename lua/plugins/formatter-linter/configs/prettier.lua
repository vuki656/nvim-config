local null_ls = require("null-ls")
local conditional = require("null-ls.utils").make_conditional_utils()

local formatter = null_ls.builtins.formatting

local has_eslint = conditional.root_has_file(".eslintrc.js") or conditional.root_has_file(".eslintrc.json")

local M = {}

M.with_eslint = formatter.prettier.with({
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
})

M.standalone = formatter.prettier.with({
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
})

return M
