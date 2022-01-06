-- Name: Project
-- Description: Project and project root manager
-- Link: https://github.com/ahmedkhalf/project.nvim

local project = require("project_nvim")

------------------------------------------------------------------------------------------
------------------------------------ SETUP -----------------------------------------------
------------------------------------------------------------------------------------------

-- Enable project switching to update cwd
vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
    patterns = { ".git", "yarn.lock" },
})
