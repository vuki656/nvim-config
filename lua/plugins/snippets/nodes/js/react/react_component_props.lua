local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt
local repeat_node = require("luasnip.extras").rep

local create_snippet = luasnip.snippet
local insert_node = luasnip.insert_node

return create_snippet(
    "rfcp",
    format(
        [[
import * as React from 'react'

import type {{ {}Props }} from './{}.types'

export const {}: React.FunctionComponent<{}Props> = (props) => {{
    const {{
        {}
    }} = props

    return (
        {}
    )
}}
    ]]   ,
        {
            insert_node(1),
            repeat_node(1),
            repeat_node(1),
            repeat_node(1),
            insert_node(2),
            insert_node(3),
        }
    )
)
