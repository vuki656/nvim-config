-- Name: Project
-- Description: Project and project root manager
-- Link: https://github.com/ahmedkhalf/project.nvim

local project = require("project_nvim")
local telescope = require("telescope")

local vars = require("utils.vars")

------------------------------------------------------------------------------------------
------------------------------------ SETUP -----------------------------------------------
------------------------------------------------------------------------------------------

project.setup({
    patterns = { ".git", "yarn.lock" },
    exclude_dirs = {
        "~/IdeaProjects/oem-dashboard/packages/*",
        "~/IdeaProjects/qia-dashboard/packages/*",
        "~/Projects/clones/*",
        "~/.nvm",
        "~/lsps/*",
        "~/.config/awesome/awesome-wm-widgets",
        "~/lua-language-server",
    },
})

telescope.load_extension("projects")

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Validate/install plugins
vars.remap.fn("n", "<leader>gp", ":Telescope projects<CR>", vars.remap.opts)
