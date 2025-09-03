local awful = require("awful")
local wibox = require("wibox")
local utf8 = require("utf8")
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi

local battery_icons = {
	[100] = utf8.char(0xf240), -- Full
	[75] = utf8.char(0xf241), -- 75%
	[50] = utf8.char(0xf242), -- 50%
	[25] = utf8.char(0xf243), -- 25%
	[0] = utf8.char(0xf244), -- Empty
	charging = utf8.char(0xf0e7), -- Bolt
	unknown = utf8.char(0xf128), -- ?
}

local function get_battery_icon(percentage, is_charging)
	if is_charging then
		return battery_icons.charging
	end

	if percentage >= 100 then
		return battery_icons[100]
	end
	if percentage >= 75 then
		return battery_icons[75]
	end
	if percentage >= 50 then
		return battery_icons[50]
	end
	if percentage >= 25 then
		return battery_icons[25]
	end
	return battery_icons[0]
end

-- Update widget by running `acpi`
local function update(self)
	awful.spawn.easy_async_with_shell("acpi -b", function(stdout)
		local status, percentage = stdout:match("Battery %d+: ([%w%s]+), (%d+)%%")
		percentage = tonumber(percentage) or 0
		local is_charging = (status == "Charging")

		local icon = get_battery_icon(percentage, is_charging)

		local icon_widget = self:get_children_by_id("icon")[1]
		local text_widget = self:get_children_by_id("text")[1]

		icon_widget:set_markup(" <span font='FiraCode Mono Nerd Font 14'>" .. icon .. "</span>     ")
		icon_widget.forced_width = dpi(30)
		text_widget:set_markup(percentage .. "% ")
		text_widget.forced_width = dpi(34)
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
		timeout = 10,
		autostart = true,
		call_now = true,
		callback = function()
			update(widget)
		end,
	})

	return widget
end
