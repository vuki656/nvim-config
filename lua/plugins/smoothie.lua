-- Name: Smoothie
-- Description: Smoother scrolling
-- Link: https://github.com/psliwka/vim-smoothie

local option = vim.api.nvim_set_var

------------------------------------------------------------------------------------------
------------------------------------ SETUP -----------------------------------------------
------------------------------------------------------------------------------------------

option('smoothie_break_on_reverse', false)
option('smoothie_base_speed', 20)
option('smoothie_update_interval', 30)
option('smoothie_speed_exponential_factor', 1.1)
