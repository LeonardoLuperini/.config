-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")

-- Declarative object management
local ruled = require("ruled")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Error handling
require("modules.error_handling")

-- Variable definitions
require("modules.variable_definitions")

-- Tag 
require("modules.tag_layout")

-- Menu
require("modules.menu")

-- Wallpaper
require("modules.wallpaper")

-- Wibar
require("modules.wibar")

-- Mouse bindings
require("modules.mouse_bindings")

-- Key bindings
require("modules.keybindings")

-- Rules
require("modules.rules")

-- Titlebars
require("modules.titlebars")

-- Notifications
require("modules.notifications")

-- Autostart
awful.spawn.with_shell("~/.config/awesome/autorun.sh")

