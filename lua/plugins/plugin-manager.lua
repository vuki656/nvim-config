-- Name: Lazy
-- Description: Nvim plugin manager
-- Link: https://github.com/folke/lazy.nvim

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- BOOTSTRAP --------------------------------------------
------------------------------------------------------------------------------------------

local path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(path) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        path,
    })
end

vim.opt.rtp:prepend(path)

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>lz",
    actions = function()
        vim.cmd("Lazy")
    end,
    description = "Open Lazy package/plugin manager",
})

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

return {
    ui = {
        border = "single",
    },
}
