local beautiful = require("beautiful")
-- Add a titlebar if titlebars_enabled is set to true for the client in `config/rules.lua`.
client.connect_signal("request::titlebars", function(c)
	-- While this isn't actually in the example configuration, it's the most sane thing to do.
	-- If a client expressly says not to draw titlebars on it, just don't.
	if c.requests_no_titlebars then
		return
	end

	require("ui.titlebar").normal(c)
end)

-- Enable sloppy focus, so that focus follows mouse.
--client.connect_signal("mouse::enter", function(c)
--  c:activate({ context = "mouse_enter", raise = false })
--end)

-- disable border for window when not focused
client.connect_signal("focus", function(c)
	c.border_width = 2
	c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
	c.border_width = 2
	c.border_color = "#00000000" --Keep transparent border around unfocused windows to stop shifitng content
end)

-- diable gap when only 1 window active
beautiful.gap_single_client = false
