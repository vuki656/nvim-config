-- Name: Neoclip
-- Description: Clipboard manager
-- Link: https://github.com/AckslD/nvim-neoclip.lua

local neoclip = require("neoclip")
local telescope = require("telescope")

local vars = require("utils.vars")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

neoclip.setup({
    keys = {
        i = {
            select = "<cr>",
            paste = "<cr>",
        },
        n = {
            select = "<cr>",
            paste = "<cr>",
        },
    },
})

telescope.load_extension("neoclip")

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Navigate to file by X index
vars.remap.fn("n", "<leader>cp", ":Telescope neoclip<CR>", vars.remap.opts)
