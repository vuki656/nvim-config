local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

local M = {
    ui = nil,
    input_width = 35,
}

--- Setup generic input for use with the editor
-- @return nil
M.setup = function()
    local input_ui = nil

    vim.ui.input = function(options, on_confirm)
        if input_ui then
            vim.api.nvim_err_writeln("UI BUSY: Another input is pending!")

            return
        end

        local text_width = string.len(options.default or "") or 0

        -- Makes sure the width can fit the item text
        if text_width > M.input_width then
            M.input_width = text_width + 10
        end

        M = vim.tbl_deep_extend("force", M, {
            options = {
                completion = options.completion or "",
                default = options.default or "",
                prompt = options.prompt,
            },
            on_confirm = on_confirm,
        })

        M.__generate_ui()
        M.__setup_keymaps()
    end
end

--- Clean up after submit/exit
-- @param value: string - new value to set
M.__on_done = function(value)
    if M.ui then
        M.ui:unmount()
    end

    M.on_confirm(value)

    M.ui = nil
    M.input_width = 35
end

--- Generates the NUI input
-- @return nil
M.__generate_ui = function()
    local title = M.options.prompt or "Choose Option"

    M.ui = Input({
        relative = "editor",
        position = "50%",
        size = { width = M.input_width },
        border = {
            style = "rounded",
            highlight = "Normal",
            text = {
                top = " " .. title .. " ",
                top_align = "center",
            },
        },
        win_options = { winhighlight = "Normal:Normal" },
    }, {
        default_value = M.options.default,
        on_close = function()
            M.__on_done(nil)
        end,
        on_submit = function(value)
            M.__on_done(value)
        end,
    })

    M.ui:mount()
end

--- Sets up the keymaps for the input
M.__setup_keymaps = function()
    local options = { noremap = true, nowait = true }

    -- Cancel and unmount on buffer leave
    M.ui:on(event.BufLeave, function()
        M.__on_done(nil)
    end, { once = true })

    -- Exit with Esc
    M.ui:map("n", "<Esc>", function()
        M.__on_done(nil)
    end, options)

    -- Exit with q
    M.ui:map("n", "q", function()
        M.__on_done(nil)
    end, options)
end

return M
