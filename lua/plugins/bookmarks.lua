-- Name: Lsp Kind
-- Description: Autosuggestion icons
-- Link: https://github.com/onsails/lspkind-nvim

local harpoon = require("harpoon")
local vars = require("utils.vars")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

harpoon.setup({
    menu = {
        width = 120,
        height = 10,
    },
})

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Navigate to file by X index
vars.remap.fn("n", "<leader>1", ':lua require("harpoon.ui").nav_file(1)<CR>', vars.remap.opts)
vars.remap.fn("n", "<leader>2", ':lua require("harpoon.ui").nav_file(2)<CR>', vars.remap.opts)
vars.remap.fn("n", "<leader>3", ':lua require("harpoon.ui").nav_file(3)<CR>', vars.remap.opts)
vars.remap.fn("n", "<leader>4", ':lua require("harpoon.ui").nav_file(4)<CR>', vars.remap.opts)
vars.remap.fn("n", "<leader>5", ':lua require("harpoon.ui").nav_file(5)<CR>', vars.remap.opts)
vars.remap.fn("n", "<leader>6", ':lua require("harpoon.ui").nav_file(6)<CR>', vars.remap.opts)

-- Open list of tagged files
vars.remap.fn("n", "<leader>ms", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', vars.remap.opts)

-- Mark current file
vars.remap.fn("n", "<leader>mf", ':lua require("harpoon.mark").add_file()<CR>', vars.remap.opts)
