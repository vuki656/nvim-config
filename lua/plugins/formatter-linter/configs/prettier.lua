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
    table.insert(filetypes, "javascript")
    table.insert(filetypes, "javascriptreact")
    table.insert(filetypes, "typescript")
    table.insert(filetypes, "typescriptreact")
end

return formatter.prettier.with({
    filetypes = filetypes,
    args = {
        "--stdin-filepath",
        "--tab-width=4",
        "--config-precedence=prefer-file",
        "$FILENAME",
    },
})
