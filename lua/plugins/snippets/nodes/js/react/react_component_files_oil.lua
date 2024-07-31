local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt

local create_snippet = luasnip.snippet
local insert_node = luasnip.insert_node
local repeat_node = require("luasnip.extras").rep

return create_snippet(
    "rnc",
    format(
        [[
{}/{}.tsx
{}/{}.types.ts
{}/{}.module.css
{}/index.ts
    ]],
        {
            insert_node(1),
            repeat_node(1),
            repeat_node(1),
            repeat_node(1),
            repeat_node(1),
            repeat_node(1),
            repeat_node(1),
        }
    )
)
