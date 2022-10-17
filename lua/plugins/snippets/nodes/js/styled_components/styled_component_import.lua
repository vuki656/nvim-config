local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt

local create_snippet = luasnip.snippet

return create_snippet(
    "sci",
    format(
        [[
import styled from 'styled-components'
    ]],
        {}
    )
)
