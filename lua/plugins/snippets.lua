-- Name: Luasnip
-- Description: Snippet Engine
-- Link: https://github.com/l3mon4d3/LuaSnip

local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt

local create_snippet = luasnip.snippet
local insert_node = luasnip.insert_node

local set_keymap = require("utils.set-keymap")

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
    -- Export all from
    create_snippet("ea", format("export * from './{}'", { insert_node(1) })),

    -- Arrow function
    create_snippet(
        "ar",
        format(
            [[
({}) => {{
    {}
}}
    ]],
            {
                insert_node(1),
                insert_node(0),
            }
        )
    ),
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
