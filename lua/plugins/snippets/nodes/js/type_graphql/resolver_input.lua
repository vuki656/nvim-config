local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt

local create_snippet = luasnip.snippet
local insert_node = luasnip.insert_node

return create_snippet(
    "rei",
    format(
        [[
import {{
    Field,
    ID,
    InputType,
}} from 'type-graphql'

@InputType()
export class {}Input {{
    @Field(() => {})
    public {}: {}
}}
    ]]   ,
        {
            insert_node(1),
            insert_node(2),
            insert_node(3),
            insert_node(4),
        }
    )
)
