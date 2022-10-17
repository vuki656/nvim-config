--- Sources the given file name in the plugins folder
-- @param name - string
return function(name)
    return "require('plugins." .. name .. "')"
end
