local Menu = require("nui.menu")

local M = {
    ui = nil,
    menu_items = {},
}

--- Setup and display spell fix select
-- @return nil
M.display = function()
    local selected_word = vim.fn.expand("<cword>")
    local suggestions = vim.fn.spellsuggest(selected_word)

    M.__generate_menu_items(suggestions)
    M.__generate_ui()
    M.__setup_keymaps()
end

--- Replace the word under cursor with selected word
-- @param suggestion: list[] - word suggestions
-- @return nil
M.__on_done = function(text)
    vim.api.nvim_input("<ESC>")
    vim.api.nvim_input("ciw" .. text)
    vim.api.nvim_input("<ESC>")
end

--- Setup suggestion list into Menu.item list
-- @param suggestion: list[] - word suggestions
-- @return nil
M.__generate_menu_items = function(suggestions)
    for index, word in ipairs(suggestions) do
        table.insert(M.menu_items, Menu.item({ text = "[" .. index .. "] " .. word, value = word }))
    end
end

--- Sets up the keymaps for the select
-- @return nil
M.__setup_keymaps = function()
    -- Map menu items so they can be selected by number
    for index, menu_item in ipairs(M.menu_items) do
        -- Skip suggestions above 9
        if index > 9 then
            return
        end

        M.ui:map("n", tostring(index), function()
            M.__on_done(menu_item.value)
        end, { noremap = true, nowait = true })
    end
end

--- Generates the NUI select
-- @return nil
M.__generate_ui = function()
    local ui = Menu({
        relative = "cursor",
        position = {
            row = 1,
            col = 0,
        },
        size = {
            width = 30,
            height = 8,
        },
        border = {
            style = "rounded",
            highlight = "Normal",
            text = {
                top = " Choose a word ",
                top_align = "center",
            },
        },
        win_options = {
            winhighlight = "Normal:Normal",
        },
    }, {
        lines = M.menu_items,
        on_submit = function(item)
            M.__on_done(item.value)
        end,
    })

    ui:mount()

    M.ui = ui
end

return M
