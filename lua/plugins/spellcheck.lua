-- Name: Spelunker
-- Description: Spell check
-- Link: https://github.com/kamykn/spelunker.vim

local vars = require('utils.vars')

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Fix current
vars.remap.fn("n", "<leader>sf", "Zl", {})

-- Exclude word
vars.remap.fn("n", "<leader>sa", "Zg", {})

-- Go to next mistake
vars.remap.fn("n", "<leader>sn", "ZN", {})

-- Go to previous mistake
vars.remap.fn("n", "<leader>sp", "ZP", {})
