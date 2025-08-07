local awful = require("awful")
local wibox = require("wibox")

local module = require(... .. ".module")

return function(s)
	s.mypromptbox = awful.widget.prompt() -- Create a promptbox.

	-- Create the wibox
	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		widget = {
			layout = wibox.layout.align.horizontal,
			-- Left widgets.
			{
				layout = wibox.layout.fixed.horizontal,
				module.taglist(s),
				s.mypromptbox,
			},
			-- Middle widgets.
			{
				layout = wibox.layout.fixed.horizontal,
				s.mypromptbox,
			},
			-- Right widgets.
			{
				layout = wibox.layout.fixed.horizontal,
				wibox.widget.systray(),
				wibox.widget.textclock(), -- Create a textclock widget.
			},
		},
	})
end
