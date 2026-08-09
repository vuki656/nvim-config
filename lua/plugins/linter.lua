-- Name: Nvim Lint
-- Description: Linter
-- Link: https://github.com/mfussenegger/nvim-lint

local lint = require("lint")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = vim.api.nvim_create_augroup("LintOnSave", { clear = true }),
    callback = function(event)
        lint.try_lint()

        local path = vim.api.nvim_buf_get_name(event.buf)

        if path:match("/%.github/workflows/") and vim.bo[event.buf].filetype == "yaml" then
            lint.try_lint("actionlint")
        end
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
    },
    php = {
        "phpstan",
        "phpcs",
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
