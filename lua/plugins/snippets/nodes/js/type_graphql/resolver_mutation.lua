local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt
local repeat_node = require("luasnip.extras").rep

local create_snippet = luasnip.snippet
local insert_node = luasnip.insert_node

return create_snippet(
    "rmfn",
    format(
        [[
@Authorized()
@Mutation(() => {}Payload)
public async {}(
    @Arg('input', () => {}Input) input: {}Input,
): Promise<{}Payload> {{
    return this.service.{}(input)
}}
    ]],
        {
            insert_node(1),
            insert_node(2),
            repeat_node(1),
            repeat_node(1),
            repeat_node(1),
            insert_node(3),
        }
    )
)