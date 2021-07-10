-- Name: Spelunker
-- Description: Spell check
-- Link: https://github.com/kamykn/spelunker.vim

local remap = vim.api.nvim_set_keymap

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Fix current
remap("n", "<leader>sf", "Zl", {})

-- Exclude word
remap("n", "<leader>sa", "Zg", {})

-- Go to next mistake
remap("n", "<leader>sn", "ZN", {})

-- Go to previous mistake
remap("n", "<leader>sp", "ZP", {})
