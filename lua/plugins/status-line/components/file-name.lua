local colors = require("utils.colors")

return {
    provider = "file_info",
    hl = {
        fg = colors.white,
        bg = colors.background,
    },
    left_sep = {
        {
            str = " ",
            hl = {
                bg = colors.background,
            },
        },
    },
}
