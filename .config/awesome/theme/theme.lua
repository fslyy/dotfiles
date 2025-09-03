---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local utf8 = require("utf8")

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir() --/usr/share/awesome/themes/

local theme = {}

local hellwal_theme = dofile(os.getenv("HOME") .. "/.cache/hellwal/awesome.lua")

for k, v in pairs(hellwal_theme) do
	theme[k] = v
end

theme.font = "sans 9"

theme.useless_gap = dpi(4)
theme.border_width = dpi(2)

-- notifications
theme.notification_font = "FiraCode Nerd Font 12"
theme.notification_border_width = 0
theme.notification_margin = 10
theme.notification_width = nil
theme.notification_height = nil

-- taglist:
theme.taglist_spacing = dpi(4)
theme.top_bar_height = dpi(32)

-- tasklist:
theme.tasklist_spacing = 5

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

theme.app_icons = {
	["firefox"] = utf8.char(0xf0239),
	["kitty"] = utf8.char(0xf489),
	["obsidian"] = utf8.char(0xf039a),
	["discord"] = utf8.char(0xf1ff),
	["code-oss"] = utf8.char(0xe8da),
	["steam"] = utf8.char(0xf1b6),
}

theme.app_icon_default = utf8.char(0xf4f6)

theme.menu_submenu_icon = themes_path .. "default/icons/submenu.png"
theme.taglist_squares_sel = themes_path .. "default/icons/square_sel.png"
theme.taglist_squares_unsel = themes_path .. "default/icons/square_unsel.png"
theme.layout_tile = themes_path .. "default/icons/tile.png"
theme.layout_tileleft = themes_path .. "default/icons/tileleft.png"
theme.layout_tilebottom = themes_path .. "default/icons/tilebottom.png"
theme.layout_tiletop = themes_path .. "default/icons/tiletop.png"
theme.layout_fairv = themes_path .. "default/icons/fairv.png"
theme.layout_fairh = themes_path .. "default/icons/fairh.png"
theme.layout_spiral = themes_path .. "default/icons/spiral.png"
theme.layout_dwindle = themes_path .. "default/icons/dwindle.png"
theme.layout_max = themes_path .. "default/icons/max.png"
theme.layout_fullscreen = themes_path .. "default/icons/fullscreen.png"
theme.layout_magnifier = themes_path .. "default/icons/magnifier.png"
theme.layout_floating = themes_path .. "default/icons/floating.png"

theme.titlebar_close_button_focus = themes_path .. "default/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal = themes_path .. "default/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active = themes_path .. "default/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "default/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "default/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themes_path .. "default/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active = themes_path .. "default/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "default/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "default/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themes_path .. "default/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active = themes_path .. "default/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themes_path .. "default/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "default/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themes_path .. "default/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "default/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "default/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "default/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "default/icons/titlebar/maximized_normal_inactive.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
