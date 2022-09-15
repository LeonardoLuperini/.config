---------------------------
-- gruvbox awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

-- local gfs = require("gears.filesystem")
local themes_path = "~/.config/awesome/themes/"

local theme = {}

theme.red_d    = "#cc241d"
theme.red_l    = "#fb4934"
theme.green_d  = "#98971a"
theme.green_l  = "#b8bb26"
theme.yellow_d = "#d79921"
theme.yellow_l = "#fabd2f"
theme.blue_d   = "#458588"
theme.blue_l   = "#83a598"
theme.purple_d = "#b16286"
theme.purple_l = "#d3869b"
theme.aqua_d   = "#689d6a"
theme.aqua_l   = "#8ec07c"
theme.gray_d   = "#928374"
theme.gray_l   = "#a89984"
theme.orange_d = "#d65d0e"
theme.orange_l = "#fe8019"

-- From the darker to birghter
theme.bg0_h    = "#1d2021"
theme.bg0      = "#282828"
theme.bg0_s    = "#23302f"
theme.bg1      = "#3c3836"
theme.bg2      = "#504945"
theme.bg3      = "#665c54"
theme.bg4      = "#7c6f64"
theme.fg4      = "#a89984"
theme.fg3      = "#bdae93"
theme.fg2      = "#d5c4a1"
theme.fg1      = "#ebdbb2"
theme.fg0      = "#fbf1c7"

theme.font          = "sans 8"

theme.bg_normal     = theme.bg0_h
theme.bg_focus      = theme.bg1
theme.bg_urgent     = theme.red_d
theme.bg_minimize   = theme.bg0
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = theme.fg1
theme.fg_focus      = theme.fg0
theme.fg_urgent     = theme.fg0
theme.fg_minimize   = theme.fg0

theme.useless_gap         = dpi(4)
theme.border_width        = dpi(2)
theme.border_color_normal = theme.bg0_h
theme.border_color_active = theme.aqua_d
theme.border_color_marked = theme.blue_d

theme.hotkeys_modifiers_fg = theme.bg4
-- There are other variable sets
-- overriding the gruvbox one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."gruvbox/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
-- theme.bg_widget = "#cc0000"

theme.wallpaper = themes_path.."gruvbox/1920x1080-dark-archlinux.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."gruvbox/layouts/fairhw.png"
theme.layout_fairv = themes_path.."gruvbox/layouts/fairvw.png"
theme.layout_floating  = themes_path.."gruvbox/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."gruvbox/layouts/magnifierw.png"
theme.layout_max = themes_path.."gruvbox/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."gruvbox/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."gruvbox/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."gruvbox/layouts/tileleftw.png"
theme.layout_tile = themes_path.."gruvbox/layouts/tilew.png"
theme.layout_tiletop = themes_path.."gruvbox/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."gruvbox/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."gruvbox/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."gruvbox/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."gruvbox/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."gruvbox/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."gruvbox/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
