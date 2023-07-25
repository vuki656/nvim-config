local lazy = require("lazy.status")

local colors = require("utils.colors")

return {
    provider = function()
        return " " .. lazy.updates() .. " "
    end,
    enabled = lazy.has_updates,
    hl = {
        fg = colors.background,
        bg = colors.green,
    },
}
