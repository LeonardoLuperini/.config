local n = require("naughty")

local utils = {}

utils.p = function (m)
	notification = {
		urgency = "critical",
		title = "Printed Message",
		message = m,
	}
	n.notify(notification)
end

return utils
