-- Name: Cmp
-- Description: Autocompletion
-- Link: https://github.com/hrsh7th/nvim-cmp

local cmp = require("cmp")
local minsnip = require("minsnip")
local lspkind = require("lspkind")
local buffer = require("cmp_buffer")

local colors = require("utils.colors")
local set_highlight = require("utils.set_highlight")

--------------------------------------------------------------------------------------------
------------------------------------- SETUP ------------------------------------------------
--------------------------------------------------------------------------------------------

-- Fix tabbing
vim.o.completeopt = "menuone,noselect"

cmp.setup({
    mapping = {
        ["<C-SPACE>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    },
    formatting = {
        format = lspkind.cmp_format(),
    },
    snippet = {
        expand = function(args)
            minsnip.expand_anonymous(args.body)
        end,
    },
    sources = {
        {
            name = "nvim_lsp",
            max_item_count = 50,
        },
        {
            name = "buffer",
            max_item_count = 15,
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end,
            },
        },
        {
            name = "minsnip",
            max_item_count = 1,
        },
        {
            name = "path",
            max_item_count = 15,
        },
        {
            name = "nvim_lua",
            max_item_count = 20,
        },
        sorting = {
            comparators = {
                function(...)
                    return buffer:compare_locality(...)
                end,
            },
        },
    },
})

-- Command source for commands
cmp.setup.cmdline(":", {
    sources = {
        { name = "cmdline" },
    },
})

-- Buffer source for search
cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" },
    },
})

--------------------------------------------------------------------------------------------
------------------------------------- COLORS -----------------------------------------------
--------------------------------------------------------------------------------------------

set_highlight(
    -- Selected item
    { group = "PmenuSel", background = colors.green, foreground = colors.background }
)
