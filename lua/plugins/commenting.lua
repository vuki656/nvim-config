-- Name: Comment
-- Description: Commenting plugin
-- Link: https://github.com/numToStr/Comment.nvim

local comment = require("Comment")
local comment_context = require("ts_context_commentstring.internal")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

comment.setup({
    pre_hook = function()
        return comment_context.calculate_commentstring()
    end,
})
