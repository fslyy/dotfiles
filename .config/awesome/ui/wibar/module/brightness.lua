local awful = require("awful")
local wibox = require("wibox")
local utf8 = require("utf8")
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi

local brightness_icons = {
	[100] = utf8.char(0xf00e0), -- 100%
	[75] = utf8.char(0xf00df), -- 75%
	[50] = utf8.char(0xf00dd), -- 50%
	[25] = utf8.char(0xf00db), -- 25%
	[0] = utf8.char(0xf00da), -- 0%
}

local function get_brightness_icon(percentage)
	if percentage >= 100 then
		return brightness_icons[100]
	end
	if percentage >= 75 then
		return brightness_icons[75]
	end
	if percentage >= 50 then
		return brightness_icons[50]
	end
	if percentage >= 25 then
		return brightness_icons[25]
	end
	return brightness_icons[0]
end

-- Update widget by running `acpi`
local function update(self)
	awful.spawn.easy_async_with_shell("brightnessctl get; brightnessctl max", function(stdout)
		local cur, max = stdout:match("(%d+)\n(%d+)")
		local brightness = 0
		if cur and max then
			brightness = math.floor((tonumber(cur) / tonumber(max)) * 100)
		end

		local icon = get_brightness_icon(brightness)

		local icon_widget = self:get_children_by_id("icon")[1]
		local text_widget = self:get_children_by_id("text")[1]

		icon_widget:set_markup(" <span font='FiraCode Mono Nerd Font 14'>" .. icon .. "</span>     ")
		text_widget:set_markup(brightness .. "% ")
	end)
end

-- Initialize widget
local function init(self)
	update(self)
end

-- Export function
return function(s)
	local widget = wibox.widget({
		{
			id = "icon",
			widget = wibox.widget.textbox,
			forced_width = dpi(30),
		},
		{
			id = "text",
			widget = wibox.widget.textbox,
			forced_width = dpi(34),
		},
		layout = wibox.layout.fixed.horizontal,
	})

	gears.timer({
		timeout = 1,
		autostart = true,
		call_now = true,
		callback = function()
			update(widget)
		end,
	})

	return widget
end
