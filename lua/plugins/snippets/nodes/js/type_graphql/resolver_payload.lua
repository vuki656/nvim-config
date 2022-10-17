local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt
local repeat_node = require("luasnip.extras").rep

local create_snippet = luasnip.snippet
local insert_node = luasnip.insert_node

return create_snippet(
    "rpa",
    format(
        [[
import {{
    Field,
    ObjectType,
}} from 'type-graphql'

import {{ {}Type }} from '../types'

@ObjectType()
export class {}Payload {{
    @Field(() => {}Type)
    public {}: {}Type
}}
    ]],
        {
            insert_node(1),
            insert_node(2),
            repeat_node(1),
            insert_node(3),
            repeat_node(1),
        }
    )
)
