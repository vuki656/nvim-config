local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")

local diagnostics = require("plugins.status-line.components.diagnostics")
local file_name = require("plugins.status-line.components.file-name")
local git_branch = require("plugins.status-line.components.git-branch")
local git_diff = require("plugins.status-line.components.git-diff")
local repository_name = require("plugins.status-line.components.repository-name")
local updates = require("plugins.status-line.components.updates")

set_highlight({
    list = {
        {
            group = "StatusLineRepoName",
            foreground = colors.background,
            background = colors.red,
            options = "bold",
        },
        {
            group = "StatusLineGitBranch",
            foreground = colors.background,
            background = colors.blue,
            options = "bold",
        },
        {
            group = "StatusLineFileName",
            foreground = colors.white,
            background = colors.background,
        },
        {
            group = "StatusLineDiagError",
            foreground = colors.red,
            background = colors.background,
        },
        {
            group = "StatusLineDiagWarning",
            foreground = colors.yellow,
            background = colors.background,
        },
        {
            group = "StatusLineDiagHint",
            foreground = colors.yellow,
            background = colors.background,
        },
        {
            group = "StatusLineDiagInfo",
            foreground = colors.blue,
            background = colors.background,
        },
        {
            group = "StatusLineGitAdded",
            foreground = colors.green,
            background = colors.background,
        },
        {
            group = "StatusLineGitRemoved",
            foreground = colors.red,
            background = colors.background,
        },
        {
            group = "StatusLineGitChanged",
            foreground = colors.orange,
            background = colors.background,
        },
        {
            group = "StatusLineUpdates",
            foreground = colors.background,
            background = colors.green,
        },
    },
})

local M = {}

function M.render()
    if vim.bo.buftype == "terminal" then
        return ""
    end

    local left = repository_name.render()
        .. git_branch.render()
        .. file_name.render()
        .. diagnostics.render()
        .. git_diff.render()

    local right = updates.render()

    return left .. "%#StatusLineFileName#%=" .. right
end

vim.o.statusline = "%!v:lua.require('plugins.status-line').render()"

vim.api.nvim_create_autocmd({ "DiagnosticChanged", "BufEnter", "User" }, {
    pattern = { "*", "*", "GitSignsUpdate" },
    callback = function()
        vim.cmd("redrawstatus")
    end,
})

return M
