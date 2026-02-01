local ICONS = require("utils.icons")

return {
    render = function()
        local counts = vim.diagnostic.count(0)
        local result = ""

        if (counts[vim.diagnostic.severity.ERROR] or 0) > 0 then
            result = result .. "%#StatusLineDiagError# " .. ICONS.ERROR .. " " .. counts[vim.diagnostic.severity.ERROR]
        end

        if (counts[vim.diagnostic.severity.HINT] or 0) > 0 then
            result = result .. "%#StatusLineDiagHint# " .. ICONS.HINT .. " " .. counts[vim.diagnostic.severity.HINT]
        end

        if (counts[vim.diagnostic.severity.INFO] or 0) > 0 then
            result = result .. "%#StatusLineDiagInfo# " .. ICONS.INFO .. " " .. counts[vim.diagnostic.severity.INFO]
        end

        if (counts[vim.diagnostic.severity.WARN] or 0) > 0 then
            result = result
                .. "%#StatusLineDiagWarning# "
                .. ICONS.WARNING
                .. " "
                .. counts[vim.diagnostic.severity.WARN]
        end

        return result
    end,
}
