local awful = require("awful")
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

--- Error handling.
-- Notification library.
local naughty = require("naughty")
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config).
naughty.connect_signal("request::display_error", function(message, startup)
	naughty.notification({
		urgency = "critical",
		title = "Oops, an error happened" .. (startup and " during startup!" or "!"),
		message = message,
	})
end)

require("awful.autofocus")

require("awful.hotkeys_popup.keys")

-- load Theme
require("theme")

-- Treat all signals. Creating all Tags, attaching their layouts, setting client behaviour and loading UI.
require("signal")

-- Set all keybinds
require("binds")

-- Load all rules
require("config.rules")

-- Autostart
awful.spawn.with_shell("/home/felix/.scripts/autorun.sh")
-- Doesnt want to be in the autorun script for some fucking reason so it has his own spawn command
awful.spawn.with_shell("xss-lock -s ${XDG_SESSION_ID} -- /home/felix/.scripts/lock_and_blur.sh & xset s 600") -- triggers custom lock script which blurs screen
