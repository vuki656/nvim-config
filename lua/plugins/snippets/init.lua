-- Name: Luasnip
-- Description: Snippet Engine
-- Link: https://github.com/l3mon4d3/LuaSnip

local luasnip = require("luasnip")

local set_keymap = require("utils.set-keymap")

local console_log_snippet = require("plugins.snippets.nodes.console_log")
local console_log_stringify_snippet = require("plugins.snippets.nodes.console_log_stringify")
local export_all_snippet = require("plugins.snippets.nodes.export_all")
local service_function_snippet = require("plugins.snippets.nodes.service_function")
local arrow_function_snippet = require("plugins.snippets.nodes.arrow_function")

-- Typegraphql
local resolver_query_snippet = require("plugins.snippets.nodes.resolver_query")
local resolver_mutation_snippet = require("plugins.snippets.nodes.resolver_mutation")
local resolver_args_snippet = require("plugins.snippets.nodes.resolver_args")
local resolver_input_snippet = require("plugins.snippets.nodes.resolver_input")
local resolver_payload_snippet = require("plugins.snippets.nodes.resolver_payload")
local resolver_type_snippet = require("plugins.snippets.nodes.resolver_type")

-- React
local react_element = require("plugins.snippets.nodes.react_element")

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
    console_log_stringify_snippet,
    export_all_snippet,
    arrow_function_snippet,
    service_function_snippet,

    -- Typegraphql
    resolver_mutation_snippet,
    resolver_query_snippet,
    resolver_args_snippet,
    resolver_input_snippet,
    resolver_payload_snippet,
    resolver_type_snippet,
})

luasnip.add_snippets("typescriptreact", {
    console_log_snippet,
    console_log_stringify_snippet,
    export_all_snippet,
    arrow_function_snippet,
    react_element,
})

luasnip.add_snippets("javascript", {
    console_log_snippet,
    console_log_stringify_snippet,
    export_all_snippet,
    arrow_function_snippet,
})

luasnip.add_snippets("javascriptreact", {
    console_log_snippet,
    console_log_stringify_snippet,
    export_all_snippet,
    arrow_function_snippet,
    react_element,
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
