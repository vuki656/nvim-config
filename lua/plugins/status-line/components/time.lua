local colors = require("utils.colors")

return {
    provider = function()
        return "  " .. os.date("%H:%M") .. " "
    end,
    hl = {
        bg = colors.green,
        fg = colors.background,
    },
}
