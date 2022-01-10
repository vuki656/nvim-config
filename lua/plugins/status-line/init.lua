-- Name: Feline
-- Description: Status line
-- Link: https://github.com/feline-nvim/feline.nvim

local feline = require("feline")

local repository_name = require("plugins.status-line.components.repository-name")
local git_branch = require("plugins.status-line.components.git-branch")
local file_name = require("plugins.status-line.components.file-name")
local diagnostics = require("plugins.status-line.components.diagnostics")
local git_diff = require("plugins.status-line.components.git-diff")
local package_info_status = require("plugins.status-line.components.package-info-status")
local lsp_status = require("plugins.status-line.components.lsp-status")
local inactive_section = require("plugins.status-line.components.inactive-section")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

feline.setup({
    components = {
        active = {
            {
                repository_name,
                git_branch,
                file_name,
                diagnostics.errors,
                diagnostics.hints,
                diagnostics.info,
                diagnostics.warnings,
                git_diff.added,
                git_diff.removed,
                git_diff.changed,
                package_info_status,
                lsp_status,
            },
            {},
        },
        inactive = { { inactive_section } },
    },
    force_inactive = {
        filetypes = {
            "NvimTree",
            "packer",
            "alpha",
            "qf",
            "help",
        },
        buftypes = { "terminal" },
        bufnames = {},
    },
})
