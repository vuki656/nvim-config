local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event

return function()
    local select_ui = nil

    vim.ui.select = function(items, opts, on_choice)
        print(vim.inspect(items))
        if select_ui then
            -- ensure single ui.select operation
            vim.api.nvim_err_writeln("busy: another select is pending!")
            return
        end

        local function on_done(item, index)
            if select_ui then
                -- if it's still mounted, unmount it
                select_ui:unmount()
            end
            -- pass the select value
            on_choice(item, index)
            -- indicate the operation is done
            select_ui = nil
        end

        local border_top_text = opts.prompt or "[Choose Item]"
        local kind = opts.kind or "unknown"
        local format_item = opts.format_item or tostring

        local relative = "editor"
        local position = "50%"

        if kind == "codeaction" then
            -- change position for codeaction selection
            relative = "cursor"
            position = {
                row = 1,
                col = 0,
            }
        end

        local max_width = vim.api.nvim_win_get_width(0)

        local menu_items = {}
        for index, item in ipairs(items) do
            item.index = index
            local item_text = string.sub(format_item(item), 0, max_width - 2)
            table.insert(menu_items, Menu.item(item_text, item))
        end

        select_ui = Menu({
            relative = relative,
            position = position,
            size = {
                width = "35",
            },
            border = {
                style = "rounded",
                highlight = "Normal",
                text = {
                    top = border_top_text,
                    top_align = "left",
                },
            },
            win_options = {
                winhighlight = "Normal:Normal",
            },
        }, {
            lines = menu_items,
            on_close = function()
                on_done(nil, nil)
            end,
            on_submit = function(item)
                on_done(item, item.index)
            end,
        })

        select_ui:mount()

        -- cancel operation if cursor leaves select
        select_ui:on(event.BufLeave, function()
            on_done(nil, nil)
        end, { once = true })
    end
end
