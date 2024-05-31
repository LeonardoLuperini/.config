-- Standard awesome library
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Notification library
local naughty = require("naughty")

-- Declarative object management
local menubar = require("menubar")

local printn = require("modules.utils").p

-- Keyboard map indicator and switcher
Mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget
Mytextclock = wibox.widget.textclock()

local function tags(s) -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
end

local function promptbox(s) -- Create a promptbox for each screen
	s.prompt_box = awful.widget.prompt()
	s.prompt_box.with_shell = true
	s.prompt_box.prompt = "Run: "
end

local function layout_images(s)
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.layout_box = awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc(-1) end),
            awful.button({ }, 5, function () awful.layout.inc( 1) end),
        }
    }
end

local function tag_list(s) -- Create a taglist widget
    s.tag_list = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = {
            awful.button({ }, 1, function(t) t:view_only() end),
            awful.button({ Modkey }, 1, function(t)
                                            if client.focus then
                                                client.focus:move_to_tag(t)
                                            end
                                        end),
            awful.button({ }, 3, awful.tag.viewtoggle),
            awful.button({ Modkey }, 3, function(t)
                                            if client.focus then
                                                client.focus:toggle_tag(t)
                                            end
                                        end),
            awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
            awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
        }
    }
end

local function task_list(s) -- Create a tasklist widget
    s.task_list = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = {
            awful.button({ }, 1, function (c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
            awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
            awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
            awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
        }
    }
end

local function top_bar(s)
	tags(s)
	promptbox(s)
	layout_images(s)
	tag_list(s)
	task_list(s)

    -- Create the wibox
    s.mywibox = awful.wibar {
        position = "top",
        screen   = s,
        widget   = {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                -- mylauncher,
                s.tag_list,
                s.prompt_box,
            },
            s.task_list, -- Middle widget
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                Mykeyboardlayout,
                wibox.widget.systray(),
                Mytextclock,
                s.layout_box,
            },
        }
    }
end

screen.connect_signal("request::desktop_decoration", top_bar)
