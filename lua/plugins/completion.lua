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
        ["<C-E>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<TAB>"] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
            elseif not minsnip.jump() then
                fallback()
            end
        end,
        ["<S-TAB>"] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
            elseif not minsnip.jump_backwards() then
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
            name = "spell",
            max_item_count = 5,
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
