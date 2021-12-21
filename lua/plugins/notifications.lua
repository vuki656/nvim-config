-- Name: Notify
-- Description: Nvim notification handler
-- Link: https://github.com/rcarriga/nvim-notify

local notify = require("notify")

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

notify.setup({
    stages = "fade",
    timeout = 3000,
})

-- Pipe all vim.notify notifications to notify plugin
vim.notify = notify

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
    list = {
        { group = "NotifyERRORBorder", foreground = colors.red },
        { group = "NotifyERRORIcon", foreground = colors.red },
        { group = "NotifyERRORTitle", foreground = colors.red },
        { group = "NotifyWARNBorder", foreground = colors.orange },
        { group = "NotifyWARNIcon", foreground = colors.orange },
        { group = "NotifyWARNTitle", foreground = colors.orange },
        { group = "NotifyINFOBorder", foreground = colors.green },
        { group = "NotifyINFOIcon", foreground = colors.green },
        { group = "NotifyINFOTitle", foreground = colors.green },
    },
})
