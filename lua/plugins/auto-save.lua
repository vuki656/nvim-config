-- Name: Auto Save
-- Description: Auto save
-- Link: https://github.com/Pocco81/AutoSave.nvim

local autosave = require("autosave")

autosave.setup({
    events = {
        "InsertLeave",
        "TextChanged",
    },
})