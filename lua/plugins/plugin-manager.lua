-- Name: Packer
-- Description: Plugin manager
-- Link: https://github.com/wbthomason/packer.nvim

local vars = require("utils.vars")

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Validate/install plugins
vars.remap.fn("n", "<leader>pas", ":PackerSync<CR>", vars.remap.opts)

-- Remove no longer installed
vars.remap.fn("n", "<leader>pac", ":PackerClean<CR>", vars.remap.opts)

-- See list of installed plugins
vars.remap.fn("n", "<leader>pal", ":PackerStatus<CR>", vars.remap.opts)
