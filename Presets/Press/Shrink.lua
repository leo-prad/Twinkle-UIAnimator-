return function(element, TS, intensity)
	local original = element.Size
	local shrinkFactor = 1 - ((intensity or 10) * 0.01)
	local clickSize = UDim2.new(
		original.X.Scale * shrinkFactor, original.X.Offset * shrinkFactor,
		original.Y.Scale * shrinkFactor, original.Y.Offset * shrinkFactor
	)
	local tweenInfo = TweenInfo.new(0.7, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)

	return {
		onPress =   function() TS:Create(element, tweenInfo, {Size = clickSize}):Play() end,
		onRelease = function() TS:Create(element, tweenInfo, {Size = original}):Play() end,
	}
end
