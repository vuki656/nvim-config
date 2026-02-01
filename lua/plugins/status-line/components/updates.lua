local lazy = require("lazy.status")

return {
    render = function()
        if not lazy.has_updates() then
            return ""
        end

        return "%#StatusLineUpdates# " .. lazy.updates() .. " "
    end,
}
