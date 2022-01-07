local print_content = require("keymaps.custom.print.formatter")

--- Get the word under cursor and put it in a print statement
-- @return nil
return function()
    local current_word = vim.fn.expand("<cword>")

    print_content(current_word)
end
