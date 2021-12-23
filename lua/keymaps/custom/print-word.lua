local set_keymap = require("utils.set-keymap")

set_keymap({
    key = "<LEADER>wp",
    actions = "<CMD>lua print_word()<CR>",
    description = "Take the word under cursor and put it into a print statement on the line below",
})

function print_word()
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

function print_lua(current_line_number, current_word)
    vim.api.nvim_buf_set_lines(
        0,
        tonumber(current_line_number),
        tonumber(current_line_number),
        false,
        { "print(vim.inspect(" .. current_word .. "))" }
    )
end

function print_js(current_line_number, current_word)
    vim.api.nvim_buf_set_lines(
        0,
        tonumber(current_line_number),
        tonumber(current_line_number),
        false,
        { "console.log('" .. tostring(current_word) .. ": ', " .. current_word .. ")" }
    )
end
