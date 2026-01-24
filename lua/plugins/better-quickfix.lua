-- Name: nvim-pql
-- Description: Better quick fix list
-- Link: https://github.com/yorickpeterse/nvim-pqf

local list = require("pqf")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

list.setup()

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.keymap.set("n", "dd", function()
            local local_list = vim.fn.getqflist()
            local ids = vim.fn.line(".")

            table.remove(local_list, ids)

            vim.fn.setqflist(local_list, "r")

            local new_ids = math.min(ids, #local_list)

            if new_ids > 0 then
                vim.fn.cursor(new_ids, 1)
            end
        end, { buffer = true, desc = "Remove quickfix entry" })
    end,
})
