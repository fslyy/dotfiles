local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local taglist_buttons = require("ui.wibar.module.taglist-buttons")
local bling = require("lib.bling") -- https://github.com/BlingCorp/bling
local rubato = require("lib.rubato") -- https://github.com/andOrlando/rubato

local dpi = require("beautiful.xresources").apply_dpi
local transition_duration = 0.3
local dot_size = 10
local number_of_tags = 7

local function create_resize_transition()
	return rubato.timed({
		pos = dpi(dot_size),
		intro = 0,
		duration = transition_duration,
		easing = rubato.linear,
	})
end

local taglist_item_transitions = {}
for i = 1, number_of_tags do
	taglist_item_transitions[i] = create_resize_transition()
end

local floating_indicator_transition = rubato.timed({
	pos = 0,
	intro = 0,
	duration = transition_duration,
	easing = rubato.linear,
})

local indicator_widget = wibox.widget({
	{
		forced_height = dpi(dot_size),
		forced_width = dpi(dot_size * 2),
		shape = gears.shape.rounded_bar,
		bg = beautiful.taglist_bg_focus,
		widget = wibox.container.background,
	},
	left = 0,
	widget = wibox.container.margin,
})

local TagList = function(s)
	-- Helper function that updates a taglist item
	local update_taglist = function(item, tag, index)
		if tag.selected then
			taglist_item_transitions[index].target = dpi(dot_size * 2)
			floating_indicator_transition.target = (beautiful.taglist_spacing + dot_size) * (index - 1)
		else
			taglist_item_transitions[index].target = dpi(dot_size)
		end
	end

	local create_taglist = function(item, tag, index)
		-- bling: Only show widget when there are clients in the tag
		item:connect_signal("mouse::enter", function()
			if #tag:clients() > 0 then
				awesome.emit_signal("bling::tag_preview::update", tag)
				awesome.emit_signal("bling::tag_preview::visibility", s, true)
			end
		end)

		item:connect_signal("mouse::leave", function()
			-- bling: Turn the widget off
			awesome.emit_signal("bling::tag_preview::visibility", s, false)

			if item.has_backup then
				item.bg = item.backup
			end
		end)

		taglist_item_transitions[index]:subscribe(function(value)
			item.forced_width = value
		end)
		floating_indicator_transition:subscribe(function(value)
			indicator_widget.left = value
		end)

		update_taglist(item, tag, index)
	end

	local tl = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
		layout = wibox.layout.fixed.horizontal,
		widget_template = {
			{
				left = dpi(1),
				widget = wibox.container.margin,
			},
			id = "background_role",
			forced_width = dot_size,
			widget = wibox.container.background,
			create_callback = create_taglist,
			update_callback = update_taglist,
		},
	})

	return wibox.widget({
		{
			tl,
			{
				indicator_widget,
				widget = wibox.layout.fixed.horizontal,
			},
			layout = wibox.layout.stack,
		},
		top = dpi(12),
		bottom = dpi(12),
		widget = wibox.container.margin,
	})
end

-- Tag preview
bling.widget.tag_preview.enable({
	show_client_content = true,
	placement_fn = function(c)
		awful.placement.top_left(c, {
			margins = {
				top = beautiful.top_bar_height + dpi(10),
				left = dpi(10),
			},
		})
	end,
	scale = 0.16,
	honor_padding = true,
	honor_workarea = true,
	background_widget = wibox.widget({
		widget = wibox.container.background,
		bg = beautiful.wallpaper,
	}),
})

return TagList
