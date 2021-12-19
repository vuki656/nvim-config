-- Name: Nvim Code Action Menu
-- Description: Floating buffer with available code actions
-- Link: https://github.com/weilbith/nvim-code-action-menu

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

vim.g.code_action_menu_show_details = false

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
    list = {
        { group = "CodeActionMenuMenuIndex", foreground = colors.red, background = colors.background },
        { group = "CodeActionMenuMenuKind", foreground = colors.blue, background = colors.background },
        { group = "CodeActionMenuMenuSelection", foreground = colors.background, background = colors.green },
    },
})
