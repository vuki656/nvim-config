-- Name: StartupTime
-- Descriptions: Nvim startup time profiler
-- Link: https://github.com/dstein64/vim-startuptime

local set_highlight = require("utils.set-highlight")
local colors = require("utils.colors")

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
