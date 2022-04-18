-- Name: Cmp
-- Description: Autocompletion
-- Link: https://github.com/hrsh7th/nvim-cmp

local cmp = require("cmp")
local snippets = require("luasnip")
local icons = require("lspkind")
local buffer = require("cmp_buffer")

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")

local has_words_before = function()
    local line, column = unpack(vim.api.nvim_win_get_cursor(0))

    return column ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(column, column):match("%s") == nil
end

--------------------------------------------------------------------------------------------
------------------------------------- SETUP ------------------------------------------------
--------------------------------------------------------------------------------------------

-- Fix tabbing
vim.o.completeopt = "menuone,noselect"

cmp.setup({
    snippet = {
        expand = function(args)
            snippets.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-SPACE>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    formatting = {
        format = icons.cmp_format(),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
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
    mapping = cmp.mapping.preset.cmdline(),
})

-- Buffer source for search
cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" },
    },
    mapping = cmp.mapping.preset.cmdline(),
})

--------------------------------------------------------------------------------------------
------------------------------------- COLORS -----------------------------------------------
--------------------------------------------------------------------------------------------

set_highlight({ group = "CmpItemKindDefault", foreground = colors.blue })
