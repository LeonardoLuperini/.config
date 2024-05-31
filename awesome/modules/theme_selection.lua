-- Theme handling library
local beautiful = require("beautiful")

local ts = {}

ts.tpath = "~/.config/awesome/themes/"
ts.tname = "gruvbox"
beautiful.init(ts.tpath..ts.tname.."/theme.lua")

return ts
