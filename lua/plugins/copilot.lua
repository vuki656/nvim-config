-- Name: Copilot
-- Description: Autocomplete on steriods
-- Link: https://github.com/github/copilot.vim

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

vim.g.copilot_no_tab_map = true

vim.keymap.set("i", "<C-o>", 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false,
})
