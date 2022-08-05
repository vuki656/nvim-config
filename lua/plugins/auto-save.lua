-- Name: Auto Save
-- Description: Auto save buffer
-- Link: https://github.com/Pocco81/auto-save.nvim

local autosave = require("autosave")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

autosave.setup({
    execution_message = "",
    events = {
        "InsertLeave",
        "TextChanged",
    },
})
