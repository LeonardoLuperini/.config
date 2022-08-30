--[[===============================
	=	 	Theme selection 	  =
	===============================]]

-- Theme handling library
local beautiful = require("beautiful")

local ts = {}

ts.theme_sel = function (tname)
	if (not (tname))
	then	
		ts.tname = "zenburn"
	else
		ts.tname = tname
	end

	ts.tpath = "~/.config/awesome/themes/"
	beautiful.init(ts.tpath..ts.tname.."/theme.lua")
end

ts.theme_sel()

return ts
