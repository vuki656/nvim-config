-- Name: Autopairs
-- Description: Autopair brackes
-- Link: https://github.com/windwp/nvim-autopairs

local autopairs = require("nvim-autopairs")
local autopairs_cmp = require("nvim-autopairs.completion.cmp")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

autopairs.setup({})

autopairs_cmp.setup({
    map_cr = true,
    map_complete = true,
    auto_select = true,
    map_char = {
        all = "(",
    },
})
