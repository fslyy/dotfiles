local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

return function(s)
	-- Create a tasklist widget
	return awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = {
			-- Left-clicking a client indicator minimizes it if it's unminimized, or unminimizes
			-- it if it's minimized.
			awful.button(nil, 1, function(c)
				c:activate({ context = "tasklist", action = "toggle_minimization" })
			end),
			-- Right-clicking a client indicator shows the list of all open clients in all visible
			-- tags.
			awful.button(nil, 3, function()
				awful.menu.client_list({ theme = { width = 250 } })
			end),
			-- Mousewheel scrolling cycles through clients.
			awful.button(nil, 4, function()
				awful.client.focus.byidx(-1)
			end),
			awful.button(nil, 5, function()
				awful.client.focus.byidx(1)
			end),
			style = {
				shape_border_width = 1,
				shape_border_color = "#777777",
				shape = gears.shape.rounded_bar,
			},
			layout = {
				spacing = 10,
				spacing_widget = {
					{
						forced_width = 5,
						shape = gears.shape.circle,
						widget = wibox.widget.separator,
					},
					valign = "center",
					halign = "center",
					widget = wibox.container.place,
				},
				layout = wibox.layout.flex.horizontal,
			},
			-- Notice that there is *NO* wibox.wibox prefix, it is a template,
			-- not a widget instance.
			widget_template = {
				{
					{
						{
							{
								id = "icon_role",
								widget = wibox.widget.imagebox,
							},
							margins = 2,
							widget = wibox.container.margin,
						},
						{
							id = "text_role",
							widget = wibox.widget.textbox,
						},
						layout = wibox.layout.fixed.horizontal,
					},
					left = 10,
					right = 10,
					widget = wibox.container.margin,
				},
				id = "background_role",
				widget = wibox.container.background,
			},
		},
	})
end
