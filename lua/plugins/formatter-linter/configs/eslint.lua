local null_ls = require("null-ls")

local filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "graphql" }

local diagnostics = null_ls.builtins.diagnostics.eslint_d.with({
    filetypes = filetypes,
})

local formatter = null_ls.builtins.formatting.eslint_d.with({
    extra_args = { "--cache" },
    filetypes = filetypes,
})

return {
    diagnostics = diagnostics,
    formatter = formatter,
}
