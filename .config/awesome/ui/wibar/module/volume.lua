local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local utf8 = require("utf8")
local dpi = require("beautiful.xresources").apply_dpi

-- Nerd Font speaker icons
local volume_icons = {
	[0] = utf8.char(0xf075f), -- mute
	[50] = utf8.char(0xf0580), -- medium
	[100] = utf8.char(0xf057e), -- high
}

local function get_volume_icon(volume, is_muted)
	if is_muted or volume == 0 then
		return volume_icons[0]
	elseif volume < 50 then
		return volume_icons[50]
	else
		return volume_icons[100]
	end
end

local function update(self)
	awful.spawn.easy_async_with_shell("amixer get Master", function(stdout)
		local volume = stdout:match("(%d?%d?%d)%%")
		local is_muted = stdout:match("%[(o[nf]*)%]") == "off"

		volume = (is_muted and 0) or tonumber(volume)

		local icon = get_volume_icon(volume, is_muted)

		local icon_widget = self:get_children_by_id("icon")[1]
		local text_widget = self:get_children_by_id("text")[1]

		icon_widget:set_markup(" <span font='FirCode Mono Nerd Font 14'>" .. icon .. "</span>    ")
		text_widget:set_markup(volume .. "% ")
	end)
end

return function(s)
	local widget = wibox.widget({
		{
			id = "icon",
			widget = wibox.widget.textbox,
			forced_width = dpi(28),
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
