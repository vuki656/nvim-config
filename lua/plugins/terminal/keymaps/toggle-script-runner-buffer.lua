local Terminal = require("toggleterm.terminal").Terminal
local Menu = require("nui.menu")

local colors = require("utils.colors")
local reset = require("plugins.terminal.keymaps.reset")

local RECENT_SCRIPTS_FILE = vim.fn.stdpath("data") .. "/script-runner-recent.json"
local FAVORITES_FILE = vim.fn.stdpath("data") .. "/script-runner-favorites.json"
local MAX_RECENT_SCRIPTS = 5

-- Icon patterns for script names (matched against first segment)
local script_icons = {
    -- Testing
    test = { icon = "󰙨", color = colors.yellow },
    spec = { icon = "󰙨", color = colors.yellow },
    e2e = { icon = "󰙨", color = colors.yellow },
    -- Build & Dev
    build = { icon = "󰏗", color = colors.blue },
    dev = { icon = "󰐊", color = colors.green },
    start = { icon = "󰐊", color = colors.green },
    serve = { icon = "󰐊", color = colors.green },
    watch = { icon = "󰈈", color = colors.orange },
    -- Linting & Formatting
    lint = { icon = "󰍉", color = colors.purple },
    format = { icon = "󰉼", color = colors.white },
    typecheck = { icon = "󰄳", color = colors.blue },
    type = { icon = "󰄳", color = colors.blue },
    -- Database
    db = { icon = "󰆼", color = colors.orange },
    database = { icon = "󰆼", color = colors.orange },
    migrate = { icon = "󰆼", color = colors.orange },
    migration = { icon = "󰆼", color = colors.orange },
    seed = { icon = "󱁤", color = colors.yellow },
    pubsub = { icon = "󰃮", color = colors.blue },
    -- Code Generation
    generate = { icon = "", color = colors.purple },
    codegen = { icon = "", color = colors.purple },
    gen = { icon = "", color = colors.purple },
    extract = { icon = "", color = colors.yellow },
    -- Schema & GraphQL
    schema = { icon = "󰡷", color = colors.blue },
    gql = { icon = "󰡷", color = colors.blue },
    graphql = { icon = "󰡷", color = colors.blue },
    -- Deployment & CI
    deploy = { icon = "", color = colors.green },
    predeploy = { icon = "", color = colors.yellow },
    affected = { icon = "󰛄", color = colors.purple },
    -- Cleanup
    clean = { icon = "󰃢", color = colors.red },
    drop = { icon = "󰃢", color = colors.red },
    reset = { icon = "󰃢", color = colors.red },
    undo = { icon = "󰕌", color = colors.orange },
    -- Docker
    docker = { icon = "󰡨", color = colors.blue },
    compose = { icon = "󰡨", color = colors.blue },
    -- Setup & Install
    setup = { icon = "󰒓", color = colors.orange },
    install = { icon = "󰏔", color = colors.green },
    postinstall = { icon = "󰏔", color = colors.green },
    prepare = { icon = "󰏔", color = colors.white },
    update = { icon = "󰚰", color = colors.blue },
    upgrade = { icon = "󰚰", color = colors.blue },
    -- Utilities
    help = { icon = "󰋖", color = colors.blue },
    cli = { icon = "󰆍", color = colors.white },
    run = { icon = "󰐊", color = colors.green },
    nx = { icon = "󰫢", color = colors.purple },
    dep = { icon = "󰙅", color = colors.orange },
    sentry = { icon = "󰒃", color = colors.red },
    -- OpenAPI
    openapi = { icon = "󱦹", color = colors.yellow },
}

local default_icon = { icon = "󰜎", color = colors.white }

-- Get icon and color for a script name (checks first segment)
local function get_script_icon(script_name)
    local name_lower = script_name:lower()
    -- Get first segment (split by : or -)
    local first_segment = name_lower:match("^([^:%-]+)")

    if first_segment and script_icons[first_segment] then
        return script_icons[first_segment].icon, script_icons[first_segment].color
    end

    -- Fallback: check if any pattern exists anywhere in the name
    for pattern, entry in pairs(script_icons) do
        if name_lower:find(pattern, 1, true) then
            return entry.icon, entry.color
        end
    end

    return default_icon.icon, default_icon.color
end

-- Favorites functions
local function load_favorites()
    local file = io.open(FAVORITES_FILE, "r")
    if not file then
        return {}
    end
    local content = file:read("*a")
    file:close()
    local ok, data = pcall(vim.json.decode, content)
    if ok and data then
        return data
    end
    return {}
end

local function save_favorites(data)
    local file = io.open(FAVORITES_FILE, "w")
    if file then
        file:write(vim.json.encode(data))
        file:close()
    end
end

local function toggle_favorite(git_root, command, package_dir)
    local data = load_favorites()
    if not data[git_root] then
        data[git_root] = {}
    end

    local key = package_dir .. ":" .. command
    if data[git_root][key] then
        data[git_root][key] = nil
    else
        data[git_root][key] = { command = command, package_dir = package_dir }
    end

    save_favorites(data)
end

local function is_favorite(git_root, command, package_dir)
    local data = load_favorites()
    if not data[git_root] then
        return false
    end
    local key = package_dir .. ":" .. command
    return data[git_root][key] ~= nil
end

local function get_favorites(git_root, package_dir, available_scripts)
    local data = load_favorites()
    if not data[git_root] then
        return {}
    end

    local favorites = {}
    for _, entry in pairs(data[git_root]) do
        -- Only include favorites from current package_dir that still exist
        if entry.package_dir == package_dir and available_scripts[entry.command] then
            table.insert(favorites, entry)
        end
    end

    table.sort(favorites, function(a, b)
        return a.command < b.command
    end)

    return favorites
end

-- Highlight groups for the menu
local function setup_highlights()
    vim.api.nvim_set_hl(0, "ScriptRunnerSeparator", { fg = colors.grey })
    vim.api.nvim_set_hl(0, "ScriptRunnerScript", { fg = colors.white })
    vim.api.nvim_set_hl(0, "ScriptRunnerScriptUnderline", { fg = colors.white, underline = true })
    vim.api.nvim_set_hl(0, "ScriptRunnerPath", { fg = colors.orange })
    vim.api.nvim_set_hl(0, "ScriptRunnerGoUp", { fg = colors.yellow })
end

-- Apply syntax highlighting to a menu buffer
local function apply_menu_highlights(bufnr, icon_colors, underline_rows, group_title_colors)
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local ns_id = vim.api.nvim_create_namespace("script_runner_highlights")

    for line_idx, line in ipairs(lines) do
        local row = line_idx - 1

        -- Highlight "Go Up" line
        if line:match("%[%^%]") then
            vim.api.nvim_buf_set_extmark(bufnr, ns_id, row, 0, {
                end_col = #line,
                hl_group = "ScriptRunnerGoUp",
            })
        -- Highlight group title lines (only the title text, not the border)
        elseif group_title_colors and group_title_colors[row] then
            -- Find the title text (word characters after any leading chars)
            -- Format is like "═ Favorites ═══" or " Build"
            local title_match = line:match("(%u%a*)")
            if title_match then
                local title_start = line:find(title_match, 1, true)
                if title_start then
                    vim.api.nvim_buf_set_extmark(bufnr, ns_id, row, title_start - 1, {
                        end_col = title_start - 1 + #title_match,
                        hl_group = group_title_colors[row],
                    })
                end
            end
        -- Highlight script lines (has │ separator)
        elseif line:match(" │ ") then
            local sep_start, sep_end = line:find(" │ ")
            if sep_start and icon_colors[row] then
                local icon_color = icon_colors[row]
                local is_favorite = underline_rows and underline_rows[row]

                -- Find positions: " icon command   │ script"
                local content_start = line:match("^%s*()") or 1
                -- Find where command name starts (after icon and space)
                -- Icon is at content_start, then space, then command
                local icon_end = content_start + #(line:match("^%s*([^ ]+)") or "")
                local cmd_start = icon_end + 1 -- after the space following icon

                -- Find where command name ends (before padding spaces)
                local before_sep = line:sub(1, sep_start - 1)
                local cmd_end = #before_sep:match("^(.-)%s*$") -- trim trailing spaces

                -- Icon (just color, no underline)
                vim.api.nvim_buf_set_extmark(bufnr, ns_id, row, content_start - 1, {
                    end_col = icon_end,
                    hl_group = icon_color,
                })

                -- Command name (white, underline if favorite)
                if is_favorite then
                    vim.api.nvim_buf_set_extmark(bufnr, ns_id, row, cmd_start - 1, {
                        end_col = cmd_end,
                        hl_group = "ScriptRunnerScriptUnderline",
                    })
                else
                    vim.api.nvim_buf_set_extmark(bufnr, ns_id, row, cmd_start - 1, {
                        end_col = cmd_end,
                        hl_group = "ScriptRunnerScript",
                    })
                end

                -- Separator
                vim.api.nvim_buf_set_extmark(bufnr, ns_id, row, sep_start - 1, {
                    end_col = sep_end,
                    hl_group = "ScriptRunnerSeparator",
                })
                -- Script content (no underline)
                vim.api.nvim_buf_set_extmark(bufnr, ns_id, row, sep_end, {
                    end_col = #line,
                    hl_group = "ScriptRunnerScript",
                })
            end
        -- Recent script lines (have @ path)
        elseif line:match(" @ ") then
            local at_start, at_end = line:find(" @ ")
            if at_start and icon_colors[row] then
                local icon_color = icon_colors[row]
                local is_favorite = underline_rows and underline_rows[row]

                local content_start = line:match("^%s*()") or 1
                local icon_end = content_start + #(line:match("^%s*([^ ]+)") or "")
                local cmd_start = icon_end + 1
                local cmd_end = at_start - 1

                -- Icon
                vim.api.nvim_buf_set_extmark(bufnr, ns_id, row, content_start - 1, {
                    end_col = icon_end,
                    hl_group = icon_color,
                })

                -- Command name (white, underline if favorite)
                if is_favorite then
                    vim.api.nvim_buf_set_extmark(bufnr, ns_id, row, cmd_start - 1, {
                        end_col = cmd_end,
                        hl_group = "ScriptRunnerScriptUnderline",
                    })
                else
                    vim.api.nvim_buf_set_extmark(bufnr, ns_id, row, cmd_start - 1, {
                        end_col = cmd_end,
                        hl_group = "ScriptRunnerScript",
                    })
                end

                -- @ separator
                vim.api.nvim_buf_set_extmark(bufnr, ns_id, row, at_start - 1, {
                    end_col = at_end,
                    hl_group = "ScriptRunnerSeparator",
                })
                -- Path
                vim.api.nvim_buf_set_extmark(bufnr, ns_id, row, at_end, {
                    end_col = #line,
                    hl_group = "ScriptRunnerPath",
                })
            end
        end
    end
end

-- Find the nearest package.json by walking up from start_dir
local function find_nearest_package_json(start_dir)
    local current_dir = start_dir
    while current_dir and current_dir ~= "/" do
        local path = current_dir .. "/package.json"
        if vim.fn.filereadable(path) == 1 then
            return path, current_dir
        end
        current_dir = vim.fs.dirname(current_dir)
    end
    return nil, nil
end

-- Get the git root directory
local function get_git_root()
    local result = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    if vim.v.shell_error == 0 and result then
        return result
    end
    return nil
end

-- Load recent scripts from JSON file
local function load_recent_scripts()
    local file = io.open(RECENT_SCRIPTS_FILE, "r")
    if not file then
        return {}
    end
    local content = file:read("*a")
    file:close()
    local ok, data = pcall(vim.json.decode, content)
    if ok and data then
        return data
    end
    return {}
end

-- Save recent scripts to JSON file
local function save_recent_scripts(data)
    local file = io.open(RECENT_SCRIPTS_FILE, "w")
    if file then
        file:write(vim.json.encode(data))
        file:close()
    end
end

-- Add a script to recent scripts
local function add_to_recent(git_root, command, package_dir)
    -- Don't save invalid entries
    if not command or not package_dir then
        return
    end

    local data = load_recent_scripts()
    if not data[git_root] then
        data[git_root] = { scripts = {} }
    end

    local scripts = data[git_root].scripts

    -- Remove existing entry for same command+package_dir
    for i = #scripts, 1, -1 do
        if scripts[i].command == command and scripts[i].package_dir == package_dir then
            table.remove(scripts, i)
        end
    end

    -- Add new entry at the beginning
    table.insert(scripts, 1, {
        command = command,
        package_dir = package_dir,
        timestamp = os.time(),
    })

    -- Keep only MAX_RECENT_SCRIPTS
    while #scripts > MAX_RECENT_SCRIPTS do
        table.remove(scripts)
    end

    save_recent_scripts(data)
end

-- Get recent scripts for a git repo, filtering out deleted ones
local function get_recent_scripts(git_root)
    local data = load_recent_scripts()
    if not data[git_root] or not data[git_root].scripts then
        return {}
    end

    local valid_scripts = {}
    for _, script in ipairs(data[git_root].scripts) do
        -- Skip invalid entries (missing required fields)
        if not script.package_dir or not script.command then
            goto continue
        end

        local package_json_path = script.package_dir .. "/package.json"
        local file = io.open(package_json_path, "r")
        if file then
            local content = file:read("*a")
            file:close()
            local ok, json = pcall(vim.json.decode, content)
            if ok and json and json.scripts and json.scripts[script.command] then
                table.insert(valid_scripts, script)
            end
        end

        ::continue::
    end

    return valid_scripts
end

-- Get relative path from git root
local function get_relative_path(git_root, path)
    if git_root and path:sub(1, #git_root) == git_root then
        local relative = path:sub(#git_root + 2)
        if relative == "" then
            return "."
        end
        return relative
    end
    return path
end

local function on_submit(item, git_root)
    -- Add to recent scripts
    if git_root then
        add_to_recent(git_root, item.command, item.package_dir)
    end

    local terminal = Terminal:new({
        dir = item.package_dir,
        direction = "float",
        float_opts = {
            border = "single",
        },
        on_open = function()
            vim.cmd("startinsert!")
        end,
        hidden = false,
    }):toggle()

    local npm_lock = io.open(item.package_dir .. "/package-lock.json", "r")

    local command = "yarn "

    if npm_lock ~= nil then
        npm_lock:close()
        command = "npm run "
    end

    vim.defer_fn(function()
        terminal:send(command .. item.command, false)
    end, 400)
end

local function open_menu(package_dir, git_root, restore_cursor_command)
    local menu_width = 35
    local max_menu_height = math.floor(vim.o.lines * 0.8)

    local package_json_path = package_dir .. "/package.json"
    local file = io.open(package_json_path, "r")

    if not file then
        vim.notify("No package.json found.", vim.log.levels.INFO)
        return
    end

    local file_content = file:read("*a")
    file:close()

    local file_json_value = vim.json.decode(file_content)
    local scripts = file_json_value["scripts"]

    if not scripts then
        vim.notify("No scripts found in package.json.", vim.log.levels.INFO)
        return
    end

    local items = {}
    local max_command_len = 0

    -- Create items for the menu and find max command length
    for command, script in pairs(scripts) do
        if #command > max_command_len then
            max_command_len = #command
        end

        table.insert(items, {
            command = command,
            script = script,
            package_dir = package_dir,
        })
    end

    table.sort(items, function(a, b)
        return a.command < b.command
    end)

    local menu_items = {}
    local icon_colors = {} -- maps row index (0-based) to highlight group name
    local bold_rows = {} -- rows that should be bold (favorites)
    local group_title_rows = {} -- rows that are group titles
    local row_index = 0

    -- Check for parent package.json (Go Up)
    local parent_package_path, parent_package_dir = find_nearest_package_json(vim.fs.dirname(package_dir))
    local relative_path = get_relative_path(git_root, package_dir)

    if parent_package_path then
        local parent_relative = get_relative_path(git_root, parent_package_dir)
        local go_up_text = " [^] Go Up (" .. parent_relative .. ")"

        if string.len(go_up_text) > menu_width then
            menu_width = string.len(go_up_text) + 1
        end

        table.insert(
            menu_items,
            Menu.item({
                text = go_up_text,
                is_go_up = true,
                parent_dir = parent_package_dir,
            })
        )
        row_index = row_index + 1
    end

    -- Favorites section
    local favorites = {}
    if git_root then
        favorites = get_favorites(git_root, package_dir, scripts)
    end

    if #favorites > 0 then
        table.insert(menu_items, Menu.separator(" Favorites ", { char = "═", text_align = "left" }))
        group_title_rows[row_index] = "ScriptRunnerScript" -- white for mixed section
        row_index = row_index + 1

        for _, fav in ipairs(favorites) do
            local icon, icon_color = get_script_icon(fav.command)
            local padding = string.rep(" ", max_command_len - #fav.command)
            local text = " " .. icon .. " " .. fav.command .. padding .. " │ " .. scripts[fav.command]

            if string.len(text) > menu_width then
                menu_width = string.len(text) + 1
            end

            local hl_name = "ScriptRunnerIcon" .. icon_color:gsub("#", "")
            vim.api.nvim_set_hl(0, hl_name, { fg = icon_color })
            icon_colors[row_index] = hl_name

            table.insert(
                menu_items,
                Menu.item({
                    text = text,
                    command = fav.command,
                    package_dir = fav.package_dir,
                })
            )
            row_index = row_index + 1
        end
    end

    -- Recent scripts section
    local recent_scripts = {}
    if git_root then
        recent_scripts = get_recent_scripts(git_root)
    end

    if #recent_scripts > 0 then
        table.insert(menu_items, Menu.separator(" Recent ", { char = "═", text_align = "left" }))
        group_title_rows[row_index] = "ScriptRunnerScript" -- white for mixed section
        row_index = row_index + 1

        for _, recent in ipairs(recent_scripts) do
            local recent_relative = get_relative_path(git_root, recent.package_dir)
            local icon, icon_color = get_script_icon(recent.command)
            local text = " " .. icon .. " " .. recent.command .. " @ " .. recent_relative

            if string.len(text) > menu_width then
                menu_width = string.len(text) + 1
            end

            local hl_name = "ScriptRunnerIcon" .. icon_color:gsub("#", "")
            vim.api.nvim_set_hl(0, hl_name, { fg = icon_color })
            icon_colors[row_index] = hl_name

            table.insert(
                menu_items,
                Menu.item({
                    text = text,
                    command = recent.command,
                    package_dir = recent.package_dir,
                })
            )
            row_index = row_index + 1
        end
    end

    -- Scripts section
    local last_prefix = nil
    local added_scripts_separator = false
    for _, item in ipairs(items) do
        -- Get first segment for grouping
        local current_prefix = item.command:lower():match("^([^:%-]+)")

        -- Add group subtitle when prefix changes
        if current_prefix ~= last_prefix then
            local group_title = current_prefix:sub(1, 1):upper() .. current_prefix:sub(2)
            -- Get color for this group from first item
            local _, group_color = get_script_icon(item.command)
            local group_hl_name = "ScriptRunnerIcon" .. group_color:gsub("#", "")
            vim.api.nvim_set_hl(0, group_hl_name, { fg = group_color })

            -- Use double line for first group if there are previous sections (Go Up, Favorites, Recent)
            if not added_scripts_separator then
                added_scripts_separator = true
                if #menu_items > 0 then
                    table.insert(
                        menu_items,
                        Menu.separator(" " .. group_title .. " ", { char = "═", text_align = "left" })
                    )
                else
                    table.insert(menu_items, Menu.separator(" " .. group_title, { text_align = "left" }))
                end
            else
                table.insert(menu_items, Menu.separator(" " .. group_title, { text_align = "left" }))
            end
            group_title_rows[row_index] = group_hl_name
            row_index = row_index + 1
        end
        last_prefix = current_prefix

        local icon, icon_color = get_script_icon(item.command)
        local padding = string.rep(" ", max_command_len - #item.command)
        local text = " " .. icon .. " " .. item.command .. padding .. " │ " .. item.script

        if string.len(text) > menu_width then
            menu_width = string.len(text) + 1
        end

        -- Check if this is a favorite
        local is_fav = git_root and is_favorite(git_root, item.command, package_dir)
        local hl_name = "ScriptRunnerIcon" .. icon_color:gsub("#", "")
        vim.api.nvim_set_hl(0, hl_name, { fg = icon_color })
        if is_fav then
            bold_rows[row_index] = true
        end
        icon_colors[row_index] = hl_name

        table.insert(
            menu_items,
            Menu.item({
                text = text,
                command = item.command,
                package_dir = item.package_dir,
            })
        )
        row_index = row_index + 1
    end

    if menu_width > 100 then
        menu_width = 100
    end

    -- Build title with relative path context
    local title = " Select Script "
    if relative_path ~= "." then
        title = " Select Script (" .. relative_path .. ") "
        if string.len(title) > menu_width then
            menu_width = string.len(title) + 2
        end
    end

    local menu = Menu({
        relative = "editor",
        position = "50%",
        size = { width = menu_width },
        border = {
            style = "rounded",
            highlight = "Normal",
            text = {
                top = title,
                top_align = "center",
            },
        },
        buf_options = {},
        win_options = {
            winhighlight = "Normal:Normal",
        },
    }, {
        lines = menu_items,
        max_height = max_menu_height,
        keymap = {
            focus_next = {},
            focus_prev = {},
            close = { "<Esc>", "q" },
            submit = { "<CR>" },
        },
        on_submit = function(item)
            -- Ignore separators/borders (they don't have command or package_dir)
            if not item.command or not item.package_dir then
                return
            end

            if item.is_go_up then
                open_menu(item.parent_dir, git_root)
            else
                on_submit(item, git_root)
            end
        end,
        on_close = function()
            reset()
        end,
    })

    menu:mount()

    -- Apply syntax highlighting
    setup_highlights()
    apply_menu_highlights(menu.bufnr, icon_colors, bold_rows, group_title_rows)

    -- Position cursor (by row number or find LAST occurrence by command name)
    local cursor_row = 1
    if type(restore_cursor_command) == "number" then
        -- Restore by row number
        cursor_row = restore_cursor_command
    elseif type(restore_cursor_command) == "string" then
        -- Find LAST occurrence by command name (Scripts section, not Favorites)
        for i, item in ipairs(menu_items) do
            if item.command == restore_cursor_command then
                cursor_row = i
                -- Don't break - keep going to find the last occurrence
            end
        end
    end
    local max_row = vim.api.nvim_buf_line_count(menu.bufnr)
    if cursor_row > max_row then
        cursor_row = max_row
    end
    vim.api.nvim_win_set_cursor(menu.winid, { cursor_row, 0 })

    -- Prevent left/right movement
    menu:map("n", "h", "", { noremap = true, nowait = true })
    menu:map("n", "l", "", { noremap = true, nowait = true })
    menu:map("n", "<Left>", "", { noremap = true, nowait = true })
    menu:map("n", "<Right>", "", { noremap = true, nowait = true })

    -- Prevent j/k from wrapping at boundaries (using expr for speed)
    menu:map("n", "j", function()
        local row = vim.api.nvim_win_get_cursor(menu.winid)[1]
        return row < max_row and "j" or ""
    end, { noremap = true, nowait = true, expr = true })
    menu:map("n", "k", function()
        local row = vim.api.nvim_win_get_cursor(menu.winid)[1]
        return row > 1 and "k" or ""
    end, { noremap = true, nowait = true, expr = true })

    -- Toggle favorite with space
    menu:map("n", "<Space>", function()
        local cursor = vim.api.nvim_win_get_cursor(menu.winid)
        local row = cursor[1]
        local item = menu_items[row]
        if item and item.command and item.package_dir and git_root then
            local was_favorite = is_favorite(git_root, item.command, item.package_dir)
            toggle_favorite(git_root, item.command, item.package_dir)
            menu:unmount()
            if was_favorite then
                -- Unfavoriting from Favorites section - stay at same row
                open_menu(package_dir, git_root, row)
            else
                -- Adding favorite - find in Scripts section
                open_menu(package_dir, git_root, item.command)
            end
        end
    end, { noremap = true, nowait = true })

    -- Map ^ for Go Up
    if parent_package_path then
        menu:map("n", "^", function()
            menu:unmount()
            open_menu(parent_package_dir, git_root)
        end, { noremap = true, nowait = true })
    end

    -- Exit with q
    menu:map("n", "q", function()
        menu:unmount()
    end, { noremap = true, nowait = true })
end

return function()
    -- Get the directory of the current buffer
    local buf_name = vim.api.nvim_buf_get_name(0)
    local start_dir

    if buf_name and buf_name ~= "" then
        start_dir = vim.fs.dirname(buf_name)
    else
        start_dir = vim.fn.getcwd()
    end

    -- Find nearest package.json
    local _, package_dir = find_nearest_package_json(start_dir)

    if not package_dir then
        vim.notify("No package.json found.", vim.log.levels.INFO)
        return
    end

    local git_root = get_git_root()

    open_menu(package_dir, git_root)
end
