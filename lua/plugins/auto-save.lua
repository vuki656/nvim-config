-- Name: Auto Save
-- Description: Auto save buffer
-- Link: https://github.com/Pocco81/auto-save.nvim

local autosave = require("auto-save")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

autosave.setup({
    execution_message = {
        message = function()
            return ""
        end,
    },
    trigger_events = { "InsertLeave", "TextChanged" },
})
