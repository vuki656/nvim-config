return {
    render = function()
        local status = vim.b.gitsigns_status_dict

        if not status then
            return ""
        end

        local result = ""

        if (status.added or 0) > 0 then
            result = result .. "%#StatusLineGitAdded# +" .. status.added
        end

        if (status.removed or 0) > 0 then
            result = result .. "%#StatusLineGitRemoved# -" .. status.removed
        end

        if (status.changed or 0) > 0 then
            result = result .. "%#StatusLineGitChanged#  " .. status.changed
        end

        return result
    end,
}
