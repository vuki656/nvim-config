-- Name: Notify
-- Description: Notification handler
-- Link: https://github.com/rcarriga/nvim-notify

local notify = require("notify")

local colors = require("utils.colors")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

notify.setup({
    stages = "fade",
    timeout = 3000,
})

vim.notify = notify

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Notifications
vim.cmd([[highlight! NotifyERRORBorder               guifg=]] .. colors.red)
vim.cmd([[highlight! NotifyERRORIcon                 guifg=]] .. colors.red)
vim.cmd([[highlight! NotifyERRORTitle                guifg=]] .. colors.red)

vim.cmd([[highlight! NotifyWARNBorder                guifg=]] .. colors.orange)
vim.cmd([[highlight! NotifyWARNIcon                  guifg=]] .. colors.orange)
vim.cmd([[highlight! NotifyWARNTitle                 guifg=]] .. colors.orange)

vim.cmd([[highlight! NotifyINFOBorder                guifg=]] .. colors.green)
vim.cmd([[highlight! NotifyINFOIcon                  guifg=]] .. colors.green)
vim.cmd([[highlight! NotifyINFOTitle                 guifg=]] .. colors.green)
