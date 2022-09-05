--[[===============================
	=		   Tag layout		  =
	===============================]]

-- Standard awesome library
local awful = require("awful")

-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile,
        awful.layout.suit.tile.left,
        awful.layout.suit.fair,
        awful.layout.suit.spiral,
        awful.layout.suit.spiral.dwindle, 
        awful.layout.suit.floating,
		awful.layout.suit.max,
        -- awful.layout.suit.max.fullscreen,
    })
end)


