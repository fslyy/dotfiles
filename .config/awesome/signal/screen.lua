local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

--- Attach tags and widgets to all screens.
screen.connect_signal("request::desktop_decoration", function(s)
	-- Create all tags and attach the layouts to each of them.
	awful.tag(require("config.user").tags, s, awful.layout.layouts[1])
	-- Attach a wibar to each screen.
	s.bar = require("ui.wibar")(s)
end)

-- save last used tag to file before exit
awesome.connect_signal("exit", function(reason_restart)
	if not reason_restart then
		return
	end

	local file = io.open("/tmp/awesomewm-last-selected-tags", "w+")

	for s in screen do
		file:write(s.selected_tag.index, "\n")
	end

	file:close()
end)

-- set active tag to saved last used tag
awesome.connect_signal("startup", function()
	local file = io.open("/tmp/awesomewm-last-selected-tags", "r")
	if not file then
		return
	end

	local selected_tags = {}

	for line in file:lines() do
		table.insert(selected_tags, tonumber(line))
	end

	for s in screen do
		local i = selected_tags[s.index]
		local t = s.tags[i]
		t:view_only()
	end

	file:close()
end)

--- Wallpaper. -> set through script with feh
-- NOTE: `awful.wallpaper` is ideal for creating a wallpaper IF YOU
-- BENEFIT FROM IT BEING A WIDGET and not just the root window
-- background. IF YOU JUST WISH TO SET THE ROOT WINDOW BACKGROUND, you
-- may want to use the deprecated `gears.wallpaper` instead. This is
-- the most common case of just wanting to set an image as wallpaper.
--screen.connect_signal("request::wallpaper", function(s)
--	awful.wallpaper({
--		screen = s,
--		widget = {
--			widget = wibox.container.tile,
--			valign = "center",
--			halign = "center",
--			tiled = false,
--			{
--				widget = wibox.widget.imagebox,
--				image = beautiful.wallpaper,
--				upscale = true,
--				downscale = true,
--			},
--		},
--	})
--end)
-- An example of what's mentioned above. For more information, see:
-- https://awesomewm.org/apidoc/utility_libraries/gears.wallpaper.html
-- gears.wallpaper.maximized(beautiful.wallpaper)
