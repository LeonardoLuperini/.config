local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Menu
-- Create a launcher widget and a main menu

local awmenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", Terminal .. " -e man awesome" },
   { "edit config", Editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

Menu = awful.menu({ items = { { "awesome", awmenu, beautiful.awesome_icon },
                                    { "open terminal", Terminal }
                                  }
                        })

Launcher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = Menu})
