-- Name: Comment
-- Description: Commenting plugin
-- Link: https://github.com/numToStr/Comment.nvim

local close_buffers = require("close_buffers")

local vars = require("utils.vars")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

close_buffers.setup({
    filetype_ignore = { "NvimTree" },
})

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Delete/kill all inactive buffers
vars.remap.fn("n", "<leader>ki", ":lua require('close_buffers').delete({ type = 'hidden' })<CR>", vars.remap.opts)
