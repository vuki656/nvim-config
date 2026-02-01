-- Name: Cmp
-- Description: Autocompletion
-- Link: https://github.com/hrsh7th/nvim-cmp

local cmp = require("cmp")
local lspkind = require("lspkind")
local snippets = require("luasnip")

lspkind.init()

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
    performance = {
        debounce = 0, -- default is 60ms
        throttle = 0, -- default is 30ms
    },
    experimental = {
        ghost_text = true,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
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
        ["<C-b>"] = cmp.mapping.scroll_docs(4),
        ["<C-f>"] = cmp.mapping.scroll_docs(-4),
    },
    formatting = {
        format = lspkind.cmp_format(),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip", max_item_count = 10 },
        {
            name = "buffer",
            max_item_count = 10,
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end,
            },
        },
        { name = "path", max_item_count = 10 },
        { name = "nvim_lua", max_item_count = 10 },
    },
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
})

-- Command source for commands
cmp.setup.cmdline(":", {
    window = {
        completion = {
            border = "rounded",
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        },
    },
    sources = {
        { name = "cmdline" },
    },
    mapping = cmp.mapping.preset.cmdline(),
})

-- Buffer source for search
cmp.setup.cmdline("/", {
    window = {
        completion = {
            border = "rounded",
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        },
    },
    sources = {
        { name = "buffer" },
    },
    mapping = cmp.mapping.preset.cmdline(),
})

--------------------------------------------------------------------------------------------
------------------------------------- COLORS -----------------------------------------------
--------------------------------------------------------------------------------------------

set_highlight({
    list = {
        { group = "CmpItemKindDefault", foreground = colors.blue },
        { group = "CmpItemAbbrDeprecated", foreground = colors.red, options = "strikethrough" },
        { group = "CmpItemAbbrMatch", foreground = colors.red },
        { group = "CmpItemKindVariable", foreground = colors.orange },
        { group = "CmpItemKindInterface", foreground = colors.purple },
        { group = "CmpItemKindText", foreground = colors.white },
        { group = "CmpItemKindFunction", foreground = colors.blue },
        { group = "CmpItemKindClass", foreground = colors.yellow },
        { group = "CmpItemKindConstant", foreground = colors.green },
        { group = "CmpItemKindField", foreground = colors.orange },
        { group = "CmpItemKindMethod", foreground = colors.blue },
        { group = "CmpItemKindKeyword", foreground = colors.purple },
        { group = "CmpItemKindProperty", foreground = colors.red },
    },
})
