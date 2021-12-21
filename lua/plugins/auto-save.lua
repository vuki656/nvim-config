-- Name: Auto Save
-- Description: Auto save buffer
-- Link: https://github.com/Pocco81/AutoSave.nvim

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
