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
require("awful.hotkeys_popup.keys")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:

-- Error handling
require("modules.error_handling")

-- Theme selection
local ts = require("modules.theme_selection")
local fm = ts.folder_module

-- Variable definitions
require("modules."..fm.."variable_definitions")

-- Tag 
require("modules."..fm.."tag_layout")

-- Menu
require("modules."..fm.."menu")

-- Wallpaper
require("modules."..fm.."wallpaper")

-- Wibar
require("modules."..fm.."wibar")

-- Mouse bindings
require("modules."..fm.."mouse_bindings")

-- Key bindings
require("modules."..fm.."keybindings")

-- Rules
require("modules."..fm.."rules")

-- Titlebars
require("modules."..fm.."titlebars")

-- Notifications
require("modules."..fm.."notifications")

-- Autostart
awful.spawn.with_shell("~/.config/awesome/autorun.sh")

--[[ If you want to print something
local u = require("modules.utils")
u.p("modules."..fm.."titlebars")
--]]

