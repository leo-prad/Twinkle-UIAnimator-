return function(element, TS, intensity)
	local original = element.Size
	local punchFactor = 1 + ((intensity or 15) * 0.02)
	local punchSize = UDim2.new(
		original.X.Scale * punchFactor, original.X.Offset * punchFactor,
		original.Y.Scale * punchFactor, original.Y.Offset * punchFactor
	)
	local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

	return {
		onPress = function()
			TS:Create(element, tweenInfo, {Size = punchSize}):Play()
			task.delay(0.15, function()
				TS:Create(element, tweenInfo, {Size = original}):Play()
			end)
		end,
		onRelease = function() end,
	}
end
