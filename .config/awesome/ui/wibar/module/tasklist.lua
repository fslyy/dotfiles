local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

return function(s)
	return awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = gears.table.join(
			awful.button({}, 1, function(c)
				if c == client.focus then
					c.minimized = true
				else
					c:emit_signal("request::activate", "tasklist", { raise = true })
				end
			end),
			awful.button({}, 3, function(c)
				c:kill()
			end),
			awful.button({}, 4, function()
				awful.client.focus.byidx(1)
			end),
			awful.button({}, 5, function()
				awful.client.focus.byidx(-1)
			end)
		),
		layout = {
			spacing = dpi(6),
			layout = wibox.layout.fixed.horizontal,
		},
		widget_template = {
			{
				{
					{
						id = "icon",
						widget = wibox.widget.textbox,
						font = "FiraCode Nerd Font 12",
					},
					{
						id = "text_role",
						widget = wibox.widget.textbox,
					},
					spacing = dpi(6),
					layout = wibox.layout.fixed.horizontal,
				},
				left = dpi(12),
				right = dpi(12),
				widget = wibox.container.margin,
			},
			id = "background_role",
			widget = wibox.container.background,
			shape = gears.shape.rounded_bar,
			create_callback = function(self, c, index, objects)
				local icon_widget = self:get_children_by_id("icon")[1]
				local glyph = beautiful.app_icons[c.class] or beautiful.app_icon_default
				icon_widget:set_markup(" " .. glyph .. " ")
			end,
			update_callback = function(self, c, index, objects)
				local icon_widget = self:get_children_by_id("icon")[1]
				local glyph = beautiful.app_icons[c.class] or beautiful.app_icon_default
				icon_widget:set_markup(" " .. glyph .. " ")
			end,
		},
	})
end
