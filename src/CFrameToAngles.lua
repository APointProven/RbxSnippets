-- Converts CFrames to Degrees
function Convert(xa, ya, za)
	return CFrame.Angles(math.rad(xa), math.rad(ya), math.rad(za))
end

return Convert