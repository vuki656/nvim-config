-- TODO: disable bracket pair highlighting
-- TODO: highlight the whole line

local Menu = require("nui.menu")

local event = require("nui.utils.autocmd").event

local M = {
    ui = nil,
    menu_width = 35,
}

--- Returns the approbate icon based on menu item text
-- @return text: string - text to base the icon off of
M.__get_icon = function(text)
    local git_icons = {
        ["Blame line"] = "",
        ["Preview hunk"] = "",
        ["Stage hunk"] = "",
        ["Reset hunk"] = "",
        ["Select hunk"] = "",
    }

    if git_icons[text] then
        return git_icons[text]
    end

    if string.find(string.lower(text), "eslint") then
        return ""
    end

    return ""
end

--- Generates menu items from LSP items
-- @return menu_items: Menu.item
M.__generate_menu_items = function()
    local menu_items = {}

    for index, item in ipairs(M.items) do
        local text = M.options.format_item(item) or tostring(item)
        local icon = M.__get_icon(text) .. "  "

        local line = "[" .. index .. "] " .. icon .. text

        -- Makes sure the width can fit the item text
        if string.len(line) > M.menu_width then
            -- +1 for nice padding
            M.menu_width = string.len(line) + 1
        end

        table.insert(menu_items, Menu.item(line, item))
    end

    return menu_items
end

--- Sets up the keymaps for the menu
-- @param menu_items: Menu.item[] - menu items for mapping number selection
M.__setup_keymaps = function(menu_items)
    local options = { noremap = true, nowait = true }

    -- Map menu items so they can be selected by number
    for index, value in ipairs(menu_items) do
        M.ui:map("n", tostring(index), function()
            M.__on_done(value, index)
        end, options)
    end

    -- Exit with q
    M.ui:map("n", "q", function()
        M.__on_done(nil)
    end, options)

    -- Disable left/right movement
    M.ui:map("n", "h", function() end, options)
    M.ui:map("n", "l", function() end, options)

    -- Cancel and unmount on buffer leave
    M.ui:on(event.BufLeave, function()
        M.__on_done(nil, nil)
    end, { once = true })
end

--- Generates the NUI select
-- @param menu_items: Menu.item[] - items to render in the menu
-- @return Menu
M.__generate_ui = function(menu_items)
    local relative = "editor"
    local position = "50%"

    if (M.options.kind or "unknown") == "codeaction" then
        relative = "cursor"
        position = {
            row = 1,
            col = 0,
        }
    end

    local title = M.options.prompt or "Choose Option"

    local ui = Menu({
        relative = relative,
        position = position,
        size = { width = M.menu_width },
        border = {
            style = "rounded",
            highlight = "Normal",
            text = {
                top = " " .. title .. " ",
                top_align = "center",
            },
        },
        win_options = {
            -- NOTE: can set custom options here
            winhighlight = "Normal:Normal",
        },
    }, {
        lines = menu_items,
        on_close = function()
            M.__on_done(nil, nil)
        end,
        on_submit = function(item)
            M.__on_done(item, item.index)
        end,
    })

    ui:mount()

    M.ui = ui
end

--- Clean up after selection/exit
-- @param item: Menu.item - selected menu item
-- @param index: number - selected menu item index
M.__on_done = function(item, index)
    if M.ui then
        M.ui:unmount()
    end

    M.on_confirm(item, index)

    M.ui = nil
    M.menu_width = 35
end

M.setup = function()
    vim.ui.select = function(items, options, on_confirm)
        M = vim.tbl_deep_extend("force", M, {
            items = items,
            options = options,
            on_confirm = on_confirm,
        })

        if M.ui then
            vim.api.nvim_err_writeln("UI BUSY: Another select is pending!")

            return
        end

        local menu_items = M.__generate_menu_items()

        M.__generate_ui(menu_items)
        M.__setup_keymaps(menu_items)
    end
end

return M
