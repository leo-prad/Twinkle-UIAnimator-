return function(element, TS, scalePercent)
	local original = element.Position
	local liftOffset = scalePercent or 5
	local liftedPosition = UDim2.new(
		original.X.Scale, original.X.Offset,
		original.Y.Scale, original.Y.Offset - liftOffset
	)
	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

	return {
		onEnter = function() TS:Create(element, tweenInfo, {Position = liftedPosition}):Play() end,
		onLeave = function() TS:Create(element, tweenInfo, {Position = original}):Play() end,
	}
end
