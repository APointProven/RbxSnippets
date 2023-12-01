function checkTable(tbl, check: any)
	local bool = true
	for _, v in pairs(tbl) do
		if check then
			if v ~= check then
				bool = false
			end
		else
			if v == nil then
				bool = false
			end
		end
	end
    return bool
end

return checkTable