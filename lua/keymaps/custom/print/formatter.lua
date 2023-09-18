--- Puts the print statement in the buffer
-- @param print_statement: string - print line to put in the buffer
-- @return nil
local function insert_print_statement(print_statement)
    local current_line = vim.api.nvim_win_get_cursor(0)
    local current_line_number = vim.inspect(current_line[1])

    vim.api.nvim_buf_set_lines(0, tonumber(current_line_number), tonumber(current_line_number), false, print_statement)
end

--- Determine for which language to use for the printing
-- @param text: string - content to put in the print statement
-- @return nil
return function(text)
    local filetype = vim.bo.filetype

    if filetype == "lua" then
        insert_print_statement({ "print(vim.inspect(" .. text .. "))" })
    elseif
        filetype == "javascript"
        or filetype == "typescript"
        or filetype == "typescriptreact"
        or filetype == "javascriptreact"
    then
        insert_print_statement({ "console.log('" .. tostring(text) .. ": ', " .. text .. ")" })
    elseif filetype == "rust" then
        insert_print_statement({ 'println!("{}", ' .. tostring(text) .. ");" })
    end
end
