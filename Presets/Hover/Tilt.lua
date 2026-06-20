-- "TiltPercent" -- attribute on button to define the tilt amount
return function(element, TS, scalePercent)
	local tiltDegrees = element:GetAttribute("TiltPercent") or 5
	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

	return {
		onEnter = function()
			TS:Create(element, tweenInfo, {Rotation = tiltDegrees}):Play()
		end,
		onLeave = function()
			TS:Create(element, tweenInfo, {Rotation = 0}):Play()
		end,
	}
end
