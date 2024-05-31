-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
-- local gears = require("gears")
local awful = require("awful")
awful.util.shell = "/bin/zsh"

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
--local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

require("awful.hotkeys_popup.keys")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:

require("modules.error_handling")

require("modules.theme_selection")

require("modules.variable_definitions")

require("modules.tag_layout")

require("modules.menu")

require("modules.wallpaper")

require("modules.wibar")

require("modules.mouse_bindings")

require("modules.keybindings")

require("modules.rules")

require("modules.titlebars")

require("modules.notifications")

-- Autostart
awful.spawn.with_shell("~/.config/awesome/autorun.sh")
