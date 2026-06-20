-- interval — time between each character appearing
-- speed — N/A
-- intensity — N/A
return function(container, label, text, lineHeight, boundX, trove, options)
	local interval = options.interval or 0.05

	label.Text = text
	label.MaxVisibleGraphemes = 0
	label.Visible = true

	local length = utf8.len(text) or #text
	for i = 1, length do
		label.MaxVisibleGraphemes = i
		task.wait(interval)
	end
end
