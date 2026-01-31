-- Name: Lazy
-- Description: Nvim plugin manager
-- Link: https://github.com/folke/lazy.nvim

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")
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
    description = "[Lazy] Open plugin manager",
})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
    list = {
        { group = "LazyCommitType", foreground = colors.white },
        { group = "LazyCommitScope", foreground = colors.white },
        { group = "LazyDimmed", foreground = colors.white },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

return {
    ui = {
        border = "single",
    },
    checker = {
        enabled = true,
    },
}
