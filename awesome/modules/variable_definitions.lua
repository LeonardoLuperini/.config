
-- This is used later as the default terminal and editor to run.
Terminal = os.getenv("TERM")
Editor = os.getenv("EDITOR")
Editor_cmd = Terminal .. " -e " .. Editor

-- Default modkey.
Modkey = "Mod4"
