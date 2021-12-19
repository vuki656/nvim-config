-- Name: Headlines
-- Description: Highlights sections in documentation files
-- Link: https://github.com/lukas-reineke/headlines.nvim

local headlines = require("headlines")

local set_highlight = require("utils.set_highlight")
local colors = require("utils.colors")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

-- Doc files header highlights
headlines.setup()

--------------------------------------------------------------------------------------------
------------------------------------- COLORS -----------------------------------------------
--------------------------------------------------------------------------------------------

set_highlight({
    list = {
        { group = "Codeblock", background = colors.grey_lighter },
        { group = "Headline", background = colors.grey_lighter },
    },
})
