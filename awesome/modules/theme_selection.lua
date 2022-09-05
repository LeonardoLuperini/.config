--[[===============================
	=	 	Theme selection 	  =
	===============================]]

-- Theme handling library
local beautiful = require("beautiful")

local ts = {}

ts.pthemes = {gruvbox = true}
ts.folder_module = ""

ts.tpath = "~/.config/awesome/themes/"
ts.tname = "gruvbox"
beautiful.init(ts.tpath..ts.tname.."/theme.lua")

if ts.pthemes[ts.tname] then
	ts.folder_module = ts.tname .. "."
end

return ts
