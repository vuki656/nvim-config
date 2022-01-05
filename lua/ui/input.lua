local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

return function()
    local input_ui = nil

    vim.ui.input = function(options, on_confirm)
        if input_ui then
            vim.api.nvim_err_writeln("UI BUSY: Another input is pending!")

            return
        end

        local function on_done(value)
            if input_ui then
                input_ui:unmount()
            end

            on_confirm(value)

            input_ui = nil
        end

        input_ui = Input({
            relative = "cursor",
            position = {
                row = 1,
                col = 0,
            },
            size = { width = 35 },
            border = {
                style = "rounded",
                highlight = "Normal",
                text = {
                    top = options.prompt or "[Input]",
                    top_align = "left",
                },
            },
            win_options = { winhighlight = "Normal:Normal" },
        }, {
            default_value = options.default,
            on_close = function()
                on_done(nil)
            end,
            on_submit = function(value)
                on_done(value)
            end,
        })

        input_ui:mount()

        input_ui:on(event.BufLeave, function()
            on_done(nil)
        end, { once = true })

        input_ui:map("n", "<Esc>", function()
            on_done(nil)
        end, { noremap = true, nowait = true })
    end
end
