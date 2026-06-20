local CharBuilder = require(script.Parent.CharBuilder)
local TS = game:GetService("TweenService")

local function escapeXML(str)
	return str:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub("\"", "&quot;"):gsub("'", "&apos;")
end

-- interval — time between each character appearing
-- speed —  how long each character takes to scale in
-- intensity — starting scale of each character before zooming in, where 0 = starts from nothing, 0.5 = starts half size
return function(container, label, text, lineHeight, boundX, trove, options)
	local charList = CharBuilder.buildLines(text, label, boundX)
	local speed = options.speed or 0.15
	local interval = options.interval or 0.05
	local intensity = options.intensity or 0

	for _, data in ipairs(charList) do
		if data.char:match("%s") then continue end

		local charLabel = CharBuilder.createCharLabel(data, label, container)
		charLabel:SetAttribute("CharLabel", true)
		charLabel.TextTransparency = 1
		trove:Add(charLabel)

		local uiScale = Instance.new("UIScale")
		uiScale.Scale = intensity
		uiScale.Parent = charLabel
		trove:Add(uiScale)

		local tweenInfo = TweenInfo.new(speed, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		TS:Create(uiScale, tweenInfo, {Scale = 1}):Play()
		TS:Create(charLabel, tweenInfo, {TextTransparency = 0}):Play()

		task.wait(interval)
	end
end
