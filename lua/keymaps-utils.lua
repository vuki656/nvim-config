local icons = require("utils.icons")

local M = {}

function M.get_diagnostic_float_opts()
    return {
        scope = "line",
        max_width = 80,
        max_height = 30,
        prefix = function(diagnostic)
            local severity = vim.diagnostic.severity[diagnostic.severity]
            local icon = icons[severity] or ""
            local hl = "Diagnostic" .. severity:sub(1, 1) .. severity:sub(2):lower()

            return icon .. " ", hl
        end,
        suffix = function(diagnostic)
            local code = diagnostic.code
            if code then
                return " [" .. code .. "]", "Comment"
            end
            return "", ""
        end,
        format = function(diagnostic)
            local message = diagnostic.message
            if diagnostic.code then
                message = message:gsub("%s*%(" .. diagnostic.code .. "%)%s*$", "")
                message = message:gsub("%s*%[" .. diagnostic.code .. "%]%s*$", "")
            end
            return message
        end,
    }
end

function M.goto_diagnostic(direction)
    local goto_fn = direction == "next" and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    goto_fn({ float = M.get_diagnostic_float_opts() })

    vim.defer_fn(function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            local config = vim.api.nvim_win_get_config(win)
            if config.relative ~= "" then
                M.highlight_diagnostic_inline_code(vim.api.nvim_win_get_buf(win))
                break
            end
        end
    end, 10)
end

function M.highlight_diagnostic_inline_code(bufnr)
    if not bufnr then
        return
    end

    local ns = vim.api.nvim_create_namespace("diagnostic_inline_code")
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    for line_idx, line in ipairs(lines) do
        local start_pos = 1
        while true do
            local quote_start, quote_end = line:find("'[^']+'", start_pos)
            if not quote_start then
                break
            end

            local code = line:sub(quote_start + 1, quote_end - 1)

            local ok, parser = pcall(vim.treesitter.get_string_parser, code, "typescript")
            if ok and parser then
                local trees = parser:parse()
                if trees and #trees > 0 then
                    local query = vim.treesitter.query.get("typescript", "highlights")
                    if query then
                        for id, node in query:iter_captures(trees[1]:root(), code) do
                            local capture_name = query.captures[id]
                            local _, start_col, _, end_col = node:range()

                            vim.api.nvim_buf_set_extmark(bufnr, ns, line_idx - 1, quote_start + start_col, {
                                end_col = quote_start + end_col,
                                hl_group = "@" .. capture_name .. ".typescript",
                            })
                        end
                    end
                end
            end

            start_pos = quote_end + 1
        end
    end
end

return M
