local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local theme = require("telescope.themes")
local conf = require("telescope.config").values

M = {
    keymaps = {},
}

--- Display the keymap preview
-- @return nil
M.toggle = function()
    local options = theme.get_dropdown({})

    local config = {
        prompt_title = "Custom Keymaps",
        sorter = conf.generic_sorter(options),
        finder = finders.new_table({
            results = M.keymaps,
        }),
    }

    pickers.new(options, config):find()
end

--- Add a new keymap to the list
-- @param properties: table
-- {
--     modes: string[] - vim modes
--     key: string - key that triggers the action
--     description: string - what the keymap does
-- }
-- @return nil
M.add = function(properties)
    local modes = ""

    -- Map modes to [m,i] template
    if vim.tbl_count(properties.modes or {}) == 1 then
        modes = properties.modes[1]
    else
        for index, mode in ipairs(properties.modes or {}) do
            if index == 1 then
                modes = mode
            else
                modes = modes .. ", " .. mode
            end
        end
    end

    -- If no mode is set don't put brackets
    if modes ~= "" then
        modes = "[" .. modes .. "] "
    end

    local line_text = modes .. properties.key .. " - " .. properties.description

    table.insert(M.keymaps, line_text)
end

return M
