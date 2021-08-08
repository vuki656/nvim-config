-- Name: Package Info
-- Description: Display outdated package versions in package.json
-- Link: https://github.com/vuki656/package-info.nvim

local package_info = require("package-info")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

package_info.setup({
    autostart = false,
})

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

vim.api.nvim_set_keymap(
    "n",
    "<leader>nc",
    ":lua require('package-info').clear()<CR>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>nd",
    ":lua require('package-info').display()<CR>",
    { silent = true, noremap = true }
)
