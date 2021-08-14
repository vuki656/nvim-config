-- Name: Project
-- Description: Project and project root manager
-- Link: https://github.com/ahmedkhalf/project.nvim

local project = require("project_nvim")
local telescope = require("telescope")

------------------------------------------------------------------------------------------
------------------------------------ SETUP -----------------------------------------------
------------------------------------------------------------------------------------------

project.setup({})
telescope.load_extension("projects")
