local null_ls = require("null-ls")
local conditional = require("null-ls.utils").make_conditional_utils()

local formatter = null_ls.builtins.formatting

local has_eslint = conditional.root_has_file(".eslintrc.js") or conditional.root_has_file(".eslintrc.json")

local filetypes = {
    "vue",
    "css",
    "html",
    "yaml",
    "markdown",
    "json",
}

if not has_eslint then
    filetypes = vim.tbl_deep_extend("force", {}, filetypes, {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    })
end

return formatter.prettier.with({
    filetypes = filetypes,
    args = {
        "--stdin-filepath",
        "$FILENAME",
    },
})
