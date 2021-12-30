-- Name: Package Info
-- Description: Display outdated package versions in package.json and package manager
-- Link: https://github.com/vuki656/package-info.nvim

local package_info = require("package-info")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

package_info.setup({
    autostart = false,
    hide_unstable_versions = true,
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>ns",
            actions = "<CMD>PackageInfoShowForce<CR>",
            description = "Show package versions",
        },
        {
            key = "<LEADER>nc",
            actions = "<CMD>PackageInfoHide<CR>",
            description = "Hide package versions",
        },
        {
            key = "<LEADER>nu",
            actions = "<CMD>PackageInfoUpdate<CR>",
            description = "Update package on current line",
        },
        {
            key = "<LEADER>nd",
            actions = "<CMD>PackageInfoDelete<CR>",
            description = "Delete package on current line",
        },
        {
            key = "<LEADER>ni",
            actions = "<CMD>PackageInfoInstall<CR>",
            description = "Install a new package",
        },
        {
            key = "<LEADER>np",
            actions = "<CMD>PackageInfoChangeVersion<CR>",
            description = "Install a different package version",
        },
    },
})
