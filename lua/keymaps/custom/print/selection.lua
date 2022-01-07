local print_content = require("keymaps.custom.print.formatter")

--- Get the selected text and put it in a print statement
-- @return nil
return function()
    -- Store the selection in buffer
    vim.cmd('noau normal! "vy"')

    -- Get the selection from the buffer
    local selection = vim.fn.getreg("v")

    -- Remove new lines
    selection:gsub("\n", "")

    print_content(selection)
end
