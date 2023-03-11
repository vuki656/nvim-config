local conditional = require("null-ls.utils").make_conditional_utils()
local null_ls = require("null-ls")

local has_eslint = conditional.root_has_file(".eslintrc.js") or conditional.root_has_file(".eslintrc.json")

local filetypes = {
    "vue",
    "css",
    "scss",
    "html",
    "yaml",
    "markdown",
    "json",
    "graphql",
}

if not has_eslint then
    table.insert(filetypes, "javascript")
    table.insert(filetypes, "javascriptreact")
    table.insert(filetypes, "typescript")
    table.insert(filetypes, "typescriptreact")
end

local formatter = null_ls.builtins.formatting.prettier.with({
    filetypes = filetypes,
    args = {
        "--tab-width=4",
        "--print-width=130",
        "--no-semi",
        "--stdin-filepath",
        "--config-precedence=prefer-file",
        "$FILENAME",
    },
})

return {
    formatter = formatter,
}
