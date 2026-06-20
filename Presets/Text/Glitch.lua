local CharBuilder = require(script.Parent.CharBuilder)

local GLITCH_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*"

-- interval — time between each character starting its glitch
-- speed — how long the glitch scramble lasts before settling
-- intensity — how many random characters flash before the correct one locks in
return function(container, label, text, lineHeight, boundX, trove, options)
	local interval = options.interval or 0.02
	local speed = options.speed or 0.04
	local intensity = options.intensity or 5

	local charList = CharBuilder.buildLines(text, label, boundX)

	for _, data in ipairs(charList) do
		if data.char:match("%s") then continue end

		local charLabel = CharBuilder.createCharLabel(data, label, container)
		charLabel:SetAttribute("CharLabel", true)
		trove:Add(charLabel)

		charLabel.TextTransparency = 1
		trove:Add(charLabel)

		task.spawn(function()
			local escPre = CharBuilder.escapeXML(data.prefix)
			local escSuf = CharBuilder.escapeXML(data.suffix)
			local elapsed = 0
			local scrambleInterval = speed / intensity

			charLabel.TextTransparency = 0 -- show only when this char's glitch starts

			while elapsed < speed do
				local idx = math.random(1, #GLITCH_CHARS)
				local randomChar = string.sub(GLITCH_CHARS, idx, idx)

				charLabel.Text = string.format(
					'<font transparency="1"><stroke transparency="1">%s</stroke></font>%s<font transparency="1"><stroke transparency="1">%s</stroke></font>',
					escPre, randomChar, escSuf
				)

				task.wait(scrambleInterval)
				elapsed += scrambleInterval
			end

			charLabel.Text = string.format(
				'<font transparency="1"><stroke transparency="1">%s</stroke></font>%s<font transparency="1"><stroke transparency="1">%s</stroke></font>',
				escPre, CharBuilder.escapeXML(data.char), escSuf
			)
		end)

		task.wait(interval)

		task.wait(interval)
	end
end
