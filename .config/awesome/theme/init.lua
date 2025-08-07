-- Theme handling library
local beautiful = require("beautiful")
-- Standard awesome library
local gears = require("gears")

-- Set Theme
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme/theme.lua")
