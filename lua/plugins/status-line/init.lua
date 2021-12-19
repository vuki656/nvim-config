-- Name: Feline
-- Description: Status line
-- Link: https://github.com/feline-nvim/feline.nvim

local feline = require("feline")

local repository_name = require("plugins.status-line.components.repository-name")
local git_branch = require("plugins.status-line.components.git-branch")
local file_name = require("plugins.status-line.components.file-name")
local blank_space = require("plugins.status-line.components.blank-space")
local diagnostics = require("plugins.status-line.components.diagnostics")
local git_diff = require("plugins.status-line.components.git-diff")
local time = require("plugins.status-line.components.time")
local package_info_status = require("plugins.status-line.components.package-info-status")
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
                blank_space,
                diagnostics,
                blank_space,
                git_diff,
                blank_space,
                package_info_status,
            },
            { time },
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
