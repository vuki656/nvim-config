local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt

local create_snippet = luasnip.snippet
local insert_node = luasnip.insert_node

return create_snippet(
    "ret",
    format(
        [[
import {{
    Field,
    ObjectType,
}} from 'type-graphql'

import {{ BaseType }} from '#shared/type-graphql-types'

@ObjectType({{ implements: BaseType }})
export class {}Type extends BaseType {{
    @Field(() => {})
    public {}: {}
}}
    ]],
        {
            insert_node(1),
            insert_node(2),
            insert_node(3),
            insert_node(4),
        }
    )
)
