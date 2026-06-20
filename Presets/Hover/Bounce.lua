return function(element, TS, scalePercent)
	local original = element.Size
	local scaleFactor = 1 + (scalePercent * 0.01)
	local bigSize = UDim2.new(
		original.X.Scale * scaleFactor, original.X.Offset * scaleFactor,
		original.Y.Scale * scaleFactor, original.Y.Offset * scaleFactor
	)
	local tweenInfo = TweenInfo.new(0.7, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)

	return {
		onEnter = function() TS:Create(element, tweenInfo, {Size = bigSize}):Play() end,
		onLeave = function() TS:Create(element, tweenInfo, {Size = original}):Play() end,
	}
end
