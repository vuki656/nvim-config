-- Name: Autopairs
-- Description: Automatically add closing brackets
-- Link: https://github.com/windwp/nvim-autopairs

local autopairs = require("nvim-autopairs")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

autopairs.setup({})

-- Insert brackes on completion confirm
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
