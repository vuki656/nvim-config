-- Name: Feline
-- Description: Status line
-- Link: https://github.com/vuki656/feline.nvim

local feline = require("feline")

local diagnostics = require("plugins.status-line.components.diagnostics")
local file_name = require("plugins.status-line.components.file-name")
local git_branch = require("plugins.status-line.components.git-branch")
local git_diff = require("plugins.status-line.components.git-diff")
local repository_name = require("plugins.status-line.components.repository-name")
local updates = require("plugins.status-line.components.updates")

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
            },
            {
                updates,
            },
        },
    },
    force_inactive = {
        buftypes = { "terminal" },
        bufnames = {},
    },
})
