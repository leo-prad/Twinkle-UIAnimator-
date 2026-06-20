local CharBuilder = {}

function CharBuilder.escapeXML(str: string)
	return str:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub("\"", "&quot;"):gsub("'", "&apos;")
end

function CharBuilder.buildLines(text: string, template: TextLabel, boundX: number)
	local charDataList = {}

	for i, pos in utf8.graphemes(text) do
		local char = text:sub(i, pos)
		local prefix = text:sub(1, i - 1)
		local suffix = text:sub(pos + 1, -1)

		table.insert(charDataList, {
			char = char,
			prefix = prefix,
			suffix = suffix
		})
	end

	return charDataList
end

function CharBuilder.createCharLabel(data, template: TextLabel, container: Frame): TextLabel
	local label = template:Clone()
	label.RichText = true

	local escPre = CharBuilder.escapeXML(data.prefix)
	local escChar = CharBuilder.escapeXML(data.char)
	local escSuf = CharBuilder.escapeXML(data.suffix)

	-- Wrap invisible parts in stroke tags to hide the UIStroke
	label.Text = string.format(
		'<font transparency="1"><stroke transparency="1">%s</stroke></font>%s<font transparency="1"><stroke transparency="1">%s</stroke></font>',
		escPre, escChar, escSuf
	)

	label.Size = template.Size
	label.Position = template.Position
	label.AnchorPoint = template.AnchorPoint
	label.TextXAlignment = template.TextXAlignment
	label.TextYAlignment = template.TextYAlignment
	label.TextWrapped = template.TextWrapped

	label.Visible = true
	label.BackgroundTransparency = 1
	label.Parent = container

	return label
end

return CharBuilder
