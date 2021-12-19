local colors = require("utils.colors")

return {
    provider = "git_branch",
    hl = {
        fg = colors.background,
        bg = colors.blue,
        style = "bold",
    },
    right_sep = function()
        return {
            str = " ",
            hl = {
                fg = colors.background,
                bg = colors.blue,
            },
        }
    end,
    left_sep = function()
        return {
            str = " ",
            hl = {
                fg = colors.background,
                bg = colors.blue,
            },
        }
    end,
}
