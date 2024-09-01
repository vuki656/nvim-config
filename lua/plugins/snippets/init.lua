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
local async_function_snippet = require("plugins.snippets.nodes.js.async-function")
local console_log_separator_snippet = require("plugins.snippets.nodes.js.console_log_separator")
local console_log_snippet = require("plugins.snippets.nodes.js.console_log")
local export_all_snippet = require("plugins.snippets.nodes.js.export_all")
local export_async_function_snippet = require("plugins.snippets.nodes.js.export-async-function")
local function_snippet = require("plugins.snippets.nodes.js.function")
local logger_snippet = require("plugins.snippets.nodes.js.logger")
local type_snippet = require("plugins.snippets.nodes.js.type")

-- React
local react_component_files_oil = require("plugins.snippets.nodes.js.react.react_component_files_oil")
local react_component_props_snippet = require("plugins.snippets.nodes.js.react.react_component_props")
local react_component_snippet = require("plugins.snippets.nodes.js.react.react_component")
local react_element_snippet = require("plugins.snippets.nodes.js.react.react_element")
local react_import_styles = require("plugins.snippets.nodes.js.react.react_import_styles")
local react_next_router = require("plugins.snippets.nodes.js.react.react_next_router")
local react_props_snippet = require("plugins.snippets.nodes.js.react.react_props")

-- CSS
local css_center_snippet = require("plugins.snippets.css.center")

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
    console_log_separator_snippet,
    export_all_snippet,
    arrow_function_snippet,
    arrow_function_async_snippet,
    arrow_function_full_async_snippet,
    arrow_function_full_snippet,
    type_snippet,
    function_snippet,
    export_async_function_snippet,
    async_function_snippet,
    logger_snippet,
}

local js_ts_react_snippets = {
    -- Generic JS/TS
    console_log_snippet,
    console_log_separator_snippet,
    export_all_snippet,
    arrow_function_snippet,
    arrow_function_full_snippet,
    type_snippet,

    -- React
    react_element_snippet,
    react_component_snippet,
    react_component_props_snippet,
    react_props_snippet,
    react_import_styles,
    react_next_router,
}

local css_snippets = {
    css_center_snippet,
}

local oil_snippets = {
    react_component_files_oil,
}

luasnip.add_snippets("typescript", js_ts_snippets)
luasnip.add_snippets("javascript", js_ts_snippets)
luasnip.add_snippets("vue", js_ts_snippets)
luasnip.add_snippets("typescriptreact", js_ts_react_snippets)
luasnip.add_snippets("javascriptreact", js_ts_react_snippets)
luasnip.add_snippets("css", css_snippets)
luasnip.add_snippets("oil", oil_snippets)

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
