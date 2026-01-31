local Input = require("nui.input")
local Layout = require("nui.layout")
local Popup = require("nui.popup")

local set_keymap = require("utils.set-keymap")

local M = {
    layout = nil,
    popups = {
        find = nil,
        replace = nil,
        options = nil,
        hint = nil,
    },
    state = {
        find_text = "",
        replace_text = "",
        options = {
            global = true,
            confirm = false,
            ignore_case = false,
            whole_file = true,
        },
        visual_range = nil,
        current_focus = "find",
    },
    is_closing = false,
    original_win = nil,
}

local POPUP_WIDTH = 40

-- ============================================================================
-- HELPERS
-- ============================================================================

--- Escapes special characters in the search pattern for use in substitute
-- @param text: string - text to escape
-- @return string - escaped text
M.__escape_pattern = function(text)
    return vim.fn.escape(text, "/\\")
end

--- Builds the substitute command string
-- @return string - the :s/find/replace/flags command
M.__build_command = function()
    local find = M.__escape_pattern(M.state.find_text)
    local replace = M.state.replace_text

    if find == "" then
        return nil
    end

    local flags = ""

    if M.state.options.global then
        flags = flags .. "g"
    end

    if M.state.options.confirm then
        flags = flags .. "c"
    end

    if M.state.options.ignore_case then
        flags = flags .. "i"
    end

    local range = ""

    if M.state.visual_range then
        range = M.state.visual_range
    elseif M.state.options.whole_file then
        range = "%"
    end

    return range .. "s/" .. find .. "/" .. replace .. "/" .. flags
end

--- Reads current text from input buffers
M.__sync_input_state = function()
    if M.popups.find and M.popups.find.bufnr then
        local lines = vim.api.nvim_buf_get_lines(M.popups.find.bufnr, 0, 1, false)
        M.state.find_text = lines[1] or ""
    end

    if M.popups.replace and M.popups.replace.bufnr then
        local lines = vim.api.nvim_buf_get_lines(M.popups.replace.bufnr, 0, 1, false)
        M.state.replace_text = lines[1] or ""
    end
end

--- Executes the substitute command
M.__execute = function()
    -- Sync state from buffers before building command
    M.__sync_input_state()

    local cmd = M.__build_command()

    if not cmd then
        vim.notify("Find pattern cannot be empty", vim.log.levels.WARN)

        return
    end

    local original_win = M.original_win

    -- Close synchronously for execute
    M.is_closing = true

    if M.layout then
        M.layout:unmount()
        M.layout = nil
    end

    M.popups = {
        find = nil,
        replace = nil,
        options = nil,
        hint = nil,
    }

    M.is_closing = false

    -- Return to original window
    if original_win and vim.api.nvim_win_is_valid(original_win) then
        vim.api.nvim_set_current_win(original_win)
    end

    -- Execute the substitute command
    local ok, err = pcall(function()
        vim.cmd(cmd)
    end)

    if not ok then
        vim.notify("Substitute failed: " .. tostring(err), vim.log.levels.ERROR)
    end

    -- Clear search highlighting
    vim.cmd("nohlsearch")
end

--- Renders the options popup content with checkboxes
M.__render_options = function()
    if not M.popups.options or not M.popups.options.bufnr then
        return
    end

    local lines = {
        (M.state.options.global and "[x]" or "[ ]") .. " g - All occurrences",
        (M.state.options.confirm and "[x]" or "[ ]") .. " c - Confirm each",
        (M.state.options.ignore_case and "[x]" or "[ ]") .. " i - Ignore case",
        (M.state.visual_range and "[-]" or (M.state.options.whole_file and "[x]" or "[ ]"))
            .. " % - Whole file"
            .. (M.state.visual_range and " (visual)" or ""),
    }

    vim.api.nvim_set_option_value("modifiable", true, { buf = M.popups.options.bufnr })
    vim.api.nvim_buf_set_lines(M.popups.options.bufnr, 0, -1, false, lines)
    vim.api.nvim_set_option_value("modifiable", false, { buf = M.popups.options.bufnr })
end

--- Toggles an option and re-renders
-- @param option: string - option key to toggle
M.__toggle_option = function(option)
    if option == "whole_file" and M.state.visual_range then
        return
    end

    M.state.options[option] = not M.state.options[option]
    M.__render_options()
end

--- Gets the option key for the current cursor line in options popup
-- @return string|nil - option key or nil if invalid line
M.__get_option_at_cursor = function()
    local line = vim.fn.line(".")
    local options_order = { "global", "confirm", "ignore_case", "whole_file" }

    return options_order[line]
end

--- Toggles the option at the current cursor line
M.__toggle_current_option = function()
    local option = M.__get_option_at_cursor()

    if option then
        M.__toggle_option(option)
    end
end

--- Sets focus to a specific popup
-- @param target: string - "find", "replace", or "options"
M.__set_focus = function(target)
    if M.is_closing then
        return
    end

    M.state.current_focus = target

    local popup = M.popups[target]

    if not popup or not popup.winid or not vim.api.nvim_win_is_valid(popup.winid) then
        return
    end

    vim.api.nvim_set_current_win(popup.winid)

    if target == "options" then
        vim.cmd("stopinsert")
        -- Position cursor between [ and ] (column 2) after mode switch
        vim.schedule(function()
            if popup.winid and vim.api.nvim_win_is_valid(popup.winid) then
                vim.api.nvim_win_set_cursor(popup.winid, { 1, 1 })
            end
        end)
    else
        vim.cmd("startinsert!")
    end
end

--- Cycles focus to the next popup
M.__focus_next = function()
    local order = { "find", "replace", "options" }
    local current_idx = 1

    for i, name in ipairs(order) do
        if name == M.state.current_focus then
            current_idx = i
            break
        end
    end

    local next_idx = (current_idx % #order) + 1

    M.__set_focus(order[next_idx])
end

--- Cycles focus to the previous popup
M.__focus_prev = function()
    local order = { "find", "replace", "options" }
    local current_idx = 1

    for i, name in ipairs(order) do
        if name == M.state.current_focus then
            current_idx = i
            break
        end
    end

    local prev_idx = ((current_idx - 2) % #order) + 1

    M.__set_focus(order[prev_idx])
end

-- ============================================================================
-- UI GENERATION
-- ============================================================================

--- Creates all popup components
M.__create_popups = function()
    -- Find input
    M.popups.find = Input({
        border = {
            style = "rounded",
            text = {
                top = " Find ",
                top_align = "left",
            },
        },
        win_options = {
            winhighlight = "Normal:Normal",
        },
    }, {
        on_change = function(value)
            M.state.find_text = value
        end,
    })

    -- Replace input
    M.popups.replace = Input({
        border = {
            style = "rounded",
            text = {
                top = " Replace ",
                top_align = "left",
            },
        },
        win_options = {
            winhighlight = "Normal:Normal",
        },
    }, {
        on_change = function(value)
            M.state.replace_text = value
        end,
    })

    -- Options popup
    M.popups.options = Popup({
        border = {
            style = "rounded",
            text = {
                top = " Options ",
                top_align = "left",
            },
        },
        win_options = {
            winhighlight = "Normal:Normal",
        },
    })

    -- Hint popup
    M.popups.hint = Popup({
        border = {
            style = "rounded",
        },
        win_options = {
            winhighlight = "Normal:Normal",
        },
    })
end

--- Creates the layout and mounts everything
M.__create_layout = function()
    M.layout = Layout(
        {
            relative = "editor",
            position = "50%",
            size = {
                width = POPUP_WIDTH,
                height = 13,
            },
        },
        Layout.Box({
            Layout.Box(M.popups.find, { size = 3 }),
            Layout.Box(M.popups.replace, { size = 3 }),
            Layout.Box(M.popups.options, { size = 6 }),
            Layout.Box(M.popups.hint, { size = 1 }),
        }, { dir = "col" })
    )

    M.layout:mount()

    -- Set hint text
    vim.api.nvim_buf_set_lines(
        M.popups.hint.bufnr,
        0,
        -1,
        false,
        { " Tab: next | Space: toggle | Enter: run | Esc: quit" }
    )

    -- Render initial options state
    M.__render_options()
end

-- ============================================================================
-- KEYMAPS (internal)
-- ============================================================================

--- Sets up keymaps for all popups
M.__setup_keymaps = function()
    local key_options = { noremap = true, nowait = true }

    local all_popups = { M.popups.find, M.popups.replace, M.popups.options }

    for _, popup in ipairs(all_popups) do
        -- Tab to cycle forward
        popup:map("i", "<Tab>", function()
            M.__focus_next()
        end, key_options)

        popup:map("n", "<Tab>", function()
            M.__focus_next()
        end, key_options)

        -- Shift-Tab to cycle backward
        popup:map("i", "<S-Tab>", function()
            M.__focus_prev()
        end, key_options)

        popup:map("n", "<S-Tab>", function()
            M.__focus_prev()
        end, key_options)

        -- Enter to execute
        popup:map("i", "<CR>", function()
            M.__execute()
        end, key_options)

        popup:map("n", "<CR>", function()
            M.__execute()
        end, key_options)

        -- Escape to close
        popup:map("i", "<Esc>", function()
            M.close()
        end, key_options)

        popup:map("n", "<Esc>", function()
            M.close()
        end, key_options)

        -- q to close (normal mode only)
        popup:map("n", "q", function()
            M.close()
        end, key_options)
    end

    -- Options popup specific keymaps
    -- Toggle with space
    M.popups.options:map("n", "<Space>", function()
        M.__toggle_current_option()
    end, key_options)

    -- Override j/k to maintain column at position 2 (between [ and ])
    M.popups.options:map("n", "j", function()
        local cursor = vim.api.nvim_win_get_cursor(0)
        local line_count = vim.api.nvim_buf_line_count(M.popups.options.bufnr)
        if cursor[1] < line_count then
            vim.api.nvim_win_set_cursor(0, { cursor[1] + 1, 1 })
        end
    end, key_options)

    M.popups.options:map("n", "k", function()
        local cursor = vim.api.nvim_win_get_cursor(0)
        if cursor[1] > 1 then
            vim.api.nvim_win_set_cursor(0, { cursor[1] - 1, 1 })
        end
    end, key_options)

    -- Disable horizontal movement
    M.popups.options:map("n", "h", function() end, key_options)
    M.popups.options:map("n", "l", function() end, key_options)
    M.popups.options:map("n", "0", function() end, key_options)
    M.popups.options:map("n", "$", function() end, key_options)
    M.popups.options:map("n", "^", function() end, key_options)
    M.popups.options:map("n", "w", function() end, key_options)
    M.popups.options:map("n", "b", function() end, key_options)
    M.popups.options:map("n", "e", function() end, key_options)
end

-- ============================================================================
-- PUBLIC API
-- ============================================================================

--- Opens the search and replace popup
-- @param opts: table|nil - options
--   opts.visual: boolean - true if opened from visual mode
M.open = function(opts)
    opts = opts or {}

    if M.layout then
        vim.notify("Search and replace is already open", vim.log.levels.WARN)

        return
    end

    -- Save original window
    M.original_win = vim.api.nvim_get_current_win()
    M.is_closing = false

    -- Reset state
    M.state = {
        find_text = "",
        replace_text = "",
        options = {
            global = true,
            confirm = false,
            ignore_case = false,
            whole_file = true,
        },
        visual_range = nil,
        current_focus = "find",
    }

    -- Handle visual mode
    if opts.visual then
        local start_line = vim.fn.line("'<")
        local end_line = vim.fn.line("'>")

        M.state.visual_range = start_line .. "," .. end_line
        M.state.options.whole_file = false

        local start_col = vim.fn.col("'<")
        local end_col = vim.fn.col("'>")

        if start_line == end_line then
            local line = vim.fn.getline(start_line)
            local selected = string.sub(line, start_col, end_col)

            if selected and selected ~= "" then
                M.state.find_text = selected
            end
        end
    end

    M.__create_popups()
    M.__create_layout()
    M.__setup_keymaps()

    -- Set initial find text if we have it
    if M.state.find_text ~= "" then
        vim.api.nvim_buf_set_lines(M.popups.find.bufnr, 0, -1, false, { M.state.find_text })
    end

    -- Focus the find input after a short delay to ensure window is ready
    vim.schedule(function()
        M.__set_focus("find")
    end)
end

--- Closes the search and replace popup
M.close = function()
    if M.is_closing then
        return
    end

    M.is_closing = true

    local original_win = M.original_win

    vim.schedule(function()
        if M.layout then
            M.layout:unmount()
            M.layout = nil
        end

        M.popups = {
            find = nil,
            replace = nil,
            options = nil,
            hint = nil,
        }

        -- Return to original window
        if original_win and vim.api.nvim_win_is_valid(original_win) then
            vim.api.nvim_set_current_win(original_win)
        end

        M.is_closing = false
    end)
end

-- ============================================================================
-- GLOBAL KEYMAPS
-- ============================================================================

set_keymap({
    list = {
        {
            modes = { "n" },
            key = "<Leader>os",
            actions = function()
                M.open()
            end,
            description = "[SearchReplace] Open search and replace",
        },
        {
            modes = { "v" },
            key = "<Leader>os",
            actions = function()
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)

                vim.defer_fn(function()
                    M.open({ visual = true })
                end, 10)
            end,
            description = "[SearchReplace] Open search and replace in selection",
        },
    },
})

return M
