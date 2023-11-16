-- Because dictionaries suck on roblox
local function Length(dictionary)
	local count = 0
	for _,_ in pairs (dictionary) do
		count += 1
	end
	return count
end

return Length