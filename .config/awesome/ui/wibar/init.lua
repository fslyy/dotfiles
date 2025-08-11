local awful = require("awful")
local beautiful = require("beautiful")
local lain = require("lain")
local dpi = require("beautiful.xresources").apply_dpi
local wibox = require("wibox")

local module = require(... .. ".module")

-- init separators
local spr = wibox.widget.textbox(" ")
local arrl_dl = lain.util.separators.arrow_left(beautiful.bg_focus, "alpha")
local arrl_ld = lain.util.separators.arrow_left("alpha", beautiful.bg_focus)

-- Battery
local baticon = wibox.widget.imagebox(beautiful.widget_battery)
local bat = lain.widget.bat({
	timeout = 15,
	settings = function()
		if bat_now.status and bat_now.status ~= "N/A" then
			if bat_now.ac_status == 1 then
				baticon:set_image(beautiful.widget_ac)
			elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
				baticon:set_image(beautiful.widget_battery_empty)
			elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
				baticon:set_image(beautiful.widget_battery_low)
			else
				baticon:set_image(beautiful.widget_battery)
			end
			widget:set_markup(lain.util.markup.font(beautiful.font, " " .. bat_now.perc .. "% "))
		else
			widget:set_markup(lain.util.markup.font(beautiful.font, " AC "))
			baticon:set_image(beautiful.widget_ac)
		end
	end,
})

-- MEM
local memicon = wibox.widget.imagebox(beautiful.widget_mem)
local mem = lain.widget.mem({
	settings = function()
		widget:set_markup(lain.util.markup.font(beautiful.font, " " .. mem_now.used .. "MB "))
	end,
})

-- CPU
local cpuicon = wibox.widget.imagebox(beautiful.widget_cpu)
local cpu = lain.widget.cpu({
	settings = function()
		widget:set_markup(lain.util.markup.font(beautiful.font, " " .. cpu_now.usage .. "% "))
	end,
})

-- Net
local neticon = wibox.widget.imagebox(beautiful.widget_net)
local net = lain.widget.net({
	settings = function()
		widget:set_markup(
			lain.util.markup.font(
				beautiful.font,
				lain.util.markup("#7AC82E", " " .. string.format("%06.1f", net_now.received))
					.. " "
					.. lain.util.markup("#46A8C3", " " .. string.format("%06.1f", net_now.sent) .. " ")
			)
		)
	end,
})

-- ALSA volume
local volicon = wibox.widget.imagebox(beautiful.widget_vol)
beautiful.volume = lain.widget.alsa({
	settings = function()
		if volume_now.status == "off" then
			volicon:set_image(beautiful.widget_vol_mute)
		elseif tonumber(volume_now.level) == 0 then
			volicon:set_image(beautiful.widget_vol_no)
		elseif tonumber(volume_now.level) <= 50 then
			volicon:set_image(beautiful.widget_vol_low)
		else
			volicon:set_image(beautiful.widget_vol)
		end

		widget:set_markup(lain.util.markup.font(beautiful.font, " " .. volume_now.level .. "% "))
	end,
})
beautiful.volume.widget:buttons(awful.util.table.join(
	awful.button({}, 4, function()
		awful.util.spawn("amixer set Master 1%+")
		beautiful.volume.update()
	end),
	awful.button({}, 5, function()
		awful.util.spawn("amixer set Master 1%-")
		beautiful.volume.update()
	end)
))

return function(s)
	s.mypromptbox = awful.widget.prompt() -- Create a promptbox.

	s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		height = dpi(20),
		bg = beautiful.bg_normal,
		fg = beautiful.fg_normal,
	})

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			--spr,
			module.taglist(s),
			s.mypromptbox,
			spr,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			wibox.widget.systray(),
			arrl_dl,
			memicon,
			mem.widget,
			spr,
			arrl_ld,
			arrl_dl,
			cpuicon,
			cpu.widget,
			arrl_ld,
			arrl_dl,
			volicon,
			beautiful.volume.widget,
			arrl_ld,
			arrl_dl,
			neticon,
			net.widget,
			arrl_ld,
			arrl_dl,
			baticon,
			bat.widget,
			arrl_ld,
			arrl_dl,
			wibox.widget.textclock,
			spr,
			arrl_ld,
		},
	})
end
