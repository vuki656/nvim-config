local colors = require("utils.colors")

local lsp_statuses = nil

vim.cmd("autocmd User LspProgressUpdate lua set_lsp_status()")

function _G.set_lsp_status()
    lsp_statuses = vim.lsp.util.get_progress_messages()
end

return {
    provider = function()
        if not vim.tbl_isempty(lsp_statuses or {}) then
            local status = lsp_statuses[1]
            local message = status.title

            if status.done then
                return ""
            end

            if status.title == "diagnostics" then
                message = "Analizing"
            end

            if status.title == "formatting" then
                message = "Formatting"
            end

            return "  " .. "[" .. status.name .. "] " .. message
        end

        return ""
    end,
    hl = {
        fg = colors.white,
        bg = colors.background,
    },
}
