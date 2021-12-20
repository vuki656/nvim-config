local package_info = require("package-info")

local colors = require("utils.colors")

return {
    provider = function()
        return package_info.get_status()
    end,
    hl = {
        fg = colors.white,
        bg = colors.background,
    },
}
