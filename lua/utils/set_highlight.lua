--- Sets the given highlight group with the given colors
-- @param options - object
-- {
--     group - string representing the highlight group
--     background - background color
--     foreground - foreground color
-- }
function apply_highlight(properties)
    local background = ""
    local foreground = ""

    if properties.background ~= nil then
        background = " guibg=" .. properties.background .. " "
    end

    if properties.foreground ~= nil then
        foreground = " guifg=" .. properties.foreground .. " "
    end

    vim.cmd("highlight! " .. properties.group .. background .. foreground)
end

--- Sets the given highlight group or list of groups with the given colors
-- @param options - object
-- {
--     group - string representing the highlight group
--     background - background color
--     foreground - foreground color
--     list -- list of object containing the above 3 properties
-- }
return function(properties)
    -- Set a single highlight
    if properties.list == nil then
        apply_highlight(properties)

        return
    end

    -- Set a list of highlights
    for _, value in ipairs(properties.list) do
        apply_highlight(value)
    end
end
