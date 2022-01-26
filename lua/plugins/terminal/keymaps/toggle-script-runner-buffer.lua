local Terminal = require("toggleterm.terminal").Terminal
local Menu = require("nui.menu")

local reset = require("plugins.terminal.keymaps.reset")

return function()
    local menu_width = 35

    local file = io.open("package.json", "r")

    if not file then
        vim.notify("No package.json found in the root.", vim.log.levels.INFO)

        return
    end

    local file_content = file:read("*a")

    local file_json_value = vim.json.decode(file_content)
    local scripts = file_json_value["scripts"]

    local items = {}

    -- Create items for the menu
    for command, script in pairs(scripts) do
        local left_side = "[" .. command .. "] "

        local text = left_side .. script

        -- Makes sure the width can fit the item text
        if string.len(text) > menu_width then
            -- +1 for nice padding
            menu_width = string.len(text) + 1
        end

        table.insert(items, { text = text, command = command })
    end

    table.sort(items, function(a, b)
        return a.text < b.text
    end)

    local menu_items = {}
    for _, item in pairs(items) do
        table.insert(menu_items, Menu.item(item))
    end

    if menu_width > 80 then
        menu_width = 80
    end

    local menu = Menu({
        relative = "editor",
        position = "50%",
        size = { width = menu_width },
        border = {
            style = "rounded",
            highlight = "Normal",
            text = {
                top = " Select Script ",
                top_align = "center",
            },
        },
        buf_options = {
            filetype = "bash",
        },
        win_options = {
            winhighlight = "Normal:Normal",
        },
    }, {
        lines = menu_items,
        on_submit = function(item)
            local terminal = Terminal
                :new({
                    dir = "git_dir",
                    direction = "float",
                    float_opts = {
                        border = "single",
                    },
                    on_open = function()
                        vim.cmd("startinsert!")
                    end,
                    hidden = false,
                })
                :toggle()

            vim.defer_fn(function()
                terminal:send("yarn " .. item.command, false)
            end, 400)
        end,
        on_close = function()
            reset()
        end,
    })

    menu:mount()
end
