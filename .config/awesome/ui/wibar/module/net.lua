local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi
local utf8 = require("utf8")

-- Nerd Font Wi-Fi icons
local wifi_icons = {
	connected = utf8.char(0xf1eb), -- 
	disconnected = utf8.char(0xf127), --  (chain-broken)
}

-- Update function
local function update(self)
	awful.spawn.easy_async_with_shell("nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2", function(ssid)
		ssid = ssid:gsub("\n", "")
		if ssid == "" then
			-- Not connected
			local icon_widget = self:get_children_by_id("icon")[1]
			local text_widget = self:get_children_by_id("text")[1]

			icon_widget:set_markup(" <span font='FiraCode Nerd Font 14'>" .. wifi_icons.disconnected .. "</span> ")
			text_widget:set_markup("NA")
		else
			-- Connected, get local IP
			awful.spawn.easy_async_with_shell("hostname -I | awk '{print $1}'", function(ip)
				ip = ip:gsub("\n", "")
				local icon_widget = self:get_children_by_id("icon")[1]
				local text_widget = self:get_children_by_id("text")[1]

				icon_widget:set_markup(" <span font='FiraCode Nerd Font 14'>" .. wifi_icons.connected .. "</span> ")
				text_widget:set_markup(ssid)
			end)
		end
	end)
end

-- Widget factory
return function(s)
	local widget = wibox.widget({
		{
			{
				id = "icon",
				widget = wibox.widget.textbox,
				align = "center",
				forced_width = dpi(30),
			},
			{
				id = "text",
				widget = wibox.widget.textbox,
				align = "left",
			},
			spacing = dpi(6),
			layout = wibox.layout.fixed.horizontal,
		},
		widget = wibox.container.margin,
		margins = dpi(2),
		update_callback = update,
		create_callback = update,
	})

	-- Poll every 5s
	gears.timer({
		timeout = 5,
		autostart = true,
		call_now = true,
		callback = function()
			update(widget)
		end,
	})

	return widget
end
