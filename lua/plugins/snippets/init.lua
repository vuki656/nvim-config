-- Name: Luasnip
-- Description: Snippet Engine
-- Link: https://github.com/l3mon4d3/LuaSnip

local luasnip = require("luasnip")

local set_keymap = require("utils.set-keymap")

local console_log_snippet = require("plugins.snippets.nodes.console_log")
local export_all_snippet = require("plugins.snippets.nodes.export_all")
local service_function_snippet = require("plugins.snippets.nodes.service_function")
local resolver_query_snippet = require("plugins.snippets.nodes.resolver_query")
local resolver_mutation_snippet = require("plugins.snippets.nodes.resolver_mutation")
local arrow_function_snippet = require("plugins.snippets.nodes.arrow_function")

------------------------------------------------------------------------------------------
------------------------------------ SETUP -----------------------------------------------
------------------------------------------------------------------------------------------

luasnip.config.set_config({
    history = true,
    update_events = "TextChanged,TextChangedI",
})

------------------------------------------------------------------------------------------
------------------------------------ SNIPPETS --------------------------------------------
------------------------------------------------------------------------------------------

luasnip.add_snippets("typescript", {
    console_log_snippet,
    export_all_snippet,
    arrow_function_snippet,
    service_function_snippet,
    resolver_mutation_snippet,
    resolver_query_snippet,
})

luasnip.add_snippets("typescriptreact", {
    console_log_snippet,
    export_all_snippet,
    arrow_function_snippet,
})

luasnip.add_snippets("javascript", {
    console_log_snippet,
    export_all_snippet,
    arrow_function_snippet,
})

luasnip.add_snippets("javascriptreact", {
    console_log_snippet,
    export_all_snippet,
    arrow_function_snippet,
})

------------------------------------------------------------------------------------------
------------------------------------ KEYMAPS ---------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            modes = { "i", "s" },
            key = "<C-k>",
            actions = function()
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                end
            end,
            description = "Go to next snippet placeholder",
        },
        {
            modes = { "i", "s" },
            key = "<C-j>",
            actions = function()
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                end
            end,
            description = "Go to previous snippet placeholder",
        },
    },
})
