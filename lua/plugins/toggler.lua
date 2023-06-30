-- Name: Toggle
-- Description: Switch words to an opposite
-- Link: https://github.com/nguyenvukhang/nvim-toggler

local toggler = require("nvim-toggler")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

toggler.setup({
    inverses = {
        ["&&"] = "||",
        ["dark"] = "light",
        ["void"] = "await",
        ["producer"] = "consumer",
        ["mutation"] = "query",
        ["null"] = "undefined",
        ["let"] = "const",
        ["in"] = "out",
        ["background"] = "foreground",
        ["asc"] = "desc",
        ["Asc"] = "Desc",
        ["public"] = "private",
        ["`"] = "'",
    },
})
