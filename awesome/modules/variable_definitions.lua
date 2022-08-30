--[[===============================
	=	  Variable definitions	  =
	===============================]]

-- Standard awesome library
local gears = require("gears")

-- Theme handling library
local beautiful = require("beautiful")

-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = os.getenv("TERM")
editor = os.getenv("EDITOR")
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
modkey = "Mod4"
