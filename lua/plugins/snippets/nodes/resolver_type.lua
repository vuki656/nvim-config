local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt
local repeat_node = require("luasnip.extras").rep

local create_snippet = luasnip.snippet
local insert_node = luasnip.insert_node

return create_snippet(
    "rty",
    format(
        [[
import {{
    Field,
    ObjectType,
}} from 'type-graphql'

import {{ BaseType }} from '#shared/type-graphql-types'

@ObjectType('{}Type')
export class {}Type extends BaseType {{
    @Field(() => {})
    public {}: {}
}}
    ]],
        {
            insert_node(1),
            repeat_node(1),
            insert_node(2),
            insert_node(3),
            insert_node(4),
        }
    )
)
