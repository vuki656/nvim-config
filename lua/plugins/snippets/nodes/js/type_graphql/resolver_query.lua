local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt
local repeat_node = require("luasnip.extras").rep

local create_snippet = luasnip.snippet
local insert_node = luasnip.insert_node

return create_snippet(
    "rqfn",
    format(
        [[
@Authorized()
@Query(() => {}Type, {{ nullable: true }})
public async {}(
    @Arg('args', () => {}Args) args: {}Args,
): Promise<{} | null> {{
    return this.service.{}(args)
}}
    ]]   ,
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
