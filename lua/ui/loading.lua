local SPINNERS = {
    "⠋",
    "⠙",
    "⠹",
    "⠸",
    "⠼",
    "⠴",
    "⠦",
    "⠧",
    "⠇",
    "⠏",
}

local M = {}

M.state = {
    current_spinner = "",
    is_running = false,
    index = 1,
}

--- Set the loading spinner to new tick after timeout
-- @return nil
M.update = function()
    if not M.state.is_running then
        return
    end

    M.state.current_spinner = SPINNERS[M.state.index]

    M.state.index = M.state.index + 1

    if M.state.index == 10 then
        M.state.index = 1
    end

    vim.fn.timer_start(60, function()
        M.update()
    end)
end

--- Start the loading spinner
-- @return nil
M.start = function()
    M.state.is_running = true

    M.update()
end

--- Stop the loading spinner and reset the state
-- @return nil
M.stop = function()
    vim.fn.timer_stopall()

    M.state.index = 1
    M.state.current_spinner = ""
    M.state.is_running = false
end

return M
