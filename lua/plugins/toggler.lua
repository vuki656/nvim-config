-- Name: Toggle
-- Description: Switch words to an opposite
-- Link: https://github.com/nguyenvukhang/nvim-toggler

local toggler = require("nvim-toggler")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

-- TODO: how to ignore subwords and only treat whole words, open an issue
toggler.setup({
    inverses = {
        ["&&"] = "||",
        ["on"] = "off",
        ["ON"] = "OFF",
        ["dark"] = "light",
        ["void"] = "await",
        ["disconnected"] = "connected",
        ["producer"] = "consumer",
        ["pick"] = "squash",
        ["row"] = "column",
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
        ["Yes"] = "No",
        ["`"] = "'",
    },
})
