local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt
local lambda = require("luasnip.extras").lambda
local repeat_node = require("luasnip.extras").rep

local create_snippet = luasnip.snippet
local insert_node = luasnip.insert_node

return create_snippet(
    "jsu",
    format(
        [[
import {{ wipeDatabase }} from '../../utils'
import {{ container }} from 'tsyringe'
import {{ {}Factory }} from '../../factories'

describe('{} resolver', () => {{
    let {}Factory: {}Factory

    beforeAll(() => {{
        {}Factory = container.resolve({}Factory)
    }})

    beforeEach(async () => {{
        await wipeDatabase()
    }})

    afterAll(async () => {{
        await wipeDatabase()
    }})
}})
    ]],
        {
            insert_node(1),
            repeat_node(1),
            lambda(lambda._1:lower(), 1),
            repeat_node(1),
            lambda(lambda._1:lower(), 1),
            repeat_node(1),
        }
    )
)
