---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

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

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

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
theme.widget_ac = themes_path .. "default/icons/ac.png"
theme.widget_battery = themes_path .. "default/icons/battery.png"
theme.widget_battery_low = themes_path .. "default/icons/battery_low.png"
theme.widget_battery_empty = themes_path .. "default/icons/battery_empty.png"
theme.widget_mem = themes_path .. "default/icons/mem.png"
theme.widget_cpu = themes_path .. "default/icons/cpu.png"
theme.widget_temp = themes_path .. "default/icons/temp.png"
theme.widget_net = themes_path .. "default/icons/net.png"
theme.widget_hdd = themes_path .. "default/icons/hdd.png"
theme.widget_music = themes_path .. "default/icons/note.png"
theme.widget_music_on = themes_path .. "default/icons/note_on.png"
theme.widget_vol = themes_path .. "default/icons/vol.png"
theme.widget_vol_low = themes_path .. "default/icons/vol_low.png"
theme.widget_vol_no = themes_path .. "default/icons/vol_no.png"
theme.widget_vol_mute = themes_path .. "default/icons/vol_mute.png"
theme.widget_mail = themes_path .. "default/icons/mail.png"
theme.widget_mail_on = themes_path .. "default/icons/mail_on.png"

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
