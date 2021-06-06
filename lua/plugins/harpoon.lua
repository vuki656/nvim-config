local harpoon = require('harpoon')

local remap = vim.api.nvim_set_keymap 

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

harpoon.setup({
    menu = {
        width = 120,
        height = 10
    }
})

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

remap('n', '<leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>', { noremap = true, silent = true })
remap('n', '<leader>2', ':lua require("harpoon.ui").nav_file(2)<CR>', { noremap = true, silent = true })
remap('n', '<leader>3', ':lua require("harpoon.ui").nav_file(3)<CR>', { noremap = true, silent = true })
remap('n', '<leader>4', ':lua require("harpoon.ui").nav_file(4)<CR>', { noremap = true, silent = true })
remap('n', '<leader>5', ':lua require("harpoon.ui").nav_file(5)<CR>', { noremap = true, silent = true })
remap('n', '<leader>6', ':lua require("harpoon.ui").nav_file(6)<CR>', { noremap = true, silent = true })

-- Open list of tagged files
remap('n', '<leader>ms', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })

-- Mark current file
remap('n', '<leader>mf', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
