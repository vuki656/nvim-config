local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt

local create_snippet = luasnip.snippet
local insert_node = luasnip.insert_node

return create_snippet(
    "sc",
    format(
        [[
export const {} = styled.div({{
{}
}})
    ]],
        {
            insert_node(1),
            insert_node(2),
        }
    )
)
