-- Name: StartupTime
-- Descriptions: Nvim startup time profiler
-- Link: https://github.com/dstein64/vim-startuptime

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
    list = {
        { group = "StartupTimeHeader", foreground = colors.white },
        { group = "StartupTimeTime", foreground = colors.blue },
        { group = "StartupTimePercent", foreground = colors.blue },
        { group = "StartupTimeSourcingEvent", foreground = colors.orange },
        { group = "StartupTimeOtherEvent", foreground = colors.red },
        { group = "StartupTimeStartupValue", foreground = colors.red, options = "bold" },
    },
})
