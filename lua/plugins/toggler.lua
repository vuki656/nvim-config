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
        ["pick"] = "squash",
        ["mutation"] = "query",
        ["AND"] = "OR",
        ["null"] = "undefined",
        ["let"] = "const",
        ["in"] = "out",
        ["background"] = "foreground",
        ["asc"] = "desc",
        ["Asc"] = "Desc",
        ["ASC"] = "DESC",
        ["public"] = "private",
        ["`"] = "'",
    },
})
