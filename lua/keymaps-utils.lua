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
    local full_text = table.concat(lines, "\n")
    local patterns = { "'[^']+'", "`[^`]+`" }

    for _, pattern in ipairs(patterns) do
        local start_pos = 1
        while true do
            local match_start, match_end = full_text:find(pattern, start_pos)
            if not match_start then
                break
            end

            local content = full_text:sub(match_start + 1, match_end - 1)
            local is_path = content:match("^/") or content:match("^%./") or content:match("^%.%./")
            local highlight = is_path and "DiagnosticInlinePath" or "DiagnosticInlineCode"

            local start_line, start_col = M._offset_to_line_col(lines, match_start - 1)
            local end_line, end_col = M._offset_to_line_col(lines, match_end)

            if start_line == end_line then
                vim.api.nvim_buf_set_extmark(bufnr, ns, start_line, start_col, {
                    end_col = end_col,
                    hl_group = highlight,
                })
            else
                for highlight_line = start_line, end_line do
                    local hl_start = highlight_line == start_line and start_col or 0
                    local hl_end = highlight_line == end_line and end_col or #lines[highlight_line + 1]

                    vim.api.nvim_buf_set_extmark(bufnr, ns, highlight_line, hl_start, {
                        end_col = hl_end,
                        hl_group = highlight,
                    })
                end
            end

            start_pos = match_end + 1
        end
    end
end

function M._offset_to_line_col(lines, offset)
    local remaining = offset

    for line_idx, line in ipairs(lines) do
        local line_len = #line + 1
        if remaining < line_len then
            return line_idx - 1, remaining
        end
        remaining = remaining - line_len
    end

    return #lines - 1, #lines[#lines]
end

return M
