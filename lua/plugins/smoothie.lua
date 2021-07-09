-- Name: Smoothie
-- Description: Smoother scrolling
-- Link: https://github.com/psliwka/vim-smoothie

------------------------------------------------------------------------------------------
------------------------------------ SETUP -----------------------------------------------
------------------------------------------------------------------------------------------

-- Enable reverse scroll if already scrolling
vim.g.smoothie_break_on_reverse = false

-- Scroll speed
vim.g.smoothie_base_speed = 20

-- ?
vim.g.smoothie_update_interval = 30

-- Speed up factor on multi presses
vim.g.smoothie_speed_exponential_factor = 1.1
