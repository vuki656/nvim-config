--- Sources the given file name in the plugins folder
-- @param options - object
return function(name)
    return "require('plugins." .. name .. "')"
end
