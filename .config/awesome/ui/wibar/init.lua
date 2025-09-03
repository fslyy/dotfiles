local awful = require("awful")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
local wibox = require("wibox")
local gears = require("gears")

local module = require("ui.wibar.module")

-- init separators
local spr = wibox.widget.textbox(" | ")
local spr_empty = wibox.widget.textbox(" ")

return function(s)
	s.mypromptbox = awful.widget.prompt() -- Create a promptbox.

	s.mywibox = awful.wibar({
		position = "top",
		border_width = 0,
		bg = "#00000050",
		height = 22,
		input_passthrough = true,
		screen = s,
	})

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			spr_empty,
			module.taglist(s),
			s.mypromptbox,
			spr_empty,
		},
		module.tasklist(s), -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			module.net(s),
			spr,
			module.brightness(s),
			spr,
			module.volume(s),
			spr,
			module.battery(s),
			spr,
			wibox.widget.textclock,
			spr_empty,
		},
	})
end
