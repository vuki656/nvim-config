-- Name: Headlines
-- Description: Highlights sections in documentation files
-- Link: https://github.com/lukas-reineke/headlines.nvim

local set_highlight = require("utils.set_highlight")
local colors = require("utils.colors")

--------------------------------------------------------------------------------------------
------------------------------------- COLORS -----------------------------------------------
--------------------------------------------------------------------------------------------

set_highlight({
    list = {
        { group = "Codeblock", background = colors.grey_lighter },
        { group = "Headline", background = colors.grey_lighter },
    },
})
