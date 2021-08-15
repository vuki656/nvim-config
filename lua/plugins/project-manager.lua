-- Name: Project
-- Description: Project and project root manager
-- Link: https://github.com/ahmedkhalf/project.nvim

local project = require("project_nvim")
local telescope = require("telescope")

local vars = require("utils.vars")
--
------------------------------------------------------------------------------------------
------------------------------------ SETUP -----------------------------------------------
------------------------------------------------------------------------------------------

project.setup({})
telescope.load_extension("projects")

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Validate/install plugins
vars.remap.fn("n", "<leader>gp", ":Telescope projects<CR>", vars.remap.opts)
