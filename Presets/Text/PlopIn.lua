local CharBuilder = require(script.Parent.CharBuilder)
local TS = game:GetService("TweenService")

local function escapeXML(str)
	return str:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub("\"", "&quot;"):gsub("'", "&apos;")
end

-- interval — time between each character appearing
-- speed — how long each character takes to slide down into place
-- intensity — how many pixels above the final position each character spawns from
return function(container, label, text, lineHeight, boundX, trove, options)
	local charList = CharBuilder.buildLines(text, label, boundX)
	local basePos = label.Position

	-- Extract custom settings or use defaults
	local dropDist = options and options.intensity and options.intensity * 20 or 50
	local speed = options.speed or 0.2
	local interval = options.interval or 0.05

	for _, data in ipairs(charList) do
		if data.char:match("%s") then continue end

		local charLabel = CharBuilder.createCharLabel(data, label, container)
		charLabel:SetAttribute("CharLabel", true)

		-- Start shifted upward
		charLabel.Position = UDim2.new(
			basePos.X.Scale, basePos.X.Offset,
			basePos.Y.Scale, basePos.Y.Offset - dropDist
		)

		charLabel.TextTransparency = 1
		trove:Add(charLabel)

		-- Tween down to the native baseline
		local tweenInfo = TweenInfo.new(speed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		TS:Create(charLabel, tweenInfo, {Position = basePos, TextTransparency = 0}):Play()

		task.wait(interval)
	end
end
