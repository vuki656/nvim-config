--- Sets the given keymap with the given properties
-- @param options - object
-- {
--     modes - modes when the keymap can trigger
--     key - key that triggers the keymap
--     actions - action that gets fired on key press
--     options -- options to be applied for the keymap
-- }
function apply_keymap(properties)
    local modes = properties.modes or "n"
    local options = properties.options or { noremap = true, silent = true }

    local action = ""

    -- If there is a list of actions, concatenate them into a single string
    if type(properties.actions) ~= "string" and table.getn(properties.actions) ~= 0 then
        for _, value in ipairs(properties.actions) do
            action = action .. " " .. value
        end
    else
        action = properties.actions
    end

    vim.api.nvim_set_keymap(modes, properties.key, action, options)
end

--- Sets the given keymap or list of keymaps with the given properties
-- @param options - object
-- {
--     modes - modes when the keymap can trigger
--     key - key that triggers the keymap
--     actions - action that gets fired on key press
--     options -- options to be applied for the keymap
--     list -- list of multiple keymaps to set
-- }
return function(properties)
    -- Set a single keymap
    if properties.list == nil then
        apply_keymap(properties)

        return
    end

    -- Set a list of keymaps
    for _, value in ipairs(properties.list) do
        apply_keymap(value)
    end
end
