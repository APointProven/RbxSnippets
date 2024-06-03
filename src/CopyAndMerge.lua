-- Copying
local function copy(original)
    local newCopy = {}
    for k, v in pairs(original) do
        if type(v) == "table" then
            v = copy(v)
        end 
        newCopy[k] = v
    end
    return newCopy
end

-- Merging
return function (original, overrides)
    local newCopy = copy(original)
    for k, v in pairs(overrides) do
        newCopy[k] = v
    end
    return newCopy
end
