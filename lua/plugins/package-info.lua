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

-- Show package versions
vim.api.nvim_set_keymap("n", "<leader>ns", ":lua require('package-info').show()<CR>", { silent = true, noremap = true })

-- Hide package versions
vim.api.nvim_set_keymap("n", "<leader>nc", ":lua require('package-info').hide()<CR>", { silent = true, noremap = true })
