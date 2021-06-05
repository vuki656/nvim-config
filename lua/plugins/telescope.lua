local actions = require('telescope.actions')
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")

local remap = vim.api.nvim_set_keymap

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

require('telescope').setup{}

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

remap("n", "<leader>p", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
remap("n", "<leader>s", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
