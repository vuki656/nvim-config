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
            actions = package_info.show,
            description = "Show latest package versions",
        },
        {
            key = "<LEADER>nc",
            actions = package_info.hide,
            description = "Hide package versions",
        },
        {
            key = "<LEADER>nu",
            actions = package_info.update,
            description = "Update package on current line",
        },
        {
            key = "<LEADER>nd",
            actions = package_info.delete,
            description = "Delete package on current line",
        },
        {
            key = "<LEADER>ni",
            actions = package_info.install,
            description = "Install a new package",
        },
        {
            key = "<LEADER>np",
            actions = package_info.change_version,
            description = "Install a different package version",
        },
    },
})
