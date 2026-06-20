return function(element, TS, scalePercent)
	local original = element.Size
	local scaleFactor = 1 + (scalePercent * 0.01)
	local grownSize = UDim2.new(
		original.X.Scale * scaleFactor, original.X.Offset * scaleFactor,
		original.Y.Scale * scaleFactor, original.Y.Offset * scaleFactor
	)
	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

	return {
		onEnter = function() TS:Create(element, tweenInfo, {Size = grownSize}):Play() end,
		onLeave = function() TS:Create(element, tweenInfo, {Size = original}):Play() end,
	}
end
