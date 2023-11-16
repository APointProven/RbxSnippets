-- Converts seconds to time format
function Convert(s, bool) -- s(seconds), bool(whether you want hours or not)
    local mins = string.format("%02i:%02i", s/60%60, s%60)
    local hrs = string.format("%02i:%02i:%02i", s/60^2, s/60%60, s%60)
    if bool == nil then
        if (s/60^2) < 1 then
            return mins
        else
            return hrs
        end
    end
    if bool then return hrs end
end

return Convert