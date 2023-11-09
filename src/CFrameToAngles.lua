-- Converts CFrames to Degrees
local module = {}

function module:Convert(xa, ya, za)
	return CFrame.Angles(math.rad(xa), math.rad(ya), math.rad(za))
end

return module