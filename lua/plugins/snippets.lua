-- Name: Minisnip
-- Description: Snippets
-- Link: https://github.com/jose-elias-alvarez/minsnip.nvim

local minsnip = require("minsnip")

local vars = require("utils.vars")

------------------------------------------------------------------------------------------
------------------------------------ SETUP -----------------------------------------------
------------------------------------------------------------------------------------------

function lua(snippet)
    if vim.bo.ft == "lua" then
        return snippet
    end
end

function js(snippet)
    local buffer = vim.bo.ft

    if
        buffer == "javascript"
        or buffer == "typescript"
        or buffer == "javascriptreact"
        or buffer == "typescriptreact"
    then
        return snippet
    end
end

function react(snippet)
    local buffer = vim.bo.ft

    if buffer == "javascriptreact" or buffer == "typescriptreact" then
        return snippet
    end
end

minsnip.setup({
    ---- LUA
    vpr = function()
        return lua("print(vim.inspect($0))")
    end,

    ---- JS/TS
    fn = function()
        return js([[
            const $1 = ($2) => {
                $0
            }
        ]])
    end,
    type = function()
        return js([[
            export type $1 = {
                $0
            }
        ]])
    end,
    log = function()
        return js("console.log($0)")
    end,
    slog = function ()
        return js("console.log('$0')")
    end,
    ea = function()
        return js("export * from './$0'")
    end,
    arr = function ()
        return js([[
            ($1) => {
                $0
            }
        ]])
    end,

    ---- REACT
    props = function()
        return react("const { $0 } = props")
    end,
    rfc = function()
        return react([[
            import * as React from 'react'

            export const $1: React.FunctionComponent = () => {
                return (
                    $0
                )
            }
        ]])
    end,
    rfp = function()
        return react([[
            import * as React from 'react'
            
            export const $1: React.FunctionComponent<$2> = (props) => {
                const { $3 } = props
            
                return (
                    $0
                )
            }
        ]])
    end,
    router = function()
        return react("const router = useRouter()")
    end,
    useEffect = function()
        return react([[
            React.useEffect(() => {
               $0
            }, [])
        ]])
    end,
})

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Go to next place in snippet
vars.remap.fn("i", "<C-k>", "<cmd> lua require('minsnip').jump()<CR>", vars.remap.opts)

-- Go to previous place in snippet
vars.remap.fn("i", "<C-j>", "<cmd> lua require('minsnip').jump_backwards()<CR>", vars.remap.opts)
