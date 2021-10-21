-- Name: Cmp
-- Description: Autocompletion
-- Link: https://github.com/hrsh7th/nvim-cmp

local cmp = require("cmp")
local minsnip = require("minsnip")
local lspkind = require("lspkind")

local colors = require("utils.colors")

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
        ["<TAB>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ["<S-TAB>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
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
            name = "minsnip",
            max_item_count = 1,
        },
        {
            name = "nvim_lsp",
            max_item_count = 50,
        },
        {
            name = "nvim_lua",
            max_item_count = 20,
        },
        {
            name = "buffer",
            max_item_count = 15,
            opts = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end,
            },
        },
        {
            name = "path",
            max_item_count = 15,
        },
    },
})

--------------------------------------------------------------------------------------------
------------------------------------- COLORS -----------------------------------------------
--------------------------------------------------------------------------------------------

---- Selected item
vim.cmd([[highlight PmenuSel           guibg=]] .. colors.green)
vim.cmd([[highlight PmenuSel           guifg=]] .. colors.background)
