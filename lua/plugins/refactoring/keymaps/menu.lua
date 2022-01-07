local refactoring = require("refactoring")
local Menu = require("nui.menu")

return function()
    local ui = Menu({
        relative = "editor",
        position = "50%",
        size = { width = 40 },
        border = {
            style = "rounded",
            highlight = "Normal",
            text = {
                top = " Refactor Functions",
                top_align = "center",
            },
        },
        win_options = {
            winhighlight = "Normal:Normal",
        },
    }, {
        lines = {
            Menu.item({
                on_submit = function(text)
                    refactoring.refactor(text)
                end,
                text = "Extract Function",
            }),
            Menu.item({
                on_submit = function(text)
                    refactoring.refactor(text)
                end,
                text = "Extract Function To File",
            }),
            Menu.item({
                on_submit = function(text)
                    refactoring.refactor(text)
                end,
                text = "Extract Variable",
            }),
            Menu.item({
                on_submit = function(text)
                    refactoring.refactor(text)
                end,
                text = "Inline Validate",
            }),
        },
        on_submit = function(item)
            item.on_submit(item.text)
        end,
    })

    ui:mount()

    -- Deselect from visual mode
    vim.api.nvim_input("<ESC>")

    -- Tag buffer to customize plugin behaviour in it
    vim.cmd("setfiletype refactoring-menu")
end
