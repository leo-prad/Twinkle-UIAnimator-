-- "LoopInterval" -- attribute on button meaning seconds between each shimmer sweep, default 2
local SHIMMER_COLOR = Color3.fromRGB(255, 255, 255)

return function(element, TS, scalePercent)
	local loopInterval = element:GetAttribute("LoopInterval") or 3
	local shimmerWidth = 0.2

	-- Clip shimmer within button bounds
	local clip = Instance.new("Frame")
	clip.Name = "ShimmerClip"
	clip.AnchorPoint = Vector2.new(0.5, 0.5)
	clip.Size = UDim2.new(0.98, 0, 0.98, 0)
	clip.Position = UDim2.new(0.5, 0, 0.5, 0)
	clip.BackgroundTransparency = 1
	clip.BorderSizePixel = 0
	clip.ClipsDescendants = true

	-- Create shimmer frame
	local shimmer = Instance.new("Frame")
	shimmer.Name = "Shimmer"
	shimmer.AnchorPoint = Vector2.new(0.5, 0.5)
	shimmer.Size = UDim2.new(shimmerWidth, 0, 2, 0)
	shimmer.Position = UDim2.new(-shimmerWidth, 0, 0, 0)
	shimmer.BackgroundColor3 = SHIMMER_COLOR
	shimmer.BackgroundTransparency = 0.3
	shimmer.Rotation = 45
	shimmer.Visible = false

	-- Gradient on shimmer for soft edges
	local gradient = Instance.new("UIGradient")
	gradient.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(0.5, 0),
		NumberSequenceKeypoint.new(1, 1),
	})

	clip.Parent = element
	shimmer.Parent = clip
	gradient.Parent = shimmer

	local sweepInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

	local function sweep()
		shimmer.Position = UDim2.new(-shimmerWidth, 0, 0, 0)
		shimmer.Visible = true
		local tween = TS:Create(shimmer, sweepInfo, {Position = UDim2.new(1, 0, 0, 0)})
		tween:Play()
		tween.Completed:Once(function()
			shimmer.Visible = false
		end)
	end

	return {
		onEnter = function() sweep() end,
		onLeave = function()
			shimmer.Visible = false
		end,
	}
end
