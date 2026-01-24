-- Name: Nvim Lint
-- Description: Linter
-- Link: https://github.com/mfussenegger/nvim-lint

local lint = require("lint")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = vim.api.nvim_create_augroup("LintOnSave", { clear = true }),
    callback = function()
        lint.try_lint()
    end,
})

------------------------------------------------------------------------------------------
----------------------------------- MAPPING ----------------------------------------------
------------------------------------------------------------------------------------------

lint.linters_by_ft = {
    lua = {
        "luacheck",
    },
    dockerfile = {
        "hadolint",
    },
    sh = {
        "shellcheck",
    },
    css = {
        "stylelint",
    },
    yaml = {
        "yamllint",
        "actionlint",
    },
    sql = {
        "sqlfluff",
    },
}

------------------------------------------------------------------------------------------
----------------------------------- OVERRIDES --------------------------------------------
------------------------------------------------------------------------------------------

lint.linters.yamllint.args = {
    "--format",
    "parsable",
    "-d",
    [[{
        rules: {
            line-length: { max: 140 },
            document-start: { present: false }
        }
    }]],
    "-",
}
