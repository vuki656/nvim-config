local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

--- Handles printing for lua files
-- @param current_line_number: number - line where to place the print statement
-- @param current_word: string - word to put in the print statement
local function print_lua(current_line_number, current_word)
    vim.api.nvim_buf_set_lines(
        0,
        tonumber(current_line_number),
        tonumber(current_line_number),
        false,
        { "print(vim.inspect(" .. current_word .. "))" }
    )
end

--- Handles printing for js files
-- @param current_line_number: number - line where to place the print statement
-- @param current_word: string - word to put in the print statement
local function print_js(current_line_number, current_word)
    vim.api.nvim_buf_set_lines(
        0,
        tonumber(current_line_number),
        tonumber(current_line_number),
        false,
        { "console.log('" .. tostring(current_word) .. ": ', " .. current_word .. ")" }
    )
end

--- Put the word you are on in a print statement based on the language
local function print_word()
    local filetype = vim.bo.filetype

    local current_word = vim.fn.expand("<cword>")
    local current_line = vim.api.nvim_win_get_cursor(0)
    local current_line_number = vim.inspect(current_line[1])

    if filetype == "lua" then
        print_lua(current_line_number, current_word)
    elseif
        filetype == "javascript"
        or filetype == "typescript"
        or filetype == "typescriptreact"
        or filetype == "javascriptreact"
    then
        print_js(current_line_number, current_word)
    end
end

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>wp",
    actions = print_word,
    description = "Take the word under cursor and put it into a print statement on the line below",
})
