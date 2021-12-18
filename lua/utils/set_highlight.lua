--- Sets the given highlight group with the given colors
-- @param options - object
-- {
--     group - string representing the highlight group
--     background - background color
--     foreground - foreground color
-- }
function apply_highlight(options)
    local background = ""
    local foreground = ""

    if options.background ~= nil then
        background = " guibg=" .. options.background .. " "
    end

    if options.foreground ~= nil then
        foreground = " guifg=" .. options.foreground .. " "
    end

    vim.cmd("highlight! " .. options.group .. background .. foreground)
end

--- Sets the given highlight group or list of groups with the given colors
-- @param options - object
-- {
--     group - string representing the highlight group
--     background - background color
--     foreground - foreground color
--     list -- list of object containing the above 3 properties
-- }
return function(options)
    -- Set a single highlight
    if options.list == nil then
        apply_highlight(options)

        return
    end

    -- Set a list of highlights
    for _, value in ipairs(options.list) do
        apply_highlight(value)
    end
end
