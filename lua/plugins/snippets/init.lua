-- Name: Luasnip
-- Description: Snippet Engine
-- Link: https://github.com/l3mon4d3/luasnip

local luasnip = require("luasnip")

local set_keymap = require("utils.set-keymap")

-- JS/TS
local arrow_function_async_snippet = require("plugins.snippets.nodes.js.arrow_function_async")
local arrow_function_full_async_snippet = require("plugins.snippets.nodes.js.arrow_function_full_async")
local arrow_function_full_snippet = require("plugins.snippets.nodes.js.arrow_function_full")
local arrow_function_snippet = require("plugins.snippets.nodes.js.arrow_function")
local console_log_snippet = require("plugins.snippets.nodes.js.console_log")
local console_log_stringify_snippet = require("plugins.snippets.nodes.js.console_log_stringify")
local export_all_snippet = require("plugins.snippets.nodes.js.export_all")
local service_function_snippet = require("plugins.snippets.nodes.js.service_function")
local type_snippet = require("plugins.snippets.nodes.js.type")

-- Typegraphql
local resolver_args_snippet = require("plugins.snippets.nodes.js.type_graphql.resolver_args")
local resolver_input_snippet = require("plugins.snippets.nodes.js.type_graphql.resolver_input")
local resolver_mutation_snippet = require("plugins.snippets.nodes.js.type_graphql.resolver_mutation")
local resolver_payload_snippet = require("plugins.snippets.nodes.js.type_graphql.resolver_payload")
local resolver_query_snippet = require("plugins.snippets.nodes.js.type_graphql.resolver_query")
local resolver_type_snippet = require("plugins.snippets.nodes.js.type_graphql.resolver_type")

-- React
local react_component_props_snippet = require("plugins.snippets.nodes.js.react.react_component_props")
local react_component_snippet = require("plugins.snippets.nodes.js.react.react_component")
local react_element_snippet = require("plugins.snippets.nodes.js.react.react_element")

-- Styled Components
local styled_component = require("plugins.snippets.nodes.js.styled_components.styled_component")
local styled_component_import = require("plugins.snippets.nodes.js.styled_components.styled_component_import")
local styled_component_props = require("plugins.snippets.nodes.js.styled_components.styled_component_props")

-- Jest
local jest_suite = require("plugins.snippets.nodes.js.jest.suite")

-- Cypress
local cypress_function = require("plugins.snippets.nodes.js.cypress.function")

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

local js_ts_snippets = {
    -- Generic JS/TS
    console_log_snippet,
    console_log_stringify_snippet,
    export_all_snippet,
    arrow_function_snippet,
    arrow_function_async_snippet,
    arrow_function_full_async_snippet,
    arrow_function_full_snippet,
    service_function_snippet,
    type_snippet,
    jest_suite,

    -- Typegraphql
    resolver_mutation_snippet,
    resolver_query_snippet,
    resolver_args_snippet,
    resolver_input_snippet,
    resolver_payload_snippet,
    resolver_type_snippet,

    -- Cypress
    cypress_function,

    -- Styled Components
    styled_component,
    styled_component_props,
    styled_component_import,
}

local js_ts_react_snippets = {
    -- Generic JS/TS
    console_log_snippet,
    console_log_stringify_snippet,
    export_all_snippet,
    arrow_function_snippet,
    arrow_function_full_snippet,
    type_snippet,

    -- React
    react_element_snippet,
    react_component_snippet,
    react_component_props_snippet,
}

luasnip.add_snippets("typescript", js_ts_snippets)
luasnip.add_snippets("javascript", js_ts_snippets)
luasnip.add_snippets("typescriptreact", js_ts_react_snippets)
luasnip.add_snippets("javascriptreact", js_ts_react_snippets)

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
