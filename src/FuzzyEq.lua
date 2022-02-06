local EPSILON = 1e-4

local function FuzzyEq(a, b)
	local aType = typeof(a)

	if aType == "number" then
		return a == b or math.abs(a - b) <= (math.abs(a) + 1) * EPSILON
	elseif aType == "Vector3" then
		return a:FuzzyEq(b, EPSILON)
	elseif aType == "Vector2" then
		local aX, bX = a.X, b.X
		local aY, bY = a.Y, b.Y
		return  aX == bX or math.abs(aX - bX) <= (math.abs(aX) + 1) * EPSILON
			and aY == bY or math.abs(aY - bY) <= (math.abs(aY) + 1) * EPSILON
	elseif aType == "CFrame" then
		return a.Position:FuzzyEq(b.Position, EPSILON)
			and a.RightVector:FuzzyEq(b.RightVector, EPSILON)
			and a.UpVector:FuzzyEq(b.UpVector, EPSILON)
			and a.LookVector:FuzzyEq(b.LookVector, EPSILON)
	end

	return false
end

return FuzzyEq