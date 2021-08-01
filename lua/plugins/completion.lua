-- Name: Compe
-- Description: Autocompletion
-- Link: https://github.com/hrsh7th/nvim-compe

local compe = require("compe")
local vars = require("utils.vars")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

compe.setup({
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1,
    },
    source = {
        path = true,
        buffer = true,
        calc = true,
        vsnip = true,
        nvim_lsp = true,
        nvim_lua = true,
        neorg = true
    },
})

vim.o.completeopt = "menuone,noselect"

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Tab to navigate forward in suggestion dialog
vars.remap.fn("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
vars.remap.fn("s", "<Tab>", "v:lua.tab_complete()", { expr = true })

-- Shift + Tab to navigate backwards in suggestion dialog
vars.remap.fn("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
vars.remap.fn("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })

-- CTRL + Space to open the suggestion dialog
vars.remap.fn("i", "<C-Space>", "compe#complete()", { expr = true })

-- Enter to select suggestion dialog item
vars.remap.fn("i", "<CR>", "compe#confirm('<CR>')", { expr = true })

-- Close suggestion dialog
vars.remap.fn("i", "<C-e>", "compe#close('<C-e>')", { expr = true })

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Selected item
vim.cmd([[highlight PmenuSel           guibg=]] .. colors.green)
vim.cmd([[highlight PmenuSel           guifg=]] .. colors.background)

------------------------------------------------------------------------------------------
----------------------------------- CONFIG -----------------------------------------------
------------------------------------------------------------------------------------------

----------------------------- TAB RESULT NAVIGATION --------------------------------------
local call_command = function(string)
    return vim.api.nvim_replace_termcodes(string, true, true, true)
end

local check_back_space = function()
    local column = vim.fn.col(".") - 1

    if column == 0 or vim.fn.getline("."):sub(column, column):match("%s") then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return call_command("<C-n>")
    elseif check_back_space() then
        return call_command("<Tab>")
    else
        return vim.fn["compe#complete"]()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return call_command("<C-p>")
    else
        return call_command("<S-Tab>")
    end
end
