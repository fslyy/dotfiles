local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local wibox = require("wibox")

local function update(self, t)
	local widget = self:get_children_by_id("icon")[1]
	if t.selected then
		-- Selected tag color (always show)
		widget.bg = beautiful.taglist_fg_focus
	elseif next(t:clients()) then
		-- Unselected but has clients
		widget.bg = beautiful.taglist_fg_occupied
	else
		-- Empty tag
		widget.bg = beautiful.taglist_fg_empty
	end

	widget.shape_border_color = t.selected and beautiful.taglist_fg_focus or "#00000"
end

local function init(self, t)
	update(self, t)
end

return function(s)
	return awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = gears.table.join(
			awful.button({}, 1, function(t)
				t:view_only()
			end),
			awful.button({}, 3, function(t)
				local c = client.focus
				if c then
					c:move_to_tag(t)
				end
			end),
			awful.button({}, 4, function()
				awful.tag.viewidx(-1)
			end),
			awful.button({}, 5, function()
				awful.tag.viewidx(1)
			end)
		),
		layout = {
			layout = wibox.layout.fixed.horizontal,
			spacing = dpi(10),
		},
		widget_template = {
			widget = wibox.container.margin,
			margins = dpi(1),
			{
				id = "icon",
				widget = wibox.container.background,
				shape = gears.shape.circle,
				shape_border_width = dpi(2),
				forced_height = dpi(12),
				forced_width = dpi(12),
				{ widget = wibox.widget({}) },
			},
			create_callback = init,
			update_callback = update,
		},
	})
end
