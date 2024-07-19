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
    condition = function(buf)
        local utils = require("auto-save.utils.data")
        local is_modifiable = vim.fn.getbufvar(buf, "&modifiable") == 1
        local is_allowed_buffer = utils.not_in(vim.fn.getbufvar(buf, "&filetype"), { "oil" })

        if is_modifiable and is_allowed_buffer then
            return true
        end

        return false
    end,
})
