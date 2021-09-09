-- Name: Package Info
-- Description: Display outdated package versions in package.json
-- Link: https://github.com/vuki656/package-info.nvim

local package_info = require("package-info")

local vars = require("utils.vars")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

package_info.setup({
    autostart = false,
    hide_unstable_versions = true,
})

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Show package versions
vars.remap.fn("n", "<leader>ns", ":lua require('package-info').show({ force = true })<CR>", vars.remap.opts)

-- Hide package versions
vars.remap.fn("n", "<leader>nc", ":lua require('package-info').hide()<CR>", vars.remap.opts)

-- Update package on line
vars.remap.fn("n", "<leader>nu", ":lua require('package-info').update()<CR>", vars.remap.opts)

-- Delete package on line
vars.remap.fn("n", "<leader>nd", ":lua require('package-info').delete()<CR>", vars.remap.opts)

-- Install a new package
vars.remap.fn("n", "<leader>ni", ":lua require('package-info').install()<CR>", vars.remap.opts)

-- Reinstall dependencies
vars.remap.fn("n", "<leader>nr", ":lua require('package-info').reinstall()<CR>", vars.remap.opts)

-- Install a different package version
vars.remap.fn("n", "<leader>np", ":lua require('package-info').change_version()<CR>", vars.remap.opts)
