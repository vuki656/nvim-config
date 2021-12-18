-- Name: Project
-- Description: Project and project root manager
-- Link: https://github.com/ahmedkhalf/project.nvim

local project = require("project_nvim")
local telescope = require("telescope")

local set_keymap = require("utils.set_keymap")

------------------------------------------------------------------------------------------
------------------------------------ SETUP -----------------------------------------------
------------------------------------------------------------------------------------------

-- Enable project switching to update cwd
vim.g.nvim_tree_respect_buf_cwd = 1

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
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>gp",
    actions = "<CMD>Telescope projects<CR>",
    description = "List all visited projects",
})
